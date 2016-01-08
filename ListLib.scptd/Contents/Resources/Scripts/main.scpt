FasdUAS 1.101.10   ��   ��    k             l      ��  ��   +% ListLib -- manipulate AppleScript lists 

Caution: In older versions of AppleScript, getting/setting an item in a list had notoriously poor O(n) performance due to the interpreter's flawed vector list implementation. Users could still trick an AppleScript list into performing O(1) lookups via arcane `item i of MY aList` kludges; however, these made user code ugly and complicated, and hard to read and debug. This library is intended for use in 10.11+ where this problem is already fixed, so doesn't include these kludges; however, its performance on older OSes will seriously degrade without them.

Notes:

- To split and join lists [of text], use the `split text` and `join text` commands in TextLib.


TO DO:

- `list comparator` constructor that takes either a single comparator (for comparing all items in an arbitrary-length list) or list of form {{index, comparator},...} (for comparing specific items)

- decide on naming convention for comparator object constructors, e.g. TypesLib uses `make WHATEVER` commands for clarity, but `sort list LIST using (text comparator)` arguably reads better than `sort list LIST using (make text comparator)`


- What other commands are needed?

- `remove duplicates from list LIST` (note: this can be implemented as FilterDuplicatesObject for use in `filter list`; a naive implementation would just build new list and compare against that, giving worst-case O(n^2) performance; however, a smarter implementation could put comparable items into a SetObject, allowing O(n * log n) when filtering lists of numbers, text, dates), caveat considering/ignoring 

- `find in list LIST value VALUE [finding first occurrence/last occurrence/all occurrences]` 

- `transpose list LIST-OF-LISTS`

- `slice list LIST from I to J` -- c.f. `slice text`

- add optional `from [before/after/] item` and `to [before/after/] item` parameters to `insert into list` and `delete from list` to insert/delete ranges; `insert into list` should also be able to replace existing ranges of items with new items (of same or different length)

- stable sorting (perhaps as a boolean option on `sort list`, as speed difference between quicksort and heapsort/etc is likely to be significant)? what about 3-way quicksort (better on lists where most items are equal)?

- might consider using NSMutableArray when sorting simple uniform lists of text or number (would need to compare costs of ASOC bridging vs native sorting to see which performs better); not sure about dates given that they're mutable (ASOC will perform deep copy of list, so resulting list will contain copies of the original date objects, whereas native sort preserves the original date objects); complex values (e.g. list of records) will still be sorted natively, of course (though even there it might be possible to use NSArray to sort an array of [key,valueIndex] and then iterate the result to reposition values in output list, making the [slow] AS part of the code O(2n))


- not sure if the following will be sufficiently useful to justify inclusion (need to identify some concrete use cases, or else discard):

	- `make list [containing INITIAL-VALUE] [size N]` (if INITIAL-VALUE is a reference, dereference it? e.g. `make list containing (a ref to some item of {1,2,3}) size 10`; would probably be simpler to pass an object that generates a random item)
	
	- `make numeric list from MIN to MAX by STEP`?

	- `interlace lists`, `deinterlace lists`? e.g. {{1,2,3},{4,5,6}} <-> {1,4,2,5,3,6}

	- `group into sublists LIST size SUB-LIST-LENGTH [padding...]`, `flatten sublists LIST`? e.g. {1,2,3,4,5,6} size 2 <-> {{1,2},{3,4},{5,6}}
     � 	 	J   L i s t L i b   - -   m a n i p u l a t e   A p p l e S c r i p t   l i s t s   
 
 C a u t i o n :   I n   o l d e r   v e r s i o n s   o f   A p p l e S c r i p t ,   g e t t i n g / s e t t i n g   a n   i t e m   i n   a   l i s t   h a d   n o t o r i o u s l y   p o o r   O ( n )   p e r f o r m a n c e   d u e   t o   t h e   i n t e r p r e t e r ' s   f l a w e d   v e c t o r   l i s t   i m p l e m e n t a t i o n .   U s e r s   c o u l d   s t i l l   t r i c k   a n   A p p l e S c r i p t   l i s t   i n t o   p e r f o r m i n g   O ( 1 )   l o o k u p s   v i a   a r c a n e   ` i t e m   i   o f   M Y   a L i s t `   k l u d g e s ;   h o w e v e r ,   t h e s e   m a d e   u s e r   c o d e   u g l y   a n d   c o m p l i c a t e d ,   a n d   h a r d   t o   r e a d   a n d   d e b u g .   T h i s   l i b r a r y   i s   i n t e n d e d   f o r   u s e   i n   1 0 . 1 1 +   w h e r e   t h i s   p r o b l e m   i s   a l r e a d y   f i x e d ,   s o   d o e s n ' t   i n c l u d e   t h e s e   k l u d g e s ;   h o w e v e r ,   i t s   p e r f o r m a n c e   o n   o l d e r   O S e s   w i l l   s e r i o u s l y   d e g r a d e   w i t h o u t   t h e m . 
 
 N o t e s : 
 
 -   T o   s p l i t   a n d   j o i n   l i s t s   [ o f   t e x t ] ,   u s e   t h e   ` s p l i t   t e x t `   a n d   ` j o i n   t e x t `   c o m m a n d s   i n   T e x t L i b . 
 
 
 T O   D O : 
 
 -   ` l i s t   c o m p a r a t o r `   c o n s t r u c t o r   t h a t   t a k e s   e i t h e r   a   s i n g l e   c o m p a r a t o r   ( f o r   c o m p a r i n g   a l l   i t e m s   i n   a n   a r b i t r a r y - l e n g t h   l i s t )   o r   l i s t   o f   f o r m   { { i n d e x ,   c o m p a r a t o r } , . . . }   ( f o r   c o m p a r i n g   s p e c i f i c   i t e m s ) 
 
 -   d e c i d e   o n   n a m i n g   c o n v e n t i o n   f o r   c o m p a r a t o r   o b j e c t   c o n s t r u c t o r s ,   e . g .   T y p e s L i b   u s e s   ` m a k e   W H A T E V E R `   c o m m a n d s   f o r   c l a r i t y ,   b u t   ` s o r t   l i s t   L I S T   u s i n g   ( t e x t   c o m p a r a t o r ) `   a r g u a b l y   r e a d s   b e t t e r   t h a n   ` s o r t   l i s t   L I S T   u s i n g   ( m a k e   t e x t   c o m p a r a t o r ) ` 
 
 
 -   W h a t   o t h e r   c o m m a n d s   a r e   n e e d e d ? 
 
 -   ` r e m o v e   d u p l i c a t e s   f r o m   l i s t   L I S T `   ( n o t e :   t h i s   c a n   b e   i m p l e m e n t e d   a s   F i l t e r D u p l i c a t e s O b j e c t   f o r   u s e   i n   ` f i l t e r   l i s t ` ;   a   n a i v e   i m p l e m e n t a t i o n   w o u l d   j u s t   b u i l d   n e w   l i s t   a n d   c o m p a r e   a g a i n s t   t h a t ,   g i v i n g   w o r s t - c a s e   O ( n ^ 2 )   p e r f o r m a n c e ;   h o w e v e r ,   a   s m a r t e r   i m p l e m e n t a t i o n   c o u l d   p u t   c o m p a r a b l e   i t e m s   i n t o   a   S e t O b j e c t ,   a l l o w i n g   O ( n   *   l o g   n )   w h e n   f i l t e r i n g   l i s t s   o f   n u m b e r s ,   t e x t ,   d a t e s ) ,   c a v e a t   c o n s i d e r i n g / i g n o r i n g   
 
 -   ` f i n d   i n   l i s t   L I S T   v a l u e   V A L U E   [ f i n d i n g   f i r s t   o c c u r r e n c e / l a s t   o c c u r r e n c e / a l l   o c c u r r e n c e s ] `   
 
 -   ` t r a n s p o s e   l i s t   L I S T - O F - L I S T S ` 
 
 -   ` s l i c e   l i s t   L I S T   f r o m   I   t o   J `   - -   c . f .   ` s l i c e   t e x t ` 
 
 -   a d d   o p t i o n a l   ` f r o m   [ b e f o r e / a f t e r / ]   i t e m `   a n d   ` t o   [ b e f o r e / a f t e r / ]   i t e m `   p a r a m e t e r s   t o   ` i n s e r t   i n t o   l i s t `   a n d   ` d e l e t e   f r o m   l i s t `   t o   i n s e r t / d e l e t e   r a n g e s ;   ` i n s e r t   i n t o   l i s t `   s h o u l d   a l s o   b e   a b l e   t o   r e p l a c e   e x i s t i n g   r a n g e s   o f   i t e m s   w i t h   n e w   i t e m s   ( o f   s a m e   o r   d i f f e r e n t   l e n g t h ) 
 
 -   s t a b l e   s o r t i n g   ( p e r h a p s   a s   a   b o o l e a n   o p t i o n   o n   ` s o r t   l i s t ` ,   a s   s p e e d   d i f f e r e n c e   b e t w e e n   q u i c k s o r t   a n d   h e a p s o r t / e t c   i s   l i k e l y   t o   b e   s i g n i f i c a n t ) ?   w h a t   a b o u t   3 - w a y   q u i c k s o r t   ( b e t t e r   o n   l i s t s   w h e r e   m o s t   i t e m s   a r e   e q u a l ) ? 
 
 -   m i g h t   c o n s i d e r   u s i n g   N S M u t a b l e A r r a y   w h e n   s o r t i n g   s i m p l e   u n i f o r m   l i s t s   o f   t e x t   o r   n u m b e r   ( w o u l d   n e e d   t o   c o m p a r e   c o s t s   o f   A S O C   b r i d g i n g   v s   n a t i v e   s o r t i n g   t o   s e e   w h i c h   p e r f o r m s   b e t t e r ) ;   n o t   s u r e   a b o u t   d a t e s   g i v e n   t h a t   t h e y ' r e   m u t a b l e   ( A S O C   w i l l   p e r f o r m   d e e p   c o p y   o f   l i s t ,   s o   r e s u l t i n g   l i s t   w i l l   c o n t a i n   c o p i e s   o f   t h e   o r i g i n a l   d a t e   o b j e c t s ,   w h e r e a s   n a t i v e   s o r t   p r e s e r v e s   t h e   o r i g i n a l   d a t e   o b j e c t s ) ;   c o m p l e x   v a l u e s   ( e . g .   l i s t   o f   r e c o r d s )   w i l l   s t i l l   b e   s o r t e d   n a t i v e l y ,   o f   c o u r s e   ( t h o u g h   e v e n   t h e r e   i t   m i g h t   b e   p o s s i b l e   t o   u s e   N S A r r a y   t o   s o r t   a n   a r r a y   o f   [ k e y , v a l u e I n d e x ]   a n d   t h e n   i t e r a t e   t h e   r e s u l t   t o   r e p o s i t i o n   v a l u e s   i n   o u t p u t   l i s t ,   m a k i n g   t h e   [ s l o w ]   A S   p a r t   o f   t h e   c o d e   O ( 2 n ) ) 
 
 
 -   n o t   s u r e   i f   t h e   f o l l o w i n g   w i l l   b e   s u f f i c i e n t l y   u s e f u l   t o   j u s t i f y   i n c l u s i o n   ( n e e d   t o   i d e n t i f y   s o m e   c o n c r e t e   u s e   c a s e s ,   o r   e l s e   d i s c a r d ) : 
 
 	 -   ` m a k e   l i s t   [ c o n t a i n i n g   I N I T I A L - V A L U E ]   [ s i z e   N ] `   ( i f   I N I T I A L - V A L U E   i s   a   r e f e r e n c e ,   d e r e f e r e n c e   i t ?   e . g .   ` m a k e   l i s t   c o n t a i n i n g   ( a   r e f   t o   s o m e   i t e m   o f   { 1 , 2 , 3 } )   s i z e   1 0 ` ;   w o u l d   p r o b a b l y   b e   s i m p l e r   t o   p a s s   a n   o b j e c t   t h a t   g e n e r a t e s   a   r a n d o m   i t e m ) 
 	 
 	 -   ` m a k e   n u m e r i c   l i s t   f r o m   M I N   t o   M A X   b y   S T E P ` ? 
 
 	 -   ` i n t e r l a c e   l i s t s ` ,   ` d e i n t e r l a c e   l i s t s ` ?   e . g .   { { 1 , 2 , 3 } , { 4 , 5 , 6 } }   < - >   { 1 , 4 , 2 , 5 , 3 , 6 } 
 
 	 -   ` g r o u p   i n t o   s u b l i s t s   L I S T   s i z e   S U B - L I S T - L E N G T H   [ p a d d i n g . . . ] ` ,   ` f l a t t e n   s u b l i s t s   L I S T ` ?   e . g .   { 1 , 2 , 3 , 4 , 5 , 6 }   s i z e   2   < - >   { { 1 , 2 } , { 3 , 4 } , { 5 , 6 } } 
   
  
 l     ��������  ��  ��        x     
�� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �      s u p p o r t      l     ��������  ��  ��        l         !  j   
 �� "�� 0 _supportlib _supportLib " N   
  # # 4   
 �� $
�� 
scpt $ m     % % � & & " L i b r a r y S u p p o r t L i b   "  used for parameter checking    ! � ' ' 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g   ( ) ( l     ��������  ��  ��   )  * + * i    , - , I      �� .���� 
0 _error   .  / 0 / o      ���� 0 handlername handlerName 0  1 2 1 o      ���� 0 etext eText 2  3 4 3 o      ���� 0 enumber eNumber 4  5 6 5 o      ���� 0 efrom eFrom 6  7�� 7 o      ���� 
0 eto eTo��  ��   - I     �� 8���� 20 _errorwithpartialresult _errorWithPartialResult 8  9 : 9 o    ���� 0 handlername handlerName :  ; < ; o    ���� 0 etext eText <  = > = o    ���� 0 enumber eNumber >  ? @ ? o    ���� 0 efrom eFrom @  A B A o    ���� 
0 eto eTo B  C�� C m    ��
�� 
msng��  ��   +  D E D l     ��������  ��  ��   E  F G F i    H I H I      �� J���� 20 _errorwithpartialresult _errorWithPartialResult J  K L K o      ���� 0 handlername handlerName L  M N M o      ���� 0 etext eText N  O P O o      ���� 0 enumber eNumber P  Q R Q o      ���� 0 efrom eFrom R  S T S o      ���� 
0 eto eTo T  U�� U o      ���� 0 partialresult partialResult��  ��   I n     V W V I    �� X���� 0 rethrowerror rethrowError X  Y Z Y m     [ [ � \ \  L i s t L i b Z  ] ^ ] o    ���� 0 handlername handlerName ^  _ ` _ o    ���� 0 etext eText `  a b a o    	���� 0 enumber eNumber b  c d c o   	 
���� 0 efrom eFrom d  e f e o   
 ���� 
0 eto eTo f  g h g m    ��
�� 
msng h  i�� i o    ���� 0 partialresult partialResult��  ��   W o     ���� 0 _supportlib _supportLib G  j k j l     ��������  ��  ��   k  l m l l     ��������  ��  ��   m  n o n l     �� p q��   p J D--------------------------------------------------------------------    q � r r � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - o  s t s l     �� u v��   u   basic operations    v � w w "   b a s i c   o p e r a t i o n s t  x y x l     ��������  ��  ��   y  z { z i    | } | I     �� ~ 
�� .Lst:Instnull���     **** ~ o      ���� 0 thelist theList  �� � �
�� 
Valu � o      ���� 0 thevalue theValue � �� � �
�� 
Befo � |���� ��� ���  ��   � o      ���� 0 beforeindex beforeIndex��   � m      ��
�� 
msng � �� ���
�� 
Afte � |���� ��� ���  ��   � o      ���� 0 
afterindex 
afterIndex��   � m      ��
�� 
msng��   } k    0 � �  � � � l     �� � ���   �.( In addition to inserting before/after the list's actual indexes, this also recognizes three 'virtual' indexes: the `after item` parameter uses index 0 and index `-length - 1` to indicate the start of the list; the `before item` parameter uses index `length + 1` to indicate the end of the list.     � � � �P   I n   a d d i t i o n   t o   i n s e r t i n g   b e f o r e / a f t e r   t h e   l i s t ' s   a c t u a l   i n d e x e s ,   t h i s   a l s o   r e c o g n i z e s   t h r e e   ' v i r t u a l '   i n d e x e s :   t h e   ` a f t e r   i t e m `   p a r a m e t e r   u s e s   i n d e x   0   a n d   i n d e x   ` - l e n g t h   -   1 `   t o   i n d i c a t e   t h e   s t a r t   o f   t h e   l i s t ;   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   u s e s   i n d e x   ` l e n g t h   +   1 `   t o   i n d i c a t e   t h e   e n d   o f   t h e   l i s t .   �  � � � l     �� � ���   �~x Note that the `before item` parameter cannot indicate the end of a list using a negative index. (Problem: the next 'virtual' index after -1 would be 0, but index 0 is already used by the `after item` parameter to represent the *start* of a list, and it's easier to disallow `before item 0` than explain to user how 'index 0' can be at both the start *and* the end of a list.)    � � � ��   N o t e   t h a t   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   c a n n o t   i n d i c a t e   t h e   e n d   o f   a   l i s t   u s i n g   a   n e g a t i v e   i n d e x .   ( P r o b l e m :   t h e   n e x t   ' v i r t u a l '   i n d e x   a f t e r   - 1   w o u l d   b e   0 ,   b u t   i n d e x   0   i s   a l r e a d y   u s e d   b y   t h e   ` a f t e r   i t e m `   p a r a m e t e r   t o   r e p r e s e n t   t h e   * s t a r t *   o f   a   l i s t ,   a n d   i t ' s   e a s i e r   t o   d i s a l l o w   ` b e f o r e   i t e m   0 `   t h a n   e x p l a i n   t o   u s e r   h o w   ' i n d e x   0 '   c a n   b e   a t   b o t h   t h e   s t a r t   * a n d *   t h e   e n d   o f   a   l i s t . ) �  ��� � Q    0 � � � � k    � �  � � � r     � � � n    � � � I    �� ����� "0 aslistparameter asListParameter �  � � � o    	���� 0 thelist theList �  ��� � m   	 
 � � � � �  ��  ��   � o    ���� 0 _supportlib _supportLib � o      ���� 0 thelist theList �  � � � Z    � � � � � � >    � � � o    ���� 0 
afterindex 
afterIndex � m    ��
�� 
msng � k    d � �  � � � Z   ' � ����� � >    � � � o    ���� 0 beforeindex beforeIndex � m    ��
�� 
msng � R    #�� � �
�� .ascrerr ****      � **** � m   ! " � � � � � ( T o o   m a n y   p a r a m e t e r s . � �� ���
�� 
errn � m     �����Y��  ��  ��   �  � � � r   ( 5 � � � n  ( 3 � � � I   - 3�� ����� (0 asintegerparameter asIntegerParameter �  � � � o   - .���� 0 
afterindex 
afterIndex �  ��� � m   . / � � � � �  a f t e r   i t e m��  ��   � o   ( -���� 0 _supportlib _supportLib � o      ���� 0 
afterindex 
afterIndex �  � � � Z  6 I � ����� � A   6 9 � � � o   6 7���� 0 
afterindex 
afterIndex � m   7 8����   � r   < E � � � [   < C � � � [   < A � � � l  < ? ����� � n   < ? � � � 1   = ?��
�� 
leng � o   < =���� 0 thelist theList��  ��   � o   ? @���� 0 
afterindex 
afterIndex � m   A B����  � o      ���� 0 
afterindex 
afterIndex��  ��   �  ��� � Z   J d � ����� � ?   J O � � � o   J K�� 0 
afterindex 
afterIndex � l  K N ��~�} � n   K N � � � 1   L N�|
�| 
leng � o   K L�{�{ 0 thelist theList�~  �}   � R   R `�z � �
�z .ascrerr ****      � **** � m   ^ _ � � � � � , I n d e x   i s   o u t   o f   r a n g e . � �y � �
�y 
errn � m   T U�x�x�@ � �w ��v
�w 
erob � l  V ] ��u�t � N   V ] � � n   V \ � � � 9   Z \�s
�s 
insl � n   V Z � � � 4   W Z�r �
�r 
cobj � o   X Y�q�q 0 
afterindex 
afterIndex � o   V W�p�p 0 thelist theList�u  �t  �v  ��  ��  ��   �  � � � >  g j � � � o   g h�o�o 0 beforeindex beforeIndex � m   h i�n
�n 
msng �  ��m � k   m � � �  � � � r   m z � � � n  m x � � � I   r x�l ��k�l (0 asintegerparameter asIntegerParameter �  � � � o   r s�j�j 0 beforeindex beforeIndex �  ��i � m   s t � � � � �  b e f o r e   i t e m�i  �k   � o   m r�h�h 0 _supportlib _supportLib � o      �g�g 0 beforeindex beforeIndex �  � � � Z   { � � �  � ?   { ~ o   { |�f�f 0 beforeindex beforeIndex m   | }�e�e   � r   � � \   � � o   � ��d�d 0 beforeindex beforeIndex m   � ��c�c  o      �b�b 0 
afterindex 
afterIndex  	 A   � �

 o   � ��a�a 0 beforeindex beforeIndex m   � ��`�`  	 �_ r   � � [   � � l  � ��^�] n   � � 1   � ��\
�\ 
leng o   � ��[�[ 0 thelist theList�^  �]   o   � ��Z�Z 0 beforeindex beforeIndex o      �Y�Y 0 
afterindex 
afterIndex�_   l  � � R   � ��X
�X .ascrerr ****      � **** m   � � �  I n v a l i d   i n d e x . �W
�W 
errn m   � ��V�V�@ �U�T
�U 
erob l  � ��S�R N   � � n   � � !  8   � ��Q
�Q 
insl! n   � �"#" 4   � ��P$
�P 
cobj$ o   � ��O�O 0 beforeindex beforeIndex# o   � ��N�N 0 thelist theList�S  �R  �T   � � the `before item` parameter cannot identify the end of a list by negative index, so throw 'invalid index' error if `before item 0` is used    �%%   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   c a n n o t   i d e n t i f y   t h e   e n d   o f   a   l i s t   b y   n e g a t i v e   i n d e x ,   s o   t h r o w   ' i n v a l i d   i n d e x '   e r r o r   i f   ` b e f o r e   i t e m   0 `   i s   u s e d � &�M& Z   � �'(�L�K' G   � �)*) ?   � �+,+ o   � ��J�J 0 
afterindex 
afterIndex, l  � �-�I�H- n   � �./. 1   � ��G
�G 
leng/ o   � ��F�F 0 thelist theList�I  �H  * A   � �010 o   � ��E�E 0 
afterindex 
afterIndex1 m   � ��D�D  ( R   � ��C23
�C .ascrerr ****      � ****2 m   � �44 �55 , I n d e x   i s   o u t   o f   r a n g e .3 �B67
�B 
errn6 m   � ��A�A�@7 �@8�?
�@ 
erob8 l  � �9�>�=9 N   � �:: n   � �;<; 8   � ��<
�< 
insl< n   � �=>= 4   � ��;?
�; 
cobj? o   � ��:�: 0 beforeindex beforeIndex> o   � ��9�9 0 thelist theList�>  �=  �?  �L  �K  �M  �m   � R   � ��8@A
�8 .ascrerr ****      � ****@ m   � �BB �CC $ M i s s i n g   p a r a m e t e r .A �7D�6
�7 
errnD m   � ��5�5�Y�6   � E�4E Z   �FGHIF =   � �JKJ o   � ��3�3 0 
afterindex 
afterIndexK m   � ��2�2  G L   � �LL b   � �MNM J   � �OO P�1P o   � ��0�0 0 thevalue theValue�1  N o   � ��/�/ 0 thelist theListH QRQ =   � �STS o   � ��.�. 0 
afterindex 
afterIndexT n   � �UVU 1   � ��-
�- 
lengV o   � ��,�, 0 thelist theListR W�+W L   � �XX b   � �YZY o   � ��*�* 0 thelist theListZ J   � �[[ \�)\ o   � ��(�( 0 thevalue theValue�)  �+  I L   �]] b   �^_^ b   �`a` l  �b�'�&b n   �cdc 7  ��%ef
�% 
cobje m  �$�$ f o  �#�# 0 
afterindex 
afterIndexd o   � ��"�" 0 thelist theList�'  �&  a J  
gg h�!h o  � �  0 thevalue theValue�!  _ l i��i n  jkj 7 �lm
� 
cobjl l n��n [  opo o  �� 0 
afterindex 
afterIndexp m  �� �  �  m m  ����k o  �� 0 thelist theList�  �  �4   � R      �qr
� .ascrerr ****      � ****q o      �� 0 etext eTextr �st
� 
errns o      �� 0 enumber eNumbert �uv
� 
erobu o      �� 0 efrom eFromv �w�
� 
errtw o      �� 
0 eto eTo�   � I  "0�x�� 
0 _error  x yzy m  #&{{ �||   i n s e r t   i n t o   l i s tz }~} o  &'�� 0 etext eText~ � o  '(�
�
 0 enumber eNumber� ��� o  ()�	�	 0 efrom eFrom� ��� o  )*�� 
0 eto eTo�  �  ��   { ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i    ��� I     � ��
�  .Lst:Delenull���     ****� o      ���� 0 thelist theList� �����
�� 
Inde� |����������  ��  � o      ���� 0 theindex theIndex��  � d      �� m      ���� ��  � Q     ����� k    ��� ��� r    ��� n   ��� I    ������� "0 aslistparameter asListParameter� ��� o    	���� 0 thelist theList� ���� m   	 
�� ���  ��  ��  � o    ���� 0 _supportlib _supportLib� o      ���� 0 thelist theList� ��� r    ��� n   ��� I    ������� (0 asintegerparameter asIntegerParameter� ��� o    ���� 0 theindex theIndex� ���� m    �� ���  i t e m��  ��  � o    ���� 0 _supportlib _supportLib� o      ���� 0 theindex theIndex� ��� Z    ������� F    ,��� ?    $��� n    "��� 1     "��
�� 
leng� o     ���� 0 thelist theList� m   " #���� � >   ' *��� o   ' (���� 0 theindex theIndex� m   ( )����  � Z   / ������� E  / 9��� J   / 5�� ��� m   / 0������� ���� n   0 3��� 1   1 3��
�� 
leng� o   0 1���� 0 thelist theList��  � J   5 8�� ���� o   5 6���� 0 theindex theIndex��  � L   < I�� n   < H��� 7  = G����
�� 
cobj� m   A C���� � m   D F������� o   < =���� 0 thelist theList� ��� E  L W��� J   L S�� ��� m   L M���� � ���� d   M Q�� l  M P������ n   M P��� 1   N P��
�� 
leng� o   M N���� 0 thelist theList��  ��  ��  � J   S V�� ���� o   S T���� 0 theindex theIndex��  � ��� L   Z _�� n   Z ^��� 1   [ ]��
�� 
rest� o   Z [���� 0 thelist theList� ��� G   b ���� F   b o��� ?   b e��� o   b c���� 0 theindex theIndex� m   c d����  � A   h m��� o   h i���� 0 theindex theIndex� n   i l��� 1   j l��
�� 
leng� o   i j���� 0 thelist theList� F   r ���� A   r u��� o   r s���� 0 theindex theIndex� m   s t����  � ?   x ~��� o   x y���� 0 theindex theIndex� d   y }�� l  y |������ n   y |��� 1   z |��
�� 
leng� o   y z���� 0 thelist theList��  ��  � ���� L   � ��� b   � ���� l  � ������� n   � ���� 7  � �����
�� 
cobj� m   � ����� � l  � ������� \   � �   o   � ����� 0 theindex theIndex m   � ����� ��  ��  � o   � ����� 0 thelist theList��  ��  � l  � ����� n   � � 7  � ���
�� 
cobj l  � ����� [   � �	 o   � ����� 0 theindex theIndex	 m   � ����� ��  ��   m   � ������� o   � ����� 0 thelist theList��  ��  ��  ��  � 

 =   � � n   � � 1   � ���
�� 
leng o   � ����� 0 thelist theList m   � �����  �� Z  � ����� E  � � J   � �  m   � ������� �� m   � ����� ��   J   � � �� o   � ����� 0 theindex theIndex��   L   � � J   � �����  ��  ��  ��  ��  � �� R   � ���
�� .ascrerr ****      � **** m   � � �   : I n v a l i d   i n d e x   ( o u t   o f   r a n g e ) . ��!"
�� 
errn! m   � ������@" ��#��
�� 
erob# l  � �$����$ N   � �%% n   � �&'& 4   � ���(
�� 
cobj( o   � ����� 0 theindex theIndex' o   � ����� 0 thelist theList��  ��  ��  ��  � R      ��)*
�� .ascrerr ****      � ****) o      ���� 0 etext eText* ��+,
�� 
errn+ o      ���� 0 enumber eNumber, ��-.
�� 
erob- o      ���� 0 efrom eFrom. ��/��
�� 
errt/ o      ���� 
0 eto eTo��  � I   � ���0���� 
0 _error  0 121 m   � �33 �44   d e l e t e   f r o m   l i s t2 565 o   � ����� 0 etext eText6 787 o   � ����� 0 enumber eNumber8 9:9 o   � ����� 0 efrom eFrom: ;��; o   � ����� 
0 eto eTo��  ��  � <=< l     ��������  ��  ��  = >?> l     ��������  ��  ��  ? @A@ l     ��BC��  B J D--------------------------------------------------------------------   C �DD � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -A EFE l     ��GH��  GZT map, filter, reduce (these operations are relatively trivial to perform in AS without the need for callbacks; however, these handlers are more flexible when the convert/check/combine operations are parameterized and also provide more advanced users with idiomatic examples of how to parameterize a general-purpose handler's exact behavior)   H �II�   m a p ,   f i l t e r ,   r e d u c e   ( t h e s e   o p e r a t i o n s   a r e   r e l a t i v e l y   t r i v i a l   t o   p e r f o r m   i n   A S   w i t h o u t   t h e   n e e d   f o r   c a l l b a c k s ;   h o w e v e r ,   t h e s e   h a n d l e r s   a r e   m o r e   f l e x i b l e   w h e n   t h e   c o n v e r t / c h e c k / c o m b i n e   o p e r a t i o n s   a r e   p a r a m e t e r i z e d   a n d   a l s o   p r o v i d e   m o r e   a d v a n c e d   u s e r s   w i t h   i d i o m a t i c   e x a m p l e s   o f   h o w   t o   p a r a m e t e r i z e   a   g e n e r a l - p u r p o s e   h a n d l e r ' s   e x a c t   b e h a v i o r )F JKJ l     ��������  ��  ��  K LML l     �NO�  N � � note: while these handlers prevent the script object from modifying the input list directly, it cannot stop them modifying mutable (date/list/record/script/reference) items within the input list (doing so would be very bad practice, however)   O �PP�   n o t e :   w h i l e   t h e s e   h a n d l e r s   p r e v e n t   t h e   s c r i p t   o b j e c t   f r o m   m o d i f y i n g   t h e   i n p u t   l i s t   d i r e c t l y ,   i t   c a n n o t   s t o p   t h e m   m o d i f y i n g   m u t a b l e   ( d a t e / l i s t / r e c o r d / s c r i p t / r e f e r e n c e )   i t e m s   w i t h i n   t h e   i n p u t   l i s t   ( d o i n g   s o   w o u l d   b e   v e r y   b a d   p r a c t i c e ,   h o w e v e r )M QRQ l     �~�}�|�~  �}  �|  R STS i  ! $UVU I     �{WX
�{ .Lst:Map_null���     ****W o      �z�z 0 thelist theListX �yY�x
�y 
UsinY o      �w�w 0 	thescript 	theScript�x  V k     yZZ [\[ l    ]^_] r     `a` J     �v�v  a o      �u�u 0 
resultlist 
resultList^�� note: while it'd be slightly quicker to shallow-copy theList and modify that in-place, collecting results in a new list allows error reporting to include a partial result -- TO DO: could still provide partial result by slicing the in-place list up to the item that failed; depending on how efficient AS's array resizing algorithm is (traditionally it scaled terribly), it might be better redoing it; similarly, `filter list` could avoid dynamic resizes by working on shallow copy of original list and just shifting each item left and trimming when done (i.e. O(3n)); need to profile both algorithms for a range of list sizes to determine if difference is significant or not   _ �bbD   n o t e :   w h i l e   i t ' d   b e   s l i g h t l y   q u i c k e r   t o   s h a l l o w - c o p y   t h e L i s t   a n d   m o d i f y   t h a t   i n - p l a c e ,   c o l l e c t i n g   r e s u l t s   i n   a   n e w   l i s t   a l l o w s   e r r o r   r e p o r t i n g   t o   i n c l u d e   a   p a r t i a l   r e s u l t   - -   T O   D O :   c o u l d   s t i l l   p r o v i d e   p a r t i a l   r e s u l t   b y   s l i c i n g   t h e   i n - p l a c e   l i s t   u p   t o   t h e   i t e m   t h a t   f a i l e d ;   d e p e n d i n g   o n   h o w   e f f i c i e n t   A S ' s   a r r a y   r e s i z i n g   a l g o r i t h m   i s   ( t r a d i t i o n a l l y   i t   s c a l e d   t e r r i b l y ) ,   i t   m i g h t   b e   b e t t e r   r e d o i n g   i t ;   s i m i l a r l y ,   ` f i l t e r   l i s t `   c o u l d   a v o i d   d y n a m i c   r e s i z e s   b y   w o r k i n g   o n   s h a l l o w   c o p y   o f   o r i g i n a l   l i s t   a n d   j u s t   s h i f t i n g   e a c h   i t e m   l e f t   a n d   t r i m m i n g   w h e n   d o n e   ( i . e .   O ( 3 n ) ) ;   n e e d   t o   p r o f i l e   b o t h   a l g o r i t h m s   f o r   a   r a n g e   o f   l i s t   s i z e s   t o   d e t e r m i n e   i f   d i f f e r e n c e   i s   s i g n i f i c a n t   o r   n o t\ c�tc Q    ydefd k    dgg hih r    jkj n   lml I    �sn�r�s "0 aslistparameter asListParametern opo o    �q�q 0 thelist theListp q�pq m    rr �ss  �p  �r  m o    �o�o 0 _supportlib _supportLibk o      �n�n 0 thelist theListi tut r    #vwv n   !xyx I    !�mz�l�m &0 asscriptparameter asScriptParameterz {|{ o    �k�k 0 	thescript 	theScript| }�j} m    ~~ � 
 u s i n g�j  �l  y o    �i�i 0 _supportlib _supportLibw o      �h�h 0 	thescript 	theScriptu ��� Q   $ a���� Y   ' E��g���f� l  4 @���� r   4 @��� n  4 =��� I   5 =�e��d�e 0 convertitem convertItem� ��c� n   5 9��� 4   6 9�b�
�b 
cobj� o   7 8�a�a 0 i  � o   5 6�`�` 0 thelist theList�c  �d  � o   4 5�_�_ 0 	thescript 	theScript� n      ���  ;   > ?� o   = >�^�^ 0 
resultlist 
resultList� � ~ use counting loop rather than `repeat with aRef in theList` as the item's index is also used when constructing error messages   � ��� �   u s e   c o u n t i n g   l o o p   r a t h e r   t h a n   ` r e p e a t   w i t h   a R e f   i n   t h e L i s t `   a s   t h e   i t e m ' s   i n d e x   i s   a l s o   u s e d   w h e n   c o n s t r u c t i n g   e r r o r   m e s s a g e s�g 0 i  � m   * +�]�] � n   + /��� 1   , .�\
�\ 
leng� o   + ,�[�[ 0 thelist theList�f  � R      �Z��
�Z .ascrerr ****      � ****� o      �Y�Y 0 etext eText� �X��
�X 
errn� o      �W�W 0 enumber eNumber� �V��U
�V 
errt� o      �T�T 
0 eto eTo�U  � k   M a�� ��� l  M M�S���S  � � � TO DO: how best to report errors? (AS's lack of stack traces is a pain); for now, use `from` to supply reference to the failed item in the input list   � ���,   T O   D O :   h o w   b e s t   t o   r e p o r t   e r r o r s ?   ( A S ' s   l a c k   o f   s t a c k   t r a c e s   i s   a   p a i n ) ;   f o r   n o w ,   u s e   ` f r o m `   t o   s u p p l y   r e f e r e n c e   t o   t h e   f a i l e d   i t e m   i n   t h e   i n p u t   l i s t� ��R� R   M a�Q��
�Q .ascrerr ****      � ****� b   Y `��� b   Y ^��� b   Y \��� m   Y Z�� ��� * C o u l d n ' t   c o n v e r t   i t e m� o   Z [�P�P 0 i  � m   \ ]�� ���  :  � o   ^ _�O�O 0 etext eText� �N��
�N 
errn� o   O P�M�M 0 enumber eNumber� �L��
�L 
erob� l  Q V��K�J� N   Q V�� n   Q U��� 4   R U�I�
�I 
cobj� o   S T�H�H 0 i  � o   Q R�G�G 0 thelist theList�K  �J  � �F��E
�F 
errt� o   W X�D�D 
0 eto eTo�E  �R  � ��C� L   b d�� o   b c�B�B 0 
resultlist 
resultList�C  e R      �A��
�A .ascrerr ****      � ****� o      �@�@ 0 etext eText� �?��
�? 
errn� o      �>�> 0 enumber eNumber� �=��
�= 
erob� o      �<�< 0 efrom eFrom� �;��:
�; 
errt� o      �9�9 
0 eto eTo�:  f I   l y�8��7�8 20 _errorwithpartialresult _errorWithPartialResult� ��� m   m p�� ���  m a p   l i s t� ��� o   p q�6�6 0 etext eText� ��� o   q r�5�5 0 enumber eNumber� ��� o   r s�4�4 0 efrom eFrom� ��� o   s t�3�3 
0 eto eTo� ��2� o   t u�1�1 0 
resultlist 
resultList�2  �7  �t  T ��� l     �0�/�.�0  �/  �.  � ��� l     �-�,�+�-  �,  �+  � ��� i  % (��� I     �*��
�* .Lst:Filtnull���     ****� o      �)�) 0 thelist theList� �(��'
�( 
Usin� o      �&�& 0 	thescript 	theScript�'  � k     y�� ��� r     ��� J     �%�%  � o      �$�$ 0 
resultlist 
resultList� ��#� Q    y���� k    d�� ��� r    ��� n   ��� I    �"��!�" "0 aslistparameter asListParameter� ��� o    � �  0 thelist theList� ��� m    �� ���  �  �!  � o    �� 0 _supportlib _supportLib� o      �� 0 thelist theList� ��� r    #��� n   !��� I    !���� &0 asscriptparameter asScriptParameter� ��� o    �� 0 	thescript 	theScript� ��� m    �� ��� 
 u s i n g�  �  � o    �� 0 _supportlib _supportLib� o      �� 0 	thescript 	theScript� � � Q   $ a Y   ' E�� r   4 @ n  4 =	
	 I   5 =��� 0 	checkitem 	checkItem � n   5 9 4   6 9�
� 
cobj o   7 8�� 0 i   o   5 6�� 0 thelist theList�  �  
 o   4 5�� 0 	thescript 	theScript n        ;   > ? o   = >�� 0 
resultlist 
resultList� 0 i   m   * +��  n   + / 1   , .�
� 
leng o   + ,�
�
 0 thelist theList�   R      �	
�	 .ascrerr ****      � **** o      �� 0 etext eText �
� 
errn o      �� 0 enumber eNumber ��
� 
errt o      �� 
0 eto eTo�   R   M a�
� .ascrerr ****      � **** b   Y ` b   Y ^ b   Y \  m   Y Z!! �"" * C o u l d n ' t   f i l t e r   i t e m    o   Z [�� 0 i   m   \ ]## �$$  :   o   ^ _� �  0 etext eText ��%&
�� 
errn% o   O P���� 0 enumber eNumber& ��'(
�� 
erob' l  Q V)����) N   Q V** n   Q U+,+ 4   R U��-
�� 
cobj- o   S T���� 0 i  , o   Q R���� 0 thelist theList��  ��  ( ��.��
�� 
errt. o   W X���� 
0 eto eTo��    /��/ L   b d00 o   b c���� 0 
resultlist 
resultList��  � R      ��12
�� .ascrerr ****      � ****1 o      ���� 0 etext eText2 ��34
�� 
errn3 o      ���� 0 enumber eNumber4 ��56
�� 
erob5 o      ���� 0 efrom eFrom6 ��7��
�� 
errt7 o      ���� 
0 eto eTo��  � I   l y��8���� 20 _errorwithpartialresult _errorWithPartialResult8 9:9 m   m p;; �<<  f i l t e r   l i s t: =>= o   p q���� 0 etext eText> ?@? o   q r���� 0 enumber eNumber@ ABA o   r s���� 0 efrom eFromB CDC o   s t���� 
0 eto eToD E��E o   t u���� 0 
resultlist 
resultList��  ��  �#  � FGF l     ��������  ��  ��  G HIH l     ��������  ��  ��  I JKJ i  ) ,LML I     ��NO
�� .Lst:Redunull���     ****N o      ���� 0 thelist theListO ��P��
�� 
UsinP o      ���� 0 	thescript 	theScript��  M k     �QQ RSR r     TUT o     ���� 0 missingvalue missingValueU o      ���� 0 	theresult 	theResultS V��V Q    �WXYW k    �ZZ [\[ r    ]^] n   _`_ I    ��a���� "0 aslistparameter asListParametera bcb o    ���� 0 thelist theListc d��d m    ee �ff  ��  ��  ` o    ���� 0 _supportlib _supportLib^ o      ���� 0 thelist theList\ ghg Z   )ij����i =    klk n    mnm 1    ��
�� 
lengn o    ���� 0 thelist theListl m    ����  j R    %��op
�� .ascrerr ****      � ****o m   # $qq �rr  L i s t   i s   e m p t y .p ��st
�� 
errns m     �����Yt ��u��
�� 
erobu o   ! "���� 0 thelist theList��  ��  ��  h vwv r   * 7xyx n  * 5z{z I   / 5��|���� &0 asscriptparameter asScriptParameter| }~} o   / 0���� 0 	thescript 	theScript~ �� m   0 1�� ��� 
 u s i n g��  ��  { o   * /���� 0 _supportlib _supportLiby o      ���� 0 	thescript 	theScriptw ��� r   8 >��� n   8 <��� 4   9 <���
�� 
cobj� m   : ;���� � o   8 9���� 0 thelist theList� o      ���� 0 	theresult 	theResult� ��� Q   ? ����� Y   B `�������� r   O [��� n  O Y��� I   P Y������� 0 combineitems combineItems� ��� o   P Q���� 0 	theresult 	theResult� ���� n   Q U��� 4   R U���
�� 
cobj� o   S T���� 0 i  � o   Q R���� 0 thelist theList��  ��  � o   O P���� 0 	thescript 	theScript� o      ���� 0 	theresult 	theResult�� 0 i  � m   E F���� � n   F J��� 1   G I��
�� 
leng� o   F G���� 0 thelist theList��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� �����
�� 
errt� o      ���� 
0 eto eTo��  � R   h �����
�� .ascrerr ****      � ****� b   t ��� b   t }��� b   t y��� m   t w�� ��� * C o u l d n ' t   r e d u c e   i t e m  � o   w x���� 0 i  � m   y |�� ���  :  � o   } ~���� 0 etext eText� ����
�� 
errn� o   j k���� 0 enumber eNumber� ����
�� 
erob� l  l q������ N   l q�� n   l p��� 4   m p���
�� 
cobj� o   n o���� 0 i  � o   l m���� 0 thelist theList��  ��  � �����
�� 
errt� o   r s���� 
0 eto eTo��  � ���� L   � ��� o   � ����� 0 	theresult 	theResult��  X R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  Y I   � �������� 20 _errorwithpartialresult _errorWithPartialResult� ��� m   � ��� ���  r e d u c e   l i s t� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ��� o   � ����� 
0 eto eTo� ���� o   � ����� 0 	theresult 	theResult��  ��  ��  K ��� l     ��������  ��  ��  � ��� l     ��~�}�  �~  �}  � ��� l     �|���|  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �{���{  �   sort   � ��� 
   s o r t� ��� l     �z�y�x�z  �y  �x  � ��� l      �w���w  �zt Notes: 

- Quicksort provides between [best case] O(n * log n) and [worst case] O(n * n) efficiency, typically leaning towards the former in all but the most pathological cases.

- One limitation of quicksort is that it isn't stable, i.e. items that compare as equal can appear in any order in the resulting list; their original order isn't preserved. An alternate algorithm such as Heapsort would avoid this, but would likely be significantly slower on average (while heapsort is guaranteed to be O(n * log n), it has much higher constant overhead than quicksort which tends to be fast in all but the most degenerate cases).

   � ����   N o t e s :   
 
 -   Q u i c k s o r t   p r o v i d e s   b e t w e e n   [ b e s t   c a s e ]   O ( n   *   l o g   n )   a n d   [ w o r s t   c a s e ]   O ( n   *   n )   e f f i c i e n c y ,   t y p i c a l l y   l e a n i n g   t o w a r d s   t h e   f o r m e r   i n   a l l   b u t   t h e   m o s t   p a t h o l o g i c a l   c a s e s . 
 
 -   O n e   l i m i t a t i o n   o f   q u i c k s o r t   i s   t h a t   i t   i s n ' t   s t a b l e ,   i . e .   i t e m s   t h a t   c o m p a r e   a s   e q u a l   c a n   a p p e a r   i n   a n y   o r d e r   i n   t h e   r e s u l t i n g   l i s t ;   t h e i r   o r i g i n a l   o r d e r   i s n ' t   p r e s e r v e d .   A n   a l t e r n a t e   a l g o r i t h m   s u c h   a s   H e a p s o r t   w o u l d   a v o i d   t h i s ,   b u t   w o u l d   l i k e l y   b e   s i g n i f i c a n t l y   s l o w e r   o n   a v e r a g e   ( w h i l e   h e a p s o r t   i s   g u a r a n t e e d   t o   b e   O ( n   *   l o g   n ) ,   i t   h a s   m u c h   h i g h e r   c o n s t a n t   o v e r h e a d   t h a n   q u i c k s o r t   w h i c h   t e n d s   t o   b e   f a s t   i n   a l l   b u t   t h e   m o s t   d e g e n e r a t e   c a s e s ) . 
 
� ��� l     �v�u�t�v  �u  �t  � ��� l     �s�r�q�s  �r  �q  � ��� i  - 0��� I      �p��o�p 0 _hashandler _hasHandler� ��n� o      �m�m 0 
handlerref 
handlerRef�n  �o  � Q     ���� l   	���� k    	�� ��� c    ��� o    �l�l 0 
handlerref 
handlerRef� m    �k
�k 
hand� ��j� L    	�� m    �i
�i boovtrue�j  � G A horrible hack to check if a script object has a specific handler   � ��� �   h o r r i b l e   h a c k   t o   c h e c k   i f   a   s c r i p t   o b j e c t   h a s   a   s p e c i f i c   h a n d l e r� R      �h�g�
�h .ascrerr ****      � ****�g  � �f��e
�f 
errn� d      �� m      �d�d��e  � l      L     m    �c
�c boovfals   doesn't exist    �    d o e s n ' t   e x i s t�  l     �b�a�`�b  �a  �`    l     �_�^�]�_  �^  �]   	
	 i  1 4 I      �\�[�\ 	0 _sort    o      �Z�Z 0 keylist keyList  o      �Y�Y 0 	valuelist 	valueList  o      �X�X 0 	fromindex 	fromIndex  o      �W�W 0 toindex toIndex  o      �V�V  0 sortcomparator sortComparator �U o      �T�T 0 usequicksort useQuickSort�U  �[   l   � k    �  l     �S �S   � � note: this will fall-through to use insertionsort when sorting small number of items, or when sorting a mostly-sorted list, or when quicksort recursion exceeds AS's stack depth; otherwise use quicksort     �!!�   n o t e :   t h i s   w i l l   f a l l - t h r o u g h   t o   u s e   i n s e r t i o n s o r t   w h e n   s o r t i n g   s m a l l   n u m b e r   o f   i t e m s ,   o r   w h e n   s o r t i n g   a   m o s t l y - s o r t e d   l i s t ,   o r   w h e n   q u i c k s o r t   r e c u r s i o n   e x c e e d s   A S ' s   s t a c k   d e p t h ;   o t h e r w i s e   u s e   q u i c k s o r t "#" Z    @$%�R�Q$ o     �P�P 0 usequicksort useQuickSort% k   <&& '(' r    )*) J    ++ ,-, o    �O�O 0 	fromindex 	fromIndex- .�N. o    �M�M 0 toindex toIndex�N  * J      // 010 o      �L�L 0 	leftindex 	leftIndex1 2�K2 o      �J�J 0 
rightindex 
rightIndex�K  ( 343 l   5675 r    898 n    :;: 3    �I
�I 
cobj; o    �H�H 0 keylist keyList9 o      �G�G 0 
pivotvalue 
pivotValue6 s m TO DO: if valueList's length>someThreshold then use median of 3 items (or 9 in the case of very large lists)   7 �<< �   T O   D O :   i f   v a l u e L i s t ' s   l e n g t h > s o m e T h r e s h o l d   t h e n   u s e   m e d i a n   o f   3   i t e m s   ( o r   9   i n   t h e   c a s e   o f   v e r y   l a r g e   l i s t s )4 =>= V   ?@? k   &AA BCB Q   & `DEFD V   ) FGHG l  < AIJKI r   < ALML [   < ?NON o   < =�F�F 0 	leftindex 	leftIndexO m   = >�E�E M o      �D�D 0 	leftindex 	leftIndexJ � } while cmp returns -1; note that if compareObjects() returns a non-numeric value/no result, this will throw -1700/-2763 error   K �PP �   w h i l e   c m p   r e t u r n s   - 1 ;   n o t e   t h a t   i f   c o m p a r e O b j e c t s ( )   r e t u r n s   a   n o n - n u m e r i c   v a l u e / n o   r e s u l t ,   t h i s   w i l l   t h r o w   - 1 7 0 0 / - 2 7 6 3   e r r o rH A   - ;QRQ c   - 9STS n  - 7UVU I   . 7�CW�B�C  0 compareobjects compareObjectsW XYX n   . 2Z[Z 4   / 2�A\
�A 
cobj\ o   0 1�@�@ 0 	leftindex 	leftIndex[ o   . /�?�? 0 keylist keyListY ]�>] o   2 3�=�= 0 
pivotvalue 
pivotValue�>  �B  V o   - .�<�<  0 sortcomparator sortComparatorT m   7 8�;
�; 
nmbrR m   9 :�:�:  E R      �9^_
�9 .ascrerr ****      � ****^ o      �8�8 0 etext eText_ �7`a
�7 
errn` o      �6�6 0 enum eNuma �5bc
�5 
erobb o      �4�4 0 efrom eFromc �3d�2
�3 
errtd o      �1�1 
0 eto eTo�2  F R   N `�0ef
�0 .ascrerr ****      � ****e b   \ _ghg m   \ ]ii �jj < C o u l d n ' t   c o m p a r e   o b j e c t   k e y s :  h o   ] ^�/�/ 0 etext eTextf �.kl
�. 
errnk o   P Q�-�- 0 enum eNuml �,mn
�, 
erobm J   R Yoo pqp n   R Vrsr 4   S V�+t
�+ 
cobjt o   T U�*�* 0 	leftindex 	leftIndexs o   R S�)�) 0 keylist keyListq u�(u o   V W�'�' 0 
pivotvalue 
pivotValue�(  n �&v�%
�& 
errtv o   Z [�$�$ 
0 eto eTo�%  C wxw Q   a �yz{y V   d �|}| l  w |~�~ r   w |��� \   w z��� o   w x�#�# 0 
rightindex 
rightIndex� m   x y�"�" � o      �!�! 0 
rightindex 
rightIndex   while cmp returns 1;    � ��� ,   w h i l e   c m p   r e t u r n s   1 ;  } ?   h v��� c   h t��� n  h r��� I   i r� ���   0 compareobjects compareObjects� ��� n   i m��� 4   j m��
� 
cobj� o   k l�� 0 
rightindex 
rightIndex� o   i j�� 0 keylist keyList� ��� o   m n�� 0 
pivotvalue 
pivotValue�  �  � o   h i��  0 sortcomparator sortComparator� m   r s�
� 
nmbr� m   t u��  z R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enum eNum� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  { R   � ����
� .ascrerr ****      � ****� b   � ���� m   � ��� ��� < C o u l d n ' t   c o m p a r e   o b j e c t   k e y s :  � o   � ��� 0 etext eText� ���
� 
errn� o   � ��
�
 0 enum eNum� �	��
�	 
erob� J   � ��� ��� n   � ���� 4   � ���
� 
cobj� o   � ��� 0 
rightindex 
rightIndex� o   � ��� 0 keylist keyList� ��� o   � ��� 0 
pivotvalue 
pivotValue�  � ���
� 
errt� o   � ��� 
0 eto eTo�  x �� � Z   �������� l  � ������� H   � ��� ?   � ���� o   � ����� 0 	leftindex 	leftIndex� o   � ����� 0 
rightindex 
rightIndex��  ��  � k   ��� ��� O  � ���� r   � ���� J   � ��� ��� 4   � ����
�� 
cobj� o   � ����� 0 
rightindex 
rightIndex� ���� 4   � ����
�� 
cobj� o   � ����� 0 	leftindex 	leftIndex��  � J      �� ��� 4   � ����
�� 
cobj� o   � ����� 0 	leftindex 	leftIndex� ���� 4   � ����
�� 
cobj� o   � ����� 0 
rightindex 
rightIndex��  � o   � ����� 0 keylist keyList� ��� O  � ���� r   � ���� J   � ��� ��� 4   � ����
�� 
cobj� o   � ����� 0 
rightindex 
rightIndex� ���� 4   � ����
�� 
cobj� o   � ����� 0 	leftindex 	leftIndex��  � J      �� ��� 4   � ����
�� 
cobj� o   � ����� 0 	leftindex 	leftIndex� ���� 4   � ����
�� 
cobj� o   � ����� 0 
rightindex 
rightIndex��  � o   � ����� 0 	valuelist 	valueList� ���� r   ���� J   � ��� ��� [   � ���� o   � ����� 0 	leftindex 	leftIndex� m   � ����� � ���� \   � ���� o   � ����� 0 
rightindex 
rightIndex� m   � ����� ��  � J      �� ��� o      ���� 0 	leftindex 	leftIndex� ���� o      ���� 0 
rightindex 
rightIndex��  ��  ��  ��  �   @ B   " %��� o   " #���� 0 	leftindex 	leftIndex� o   # $���� 0 
rightindex 
rightIndex> ���� Q  <���� k  3�� ��� l ������  � � � the following calls will use insertionsort instead of quicksort when sorting �10 items, as insertionsort, while typically less efficient than quicksort, has a lower constant overhead   � ���n   t h e   f o l l o w i n g   c a l l s   w i l l   u s e   i n s e r t i o n s o r t   i n s t e a d   o f   q u i c k s o r t   w h e n   s o r t i n g  "d 1 0   i t e m s ,   a s   i n s e r t i o n s o r t ,   w h i l e   t y p i c a l l y   l e s s   e f f i c i e n t   t h a n   q u i c k s o r t ,   h a s   a   l o w e r   c o n s t a n t   o v e r h e a d� ��� I   ������� 	0 _sort  � ��� o  ���� 0 keylist keyList� ��� o  ���� 0 	valuelist 	valueList� ��� o  ���� 0 	fromindex 	fromIndex� ��� o  ���� 0 
rightindex 
rightIndex� ��� o  ����  0 sortcomparator sortComparator�  ��  ?   \   o  ���� 0 
rightindex 
rightIndex o  ���� 0 	fromindex 	fromIndex m  ���� 
��  ��  �  I  !0������ 	0 _sort   	 o  "#���� 0 keylist keyList	 

 o  #$���� 0 	valuelist 	valueList  o  $%���� 0 	leftindex 	leftIndex  o  %&���� 0 toindex toIndex  o  &'����  0 sortcomparator sortComparator �� ?  ', \  '* o  '(���� 0 toindex toIndex o  ()���� 0 	leftindex 	leftIndex m  *+���� 
��  ��   �� L  13����  ��  � R      ����
�� .ascrerr ****      � ****��   ����
�� 
errn d       m      ����
���  � l ;;����   J D stack overflow, so fall-through to use non-recursive insertion sort    � �   s t a c k   o v e r f l o w ,   s o   f a l l - t h r o u g h   t o   u s e   n o n - r e c u r s i v e   i n s e r t i o n   s o r t��  �R  �Q  #  l AA�� !��    � � fall-through to use loop-based insertion sort when sorting a small number of items (for which it is faster than quicksort), or when quicksort recursion overflows AppleScript's call stack   ! �""v   f a l l - t h r o u g h   t o   u s e   l o o p - b a s e d   i n s e r t i o n   s o r t   w h e n   s o r t i n g   a   s m a l l   n u m b e r   o f   i t e m s   ( f o r   w h i c h   i t   i s   f a s t e r   t h a n   q u i c k s o r t ) ,   o r   w h e n   q u i c k s o r t   r e c u r s i o n   o v e r f l o w s   A p p l e S c r i p t ' s   c a l l   s t a c k #$# r  AF%&% [  AD'(' o  AB���� 0 	fromindex 	fromIndex( m  BC���� & o      ���� 0 	fromindex 	fromIndex$ )��) Y  G�*��+,��* Y  Q�-��./0- k  [�11 232 r  [x454 J  [g66 787 n  [a9:9 4  \a��;
�� 
cobj; l ]`<����< \  ]`=>= o  ]^���� 0 j  > m  ^_���� ��  ��  : o  [\���� 0 keylist keyList8 ?��? n  ae@A@ 4  be��B
�� 
cobjB o  cd���� 0 j  A o  ab���� 0 keylist keyList��  5 J      CC DED o      ���� 0 leftkey leftKeyE F��F o      ���� 0 rightkey rightKey��  3 GHG l y�IJKI Z y�LM����L A  y�NON n y�PQP I  z���R����  0 compareobjects compareObjectsR STS o  z{���� 0 leftkey leftKeyT U��U o  {~���� 0 rightkey rightKey��  ��  Q o  yz����  0 sortcomparator sortComparatorO m  ������ M  S  ����  ��  J !  stop when leftKey�rightKey   K �VV 6   s t o p   w h e n   l e f t K e y"d r i g h t K e yH WXW r  ��YZY J  ��[[ \]\ o  ������ 0 rightkey rightKey] ^��^ o  ������ 0 leftkey leftKey��  Z J      __ `a` n      bcb 4  ����d
�� 
cobjd l ��e����e \  ��fgf o  ������ 0 j  g m  ������ ��  ��  c o  ������ 0 keylist keyLista h��h n      iji 4  ����k
�� 
cobjk o  ������ 0 j  j o  ������ 0 keylist keyList��  X l��l r  ��mnm J  ��oo pqp n  ��rsr 4  ����t
�� 
cobjt o  ������ 0 j  s o  ������ 0 	valuelist 	valueListq u��u n  ��vwv 4  ����x
�� 
cobjx l ��y����y \  ��z{z o  ������ 0 j  { m  ������ ��  ��  w o  ������ 0 	valuelist 	valueList��  n J      || }~} n      � 4  �����
�� 
cobj� l �������� \  ����� o  ���� 0 j  � m  ���~�~ ��  ��  � o  ���}�} 0 	valuelist 	valueList~ ��|� n      ��� 4  ���{�
�{ 
cobj� o  ���z�z 0 j  � o  ���y�y 0 	valuelist 	valueList�|  ��  �� 0 j  . o  TU�x�x 0 i  / o  UV�w�w 0 	fromindex 	fromIndex0 m  VW�v�v���� 0 i  + o  JK�u�u 0 	fromindex 	fromIndex, o  KL�t�t 0 toindex toIndex��  ��   0 * performs in-place quicksort/insertionsort    ��� T   p e r f o r m s   i n - p l a c e   q u i c k s o r t / i n s e r t i o n s o r t
 ��� l     �s�r�q�s  �r  �q  � ��� l     �p�o�n�p  �o  �n  � ��� l     �m�l�k�m  �l  �k  � ��� i  5 8��� I     �j��
�j .Lst:Sortnull���     ****� o      �i�i 0 thelist theList� �h��g
�h 
Comp� |�f�e��d��f  �e  � o      �c�c $0 comparatorobject comparatorObject�d  � m      �b
�b 
msng�g  � k    ��� ��� l     �a���a  �1+ note that `sort list` currently doesn't implement a `reversed order` parameter as its quicksort algorithm isn't stable (i.e. items that compare as equal will appear in any order, not the order in which they were supplied), so such an option would be useless in practice and rather misleading too. (To get a list in descending order, just get the returned list's `reverse` property or else pass a comparator containing a suitable compareObjects handler.) This parameter can always be added in future if/when a stable sorting algorithm is ever implemented.   � ���V   n o t e   t h a t   ` s o r t   l i s t `   c u r r e n t l y   d o e s n ' t   i m p l e m e n t   a   ` r e v e r s e d   o r d e r `   p a r a m e t e r   a s   i t s   q u i c k s o r t   a l g o r i t h m   i s n ' t   s t a b l e   ( i . e .   i t e m s   t h a t   c o m p a r e   a s   e q u a l   w i l l   a p p e a r   i n   a n y   o r d e r ,   n o t   t h e   o r d e r   i n   w h i c h   t h e y   w e r e   s u p p l i e d ) ,   s o   s u c h   a n   o p t i o n   w o u l d   b e   u s e l e s s   i n   p r a c t i c e   a n d   r a t h e r   m i s l e a d i n g   t o o .   ( T o   g e t   a   l i s t   i n   d e s c e n d i n g   o r d e r ,   j u s t   g e t   t h e   r e t u r n e d   l i s t ' s   ` r e v e r s e `   p r o p e r t y   o r   e l s e   p a s s   a   c o m p a r a t o r   c o n t a i n i n g   a   s u i t a b l e   c o m p a r e O b j e c t s   h a n d l e r . )   T h i s   p a r a m e t e r   c a n   a l w a y s   b e   a d d e d   i n   f u t u r e   i f / w h e n   a   s t a b l e   s o r t i n g   a l g o r i t h m   i s   e v e r   i m p l e m e n t e d .� ��� l    ���� r     ��� J     �`�`  � o      �_�_ 0 
resultlist 
resultList� S M (only needed to keep the `on error` clause at the end of this handler happy)   � ��� �   ( o n l y   n e e d e d   t o   k e e p   t h e   ` o n   e r r o r `   c l a u s e   a t   t h e   e n d   o f   t h i s   h a n d l e r   h a p p y )� ��^� Q   ����� k   ��� ��� r    ��� n    ��� 2   �]
�] 
cobj� n   ��� I    �\��[�\ "0 aslistparameter asListParameter� ��� o    �Z�Z 0 thelist theList� ��Y� m    �� ���  �Y  �[  � o    �X�X 0 _supportlib _supportLib� o      �W�W 0 
resultlist 
resultList� ��� Z   &���V�U� A    ��� n   ��� 1    �T
�T 
leng� o    �S�S 0 
resultlist 
resultList� m    �R�R � L     "�� o     !�Q�Q 0 
resultlist 
resultList�V  �U  � ��� Z   ' D���P�� =  ' *��� o   ' (�O�O $0 comparatorobject comparatorObject� m   ( )�N
�N 
msng� r   - 4��� I   - 2�M�L�K�M 00 _makedefaultcomparator _makeDefaultComparator�L  �K  � o      �J�J  0 sortcomparator sortComparator�P  � r   7 D��� n  7 B��� I   < B�I��H�I &0 asscriptparameter asScriptParameter� ��� o   < =�G�G $0 comparatorobject comparatorObject� ��F� m   = >�� ��� 
 u s i n g�F  �H  � o   7 <�E�E 0 _supportlib _supportLib� o      �D�D  0 sortcomparator sortComparator� ��� l  E E�C���C  ��} note: the quickest way to check types is (count {resultList} each number/text/date) = length of resultList; could also accept number/text/date in `using` and create default comparator according to that; OTOH, a benefit of this extra O(n) pass is that we can check if list is already sorted or almost sorted and return immediately or use insertionsort instead of quicksort if it is   � ����   n o t e :   t h e   q u i c k e s t   w a y   t o   c h e c k   t y p e s   i s   ( c o u n t   { r e s u l t L i s t }   e a c h   n u m b e r / t e x t / d a t e )   =   l e n g t h   o f   r e s u l t L i s t ;   c o u l d   a l s o   a c c e p t   n u m b e r / t e x t / d a t e   i n   ` u s i n g `   a n d   c r e a t e   d e f a u l t   c o m p a r a t o r   a c c o r d i n g   t o   t h a t ;   O T O H ,   a   b e n e f i t   o f   t h i s   e x t r a   O ( n )   p a s s   i s   t h a t   w e   c a n   c h e c k   i f   l i s t   i s   a l r e a d y   s o r t e d   o r   a l m o s t   s o r t e d   a n d   r e t u r n   i m m e d i a t e l y   o r   u s e   i n s e r t i o n s o r t   i n s t e a d   o f   q u i c k s o r t   i f   i t   i s� ��� l  E E�B�A�@�B  �A  �@  � ��� l  E E�?���?  � TO DO: if makeKey not specified, throw error if all items are not same type (number/text/date); this'll prevent unpredictable results due to mixed types (e.g. {11,"2"} vs {"11", 2}), forcing users to pass an appropriate comparator if they want to sort mixed lists   � ���   T O   D O :   i f   m a k e K e y   n o t   s p e c i f i e d ,   t h r o w   e r r o r   i f   a l l   i t e m s   a r e   n o t   s a m e   t y p e   ( n u m b e r / t e x t / d a t e ) ;   t h i s ' l l   p r e v e n t   u n p r e d i c t a b l e   r e s u l t s   d u e   t o   m i x e d   t y p e s   ( e . g .   { 1 1 , " 2 " }   v s   { " 1 1 " ,   2 } ) ,   f o r c i n g   u s e r s   t o   p a s s   a n   a p p r o p r i a t e   c o m p a r a t o r   i f   t h e y   w a n t   t o   s o r t   m i x e d   l i s t s� ��� Z   E ����>�� F   E V��� >  E H��� o   E F�=�= $0 comparatorobject comparatorObject� m   F G�<
�< 
msng� I   K T�;��:�; 0 _hashandler _hasHandler� ��9� N   L P�� n   L O��� o   M O�8�8 0 makekey makeKey� o   L M�7�7  0 sortcomparator sortComparator�9  �:  � l  Y \���� r   Y \��� o   Y Z�6�6  0 sortcomparator sortComparator� o      �5�5 0 keymaker keyMaker� M G call comparator's makeKey method to generate each sortable key in turn   � ��� �   c a l l   c o m p a r a t o r ' s   m a k e K e y   m e t h o d   t o   g e n e r a t e   e a c h   s o r t a b l e   k e y   i n   t u r n�>  � k   _ ��� ��� Z   _ ����4�3� F   _ ���� F   _ z��� >   _ j� � l  _ f�2�1 I  _ f�0
�0 .corecnte****       **** o   _ `�/�/ 0 
resultlist 
resultList �.�-
�. 
kocl m   a b�,
�, 
nmbr�-  �2  �1    n  f i 1   g i�+
�+ 
leng o   f g�*�* 0 
resultlist 
resultList� >   m x l 	 m t	�)�(	 l  m t
�'�&
 I  m t�%
�% .corecnte****       **** o   m n�$�$ 0 
resultlist 
resultList �#�"
�# 
kocl m   o p�!
�! 
ctxt�"  �'  �&  �)  �(   n  t w 1   u w� 
�  
leng o   t u�� 0 
resultlist 
resultList� >   } � l 	 } ��� l  } ��� I  } ��
� .corecnte****       **** o   } ~�� 0 
resultlist 
resultList ��
� 
kocl m    ��
� 
ldt �  �  �  �  �   n  � � 1   � ��
� 
leng o   � ��� 0 
resultlist 
resultList� R   � ��
� .ascrerr ****      � **** m   � � � � O n l y   l i s t s   o f   n u m b e r s   O R   t e x t   O R   d a t e s   c a n   b e   s o r t e d   u n l e s s   t h e    u s i n g    p a r a m e t e r   i s   g i v e n . ��
� 
errn m   � ����Y�  �4  �3  � � r   � �  I   � ����� 00 _makedefaultcomparator _makeDefaultComparator�  �    o      �� 0 keymaker keyMaker�  � !"! l  � �#$%# r   � �&'& J   � �(( )*) m   � ��
�
  * +�	+ m   � ���  �	  ' J      ,, -.- o      ��  0 ascendingcount ascendingCount. /�/ o      �� "0 descendingcount descendingCount�  $ � � while generating keys also check if list is already almost/fully sorted (either ascending or descending) and if it is use insertionsort/return as-is   % �00*   w h i l e   g e n e r a t i n g   k e y s   a l s o   c h e c k   i f   l i s t   i s   a l r e a d y   a l m o s t / f u l l y   s o r t e d   ( e i t h e r   a s c e n d i n g   o r   d e s c e n d i n g )   a n d   i f   i t   i s   u s e   i n s e r t i o n s o r t / r e t u r n   a s - i s" 121 r   � �343 n   � �565 2  � ��
� 
cobj6 o   � ��� 0 
resultlist 
resultList4 o      �� 0 keylist keyList2 787 Q   ��9:;9 k   �j<< =>= Q   � �?@A? r   � �BCB n  � �DED I   � ��F� � 0 makekey makeKeyF G��G n   � �HIH 4   � ���J
�� 
cobjJ m   � ����� I o   � ����� 0 keylist keyList��  �   E o   � �����  0 sortcomparator sortComparatorC o      ���� 0 previouskey previousKey@ R      ��KL
�� .ascrerr ****      � ****K o      ���� 0 etext eTextL ��MN
�� 
errnM o      ���� 0 enum eNumN ��OP
�� 
erobO o      ���� 0 efrom eFromP ��Q��
�� 
errtQ o      ���� 
0 eto eTo��  A R   � ���RS
�� .ascrerr ****      � ****R b   � �TUT m   � �VV �WW : C o u l d n ' t   m a k e K e y   f o r   i t e m   1 :  U o   � ����� 0 etext eTextS ��XY
�� 
errnX o   � ����� 0 enum eNumY ��Z[
�� 
erobZ o   � ����� 0 efrom eFrom[ ��\��
�� 
errt\ o   � ����� 
0 eto eTo��  > ]^] r   � �_`_ o   � ����� 0 previouskey previousKey` n      aba 4   � ���c
�� 
cobjc m   � ����� b o   � ����� 0 keylist keyList^ d��d Y   �je��fg��e l ehijh k  ekk lml Q  6nopn r  qrq n sts I  ��u���� 0 makekey makeKeyu v��v n  wxw 4  	��y
�� 
cobjy o  
���� 0 i  x o  	���� 0 keylist keyList��  ��  t o  ����  0 sortcomparator sortComparatorr o      ���� 0 
currentkey 
currentKeyo R      ��z{
�� .ascrerr ****      � ****z o      ���� 0 etext eText{ ��|}
�� 
errn| o      ���� 0 enum eNum} ��~
�� 
erob~ o      ���� 0 efrom eFrom �����
�� 
errt� o      ���� 
0 eto eTo��  p R  6����
�� .ascrerr ****      � ****� b  *5��� b  *3��� b  */��� m  *-�� ��� 4 C o u l d n ' t   m a k e K e y   f o r   i t e m  � o  -.���� 0 i  � m  /2�� ���  :  � o  34���� 0 etext eText� ����
�� 
errn� o  ���� 0 enum eNum� ����
�� 
erob� o  "#���� 0 efrom eFrom� �����
�� 
errt� o  &'���� 
0 eto eTo��  m ��� r  7=��� o  78���� 0 
currentkey 
currentKey� n      ��� 4  9<���
�� 
cobj� o  :;���� 0 i  � o  89���� 0 keylist keyList� ��� r  >G��� n >E��� I  ?E�������  0 compareobjects compareObjects� ��� o  ?@���� 0 previouskey previousKey� ���� o  @A���� 0 
currentkey 
currentKey��  ��  � o  >?����  0 sortcomparator sortComparator� o      ���� 0 keycomparison keyComparison� ���� Z  He������ A  HK��� o  HI���� 0 keycomparison keyComparison� m  IJ����  � l NS���� r  NS��� [  NQ��� o  NO����  0 ascendingcount ascendingCount� m  OP���� � o      ����  0 ascendingcount ascendingCount�   current key is larger   � ��� ,   c u r r e n t   k e y   i s   l a r g e r� ��� ?  VY��� o  VW���� 0 keycomparison keyComparison� m  WX����  � ���� l \a���� r  \a��� [  \_��� o  \]���� "0 descendingcount descendingCount� m  ]^���� � o      ���� "0 descendingcount descendingCount�   previous key is larger   � ��� .   p r e v i o u s   k e y   i s   l a r g e r��  ��  ��  i @ : TO DO: once again, need to know index for error reporting   j ��� t   T O   D O :   o n c e   a g a i n ,   n e e d   t o   k n o w   i n d e x   f o r   e r r o r   r e p o r t i n g�� 0 i  f m   � ����� g n  � ���� 1   � ���
�� 
leng� o   � ����� 0 keylist keyList��  ��  : R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enum eNum� �����
�� 
errt� o      ���� 
0 eto eTo��  ; R  r�����
�� .ascrerr ****      � ****� o  ������ 0 etext eText� ����
�� 
errn� o  vw���� 0 enum eNum� ����
�� 
erob� l z������ N  z�� n  z~��� 4  {~���
�� 
cobj� o  |}���� 0 i  � o  z{���� 0 
resultlist 
resultList��  ��  � �����
�� 
errt� o  ������ 
0 eto eTo��  8 ��� l ��������  � � �	log "   ORDEREDNESS=" & (ascendingCount * 100 div (resultList's length)) & " " & (descendingCount * 100 div (resultList's length))   � ��� 	 l o g   "       O R D E R E D N E S S = "   &   ( a s c e n d i n g C o u n t   *   1 0 0   d i v   ( r e s u l t L i s t ' s   l e n g t h ) )   &   "   "   &   ( d e s c e n d i n g C o u n t   *   1 0 0   d i v   ( r e s u l t L i s t ' s   l e n g t h ) )� ��� l ��������  � � � TO DO: if list is almost or fully ordered then tell _sort() to use insertionsort or return as-is (remembering to reverse order as necessary), as that will be quicker than quicksorting the whole thing   � ����   T O   D O :   i f   l i s t   i s   a l m o s t   o r   f u l l y   o r d e r e d   t h e n   t e l l   _ s o r t ( )   t o   u s e   i n s e r t i o n s o r t   o r   r e t u r n   a s - i s   ( r e m e m b e r i n g   t o   r e v e r s e   o r d e r   a s   n e c e s s a r y ) ,   a s   t h a t   w i l l   b e   q u i c k e r   t h a n   q u i c k s o r t i n g   t h e   w h o l e   t h i n g� ��� l ��������  � TO DO: what about lists containing lots of duplicates, e.g. when sorting a large list containing only numbers from 0 to 10, or only true/false (basic quicksort gets pathological on those cases, so a three-way quicksort or a mergesort would work much better there)   � ���   T O   D O :   w h a t   a b o u t   l i s t s   c o n t a i n i n g   l o t s   o f   d u p l i c a t e s ,   e . g .   w h e n   s o r t i n g   a   l a r g e   l i s t   c o n t a i n i n g   o n l y   n u m b e r s   f r o m   0   t o   1 0 ,   o r   o n l y   t r u e / f a l s e   ( b a s i c   q u i c k s o r t   g e t s   p a t h o l o g i c a l   o n   t h o s e   c a s e s ,   s o   a   t h r e e - w a y   q u i c k s o r t   o r   a   m e r g e s o r t   w o u l d   w o r k   m u c h   b e t t e r   t h e r e )� ��� l ������ r  ����� A  ����� n ����� 1  ����
�� 
leng� o  ������ 0 
resultlist 
resultList� m  ������ 
� o      ���� 0 usequicksort useQuickSort�   or is nearly ordered   � ��� *   o r   i s   n e a r l y   o r d e r e d� ��� I  ��������� 	0 _sort  � ��� o  ������ 0 keylist keyList� ��� o  ������ 0 
resultlist 
resultList� ��� m  ������ � ��� n ����� 1  ����
�� 
leng� o  ������ 0 
resultlist 
resultList� ��� o  ������  0 sortcomparator sortComparator� ���� o  ������ 0 usequicksort useQuickSort��  ��  � ���� L  ���� o  ������ 0 
resultlist 
resultList��  � R      ��� 
�� .ascrerr ****      � ****� o      ���� 0 etext eText  ��
�� 
errn o      ���� 0 enumber eNumber �
� 
erob o      �~�~ 0 efrom eFrom �}�|
�} 
errt o      �{�{ 
0 eto eTo�|  � I  ���z�y�z 20 _errorwithpartialresult _errorWithPartialResult  m  ��		 �

  s o r t   l i s t  o  ���x�x 0 etext eText  o  ���w�w 0 enumber eNumber  o  ���v�v 0 efrom eFrom  o  ���u�u 
0 eto eTo �t o  ���s�s 0 
resultlist 
resultList�t  �y  �^  �  l     �r�q�p�r  �q  �p    l     �o�n�m�o  �n  �m    i  9 < I     �l�k�j
�l .Lst:DeSonull��� ��� null�k  �j   h     �i�i &0 defaultcomparator DefaultComparator k        j     �h �h "0 _supportedtypes _supportedTypes  J     !! "#" m     �g
�g 
nmbr# $%$ m    �f
�f 
ctxt% &�e& m    �d
�d 
ldt �e   '(' j    	�c)�c 	0 _type  ) m    �b
�b 
msng( *+* i   
 ,-, I      �a.�`�a 0 makekey makeKey. /�_/ o      �^�^ 0 anobject anObject�_  �`  - k     �00 121 Z     �345�]3 =    676 o     �\�\ 	0 _type  7 m    �[
�[ 
msng4 k   
 J88 9:9 X   
 A;�Z<; Z    <=>�Y�X= I   )�W?@
�W .corecnte****       ****? J    AA B�VB o    �U�U 0 anobject anObject�V  @ �TC�S
�T 
koclC ?     %DED n    #FGF 1   ! #�R
�R 
pcntG o     !�Q�Q 0 aref aRefE m   # $�P�P  �S  > k   , 8HH IJI r   , 5KLK n  , /MNM 1   - /�O
�O 
pcntN o   , -�N�N 0 aref aRefL o      �M�M 	0 _type  J O�LO L   6 8PP o   6 7�K�K 0 anobject anObject�L  �Y  �X  �Z 0 aref aRef< n   QRQ o    �J�J "0 _supportedtypes _supportedTypesR  f    : S�IS R   B J�HTU
�H .ascrerr ****      � ****T m   H IVV �WW � I n v a l i d   i t e m   t y p e   ( d e f a u l t   c o m p a r a t o r   c a n   o n l y   c o m p a r e   i n t e g e r / r e a l ,   t e x t ,   o r   d a t e   t y p e s ) .U �GXY
�G 
errnX m   D E�F�F�\Y �EZ�D
�E 
erobZ o   F G�C�C 0 anobject anObject�D  �I  5 [\[ I  M \�B]^
�B .corecnte****       ****] J   M P__ `�A` o   M N�@�@ 0 anobject anObject�A  ^ �?a�>
�? 
kocla =   Q Xbcb o   Q V�=�= 	0 _type  c m   V W�<�<  �>  \ d�;d k   _ �ee fgf Z   _ xhi�:jh I  _ l�9kl
�9 .corecnte****       ****k J   _ bmm n�8n o   _ `�7�7 0 anobject anObject�8  l �6o�5
�6 
koclo ?   c hpqp l  c fr�4�3r n  c fsts o   d f�2�2 "0 _supportedtypes _supportedTypest  f   c d�4  �3  q m   f g�1�1  �5  i r   o ruvu m   o pww �xx d d e f a u l t   c o m p a r a t o r   c a n n o t   c o m p a r e   m i x e d   i t e m   t y p e sv o      �0�0 0 etext eText�:  j r   u xyzy m   u v{{ �|| � d e f a u l t   c o m p a r a t o r   c a n   o n l y   c o m p a r e   i n t e g e r / r e a l ,   t e x t ,   o r   d a t e   t y p e sz o      �/�/ 0 etext eTextg }�.} R   y ��-~
�- .ascrerr ****      � ****~ b   � ���� b   � ���� m   � ��� ��� & I n v a l i d   i t e m   t y p e   (� o   � ��,�, 0 etext eText� m   � ��� ���  ) . �+��
�+ 
errn� m   { |�*�*�\� �)��
�) 
erob� o   } ~�(�( 0 anobject anObject� �'��&
�' 
errt� o    ��%�% 	0 _type  �&  �.  �;  �]  2 ��$� L   � ��� o   � ��#�# 0 anobject anObject�$  + ��"� i   ��� I      �!�� �!  0 compareobjects compareObjects� ��� o      �� 0 
leftobject 
leftObject� ��� o      �� 0 rightobject rightObject�  �   � Z     ����� A     ��� o     �� 0 
leftobject 
leftObject� o    �� 0 rightobject rightObject� L    �� m    ����� ��� ?    ��� o    �� 0 
leftobject 
leftObject� o    �� 0 rightobject rightObject� ��� L    �� m    �� �  � L    �� m    ��  �"   ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  = @��� I     ���
� .Lst:NuSonull��� ��� null�  �  � h     ��� &0 numericcomparator NumericComparator� k      �� ��� i    ��� I      �
��	�
 0 makekey makeKey� ��� o      �� 0 anobject anObject�  �	  � L     �� c     ��� o     �� 0 anobject anObject� m    �
� 
nmbr� ��� i   ��� I      ����  0 compareobjects compareObjects� ��� o      �� 0 
leftobject 
leftObject� �� � o      ���� 0 rightobject rightObject�   �  � l    ���� L     �� \     ��� o     ���� 0 
leftobject 
leftObject� o    ���� 0 rightobject rightObject� � � note: since compareObjects' return value can be any -ve/0/+ve number, a single subtraction operation is sufficient for numbers and dates   � ���   n o t e :   s i n c e   c o m p a r e O b j e c t s '   r e t u r n   v a l u e   c a n   b e   a n y   - v e / 0 / + v e   n u m b e r ,   a   s i n g l e   s u b t r a c t i o n   o p e r a t i o n   i s   s u f f i c i e n t   f o r   n u m b e r s   a n d   d a t e s�  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  A D��� I     ������
�� .Lst:DaSonull��� ��� null��  ��  � h     �����  0 datecomparator DateComparator� k      �� ��� i    ��� I      ������� 0 makekey makeKey� ���� o      ���� 0 anobject anObject��  ��  � l    ���� L     �� c     ��� o     ���� 0 anobject anObject� m    ��
�� 
ldt ��� TO DO: if coercion fails, try `date anObject` on offchance it's a text value? Am inclined not to, as that's locale dependent so will produce different results on different machines for same input (while text-to-number coercions are also a bit locale-sensitive, those coercions will simply fail whereas `date "05-05-05"` could produce multiple different values or errors). Safest approach is for user to supply her own comparator implementation that implements her exact requirements, rather than trying to second-guess what those requirements are (which has a tendency to create fresh problems faster than it solves them, as AppleScript frequently demonstrates).   � ���.   T O   D O :   i f   c o e r c i o n   f a i l s ,   t r y   ` d a t e   a n O b j e c t `   o n   o f f c h a n c e   i t ' s   a   t e x t   v a l u e ?   A m   i n c l i n e d   n o t   t o ,   a s   t h a t ' s   l o c a l e   d e p e n d e n t   s o   w i l l   p r o d u c e   d i f f e r e n t   r e s u l t s   o n   d i f f e r e n t   m a c h i n e s   f o r   s a m e   i n p u t   ( w h i l e   t e x t - t o - n u m b e r   c o e r c i o n s   a r e   a l s o   a   b i t   l o c a l e - s e n s i t i v e ,   t h o s e   c o e r c i o n s   w i l l   s i m p l y   f a i l   w h e r e a s   ` d a t e   " 0 5 - 0 5 - 0 5 " `   c o u l d   p r o d u c e   m u l t i p l e   d i f f e r e n t   v a l u e s   o r   e r r o r s ) .   S a f e s t   a p p r o a c h   i s   f o r   u s e r   t o   s u p p l y   h e r   o w n   c o m p a r a t o r   i m p l e m e n t a t i o n   t h a t   i m p l e m e n t s   h e r   e x a c t   r e q u i r e m e n t s ,   r a t h e r   t h a n   t r y i n g   t o   s e c o n d - g u e s s   w h a t   t h o s e   r e q u i r e m e n t s   a r e   ( w h i c h   h a s   a   t e n d e n c y   t o   c r e a t e   f r e s h   p r o b l e m s   f a s t e r   t h a n   i t   s o l v e s   t h e m ,   a s   A p p l e S c r i p t   f r e q u e n t l y   d e m o n s t r a t e s ) .� ���� i   ��� I      �������  0 compareobjects compareObjects� ��� o      ���� 0 
leftobject 
leftObject� ���� o      ���� 0 rightobject rightObject��  ��  � l    ���� L     �� \     ��� o     ���� 0 
leftobject 
leftObject� o    ���� 0 rightobject rightObject� Y S as in NumericComparator, a simple subtraction operation produces a suitable result   � ��� �   a s   i n   N u m e r i c C o m p a r a t o r ,   a   s i m p l e   s u b t r a c t i o n   o p e r a t i o n   p r o d u c e s   a   s u i t a b l e   r e s u l t��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  E H��� I     �����
�� .Lst:TeSonull��� ��� null��  � �����
�� 
Cons� |����������  ��  � o      ����  0 orderingoption orderingOption��  � m      ��
�� SrtECmpI��  � Q     b���� k    L�� ��� h    
����� B0 currentconsiderationscomparator CurrentConsiderationsComparator� k      �� ��� i       I      ������ 0 makekey makeKey �� o      ���� 0 anobject anObject��  ��   l     L      c     	 o     ���� 0 anobject anObject	 m    ��
�� 
ctxt _ Y TO DO: what if item is a list [of text]? currently it coerces to text using current TIDs    �

 �   T O   D O :   w h a t   i f   i t e m   i s   a   l i s t   [ o f   t e x t ] ?   c u r r e n t l y   i t   c o e r c e s   t o   t e x t   u s i n g   c u r r e n t   T I D s� �� i    I      ������  0 compareobjects compareObjects  o      ���� 0 
leftobject 
leftObject �� o      ���� 0 rightobject rightObject��  ��   k     '  I    ����
�� .ascrcmnt****      � **** J     
  o     ���� 0 
leftobject 
leftObject  o    ���� 0 rightobject rightObject  A     o    ���� 0 
leftobject 
leftObject o    ���� 0 rightobject rightObject �� ?     !  o    ���� 0 
leftobject 
leftObject! o    ���� 0 rightobject rightObject��  ��   "��" Z    '#$%&# A    '(' o    ���� 0 
leftobject 
leftObject( o    ���� 0 rightobject rightObject$ L    )) m    ������% *+* ?    ,-, o    ���� 0 
leftobject 
leftObject- o    ���� 0 rightobject rightObject+ .��. L     "// m     !���� ��  & L   % '00 m   % &����  ��  ��  � 1��1 Z    L23452 =   676 o    ����  0 orderingoption orderingOption7 m    ��
�� SrtECmpI3 k    88 9:9 h    ��;�� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator; k      << =>= j     ��?
�� 
pare? o     ���� B0 currentconsiderationscomparator CurrentConsiderationsComparator> @��@ i  	 ABA I      ��C����  0 compareobjects compareObjectsC DED o      ���� 0 
leftobject 
leftObjectE F��F o      ���� 0 rightobject rightObject��  ��  B P     GHIG L    JJ M    KK I      ��L����  0 compareobjects compareObjectsL MNM o    ���� 0 
leftobject 
leftObjectN O��O o    ���� 0 rightobject rightObject��  ��  H ��P
�� conshyphP ��Q
�� conspuncQ ��R
�� conswhitR ����
�� consnume��  I ��S
�� conscaseS ����
�� consdiac��  ��  : T��T L    UU o    ���� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator��  4 VWV =   !XYX o    ����  0 orderingoption orderingOptionY m     ��
�� SrtECmpCW Z[Z k   $ .\\ ]^] h   $ +��_�� :0 casesensitivetextcomparator CaseSensitiveTextComparator_ k      `` aba j     ��c
�� 
parec o     ���� B0 currentconsiderationscomparator CurrentConsiderationsComparatorb d��d i  	 efe I      ��g����  0 compareobjects compareObjectsg hih o      ���� 0 
leftobject 
leftObjecti j��j o      ���� 0 rightobject rightObject��  ��  f P     klmk L    nn M    oo I      ��p����  0 compareobjects compareObjectsp qrq o    ���� 0 
leftobject 
leftObjectr s��s o    ���� 0 rightobject rightObject��  ��  l ��t
�� conscaset ��u
�� conshyphu ��v
�� conspuncv ��w
�� conswhitw ����
�� consnume��  m ����
�� consdiac��  ��  ^ x��x L   , .yy o   , -���� :0 casesensitivetextcomparator CaseSensitiveTextComparator��  [ z{z =  1 4|}| o   1 2����  0 orderingoption orderingOption} m   2 3��
�� SrtECmpD{ ~�~ L   7 9 o   7 8�~�~ B0 currentconsiderationscomparator CurrentConsiderationsComparator�  5 R   < L�}��
�} .ascrerr ****      � ****� m   H K�� ��� d I n v a l i d    f o r    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .� �|��
�| 
errn� m   > ?�{�{�Y� �z��
�z 
erob� o   @ A�y�y  0 orderingoption orderingOption� �x��w
�x 
errt� m   B E�v
�v 
enum�w  ��  � R      �u��
�u .ascrerr ****      � ****� o      �t�t 0 etext eText� �s��
�s 
errn� o      �r�r 0 enumber eNumber� �q��
�q 
erob� o      �p�p 0 efrom eFrom� �o��n
�o 
errt� o      �m�m 
0 eto eTo�n  � I   T b�l��k�l 
0 _error  � ��� m   U X�� ���  t e x t   c o m p a r a t o r� ��� o   X Y�j�j 0 etext eText� ��� o   Y Z�i�i 0 enumber eNumber� ��� o   Z [�h�h 0 efrom eFrom� ��g� o   [ \�f�f 
0 eto eTo�g  �k  � ��� l     �e�d�c�e  �d  �c  � ��� l     �b�a�`�b  �a  �`  � ��� l     �_�^�]�_  �^  �]  � ��� i   I L��� I     �\��[
�\ .Lst:LiUSnull���     ****� o      �Z�Z 0 thelist theList�[  � Q     ���� k    m�� ��� r    ��� n    ��� 2   �Y
�Y 
cobj� n   ��� I    �X��W�X "0 aslistparameter asListParameter� ��� o    	�V�V 0 thelist theList� ��U� m   	 
�� ���  �U  �W  � o    �T�T 0 _supportlib _supportLib� o      �S�S 0 
resultlist 
resultList� ��� r    ��� n    ��� 1    �R
�R 
leng� o    �Q�Q 0 
resultlist 
resultList� o      �P�P 0 len  � ��� l   �O���O  � � � call `random number` osax once to obtain a seed, then switch to native pseudo-random number generation for generating 'random' list indexes; this should provide modest improvement in speed   � ���z   c a l l   ` r a n d o m   n u m b e r `   o s a x   o n c e   t o   o b t a i n   a   s e e d ,   t h e n   s w i t c h   t o   n a t i v e   p s e u d o - r a n d o m   n u m b e r   g e n e r a t i o n   f o r   g e n e r a t i n g   ' r a n d o m '   l i s t   i n d e x e s ;   t h i s   s h o u l d   p r o v i d e   m o d e s t   i m p r o v e m e n t   i n   s p e e d� ��� r    )��� I   '��N�� z�M�L
�M .sysorandnmbr    ��� nmbr
�L misccura�N  � �K��
�K 
from� m     �J�J � �I��H
�I 
to  � m   ! "�� B�0��?� �H  � o      �G�G 0 lastnum lastNum� ��� Y   * j��F���E� k   4 e�� ��� r   4 ;��� `   4 9��� l  4 7��D�C� ]   4 7��� o   4 5�B�B 0 lastnum lastNum� m   5 6�A�A  J��D  �C  � m   7 8�� B�0��?� � o      �@�@ 0 lastnum lastNum� ��� r   < C��� [   < A��� l  < ?��?�>� `   < ?��� o   < =�=�= 0 lastnum lastNum� o   = >�<�< 0 len  �?  �>  � m   ? @�;�; � o      �:�: 0 idx2  � ��9� r   D e��� J   D P�� ��� e   D I�� n  D I��� 4   E H�8�
�8 
cobj� o   F G�7�7 0 idx2  � o   D E�6�6 0 
resultlist 
resultList� ��5� e   I N�� n  I N��� 4   J M�4�
�4 
cobj� o   K L�3�3 0 idx1  � o   I J�2�2 0 
resultlist 
resultList�5  � J      �� ��� n     ��� 4   V Y�1�
�1 
cobj� o   W X�0�0 0 idx1  � o   U V�/�/ 0 
resultlist 
resultList� ��.� n     ��� 4   ` c�-�
�- 
cobj� o   a b�,�, 0 idx2  � o   _ `�+�+ 0 
resultlist 
resultList�.  �9  �F 0 idx1  � m   - .�*�* � o   . /�)�) 0 len  �E  � 	 �(	  L   k m		 o   k l�'�' 0 
resultlist 
resultList�(  � R      �&		
�& .ascrerr ****      � ****	 o      �%�% 0 etext eText	 �$		
�$ 
errn	 o      �#�# 0 enumber eNumber	 �"		
�" 
erob	 o      �!�! 0 efrom eFrom	 � 	�
�  
errt	 o      �� 
0 eto eTo�  � I   u �		�� 
0 _error  		 	
		
 m   v w		 �		  u n s o r t   l i s t	 			 o   w x�� 0 etext eText	 			 o   x y�� 0 enumber eNumber	 			 o   y z�� 0 efrom eFrom	 	�	 o   z {�� 
0 eto eTo�  �  � 			 l     ����  �  �  	 	�	 l     ����  �  �  �       �									 	!	"	#	$	%	&	'	(	)�  	 �����
�	��������� ����
� 
pimr� 0 _supportlib _supportLib� 
0 _error  � 20 _errorwithpartialresult _errorWithPartialResult
�
 .Lst:Instnull���     ****
�	 .Lst:Delenull���     ****
� .Lst:Map_null���     ****
� .Lst:Filtnull���     ****
� .Lst:Redunull���     ****� 0 _hashandler _hasHandler� 	0 _sort  
� .Lst:Sortnull���     ****
� .Lst:DeSonull��� ��� null
� .Lst:NuSonull��� ��� null
�  .Lst:DaSonull��� ��� null
�� .Lst:TeSonull��� ��� null
�� .Lst:LiUSnull���     ****	 ��	*�� 	*  	+	+ ��	,��
�� 
cobj	, 	-	-   ��
�� 
osax��  	 	.	.   �� %
�� 
scpt	 �� -����	/	0���� 
0 _error  �� ��	1�� 	1  ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo��  	/ ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo	0 ������
�� 
msng�� �� 20 _errorwithpartialresult _errorWithPartialResult�� *�������+ 	 �� I����	2	3���� 20 _errorwithpartialresult _errorWithPartialResult�� ��	4�� 	4  �������������� 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�� 0 partialresult partialResult��  	2 �������������� 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�� 0 partialresult partialResult	3  [������
�� 
msng�� �� 0 rethrowerror rethrowError�� b  ࠡ�����+ 	 �� }����	5	6��
�� .Lst:Instnull���     ****�� 0 thelist theList�� ����	7
�� 
Valu�� 0 thevalue theValue	7 ��	8	9
�� 
Befo	8 {�������� 0 beforeindex beforeIndex��  
�� 
msng	9 ��	:��
�� 
Afte	: {�������� 0 
afterindex 
afterIndex��  
�� 
msng��  	5 ������������������ 0 thelist theList�� 0 thevalue theValue�� 0 beforeindex beforeIndex�� 0 
afterindex 
afterIndex�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo	6  ��������� � ��������������� � ���4B��	;{������ "0 aslistparameter asListParameter
�� 
msng
�� 
errn���Y�� (0 asintegerparameter asIntegerParameter
�� 
leng���@
�� 
erob
�� 
cobj
�� 
insl�� 
�� 
bool�� 0 etext eText	; ����	<
�� 
errn�� 0 enumber eNumber	< ����	=
�� 
erob�� 0 efrom eFrom	= ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ��1b  ��l+ E�O�� R�� )��l�Y hOb  ��l+ E�O�j ��,�kE�Y hO���, )����/�4��Y hY v�� hb  ��l+ E�O�j 
�kE�Y "�j ��,�E�Y )����/�3�a O���,
 	�ja & )����/�3�a Y hY 
)��la O�j  �kv�%Y 1���,  ��kv%Y  �[�\[Zk\Z�2�kv%�[�\[Z�k\Zi2%W X  *a ����a + 	 �������	>	?��
�� .Lst:Delenull���     ****�� 0 thelist theList�� ��	@��
�� 
Inde	@ {�������� 0 theindex theIndex��  ������  	> �������������� 0 thelist theList�� 0 theindex theIndex�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo	? ������������������������	A3������ "0 aslistparameter asListParameter�� (0 asintegerparameter asIntegerParameter
�� 
leng
�� 
bool
�� 
cobj
�� 
rest
�� 
errn���@
�� 
erob�� �� 0 etext eText	A ����	B
�� 
errn�� 0 enumber eNumber	B ����	C
�� 
erob�� 0 efrom eFrom	C ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � �b  ��l+ E�Ob  ��l+ E�O��,k	 �j�& {i��,lv�kv �[�\[Zl\Zi2EY [k��,'lv�kv 
��,EY E�j	 	���,�&
 �j	 
���,'�&�& !�[�\[Zk\Z�k2�[�\[Z�k\Zi2%Y hY  ��,k  iklv�kv jvY hY hO)����/��W X  *��a + 	 ��V����	D	E�
�� .Lst:Map_null���     ****�� 0 thelist theList�� �~�}�|
�~ 
Usin�} 0 	thescript 	theScript�|  	D �{�z�y�x�w�v�u�t�{ 0 thelist theList�z 0 	thescript 	theScript�y 0 
resultlist 
resultList�x 0 i  �w 0 etext eText�v 0 enumber eNumber�u 
0 eto eTo�t 0 efrom eFrom	E r�s~�r�q�p�o�n	F�m�l�k�j��	G��i�s "0 aslistparameter asListParameter�r &0 asscriptparameter asScriptParameter
�q 
leng
�p 
cobj�o 0 convertitem convertItem�n 0 etext eText	F �h�g	H
�h 
errn�g 0 enumber eNumber	H �f�e�d
�f 
errt�e 
0 eto eTo�d  
�m 
errn
�l 
erob
�k 
errt�j 	G �c�b	I
�c 
errn�b 0 enumber eNumber	I �a�`	J
�a 
erob�` 0 efrom eFrom	J �_�^�]
�_ 
errt�^ 
0 eto eTo�]  �i 20 _errorwithpartialresult _errorWithPartialResult� zjvE�O ab  ��l+ E�Ob  ��l+ E�O # k��,Ekh ���/k+ �6F[OY��W X  )���/����%�%�%O�W X  *a ������+ 	  �\��[�Z	K	L�Y
�\ .Lst:Filtnull���     ****�[ 0 thelist theList�Z �X�W�V
�X 
Usin�W 0 	thescript 	theScript�V  	K �U�T�S�R�Q�P�O�N�U 0 thelist theList�T 0 	thescript 	theScript�S 0 
resultlist 
resultList�R 0 i  �Q 0 etext eText�P 0 enumber eNumber�O 
0 eto eTo�N 0 efrom eFrom	L ��M��L�K�J�I�H	M�G�F�E�D!#	N;�C�M "0 aslistparameter asListParameter�L &0 asscriptparameter asScriptParameter
�K 
leng
�J 
cobj�I 0 	checkitem 	checkItem�H 0 etext eText	M �B�A	O
�B 
errn�A 0 enumber eNumber	O �@�?�>
�@ 
errt�? 
0 eto eTo�>  
�G 
errn
�F 
erob
�E 
errt�D 	N �=�<	P
�= 
errn�< 0 enumber eNumber	P �;�:	Q
�; 
erob�: 0 efrom eFrom	Q �9�8�7
�9 
errt�8 
0 eto eTo�7  �C 20 _errorwithpartialresult _errorWithPartialResult�Y zjvE�O ab  ��l+ E�Ob  ��l+ E�O # k��,Ekh ���/k+ �6F[OY��W X  )���/����%�%�%O�W X  *a ������+ 	! �6M�5�4	R	S�3
�6 .Lst:Redunull���     ****�5 0 thelist theList�4 �2�1�0
�2 
Usin�1 0 	thescript 	theScript�0  	R 	�/�.�-�,�+�*�)�(�'�/ 0 thelist theList�. 0 	thescript 	theScript�- 0 missingvalue missingValue�, 0 	theresult 	theResult�+ 0 i  �* 0 etext eText�) 0 enumber eNumber�( 
0 eto eTo�' 0 efrom eFrom	S e�&�%�$�#�"�!q�� ���	T����	U���& "0 aslistparameter asListParameter
�% 
leng
�$ 
errn�#�Y
�" 
erob�! �  &0 asscriptparameter asScriptParameter
� 
cobj� 0 combineitems combineItems� 0 etext eText	T ��	V
� 
errn� 0 enumber eNumber	V ���
� 
errt� 
0 eto eTo�  
� 
errt� 	U ��	W
� 
errn� 0 enumber eNumber	W ��	X
� 
erob� 0 efrom eFrom	X ���
� 
errt� 
0 eto eTo�  � 20 _errorwithpartialresult _errorWithPartialResult�3 ��E�O �b  ��l+ E�O��,j  )�����Y hOb  ��l+ 	E�O��k/E�O # l��,Ekh ����/l+ E�[OY��W X  )���/��a �%a %�%O�W X  *a ������+ 	" ����	Y	Z�
� 0 _hashandler _hasHandler� �		[�	 	[  �� 0 
handlerref 
handlerRef�  	Y �� 0 
handlerref 
handlerRef	Z ��	\
� 
hand�  	\ ���
� 
errn��\�  �
  ��&OeW 	X  f	# �� ��	]	^��� 	0 _sort  �  ��	_�� 	_  �������������� 0 keylist keyList�� 0 	valuelist 	valueList�� 0 	fromindex 	fromIndex�� 0 toindex toIndex��  0 sortcomparator sortComparator�� 0 usequicksort useQuickSort��  	] ������������������������������������ 0 keylist keyList�� 0 	valuelist 	valueList�� 0 	fromindex 	fromIndex�� 0 toindex toIndex��  0 sortcomparator sortComparator�� 0 usequicksort useQuickSort�� 0 	leftindex 	leftIndex�� 0 
rightindex 
rightIndex�� 0 
pivotvalue 
pivotValue�� 0 etext eText�� 0 enum eNum�� 0 efrom eFrom�� 
0 eto eTo�� 0 i  �� 0 j  �� 0 leftkey leftKey�� 0 rightkey rightKey	^ ��������	`��������i�������	a
�� 
cobj��  0 compareobjects compareObjects
�� 
nmbr�� 0 etext eText	` ����	b
�� 
errn�� 0 enum eNum	b ����	c
�� 
erob�� 0 efrom eFrom	c ������
�� 
errt�� 
0 eto eTo��  
�� 
errn
�� 
erob
�� 
errt�� �� 
�� 	0 _sort  ��  	a ������
�� 
errn���n��  ��٥=��lvE[�k/E�Z[�l/E�ZO��.E�O �h�� " h���/�l+ �&j�kE�[OY��W X  )���/�lv���%O " h���/�l+ �&j�kE�[OY��W X  )���/�lv���%O�� f� !*�/*�/lvE[�k/*�/FZ[�l/*�/FZUO� !*�/*�/lvE[�k/*�/FZ[�l/*�/FZUO�k�klvE[�k/E�Z[�l/E�ZY h[OY�O '*���������+ O*���������+ OhW X  hY hO�kE�O ���kh  ���ih ��k/��/lvE[�k/E�Z[�l/E^ ZO��] l+ k Y hO] �lvE[�k/��k/FZ[�l/��/FZO��/��k/lvE[�k/��k/FZ[�l/��/FZ[OY��[OY�x	$ �������	d	e��
�� .Lst:Sortnull���     ****�� 0 thelist theList�� ��	f��
�� 
Comp	f {�������� $0 comparatorobject comparatorObject��  
�� 
msng��  	d �������������������������������������� 0 thelist theList�� $0 comparatorobject comparatorObject�� 0 
resultlist 
resultList��  0 sortcomparator sortComparator�� 0 keymaker keyMaker��  0 ascendingcount ascendingCount�� "0 descendingcount descendingCount�� 0 keylist keyList�� 0 previouskey previousKey�� 0 etext eText�� 0 enum eNum�� 0 efrom eFrom�� 
0 eto eTo�� 0 i  �� 0 
currentkey 
currentKey�� 0 keycomparison keyComparison�� 0 usequicksort useQuickSort�� 0 enumber eNumber	e "������������������������������������	g������V����	h����	i	���� "0 aslistparameter asListParameter
�� 
cobj
�� 
leng
�� 
msng�� 00 _makedefaultcomparator _makeDefaultComparator�� &0 asscriptparameter asScriptParameter�� 0 makekey makeKey�� 0 _hashandler _hasHandler
�� 
bool
�� 
kocl
�� 
nmbr
�� .corecnte****       ****
�� 
ctxt
�� 
ldt 
�� 
errn���Y�� 0 etext eText	g ����	j
�� 
errn�� 0 enum eNum	j ����	k
�� 
erob�� 0 efrom eFrom	k ������
�� 
errt�� 
0 eto eTo��  
�� 
erob
�� 
errt�� ��  0 compareobjects compareObjects	h ����	l
�� 
errn�� 0 enum eNum	l ������
�� 
errt�� 
0 eto eTo��  �� 
�� 	0 _sort  	i ����	m
�� 
errn�� 0 enumber eNumber	m ����	n
�� 
erob�� 0 efrom eFrom	n ������
�� 
errt�� 
0 eto eTo��  �� 20 _errorwithpartialresult _errorWithPartialResult���jvE�O�b  ��l+ �-E�O��,l �Y hO��  *j+ E�Y b  ��l+ E�O��	 *��,k+ 	�& �E�Y H���l ��,	 ���l ��,�&	 ���l ��,�& )a a la Y hO*j+ E�OjjlvE[�k/E�Z[�l/E�ZO��-E�O � ���k/k+ E�W X  )a �a �a �a a �%O���k/FO rl��,Ekh  ���/k+ E�W #X  )a �a �a �a a �%a %�%O���/FO���l+ E�O�j 
�kE�Y �j 
�kE�Y h[OY��W X  )a �a ��/a �a �O��,a E^ O*��k��,�] a + O�W X  *a  �] ���a + !	% ������	o	p��
�� .Lst:DeSonull��� ��� null��  ��  	o ���� &0 defaultcomparator DefaultComparator	p ��	q�� &0 defaultcomparator DefaultComparator	q ��	r����	s	t��
�� .ascrinit****      � ****	r k     	u	u 	v	v '	w	w *	x	x �����  ��  ��  	s ��~�}�|� "0 _supportedtypes _supportedTypes�~ 	0 _type  �} 0 makekey makeKey�|  0 compareobjects compareObjects	t �{�z�y�x�w�v	y	z
�{ 
nmbr
�z 
ctxt
�y 
ldt �x "0 _supportedtypes _supportedTypes
�w 
msng�v 	0 _type  	y �u-�t�s	{	|�r�u 0 makekey makeKey�t �q	}�q 	}  �p�p 0 anobject anObject�s  	{ �o�n�m�o 0 anobject anObject�n 0 aref aRef�m 0 etext eText	| �l�k�j�i�h�g�f�e�d�cVw{�b�a��
�l 
msng�k "0 _supportedtypes _supportedTypes
�j 
kocl
�i 
cobj
�h .corecnte****       ****
�g 
pcnt
�f 
errn�e�\
�d 
erob�c 
�b 
errt�a �r �b  �  E 6)�,[��l kh �kv��,jl  ��,Ec  O�Y h[OY��O)�����Y F�kv�b  j l  3�kv�)�,jl  �E�Y �E�O)����b  ��%a %Y hO�	z �`��_�^	~	�]�`  0 compareobjects compareObjects�_ �\	��\ 	�  �[�Z�[ 0 
leftobject 
leftObject�Z 0 rightobject rightObject�^  	~ �Y�X�Y 0 
leftobject 
leftObject�X 0 rightobject rightObject	  �] �� iY �� kY j�� ���mv�O�OL OL �� ��K S�	& �W��V�U	�	��T
�W .Lst:NuSonull��� ��� null�V  �U  	� �S�S &0 numericcomparator NumericComparator	� �R�	��R &0 numericcomparator NumericComparator	� �Q	��P�O	�	��N
�Q .ascrinit****      � ****	� k     	�	� �	�	� ��M�M  �P  �O  	� �L�K�L 0 makekey makeKey�K  0 compareobjects compareObjects	� 	�	�	� �J��I�H	�	��G�J 0 makekey makeKey�I �F	��F 	�  �E�E 0 anobject anObject�H  	� �D�D 0 anobject anObject	� �C
�C 
nmbr�G ��&	� �B��A�@	�	��?�B  0 compareobjects compareObjects�A �>	��> 	�  �=�<�= 0 
leftobject 
leftObject�< 0 rightobject rightObject�@  	� �;�:�; 0 
leftobject 
leftObject�: 0 rightobject rightObject	�  �? ���N L  OL �T ��K S�	' �9��8�7	�	��6
�9 .Lst:DaSonull��� ��� null�8  �7  	� �5�5  0 datecomparator DateComparator	� �4�	��4  0 datecomparator DateComparator	� �3	��2�1	�	��0
�3 .ascrinit****      � ****	� k     	�	� �	�	� ��/�/  �2  �1  	� �.�-�. 0 makekey makeKey�-  0 compareobjects compareObjects	� 	�	�	� �,��+�*	�	��)�, 0 makekey makeKey�+ �(	��( 	�  �'�' 0 anobject anObject�*  	� �&�& 0 anobject anObject	� �%
�% 
ldt �) ��&	� �$��#�"	�	��!�$  0 compareobjects compareObjects�# � 	��  	�  ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�"  	� ��� 0 
leftobject 
leftObject� 0 rightobject rightObject	�  �! ���0 L  OL �6 ��K S�	( ����	�	��
� .Lst:TeSonull��� ��� null�  � �	��
� 
Cons	� {����  0 orderingoption orderingOption�  
� SrtECmpI�  	� ���������  0 orderingoption orderingOption� B0 currentconsiderationscomparator CurrentConsiderationsComparator� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator� :0 casesensitivetextcomparator CaseSensitiveTextComparator� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo	� �
�	��	�;	���_	������� �����	�������
 B0 currentconsiderationscomparator CurrentConsiderationsComparator	� ��	�����	�	���
�� .ascrinit****      � ****	� k     	�	� �	�	� ����  ��  ��  	� ������ 0 makekey makeKey��  0 compareobjects compareObjects	� 	�	�	� ������	�	����� 0 makekey makeKey�� ��	��� 	�  ���� 0 anobject anObject��  	� ���� 0 anobject anObject	� ��
�� 
ctxt�� ��&	� ������	�	�����  0 compareobjects compareObjects�� ��	��� 	�  ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject��  	� ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject	� ������ 
�� .ascrcmnt****      � ****�� (�������vj O�� iY �� kY j�� L  OL 
�	 SrtECmpI� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator	� ��	�����	�	���
�� .ascrinit****      � ****	� k     	�	� =	�	� @����  ��  ��  	� ����
�� 
pare��  0 compareobjects compareObjects	� ��	�
�� 
pare	� ��B����	�	�����  0 compareobjects compareObjects�� ��	��� 	�  ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject��  	� ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject	� HI����  0 compareobjects compareObjects�� �� )��ld*J V�� b  N  OL 
� SrtECmpC� :0 casesensitivetextcomparator CaseSensitiveTextComparator	� ��	�����	�	���
�� .ascrinit****      � ****	� k     	�	� a	�	� d����  ��  ��  	� ����
�� 
pare��  0 compareobjects compareObjects	� ��	�
�� 
pare	� ��f����	�	�����  0 compareobjects compareObjects�� ��	��� 	�  ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject��  	� ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject	� lm����  0 compareobjects compareObjects�� �� )��ld*J V�� b  N  OL 
� SrtECmpD
� 
errn��Y
� 
erob
� 
errt
�  
enum�� �� 0 etext eText	� ����	�
�� 
errn�� 0 enumber eNumber	� ����	�
�� 
erob�� 0 efrom eFrom	� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � c N��K S�O��  ��K S�O�Y 0��  ��K 
S�O�Y ��  �Y )����a a a W X  *a ����a + 	) �������	�	���
�� .Lst:LiUSnull���     ****�� 0 thelist theList��  	� 
���������������������� 0 thelist theList�� 0 
resultlist 
resultList�� 0 len  �� 0 lastnum lastNum�� 0 idx1  �� 0 idx2  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo	� ����������������������	�	������ "0 aslistparameter asListParameter
�� 
cobj
�� 
leng
�� misccura
�� 
from
�� 
to  �� 
�� .sysorandnmbr    ��� nmbr��  J��� 0 etext eText	� ����	�
�� 
errn�� 0 enumber eNumber	� ����	�
�� 
erob�� 0 efrom eFrom	� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � ob  ��l+ �-E�O��,E�O� *�k��� 	UE�O ?k�kh �� �#E�O��#kE�O��/E��/ElvE[�k/��/FZ[�l/��/FZ[OY��O�W X  *������+  ascr  ��ޭ