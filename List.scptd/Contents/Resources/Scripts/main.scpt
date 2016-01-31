FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� List -- manipulate AppleScript lists 

Notes:

- To split and join lists [of text], use the `split text` and `join text` commands in Text.


TO DO:

- text comparator should implement exactly the same predefined considering/ignoring options as Text's `search text`, etc. (currently they are inconsistent on whether to consider or ignore diacriticals)


- would it be worth implementing an ArrayCollection object that encapsulates list lookup kludges, and just encouraging users to use that for manipulating lists (in which case some/most of the below handlers might be as well made into methods on that)


- implement `list comparator` constructor that takes either a single comparator (for comparing all items in an arbitrary-length list) or list of form {{index, comparator},...} (for comparing specific items)

- decide on naming convention for comparator object constructors



- What other commands are needed?

- `remove duplicates from list LIST` (note: this can be implemented as FilterDuplicatesObject for use in `filter list`; a naive implementation would just build new list and compare against that, giving worst-case O(n^2) performance; however, a smarter implementation could put comparable items into a SetObject, allowing O(n * log n) when filtering lists of numbers, text, dates), caveat considering/ignoring  (Q. what are common use cases for this command? would they be better dealt with using Set objects?)

- `slice list LIST from I to J` -- c.f. `slice text`

- add optional `from [before/after/] item` and `to [before/after/] item` parameters to `insert into list` and `delete from list` to insert/delete ranges; `insert into list` should also be able to replace existing ranges of items with new items (of same or different length)

- stable sorting? what about 3-way quicksort (better on lists where most items are equal)?

- might consider using NSMutableArray when sorting simple uniform lists of text or number without a user-supplied comparator (would need to compare costs of ASOC bridging vs native sorting to see which performs better); not sure about dates given that they're mutable (ASOC will perform deep copy of list, so resulting list will contain copies of the original date objects, whereas native sort preserves the original date objects); complex values (e.g. list of records) will still be sorted natively, of course (though even there it might be possible to use NSArray to sort an array of [key,valueIndex] and then iterate the result to reposition values in output list, making the [slow] AS part of the code O(2n))


- not sure if the following will be sufficiently useful to justify inclusion (need to identify some concrete use cases, or else discard):

	- `make list [containing INITIAL-VALUE] [size N]` (if INITIAL-VALUE is a reference, dereference it? e.g. `make list containing (a ref to some item of {1,2,3}) size 10`; would probably be simpler to pass an object that generates a random item)
	
	- `make numeric list from MIN to MAX by STEP`?

	- `interlace lists`, `deinterlace lists`? e.g. {{1,2,3},{4,5,6}} <-> {1,4,2,5,3,6}

	- `group into sublists LIST size SUB-LIST-LENGTH [padding...]`, `flatten sublists LIST`? e.g. {1,2,3,4,5,6} size 2 <-> {{1,2},{3,4},{5,6}}
     � 	 	0   L i s t   - -   m a n i p u l a t e   A p p l e S c r i p t   l i s t s   
 
 N o t e s : 
 
 -   T o   s p l i t   a n d   j o i n   l i s t s   [ o f   t e x t ] ,   u s e   t h e   ` s p l i t   t e x t `   a n d   ` j o i n   t e x t `   c o m m a n d s   i n   T e x t . 
 
 
 T O   D O : 
 
 -   t e x t   c o m p a r a t o r   s h o u l d   i m p l e m e n t   e x a c t l y   t h e   s a m e   p r e d e f i n e d   c o n s i d e r i n g / i g n o r i n g   o p t i o n s   a s   T e x t ' s   ` s e a r c h   t e x t ` ,   e t c .   ( c u r r e n t l y   t h e y   a r e   i n c o n s i s t e n t   o n   w h e t h e r   t o   c o n s i d e r   o r   i g n o r e   d i a c r i t i c a l s ) 
 
 
 -   w o u l d   i t   b e   w o r t h   i m p l e m e n t i n g   a n   A r r a y C o l l e c t i o n   o b j e c t   t h a t   e n c a p s u l a t e s   l i s t   l o o k u p   k l u d g e s ,   a n d   j u s t   e n c o u r a g i n g   u s e r s   t o   u s e   t h a t   f o r   m a n i p u l a t i n g   l i s t s   ( i n   w h i c h   c a s e   s o m e / m o s t   o f   t h e   b e l o w   h a n d l e r s   m i g h t   b e   a s   w e l l   m a d e   i n t o   m e t h o d s   o n   t h a t ) 
 
 
 -   i m p l e m e n t   ` l i s t   c o m p a r a t o r `   c o n s t r u c t o r   t h a t   t a k e s   e i t h e r   a   s i n g l e   c o m p a r a t o r   ( f o r   c o m p a r i n g   a l l   i t e m s   i n   a n   a r b i t r a r y - l e n g t h   l i s t )   o r   l i s t   o f   f o r m   { { i n d e x ,   c o m p a r a t o r } , . . . }   ( f o r   c o m p a r i n g   s p e c i f i c   i t e m s ) 
 
 -   d e c i d e   o n   n a m i n g   c o n v e n t i o n   f o r   c o m p a r a t o r   o b j e c t   c o n s t r u c t o r s 
 
 
 
 -   W h a t   o t h e r   c o m m a n d s   a r e   n e e d e d ? 
 
 -   ` r e m o v e   d u p l i c a t e s   f r o m   l i s t   L I S T `   ( n o t e :   t h i s   c a n   b e   i m p l e m e n t e d   a s   F i l t e r D u p l i c a t e s O b j e c t   f o r   u s e   i n   ` f i l t e r   l i s t ` ;   a   n a i v e   i m p l e m e n t a t i o n   w o u l d   j u s t   b u i l d   n e w   l i s t   a n d   c o m p a r e   a g a i n s t   t h a t ,   g i v i n g   w o r s t - c a s e   O ( n ^ 2 )   p e r f o r m a n c e ;   h o w e v e r ,   a   s m a r t e r   i m p l e m e n t a t i o n   c o u l d   p u t   c o m p a r a b l e   i t e m s   i n t o   a   S e t O b j e c t ,   a l l o w i n g   O ( n   *   l o g   n )   w h e n   f i l t e r i n g   l i s t s   o f   n u m b e r s ,   t e x t ,   d a t e s ) ,   c a v e a t   c o n s i d e r i n g / i g n o r i n g     ( Q .   w h a t   a r e   c o m m o n   u s e   c a s e s   f o r   t h i s   c o m m a n d ?   w o u l d   t h e y   b e   b e t t e r   d e a l t   w i t h   u s i n g   S e t   o b j e c t s ? ) 
 
 -   ` s l i c e   l i s t   L I S T   f r o m   I   t o   J `   - -   c . f .   ` s l i c e   t e x t ` 
 
 -   a d d   o p t i o n a l   ` f r o m   [ b e f o r e / a f t e r / ]   i t e m `   a n d   ` t o   [ b e f o r e / a f t e r / ]   i t e m `   p a r a m e t e r s   t o   ` i n s e r t   i n t o   l i s t `   a n d   ` d e l e t e   f r o m   l i s t `   t o   i n s e r t / d e l e t e   r a n g e s ;   ` i n s e r t   i n t o   l i s t `   s h o u l d   a l s o   b e   a b l e   t o   r e p l a c e   e x i s t i n g   r a n g e s   o f   i t e m s   w i t h   n e w   i t e m s   ( o f   s a m e   o r   d i f f e r e n t   l e n g t h ) 
 
 -   s t a b l e   s o r t i n g ?   w h a t   a b o u t   3 - w a y   q u i c k s o r t   ( b e t t e r   o n   l i s t s   w h e r e   m o s t   i t e m s   a r e   e q u a l ) ? 
 
 -   m i g h t   c o n s i d e r   u s i n g   N S M u t a b l e A r r a y   w h e n   s o r t i n g   s i m p l e   u n i f o r m   l i s t s   o f   t e x t   o r   n u m b e r   w i t h o u t   a   u s e r - s u p p l i e d   c o m p a r a t o r   ( w o u l d   n e e d   t o   c o m p a r e   c o s t s   o f   A S O C   b r i d g i n g   v s   n a t i v e   s o r t i n g   t o   s e e   w h i c h   p e r f o r m s   b e t t e r ) ;   n o t   s u r e   a b o u t   d a t e s   g i v e n   t h a t   t h e y ' r e   m u t a b l e   ( A S O C   w i l l   p e r f o r m   d e e p   c o p y   o f   l i s t ,   s o   r e s u l t i n g   l i s t   w i l l   c o n t a i n   c o p i e s   o f   t h e   o r i g i n a l   d a t e   o b j e c t s ,   w h e r e a s   n a t i v e   s o r t   p r e s e r v e s   t h e   o r i g i n a l   d a t e   o b j e c t s ) ;   c o m p l e x   v a l u e s   ( e . g .   l i s t   o f   r e c o r d s )   w i l l   s t i l l   b e   s o r t e d   n a t i v e l y ,   o f   c o u r s e   ( t h o u g h   e v e n   t h e r e   i t   m i g h t   b e   p o s s i b l e   t o   u s e   N S A r r a y   t o   s o r t   a n   a r r a y   o f   [ k e y , v a l u e I n d e x ]   a n d   t h e n   i t e r a t e   t h e   r e s u l t   t o   r e p o s i t i o n   v a l u e s   i n   o u t p u t   l i s t ,   m a k i n g   t h e   [ s l o w ]   A S   p a r t   o f   t h e   c o d e   O ( 2 n ) ) 
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
 �� "�� 0 _support   " N   
  # # 4   
 �� $
�� 
scpt $ m     % % � & &  T y p e S u p p o r t   "  used for parameter checking    ! � ' ' 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g   ( ) ( l     ��������  ��  ��   )  * + * i    , - , I      �� .���� 
0 _error   .  / 0 / o      ���� 0 handlername handlerName 0  1 2 1 o      ���� 0 etext eText 2  3 4 3 o      ���� 0 enumber eNumber 4  5 6 5 o      ���� 0 efrom eFrom 6  7�� 7 o      ���� 
0 eto eTo��  ��   - I     �� 8���� 20 _errorwithpartialresult _errorWithPartialResult 8  9 : 9 o    ���� 0 handlername handlerName :  ; < ; o    ���� 0 etext eText <  = > = o    ���� 0 enumber eNumber >  ? @ ? o    ���� 0 efrom eFrom @  A B A o    ���� 
0 eto eTo B  C�� C m    ��
�� 
msng��  ��   +  D E D l     ��������  ��  ��   E  F G F i    H I H I      �� J���� 20 _errorwithpartialresult _errorWithPartialResult J  K L K o      ���� 0 handlername handlerName L  M N M o      ���� 0 etext eText N  O P O o      ���� 0 enumber eNumber P  Q R Q o      ���� 0 efrom eFrom R  S T S o      ���� 
0 eto eTo T  U�� U o      ���� 0 epartial ePartial��  ��   I n     V W V I    �� X���� 0 rethrowerror rethrowError X  Y Z Y m     [ [ � \ \  L i s t Z  ] ^ ] o    ���� 0 handlername handlerName ^  _ ` _ o    ���� 0 etext eText `  a b a o    	���� 0 enumber eNumber b  c d c o   	 
���� 0 efrom eFrom d  e f e o   
 ���� 
0 eto eTo f  g h g m    ��
�� 
msng h  i�� i o    ���� 0 epartial ePartial��  ��   W o     ���� 0 _support   G  j k j l     ��������  ��  ��   k  l m l l     ��������  ��  ��   m  n o n l     �� p q��   p  -----    q � r r 
 - - - - - o  s t s l     ��������  ��  ��   t  u v u i    w x w I      �� y���� "0 _makelistobject _makeListObject y  z { z o      ���� 0 len   {  |�� | o      ���� 0 padvalue padValue��  ��   x l    _ } ~  } k     _ � �  � � � h     �� ��� 0 
listobject 
listObject � j     �� ��� 
0 _list_   � J     ����   �  � � � Z    Y � ����� � ?     � � � o    	���� 0 len   � m   	 
����   � k    U � �  � � � r     � � � J     � �  � � � o    ���� 0 padvalue padValue �  � � � o    ���� 0 padvalue padValue �  � � � o    ���� 0 padvalue padValue �  ��� � o    ���� 0 padvalue padValue��   � n      � � � o    ���� 
0 _list_   � o    ���� 0 
listobject 
listObject �  � � � V    5 � � � r   % 0 � � � b   % , � � � n  % ( � � � o   & (���� 
0 _list_   � o   % &���� 0 
listobject 
listObject � n  ( + � � � o   ) +���� 
0 _list_   � o   ( )���� 0 
listobject 
listObject � n      � � � o   - /���� 
0 _list_   � o   , -���� 0 
listobject 
listObject � A    $ � � � n   " � � � 1     "��
�� 
leng � n     � � � o     ���� 
0 _list_   � o    ���� 0 
listobject 
listObject � o   " #���� 0 len   �  ��� � Z  6 U � ����� � ?   6 = � � � n  6 ; � � � 1   9 ;��
�� 
leng � n  6 9 � � � o   7 9���� 
0 _list_   � o   6 7���� 0 
listobject 
listObject � o   ; <���� 0 len   � r   @ Q � � � n   @ M � � � 7  C M�� � �
�� 
cobj � m   G I����  � o   J L���� 0 len   � n  @ C � � � o   A C���� 
0 _list_   � o   @ A���� 0 
listobject 
listObject � n      � � � o   N P���� 
0 _list_   � o   M N���� 0 
listobject 
listObject��  ��  ��  ��  ��   �  ��� � L   Z _ � � n  Z ^ � � � o   [ ]���� 
0 _list_   � o   Z [���� 0 
listobject 
listObject��   ~ � � make a new list of specified length using the supplied value as padding; caution: padValue will not be copied, so should be an immutable type (e.g. number, string, constant; not date/list/record/script/reference)     � � ��   m a k e   a   n e w   l i s t   o f   s p e c i f i e d   l e n g t h   u s i n g   t h e   s u p p l i e d   v a l u e   a s   p a d d i n g ;   c a u t i o n :   p a d V a l u e   w i l l   n o t   b e   c o p i e d ,   s o   s h o u l d   b e   a n   i m m u t a b l e   t y p e   ( e . g .   n u m b e r ,   s t r i n g ,   c o n s t a n t ;   n o t   d a t e / l i s t / r e c o r d / s c r i p t / r e f e r e n c e ) v  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �� � ���   �   basic operations    � � � � "   b a s i c   o p e r a t i o n s �  � � � l     ��������  ��  ��   �  � � � i     � � � I     � � �
� .Lst:Instnull���     **** � o      �~�~ 0 thelist theList � �} � �
�} 
Valu � o      �|�| 0 thevalue theValue � �{ � �
�{ 
Befo � |�z�y ��x ��z  �y   � o      �w�w 0 beforeindex beforeIndex�x   � m      �v
�v 
msng � �u ��t
�u 
Afte � |�s�r ��q ��s  �r   � o      �p�p 0 
afterindex 
afterIndex�q   � m      �o
�o 
msng�t   � k    I � �  � � � l     �n � ��n   �.( In addition to inserting before/after the list's actual indexes, this also recognizes three 'virtual' indexes: the `after item` parameter uses index 0 and index `-length - 1` to indicate the start of the list; the `before item` parameter uses index `length + 1` to indicate the end of the list.     � � � �P   I n   a d d i t i o n   t o   i n s e r t i n g   b e f o r e / a f t e r   t h e   l i s t ' s   a c t u a l   i n d e x e s ,   t h i s   a l s o   r e c o g n i z e s   t h r e e   ' v i r t u a l '   i n d e x e s :   t h e   ` a f t e r   i t e m `   p a r a m e t e r   u s e s   i n d e x   0   a n d   i n d e x   ` - l e n g t h   -   1 `   t o   i n d i c a t e   t h e   s t a r t   o f   t h e   l i s t ;   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   u s e s   i n d e x   ` l e n g t h   +   1 `   t o   i n d i c a t e   t h e   e n d   o f   t h e   l i s t .   �  � � � l     �m � ��m   �~x Note that the `before item` parameter cannot indicate the end of a list using a negative index. (Problem: the next 'virtual' index after -1 would be 0, but index 0 is already used by the `after item` parameter to represent the *start* of a list, and it's easier to disallow `before item 0` than explain to user how 'index 0' can be at both the start *and* the end of a list.)    � � � ��   N o t e   t h a t   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   c a n n o t   i n d i c a t e   t h e   e n d   o f   a   l i s t   u s i n g   a   n e g a t i v e   i n d e x .   ( P r o b l e m :   t h e   n e x t   ' v i r t u a l '   i n d e x   a f t e r   - 1   w o u l d   b e   0 ,   b u t   i n d e x   0   i s   a l r e a d y   u s e d   b y   t h e   ` a f t e r   i t e m `   p a r a m e t e r   t o   r e p r e s e n t   t h e   * s t a r t *   o f   a   l i s t ,   a n d   i t ' s   e a s i e r   t o   d i s a l l o w   ` b e f o r e   i t e m   0 `   t h a n   e x p l a i n   t o   u s e r   h o w   ' i n d e x   0 '   c a n   b e   a t   b o t h   t h e   s t a r t   * a n d *   t h e   e n d   o f   a   l i s t . ) �  ��l � Q    I � � � � k   3 � �  � � � h    
�k ��k 0 
listobject 
listObject � j     �j ��j 
0 _list_   � n     � � � I    �i ��h�i "0 aslistparameter asListParameter �  � � � o    
�g�g 0 thelist theList �  ��f � m   
  � � �    �f  �h   � o     �e�e 0 _support   �  Z    � >    o    �d�d 0 
afterindex 
afterIndex m    �c
�c 
msng k    g		 

 Z   !�b�a >    o    �`�` 0 beforeindex beforeIndex m    �_
�_ 
msng R    �^
�^ .ascrerr ****      � **** m     � ( T o o   m a n y   p a r a m e t e r s . �]�\
�] 
errn m    �[�[�Y�\  �b  �a    r   " / n  " - I   ' -�Z�Y�Z (0 asintegerparameter asIntegerParameter  o   ' (�X�X 0 
afterindex 
afterIndex �W m   ( ) �    a f t e r   i t e m�W  �Y   o   " '�V�V 0 _support   o      �U�U 0 
afterindex 
afterIndex !"! Z  0 E#$�T�S# A   0 3%&% o   0 1�R�R 0 
afterindex 
afterIndex& m   1 2�Q�Q  $ r   6 A'(' [   6 ?)*) [   6 =+,+ l  6 ;-�P�O- n  6 ;./. 1   9 ;�N
�N 
leng/ n  6 9010 o   7 9�M�M 
0 _list_  1 o   6 7�L�L 0 
listobject 
listObject�P  �O  , o   ; <�K�K 0 
afterindex 
afterIndex* m   = >�J�J ( o      �I�I 0 
afterindex 
afterIndex�T  �S  " 2�H2 Z   F g34�G�F3 ?   F M565 o   F G�E�E 0 
afterindex 
afterIndex6 l  G L7�D�C7 n  G L898 1   J L�B
�B 
leng9 n  G J:;: o   H J�A�A 
0 _list_  ; o   G H�@�@ 0 
listobject 
listObject�D  �C  4 R   P c�?<=
�? .ascrerr ****      � ****< m   _ b>> �?? , I n d e x   i s   o u t   o f   r a n g e .= �>@A
�> 
errn@ m   R S�=�=�@A �<B�;
�< 
erobB l  T ^C�:�9C N   T ^DD n   T ]EFE 9   [ ]�8
�8 
inslF n   T [GHG 4   X [�7I
�7 
cobjI o   Y Z�6�6 0 
afterindex 
afterIndexH l  T XJ�5�4J e   T XKK n  T XLML o   U W�3�3 
0 _list_  M o   T U�2�2 0 
listobject 
listObject�5  �4  �:  �9  �;  �G  �F  �H   NON >  j mPQP o   j k�1�1 0 beforeindex beforeIndexQ m   k l�0
�0 
msngO R�/R k   p �SS TUT r   p VWV n  p }XYX I   u }�.Z�-�. (0 asintegerparameter asIntegerParameterZ [\[ o   u v�,�, 0 beforeindex beforeIndex\ ]�+] m   v y^^ �__  b e f o r e   i t e m�+  �-  Y o   p u�*�* 0 _support  W o      �)�) 0 beforeindex beforeIndexU `a` Z   � �bcdeb ?   � �fgf o   � ��(�( 0 beforeindex beforeIndexg m   � ��'�'  c r   � �hih \   � �jkj o   � ��&�& 0 beforeindex beforeIndexk m   � ��%�% i o      �$�$ 0 
afterindex 
afterIndexd lml A   � �non o   � ��#�# 0 beforeindex beforeIndexo m   � ��"�"  m p�!p r   � �qrq [   � �sts l  � �u� �u n  � �vwv 1   � ��
� 
lengw n  � �xyx o   � ��� 
0 _list_  y o   � ��� 0 
listobject 
listObject�   �  t o   � ��� 0 beforeindex beforeIndexr o      �� 0 
afterindex 
afterIndex�!  e l  � �z{|z R   � ��}~
� .ascrerr ****      � ****} m   � � ���  I n v a l i d   i n d e x .~ ���
� 
errn� m   � ����@� ���
� 
erob� l  � ����� N   � ��� n   � ���� 8   � ��
� 
insl� n   � ���� 4   � ���
� 
cobj� o   � ��� 0 beforeindex beforeIndex� l  � ����� e   � ��� n  � ���� o   � ��� 
0 _list_  � o   � ��� 0 
listobject 
listObject�  �  �  �  �  { � � the `before item` parameter cannot identify the end of a list by negative index, so throw 'invalid index' error if `before item 0` is used   | ���   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   c a n n o t   i d e n t i f y   t h e   e n d   o f   a   l i s t   b y   n e g a t i v e   i n d e x ,   s o   t h r o w   ' i n v a l i d   i n d e x '   e r r o r   i f   ` b e f o r e   i t e m   0 `   i s   u s e da ��� Z   � ����
�	� G   � ���� ?   � ���� o   � ��� 0 
afterindex 
afterIndex� l  � ����� n  � ���� 1   � ��
� 
leng� n  � ���� o   � ��� 
0 _list_  � o   � ��� 0 
listobject 
listObject�  �  � A   � ���� o   � ��� 0 
afterindex 
afterIndex� m   � ���  � R   � �� ��
�  .ascrerr ****      � ****� m   � ��� ��� , I n d e x   i s   o u t   o f   r a n g e .� ����
�� 
errn� m   � ������@� �����
�� 
erob� l  � ������� N   � ��� n   � ���� 8   � ���
�� 
insl� n   � ���� 4   � ����
�� 
cobj� o   � ����� 0 beforeindex beforeIndex� l  � ������� e   � ��� n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject��  ��  ��  ��  ��  �
  �	  �  �/   R   � �����
�� .ascrerr ****      � ****� m   � ��� ��� $ M i s s i n g   p a r a m e t e r .� �����
�� 
errn� m   � ������Y��   ���� Z   �3����� =   � ���� o   � ����� 0 
afterindex 
afterIndex� m   � �����  � L   � ��� b   � ���� J   � ��� ���� o   � ����� 0 thevalue theValue��  � n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject� ��� =   ���� o   � ����� 0 
afterindex 
afterIndex� n  ���� 1   ��
�� 
leng� n  � ��� o   � ���� 
0 _list_  � o   � ����� 0 
listobject 
listObject� ���� L  �� b  ��� n 	��� o  	���� 
0 _list_  � o  ���� 0 
listobject 
listObject� J  	�� ���� o  	
���� 0 thevalue theValue��  ��  � L  3�� b  2��� b  "��� l ������ n  ��� 7 ����
�� 
cobj� m  ���� � o  ���� 0 
afterindex 
afterIndex� n ��� o  ���� 
0 _list_  � o  ���� 0 
listobject 
listObject��  ��  � J  !�� ���� o  ���� 0 thevalue theValue��  � l "1������ n  "1��� 7 %1����
�� 
cobj� l )-������ [  )-��� o  *+���� 0 
afterindex 
afterIndex� m  +,���� ��  ��  � m  .0������� n "%��� o  #%���� 
0 _list_  � o  "#���� 0 
listobject 
listObject��  ��  ��   � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��   � I  ;I������� 
0 _error  � ��� m  <?�� ���   i n s e r t   i n t o   l i s t� ��� o  ?@���� 0 etext eText� ��� o  @A���� 0 enumber eNumber� ��� o  AB���� 0 efrom eFrom� ���� o  BC���� 
0 eto eTo��  ��  �l   � ��� l     ��������  ��  ��  �    l     ��������  ��  ��    i  ! $ I     ��
�� .Lst:Delenull���     **** o      ���� 0 thelist theList ����
�� 
Inde |����	��
��  ��  	 o      ���� 0 theindex theIndex��  
 d       m      ���� ��   Q     � k    �  h    
���� 0 
listobject 
listObject j     ���� 
0 _list_   n     I    ������ "0 aslistparameter asListParameter  o    
���� 0 thelist theList �� m   
  �  ��  ��   o     ���� 0 _support    r     n    !  I    ��"���� (0 asintegerparameter asIntegerParameter" #$# o    ���� 0 theindex theIndex$ %��% m    && �''  i t e m��  ��  ! o    ���� 0 _support   o      ���� 0 theindex theIndex ()( Z    �*+,��* F    (-.- ?     /0/ n   121 1    ��
�� 
leng2 n   343 o    ���� 
0 _list_  4 o    ���� 0 
listobject 
listObject0 m    ���� . >   # &565 o   # $���� 0 theindex theIndex6 m   $ %����  + Z   + �789��7 E  + 7:;: J   + 3<< =>= m   + ,������> ?��? n  , 1@A@ 1   / 1��
�� 
lengA n  , /BCB o   - /���� 
0 _list_  C o   , -���� 0 
listobject 
listObject��  ; J   3 6DD E��E o   3 4���� 0 theindex theIndex��  8 L   : IFF n   : HGHG 7  = G��IJ
�� 
cobjI m   A C���� J m   D F������H n  : =KLK o   ; =���� 
0 _list_  L o   : ;���� 0 
listobject 
listObject9 MNM E  L YOPO J   L UQQ RSR m   L M���� S T��T d   M SUU l  M RV����V n  M RWXW 1   P R��
�� 
lengX n  M PYZY o   N P���� 
0 _list_  Z o   M N���� 0 
listobject 
listObject��  ��  ��  P J   U X[[ \��\ o   U V���� 0 theindex theIndex��  N ]^] L   \ c__ n   \ b`a` 1   _ a��
�� 
resta n  \ _bcb o   ] _���� 
0 _list_  c o   \ ]���� 0 
listobject 
listObject^ ded G   f �fgf F   f uhih ?   f ijkj o   f g�� 0 theindex theIndexk m   g h�~�~  i A   l slml o   l m�}�} 0 theindex theIndexm n  m rnon 1   p r�|
�| 
lengo n  m ppqp o   n p�{�{ 
0 _list_  q o   m n�z�z 0 
listobject 
listObjectg F   x �rsr A   x {tut o   x y�y�y 0 theindex theIndexu m   y z�x�x  s ?   ~ �vwv o   ~ �w�w 0 theindex theIndexw d    �xx l   �y�v�uy n   �z{z 1   � ��t
�t 
leng{ n   �|}| o   � ��s�s 
0 _list_  } o    ��r�r 0 
listobject 
listObject�v  �u  e ~�q~ L   � � b   � ���� l  � ���p�o� n   � ���� 7  � ��n��
�n 
cobj� m   � ��m�m � l  � ���l�k� \   � ���� o   � ��j�j 0 theindex theIndex� m   � ��i�i �l  �k  � n  � ���� o   � ��h�h 
0 _list_  � o   � ��g�g 0 
listobject 
listObject�p  �o  � l  � ���f�e� n   � ���� 7  � ��d��
�d 
cobj� l  � ���c�b� [   � ���� o   � ��a�a 0 theindex theIndex� m   � ��`�` �c  �b  � m   � ��_�_��� n  � ���� o   � ��^�^ 
0 _list_  � o   � ��]�] 0 
listobject 
listObject�f  �e  �q  ��  , ��� =   � ���� n  � ���� 1   � ��\
�\ 
leng� n  � ���� o   � ��[�[ 
0 _list_  � o   � ��Z�Z 0 
listobject 
listObject� m   � ��Y�Y � ��X� Z  � ����W�V� E  � ���� J   � ��� ��� m   � ��U�U��� ��T� m   � ��S�S �T  � J   � ��� ��R� o   � ��Q�Q 0 theindex theIndex�R  � L   � ��� J   � ��P�P  �W  �V  �X  ��  ) ��O� R   � ��N��
�N .ascrerr ****      � ****� m   � ��� ��� : I n v a l i d   i n d e x   ( o u t   o f   r a n g e ) .� �M��
�M 
errn� m   � ��L�L�@� �K��J
�K 
erob� l  � ���I�H� N   � ��� n   � ���� 4   � ��G�
�G 
cobj� o   � ��F�F 0 theindex theIndex� l  � ���E�D� e   � ��� n  � ���� o   � ��C�C 
0 _list_  � o   � ��B�B 0 
listobject 
listObject�E  �D  �I  �H  �J  �O   R      �A��
�A .ascrerr ****      � ****� o      �@�@ 0 etext eText� �?��
�? 
errn� o      �>�> 0 enumber eNumber� �=��
�= 
erob� o      �<�< 0 efrom eFrom� �;��:
�; 
errt� o      �9�9 
0 eto eTo�:   I   � ��8��7�8 
0 _error  � ��� m   � ��� ���   d e l e t e   f r o m   l i s t� ��� o   � ��6�6 0 etext eText� ��� o   � ��5�5 0 enumber eNumber� ��� o   � ��4�4 0 efrom eFrom� ��3� o   � ��2�2 
0 eto eTo�3  �7   ��� l     �1�0�/�1  �0  �/  � ��� l     �.�-�,�.  �-  �,  � ��� i  % (��� I     �+��
�+ .Lst:Findnull���     ****� o      �*�* 0 thelist theList� �)��
�) 
Valu� o      �(�( 0 theitem theItem� �'��&
�' 
Retu� |�%�$��#��%  �$  � o      �"�" (0 findingoccurrences findingOccurrences�#  � l     ��!� � m      �
� LFWhLFWA�!  �   �&  � Q     ����� k    ��� ��� h    
��� 0 
listobject 
listObject� k      �� ��� j     ��� 
0 _list_  � n    ��� I    ���� "0 aslistparameter asListParameter� ��� o    
�� 0 thelist theList� ��� m   
 �� ���  �  �  � o     �� 0 _support  � ��� j    ��� 0 _result_  � J    ��  �  � ��� Z    ������ =   ��� o    �� (0 findingoccurrences findingOccurrences� m    �
� LFWhLFWA� Y    :������ Z     5����� =    (   n     & 4   # &�
� 
cobj o   $ %�� 0 i   n    # o   ! #�� 
0 _list_   o     !�� 0 
listobject 
listObject o   & '�
�
 0 theitem theItem� r   + 1 o   + ,�	�	 0 i   n      	
	  ;   / 0
 n  , / o   - /�� 0 _result_   o   , -�� 0 
listobject 
listObject�  �  � 0 i  � m    �� � n     1    �
� 
leng n    o    �� 
0 _list_   o    �� 0 
listobject 
listObject�  �  =  = @ o   = >�� (0 findingoccurrences findingOccurrences m   > ?�
� LFWhLFWF  Y   C n� �� Z   R i���� =  R Z n   R X 4   U X�� 
�� 
cobj  o   V W���� 0 i   n  R U!"! o   S U���� 
0 _list_  " o   R S���� 0 
listobject 
listObject o   X Y���� 0 theitem theItem k   ] e## $%$ r   ] c&'& o   ] ^���� 0 i  ' n      ()(  ;   a b) n  ^ a*+* o   _ a���� 0 _result_  + o   ^ _���� 0 
listobject 
listObject% ,��,  S   d e��  ��  ��  �  0 i   m   F G����  n   G M-.- 1   J L��
�� 
leng. n  G J/0/ o   H J���� 
0 _list_  0 o   G H���� 0 
listobject 
listObject��   121 =  q t343 o   q r���� (0 findingoccurrences findingOccurrences4 m   r s��
�� LFWhLFWL2 5��5 Y   w �6��7896 Z   � �:;����: =  � �<=< n   � �>?> 4   � ���@
�� 
cobj@ o   � ����� 0 i  ? n  � �ABA o   � ����� 
0 _list_  B o   � ����� 0 
listobject 
listObject= o   � ����� 0 theitem theItem; k   � �CC DED r   � �FGF o   � ����� 0 i  G n      HIH  ;   � �I n  � �JKJ o   � ����� 0 _result_  K o   � ����� 0 
listobject 
listObjectE L��L  S   � ���  ��  ��  �� 0 i  7 n   z �MNM 1   } ��
�� 
lengN n  z }OPO o   { }���� 
0 _list_  P o   z {���� 0 
listobject 
listObject8 m   � ����� 9 m   � ���������  � R   � ���QR
�� .ascrerr ****      � ****Q m   � �SS �TT p I n v a l i d    r e t u r n i n g    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .R ��UV
�� 
errnU m   � ������YV ��WX
�� 
erobW o   � ����� (0 findingoccurrences findingOccurrencesX ��Y��
�� 
errtY m   � ���
�� 
enum��  � Z��Z L   � �[[ n  � �\]\ o   � ����� 0 _result_  ] o   � ����� 0 
listobject 
listObject��  � R      ��^_
�� .ascrerr ****      � ****^ o      ���� 0 etext eText_ ��`a
�� 
errn` o      ���� 0 enumber eNumbera ��bc
�� 
erobb o      ���� 0 efrom eFromc ��d��
�� 
errtd o      ���� 
0 eto eTo��  � I   � ���e���� 
0 _error  e fgf m   � �hh �ii  f i n d   i n   l i s tg jkj o   � ����� 0 etext eTextk lml o   � ����� 0 enumber eNumberm non o   � ����� 0 efrom eFromo p��p o   � ����� 
0 eto eTo��  ��  � qrq l     ��������  ��  ��  r sts l     ��������  ��  ��  t uvu i  ) ,wxw I     ��yz
�� .Lst:Trannull���     ****y o      ���� 0 thelist theListz ��{|
�� 
Whil{ |����}��~��  ��  } o      ���� 0 unevenoption unevenOption��  ~ l     ���� m      ��
�� LTrhLTrR��  ��  | �����
�� 
PadI� |����������  ��  � o      ���� 0 padvalue padValue��  � l     ������ m      ��
�� 
msng��  ��  ��  x Q    ����� k   ��� ��� Z   ������� =   ��� o    ���� 0 thelist theList� J    ����  � L   
 �� J   
 ����  ��  ��  � ��� Z   >������� G    /��� =    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ���� 0 thelist theList��  � �����
�� 
kocl� m    ��
�� 
list��  ��  ��  � m    ����  � >     -��� l    '������ I    '����
�� .corecnte****       ****� o     !���� 0 thelist theList� �����
�� 
kocl� m   " #��
�� 
list��  ��  ��  � l  ' ,������ I  ' ,�����
�� .corecnte****       ****� o   ' (���� 0 thelist theList��  ��  ��  � R   2 :����
�� .ascrerr ****      � ****� m   8 9�� ��� ( N o t   a   l i s t   o f   l i s t s .� ����
�� 
errn� m   4 5�����Y� �����
�� 
erob� o   6 7���� 0 thelist theList��  ��  ��  � ��� h   ? F����� 0 
listobject 
listObject� j     ����� 
0 _list_  � o     ���� 0 thelist theList� ��� r   G Q��� n   G O��� 1   M O��
�� 
leng� n  G M��� 4   J M���
�� 
cobj� m   K L���� � n  G J��� o   H J�� 
0 _list_  � o   G H�~�~ 0 
listobject 
listObject� o      �}�} $0 resultlistlength resultListLength� ��� l  R R�|���|  � K E find the longest/shortest sublist; this will be length of resultList   � ��� �   f i n d   t h e   l o n g e s t / s h o r t e s t   s u b l i s t ;   t h i s   w i l l   b e   l e n g t h   o f   r e s u l t L i s t� ��� Z   R����� =  R U��� o   R S�{�{ 0 unevenoption unevenOption� m   S T�z
�z LTrhLTrR� X   X ���y�� Z  j ����x�w� >   j o��� n  j m��� 1   k m�v
�v 
leng� o   j k�u�u 0 aref aRef� o   m n�t�t $0 resultlistlength resultListLength� R   r ~�s��
�s .ascrerr ****      � ****� m   z }�� ��� x I n v a l i d   d i r e c t   p a r a m e t e r   ( s u b l i s t s   a r e   n o t   a l l   s a m e   l e n g t h ) .� �r��
�r 
errn� m   t u�q�q�Y� �p��o
�p 
erob� l  v y��n�m� n  v y��� o   w y�l�l 
0 _list_  � o   v w�k�k 0 
listobject 
listObject�n  �m  �o  �x  �w  �y 0 aref aRef� n  [ ^��� o   \ ^�j�j 
0 _list_  � o   [ \�i�i 0 
listobject 
listObject� ��� =  � ���� o   � ��h�h 0 unevenoption unevenOption� m   � ��g
�g LTrhLTrP� ��� X   � ���f�� Z  � ����e�d� ?   � ���� n  � ���� 1   � ��c
�c 
leng� o   � ��b�b 0 aref aRef� o   � ��a�a $0 resultlistlength resultListLength� r   � ���� n  � ���� 1   � ��`
�` 
leng� o   � ��_�_ 0 aref aRef� o      �^�^ $0 resultlistlength resultListLength�e  �d  �f 0 aref aRef� n  � ���� o   � ��]�] 
0 _list_  � o   � ��\�\ 0 
listobject 
listObject� ��� =  � ���� o   � ��[�[ 0 unevenoption unevenOption� m   � ��Z
�Z LTrhLTrT� ��Y� X   � ���X�� Z  � ����W�V� A   � ���� n  � ���� 1   � ��U
�U 
leng� o   � ��T�T 0 aref aRef� o   � ��S�S $0 resultlistlength resultListLength� r   � ���� n  � �� � 1   � ��R
�R 
leng  o   � ��Q�Q 0 aref aRef� o      �P�P $0 resultlistlength resultListLength�W  �V  �X 0 aref aRef� n  � � o   � ��O�O 
0 _list_   o   � ��N�N 0 
listobject 
listObject�Y  � R   ��M
�M .ascrerr ****      � **** m   � � h I n v a l i d    w h i l e    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) . �L
�L 
errn m   � ��K�K�Y �J	

�J 
erob	 o   � ��I�I 0 unevenoption unevenOption
 �H�G
�H 
errt m   � ��F
�F 
enum�G  �  l �E�E   � � build empty matrix (due to inefficiencies of AS's list implementation, when populating large lists, it's probably quicker to create a padded list then set its items rather than start with an empty list and append items)    ��   b u i l d   e m p t y   m a t r i x   ( d u e   t o   i n e f f i c i e n c i e s   o f   A S ' s   l i s t   i m p l e m e n t a t i o n ,   w h e n   p o p u l a t i n g   l a r g e   l i s t s ,   i t ' s   p r o b a b l y   q u i c k e r   t o   c r e a t e   a   p a d d e d   l i s t   t h e n   s e t   i t s   i t e m s   r a t h e r   t h a n   s t a r t   w i t h   a n   e m p t y   l i s t   a n d   a p p e n d   i t e m s )  r   I  �D�C�D "0 _makelistobject _makeListObject  n 	 1  	�B
�B 
leng n  o  �A�A 
0 _list_   o  �@�@ 0 
listobject 
listObject �? o  	
�>�> 0 padvalue padValue�?  �C   o      �=�= (0 emptyresultsublist emptyResultSubList  h  �<�< $0 resultlistobject resultListObject j     �; �; 
0 _list_    J     �:�:   !"! Y  7#�9$%�8# l )2&'(& r  )2)*) l )-+�7�6+ e  )-,, n )--.- 2 *,�5
�5 
cobj. o  )*�4�4 (0 emptyresultsublist emptyResultSubList�7  �6  * n      /0/  ;  010 n -0121 o  .0�3�3 
0 _list_  2 o  -.�2�2 $0 resultlistobject resultListObject'   shallow copy   ( �33    s h a l l o w   c o p y�9 0 i  $ m   !�1�1 % l !$4�0�/4 \  !$565 o  !"�.�. $0 resultlistlength resultListLength6 m  "#�-�- �0  �/  �8  " 787 r  8>9:9 o  89�,�, (0 emptyresultsublist emptyResultSubList: n      ;<;  ;  <=< n 9<=>= o  :<�+�+ 
0 _list_  > o  9:�*�* $0 resultlistobject resultListObject8 ?@? l ??�)AB�)  A   populate matrix   B �CC     p o p u l a t e   m a t r i x@ DED Y  ?}F�(GH�'F Y  NxI�&JK�%I r  `sLML n  `iNON 4  fi�$P
�$ 
cobjP o  gh�#�# 0 j  O n  `fQRQ 4  cf�"S
�" 
cobjS o  de�!�! 0 i  R n `cTUT o  ac� �  
0 _list_  U o  `a�� 0 
listobject 
listObjectM n      VWV 4  or�X
� 
cobjX o  pq�� 0 i  W n  ioYZY 4  lo�[
� 
cobj[ o  mn�� 0 j  Z n il\]\ o  jl�� 
0 _list_  ] o  ij�� $0 resultlistobject resultListObject�& 0 j  J m  QR�� K n  R[^_^ 1  XZ�
� 
leng_ n RX`a` 4  UX�b
� 
cobjb o  VW�� 0 i  a n RUcdc o  SU�� 
0 _list_  d o  RS�� 0 
listobject 
listObject�%  �( 0 i  G m  BC�� H n CIefe 1  FH�
� 
lengf n CFghg o  DF�� 
0 _list_  h o  CD�� 0 
listobject 
listObject�'  E i�i L  ~�jj n ~�klk o  ��� 
0 _list_  l o  ~�� $0 resultlistobject resultListObject�  � R      �mn
� .ascrerr ****      � ****m o      �
�
 0 etext eTextn �	op
�	 
errno o      �� 0 enumber eNumberp �qr
� 
erobq o      �� 0 efrom eFromr �s�
� 
errts o      �� 
0 eto eTo�  � I  ���t�� 
0 _error  t uvu m  ��ww �xx  t r a n s p o s e   l i s tv yzy o  ��� �  0 etext eTextz {|{ o  ������ 0 enumber eNumber| }~} o  ������ 0 efrom eFrom~ �� o  ������ 
0 eto eTo��  �  v ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �ZT map, filter, reduce (these operations are relatively trivial to perform in AS without the need for callbacks; however, these handlers are more flexible when the convert/check/combine operations are parameterized and also provide more advanced users with idiomatic examples of how to parameterize a general-purpose handler's exact behavior)   � ����   m a p ,   f i l t e r ,   r e d u c e   ( t h e s e   o p e r a t i o n s   a r e   r e l a t i v e l y   t r i v i a l   t o   p e r f o r m   i n   A S   w i t h o u t   t h e   n e e d   f o r   c a l l b a c k s ;   h o w e v e r ,   t h e s e   h a n d l e r s   a r e   m o r e   f l e x i b l e   w h e n   t h e   c o n v e r t / c h e c k / c o m b i n e   o p e r a t i o n s   a r e   p a r a m e t e r i z e d   a n d   a l s o   p r o v i d e   m o r e   a d v a n c e d   u s e r s   w i t h   i d i o m a t i c   e x a m p l e s   o f   h o w   t o   p a r a m e t e r i z e   a   g e n e r a l - p u r p o s e   h a n d l e r ' s   e x a c t   b e h a v i o r )� ��� l     ��������  ��  ��  � ��� l     ������  � � � note: while these handlers prevent the script object from modifying the input list directly, it cannot stop them modifying mutable (date/list/record/script/reference) items within the input list (doing so would be very bad practice, however)   � ����   n o t e :   w h i l e   t h e s e   h a n d l e r s   p r e v e n t   t h e   s c r i p t   o b j e c t   f r o m   m o d i f y i n g   t h e   i n p u t   l i s t   d i r e c t l y ,   i t   c a n n o t   s t o p   t h e m   m o d i f y i n g   m u t a b l e   ( d a t e / l i s t / r e c o r d / s c r i p t / r e f e r e n c e )   i t e m s   w i t h i n   t h e   i n p u t   l i s t   ( d o i n g   s o   w o u l d   b e   v e r y   b a d   p r a c t i c e ,   h o w e v e r )� ��� l     ��������  ��  ��  � ��� i  - 0��� I     ����
�� .Lst:Map_null���     ****� o      ���� 0 thelist theList� �����
�� 
Usin� o      ���� 0 	thescript 	theScript��  � Q     ����� k    ��� ��� h    
����� $0 resultlistobject resultListObject� j     ����� 
0 _list_  � n     ��� 2   ��
�� 
cobj� n    ��� I    ������� "0 aslistparameter asListParameter� ��� o    
���� 0 thelist theList� ���� m   
 �� ���  ��  ��  � o     ���� 0 _support  � ��� r    ��� n   ��� I    ������� &0 asscriptparameter asScriptParameter� ��� o    ���� 0 	thescript 	theScript� ���� m    �� ��� 
 u s i n g��  ��  � o    ���� 0 _support  � o      ���� 0 	thescript 	theScript� ��� Q    ����� Y    B�������� l  + =���� r   + =��� n  + 6��� I   , 6������� 0 convertitem convertItem� ���� n   , 2��� 4   / 2���
�� 
cobj� o   0 1���� 0 i  � n  , /��� o   - /���� 
0 _list_  � o   , -���� $0 resultlistobject resultListObject��  ��  � o   + ,���� 0 	thescript 	theScript� n      ��� 4   9 <���
�� 
cobj� o   : ;���� 0 i  � n  6 9��� o   7 9���� 
0 _list_  � o   6 7���� $0 resultlistobject resultListObject� � ~ use counting loop rather than `repeat with aRef in theList` as the item's index is also used when constructing error messages   � ��� �   u s e   c o u n t i n g   l o o p   r a t h e r   t h a n   ` r e p e a t   w i t h   a R e f   i n   t h e L i s t `   a s   t h e   i t e m ' s   i n d e x   i s   a l s o   u s e d   w h e n   c o n s t r u c t i n g   e r r o r   m e s s a g e s�� 0 i  � m     ���� � n     &��� 1   # %��
�� 
leng� n    #��� o   ! #���� 
0 _list_  � o     !���� $0 resultlistobject resultListObject��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� �����
�� 
errt� o      ���� 
0 eto eTo��  � k   J ��� ��� Z   J h������ ?   J M��� o   J K���� 0 i  � m   K L���� � r   P a��� n   P _��� 7  S _����
�� 
cobj� m   W Y���� � l  Z ^������ \   Z ^��� o   [ \���� 0 i  � m   \ ]���� ��  ��  � n  P S��� o   Q S���� 
0 _list_  � o   P Q���� $0 resultlistobject resultListObject� o      ���� 0 epartial ePartial��  � r   d h��� J   d f����  � o      ���� 0 epartial ePartial� ���� R   i �����
�� .ascrerr ****      � ****� b   z ���� b   z ���� b   z ��� m   z }�� �   , C o u l d n ' t   c o n v e r t   i t e m  � o   } ~���� 0 i  � m    � �  :  � o   � ����� 0 etext eText� ��
�� 
errn o   k l���� 0 enumber eNumber ��
�� 
erob l  m u���� N   m u n   m t	
	 4   q t��
�� 
cobj o   r s���� 0 i  
 l  m q���� e   m q n  m q o   n p���� 
0 _list_   o   m n���� 0 
listobject 
listObject��  ��  ��  ��   ��
�� 
errt o   v w���� 
0 eto eTo ����
�� 
ptlr o   x y���� 0 epartial ePartial��  ��  � �� L   � � n  � � o   � ����� 
0 _list_   o   � ����� $0 resultlistobject resultListObject��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ��
�� 
errt o      ���� 
0 eto eTo ����
�� 
ptlr o      ���� 0 epartial ePartial��  � I   � ��� ���� 20 _errorwithpartialresult _errorWithPartialResult  !"! m   � �## �$$  m a p   l i s t" %&% o   � ����� 0 etext eText& '(' o   � ����� 0 enumber eNumber( )*) o   � ����� 0 efrom eFrom* +,+ o   � ����� 
0 eto eTo, -��- o   � ����� 0 epartial ePartial��  ��  � ./. l     ��������  ��  ��  / 010 l     ��������  ��  ��  1 232 i  1 4454 I     ��67
�� .Lst:Filtnull���     ****6 o      ���� 0 thelist theList7 ��8�
�� 
Usin8 o      �~�~ 0 	thescript 	theScript�  5 Q     �9:;9 k    �<< =>= h    
�}?�} $0 resultlistobject resultListObject? j     �|@�| 
0 _list_  @ n     ABA 2   �{
�{ 
cobjB n    CDC I    �zE�y�z "0 aslistparameter asListParameterE FGF o    
�x�x 0 thelist theListG H�wH m   
 II �JJ  �w  �y  D o     �v�v 0 _support  > KLK r    MNM n   OPO I    �uQ�t�u &0 asscriptparameter asScriptParameterQ RSR o    �s�s 0 	thescript 	theScriptS T�rT m    UU �VV 
 u s i n g�r  �t  P o    �q�q 0 _support  N o      �p�p 0 	thescript 	theScriptL WXW r    YZY m    �o�o  Z o      �n�n 0 	lastindex 	lastIndexX [\[ Q    �]^_] Y     X`�mab�l` k   / Scc ded r   / 7fgf n   / 5hih 4   2 5�kj
�k 
cobjj o   3 4�j�j 0 i  i n  / 2klk o   0 2�i�i 
0 _list_  l o   / 0�h�h $0 resultlistobject resultListObjectg o      �g�g 0 theitem theIteme m�fm Z   8 Sno�e�dn n  8 >pqp I   9 >�cr�b�c 0 	checkitem 	checkItemr s�as o   9 :�`�` 0 theitem theItem�a  �b  q o   8 9�_�_ 0 	thescript 	theScripto k   A Ott uvu r   A Fwxw [   A Dyzy o   A B�^�^ 0 	lastindex 	lastIndexz m   B C�]�] x o      �\�\ 0 	lastindex 	lastIndexv {�[{ r   G O|}| o   G H�Z�Z 0 theitem theItem} n      ~~ 4   K N�Y�
�Y 
cobj� o   L M�X�X 0 	lastindex 	lastIndex n  H K��� o   I K�W�W 
0 _list_  � o   H I�V�V $0 resultlistobject resultListObject�[  �e  �d  �f  �m 0 i  a m   # $�U�U b n   $ *��� 1   ' )�T
�T 
leng� n  $ '��� o   % '�S�S 
0 _list_  � o   $ %�R�R $0 resultlistobject resultListObject�l  ^ R      �Q��
�Q .ascrerr ****      � ****� o      �P�P 0 etext eText� �O��
�O 
errn� o      �N�N 0 enumber eNumber� �M��L
�M 
errt� o      �K�K 
0 eto eTo�L  _ k   ` ��� ��� Z   ` ~���J�� ?   ` c��� o   ` a�I�I 0 	lastindex 	lastIndex� m   a b�H�H � r   f w��� n   f u��� 7  i u�G��
�G 
cobj� m   m o�F�F � l  p t��E�D� \   p t��� o   q r�C�C 0 	lastindex 	lastIndex� m   r s�B�B �E  �D  � n  f i��� o   g i�A�A 
0 _list_  � o   f g�@�@ $0 resultlistobject resultListObject� o      �?�? 0 epartial ePartial�J  � r   z ~��� J   z |�>�>  � o      �=�= 0 epartial ePartial� ��<� R    ��;��
�; .ascrerr ****      � ****� b   � ���� b   � ���� b   � ���� m   � ��� ��� * C o u l d n ' t   f i l t e r   i t e m  � o   � ��:�: 0 i  � m   � ��� ���  :  � o   � ��9�9 0 etext eText� �8��
�8 
errn� o   � ��7�7 0 enumber eNumber� �6��
�6 
erob� l  � ���5�4� N   � ��� n   � ���� 4   � ��3�
�3 
cobj� o   � ��2�2 0 i  � l  � ���1�0� e   � ��� n  � ���� o   � ��/�/ 
0 _list_  � o   � ��.�. 0 
listobject 
listObject�1  �0  �5  �4  � �-��
�- 
errt� o   � ��,�, 
0 eto eTo� �+��*
�+ 
ptlr� o   � ��)�) 0 epartial ePartial�*  �<  \ ��� Z  � ����(�'� =   � ���� o   � ��&�& 0 	lastindex 	lastIndex� m   � ��%�%  � L   � ��� J   � ��$�$  �(  �'  � ��#� L   � ��� n  � ���� 7  � ��"��
�" 
cobj� m   � ��!�! � o   � �� �  0 	lastindex 	lastIndex� n  � ���� o   � ��� 
0 _list_  � o   � ��� $0 resultlistobject resultListObject�#  : R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo� ���
� 
ptlr� o      �� 0 epartial ePartial�  ; I   � ����� 20 _errorwithpartialresult _errorWithPartialResult� ��� m   � ��� ���  f i l t e r   l i s t� ��� o   � ��� 0 etext eText� ��� o   � ��� 0 enumber eNumber� ��� o   � ��� 0 efrom eFrom� ��� o   � ��� 
0 eto eTo� ��� o   � ��� 0 epartial ePartial�  �  3 ��� l     �
�	��
  �	  �  � ��� l     ����  �  �  � ��� i  5 8��� I     ���
� .Lst:Redunull���     ****� o      �� 0 thelist theList� ���
� 
Usin� o      � �  0 	thescript 	theScript�  � k     ��� ��� r     ��� o     ���� 0 missingvalue missingValue� o      ���� 0 	theresult 	theResult� ���� Q    ����� k    ��� ��� h    ����� 0 
listobject 
listObject� j     ����� 
0 _list_  � n    ��� I    ������� "0 aslistparameter asListParameter�    o    
���� 0 thelist theList �� m   
  �  ��  ��  � o     ���� 0 _support  �  Z   &���� =    	
	 n     1    ��
�� 
leng n    o    ���� 
0 _list_   o    ���� 0 
listobject 
listObject
 m    ����   R    "��
�� .ascrerr ****      � **** m     ! �  L i s t   i s   e m p t y . ��
�� 
errn m    �����Y ����
�� 
erob J    ����  ��  ��  ��    r   ' 4 n  ' 2 I   , 2������ &0 asscriptparameter asScriptParameter  o   , -���� 0 	thescript 	theScript �� m   - .   �!! 
 u s i n g��  ��   o   ' ,���� 0 _support   o      ���� 0 	thescript 	theScript "#" r   5 =$%$ n   5 ;&'& 4   8 ;��(
�� 
cobj( m   9 :���� ' n  5 8)*) o   6 8���� 
0 _list_  * o   5 6���� 0 
listobject 
listObject% o      ���� 0 	theresult 	theResult# +,+ Q   > �-./- Y   A c0��12��0 r   P ^343 n  P \565 I   Q \��7���� 0 combineitems combineItems7 898 o   Q R���� 0 	theresult 	theResult9 :��: n   R X;<; 4   U X��=
�� 
cobj= o   V W���� 0 i  < n  R U>?> o   S U���� 
0 _list_  ? o   R S���� 0 
listobject 
listObject��  ��  6 o   P Q���� 0 	thescript 	theScript4 o      ���� 0 	theresult 	theResult�� 0 i  1 m   D E���� 2 n   E K@A@ 1   H J��
�� 
lengA n  E HBCB o   F H���� 
0 _list_  C o   E F���� 0 
listobject 
listObject��  . R      ��DE
�� .ascrerr ****      � ****D o      ���� 0 etext eTextE ��FG
�� 
errnF o      ���� 0 enumber eNumberG ��H��
�� 
errtH o      ���� 
0 eto eTo��  / R   k ���IJ
�� .ascrerr ****      � ****I b   ~ �KLK b   ~ �MNM b   ~ �OPO m   ~ �QQ �RR * C o u l d n ' t   r e d u c e   i t e m  P o   � ����� 0 i  N m   � �SS �TT  :  L o   � ����� 0 etext eTextJ ��UV
�� 
errnU o   m n���� 0 enumber eNumberV ��WX
�� 
erobW l  o wY����Y N   o wZZ n   o v[\[ 4   s v��]
�� 
cobj] o   t u���� 0 i  \ l  o s^����^ e   o s__ n  o s`a` o   p r���� 
0 _list_  a o   o p���� 0 
listobject 
listObject��  ��  ��  ��  X ��b��
�� 
errtb o   z {���� 
0 eto eTo��  , c��c L   � �dd o   � ����� 0 	theresult 	theResult��  � R      ��ef
�� .ascrerr ****      � ****e o      ���� 0 etext eTextf ��gh
�� 
errng o      ���� 0 enumber eNumberh ��ij
�� 
erobi o      ���� 0 efrom eFromj ��k��
�� 
errtk o      ���� 
0 eto eTo��  � I   � ���l���� 20 _errorwithpartialresult _errorWithPartialResultl mnm m   � �oo �pp  r e d u c e   l i s tn qrq o   � ����� 0 etext eTextr sts o   � ����� 0 enumber eNumbert uvu o   � ����� 0 efrom eFromv wxw o   � ����� 
0 eto eTox y��y o   � ����� 0 	theresult 	theResult��  ��  ��  � z{z l     ��������  ��  ��  { |}| l     ��������  ��  ��  } ~~ l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ��� l     ������  �   sort   � ��� 
   s o r t� ��� l     ��������  ��  ��  � ��� l      ������  ��� Notes: 

- Quicksort provides between [best case] O(n * log n) and [worst case] O(n * n) efficiency, typically leaning towards the former in all but the most pathological cases.

- One limitation of quicksort is that it isn't stable, i.e. items that compare as equal can appear in any order in the resulting list; their original order isn't preserved. An alternate algorithm such as Heapsort would avoid this, but would likely be significantly slower on average (while heapsort is guaranteed to be O(n * log n), it has much higher constant overhead than quicksort which tends to be fast in all but the most degenerate cases).

- This implementation trades some speed for greater robustness and flexibility, sorting a 10,000-number list in ~1sec, whereas a bare-bones quicksort might be 2x faster. OTOH, if you want fast code then AppleScript's the absolute last language you want to be using anyway, (e.g. Python's `sorted` function is 100x faster). For sorting simple lists of number/text/date values it's probably much quicker to send the AS list across the ASOC bridge and use -[NSArray sortedArray...], but that doesn't generalize to other use cases so isn't used here.

- TO DO: What, if anything, could be done to get better performance out of this code?

   � ���	�   N o t e s :   
 
 -   Q u i c k s o r t   p r o v i d e s   b e t w e e n   [ b e s t   c a s e ]   O ( n   *   l o g   n )   a n d   [ w o r s t   c a s e ]   O ( n   *   n )   e f f i c i e n c y ,   t y p i c a l l y   l e a n i n g   t o w a r d s   t h e   f o r m e r   i n   a l l   b u t   t h e   m o s t   p a t h o l o g i c a l   c a s e s . 
 
 -   O n e   l i m i t a t i o n   o f   q u i c k s o r t   i s   t h a t   i t   i s n ' t   s t a b l e ,   i . e .   i t e m s   t h a t   c o m p a r e   a s   e q u a l   c a n   a p p e a r   i n   a n y   o r d e r   i n   t h e   r e s u l t i n g   l i s t ;   t h e i r   o r i g i n a l   o r d e r   i s n ' t   p r e s e r v e d .   A n   a l t e r n a t e   a l g o r i t h m   s u c h   a s   H e a p s o r t   w o u l d   a v o i d   t h i s ,   b u t   w o u l d   l i k e l y   b e   s i g n i f i c a n t l y   s l o w e r   o n   a v e r a g e   ( w h i l e   h e a p s o r t   i s   g u a r a n t e e d   t o   b e   O ( n   *   l o g   n ) ,   i t   h a s   m u c h   h i g h e r   c o n s t a n t   o v e r h e a d   t h a n   q u i c k s o r t   w h i c h   t e n d s   t o   b e   f a s t   i n   a l l   b u t   t h e   m o s t   d e g e n e r a t e   c a s e s ) . 
 
 -   T h i s   i m p l e m e n t a t i o n   t r a d e s   s o m e   s p e e d   f o r   g r e a t e r   r o b u s t n e s s   a n d   f l e x i b i l i t y ,   s o r t i n g   a   1 0 , 0 0 0 - n u m b e r   l i s t   i n   ~ 1 s e c ,   w h e r e a s   a   b a r e - b o n e s   q u i c k s o r t   m i g h t   b e   2 x   f a s t e r .   O T O H ,   i f   y o u   w a n t   f a s t   c o d e   t h e n   A p p l e S c r i p t ' s   t h e   a b s o l u t e   l a s t   l a n g u a g e   y o u   w a n t   t o   b e   u s i n g   a n y w a y ,   ( e . g .   P y t h o n ' s   ` s o r t e d `   f u n c t i o n   i s   1 0 0 x   f a s t e r ) .   F o r   s o r t i n g   s i m p l e   l i s t s   o f   n u m b e r / t e x t / d a t e   v a l u e s   i t ' s   p r o b a b l y   m u c h   q u i c k e r   t o   s e n d   t h e   A S   l i s t   a c r o s s   t h e   A S O C   b r i d g e   a n d   u s e   - [ N S A r r a y   s o r t e d A r r a y . . . ] ,   b u t   t h a t   d o e s n ' t   g e n e r a l i z e   t o   o t h e r   u s e   c a s e s   s o   i s n ' t   u s e d   h e r e . 
 
 -   T O   D O :   W h a t ,   i f   a n y t h i n g ,   c o u l d   b e   d o n e   t o   g e t   b e t t e r   p e r f o r m a n c e   o u t   o f   t h i s   c o d e ? 
 
� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� j   9 ;����� *0 _quicksortthreshold _quicksortThreshold� m   9 :���� � ��� l     ��������  ��  ��  � ��� i  < ?��� I      ������� 	0 _sort  � ��� o      ���� $0 resultlistobject resultListObject� ��� o      ���� 0 	fromindex 	fromIndex� ��� o      ���� 0 toindex toIndex� ��� o      ����  0 sortcomparator sortComparator� ���� o      ���� 0 usequicksort useQuickSort��  ��  � l   ���� k    �� ��� Z    t������� o     ���� 0 usequicksort useQuickSort� l  p���� k   p�� ��� Z   ������� A    	��� \    ��� o    �� 0 toindex toIndex� o    �~�~ 0 	fromindex 	fromIndex� m    �}�} � L    �|�|  ��  ��  � ��� r    &��� J    �� ��� o    �{�{ 0 	fromindex 	fromIndex� ��z� o    �y�y 0 toindex toIndex�z  � J      �� ��� o      �x�x 0 	leftindex 	leftIndex� ��w� o      �v�v 0 
rightindex 
rightIndex�w  � ��� l  ' 8���� r   ' 8��� n   ' 6��� 3   4 6�u
�u 
cobj� n   ' 4��� 7  * 4�t��
�t 
cobj� o   . 0�s�s 0 	fromindex 	fromIndex� o   1 3�r�r 0 toindex toIndex� n  ' *��� o   ( *�q�q 
0 _keys_  � o   ' (�p�p $0 resultlistobject resultListObject� o      �o�o 0 
pivotvalue 
pivotValue� � � TO DO: if resultListObject's _list_'s length>someLargeThreshold then use median of 3 items? (TBH, picking a good midrange pivot is probably least of its problems performancewise)   � ���f   T O   D O :   i f   r e s u l t L i s t O b j e c t ' s   _ l i s t _ ' s   l e n g t h > s o m e L a r g e T h r e s h o l d   t h e n   u s e   m e d i a n   o f   3   i t e m s ?   ( T B H ,   p i c k i n g   a   g o o d   m i d r a n g e   p i v o t   i s   p r o b a b l y   l e a s t   o f   i t s   p r o b l e m s   p e r f o r m a n c e w i s e )� ��� V   9;��� k   A6�� ��� Q   A ����� V   D d��� l  Z _���� r   Z _��� [   Z ]��� o   Z [�n�n 0 	leftindex 	leftIndex� m   [ \�m�m � o      �l�l 0 	leftindex 	leftIndex� � z while cmp returns -1; note that if compareKeys() returns a non-numeric value/no result, this will throw -1700/-2763 error   � ��� �   w h i l e   c m p   r e t u r n s   - 1 ;   n o t e   t h a t   i f   c o m p a r e K e y s ( )   r e t u r n s   a   n o n - n u m e r i c   v a l u e / n o   r e s u l t ,   t h i s   w i l l   t h r o w   - 1 7 0 0 / - 2 7 6 3   e r r o r� A   H Y��� c   H W��� n  H U��� I   I U�k��j�k 0 comparekeys compareKeys� ��� e   I P�� n   I P��� 4   L O�i�
�i 
cobj� o   M N�h�h 0 	leftindex 	leftIndex� n  I L��� o   J L�g�g 
0 _keys_  � o   I J�f�f $0 resultlistobject resultListObject� ��e� o   P Q�d�d 0 
pivotvalue 
pivotValue�e  �j  � o   H I�c�c  0 sortcomparator sortComparator� m   U V�b
�b 
nmbr� m   W X�a�a  � R      �`��
�` .ascrerr ****      � ****� o      �_�_ 0 etext eText� �^��
�^ 
errn� o      �]�] 0 enum eNum� �\��
�\ 
erob� o      �[�[ 0 efrom eFrom� �Z �Y
�Z 
errt  o      �X�X 
0 eto eTo�Y  � R   l ��W
�W .ascrerr ****      � **** b   |  m   | } � < C o u l d n ' t   c o m p a r e   o b j e c t   k e y s :   o   } ~�V�V 0 etext eText �U
�U 
errn o   n o�T�T 0 enum eNum �S	

�S 
erob	 J   p y  n   p v 4   s v�R
�R 
cobj o   t u�Q�Q 0 	leftindex 	leftIndex n  p s o   q s�P�P 
0 _keys_   o   p q�O�O $0 resultlistobject resultListObject �N o   v w�M�M 0 
pivotvalue 
pivotValue�N  
 �L�K
�L 
errt o   z {�J�J 
0 eto eTo�K  �  Q   � � V   � � l  � � r   � �  \   � �!"! o   � ��I�I 0 
rightindex 
rightIndex" m   � ��H�H   o      �G�G 0 
rightindex 
rightIndex   while cmp returns 1;     �## ,   w h i l e   c m p   r e t u r n s   1 ;   ?   � �$%$ c   � �&'& n  � �()( I   � ��F*�E�F 0 comparekeys compareKeys* +,+ n   � �-.- 4   � ��D/
�D 
cobj/ o   � ��C�C 0 
rightindex 
rightIndex. n  � �010 o   � ��B�B 
0 _keys_  1 o   � ��A�A $0 resultlistobject resultListObject, 2�@2 o   � ��?�? 0 
pivotvalue 
pivotValue�@  �E  ) o   � ��>�>  0 sortcomparator sortComparator' m   � ��=
�= 
nmbr% m   � ��<�<   R      �;34
�; .ascrerr ****      � ****3 o      �:�: 0 etext eText4 �956
�9 
errn5 o      �8�8 0 enum eNum6 �778
�7 
erob7 o      �6�6 0 efrom eFrom8 �59�4
�5 
errt9 o      �3�3 
0 eto eTo�4   R   � ��2:;
�2 .ascrerr ****      � ****: b   � �<=< m   � �>> �?? < C o u l d n ' t   c o m p a r e   o b j e c t   k e y s :  = o   � ��1�1 0 etext eText; �0@A
�0 
errn@ o   � ��/�/ 0 enum eNumA �.BC
�. 
erobB J   � �DD EFE n   � �GHG 4   � ��-I
�- 
cobjI o   � ��,�, 0 
rightindex 
rightIndexH n  � �JKJ o   � ��+�+ 
0 _keys_  K o   � ��*�* $0 resultlistobject resultListObjectF L�)L o   � ��(�( 0 
pivotvalue 
pivotValue�)  C �'M�&
�' 
errtM o   � ��%�% 
0 eto eTo�&   N�$N Z   �6OP�#�"O l  � �Q�!� Q H   � �RR ?   � �STS o   � ��� 0 	leftindex 	leftIndexT o   � ��� 0 
rightindex 
rightIndex�!  �   P k   �2UU VWV r   � �XYX J   � �ZZ [\[ e   � �]] n   � �^_^ 4   � ��`
� 
cobj` o   � ��� 0 
rightindex 
rightIndex_ n  � �aba o   � ��� 
0 _keys_  b o   � ��� $0 resultlistobject resultListObject\ c�c e   � �dd n   � �efe 4   � ��g
� 
cobjg o   � ��� 0 	leftindex 	leftIndexf n  � �hih o   � ��� 
0 _keys_  i o   � ��� $0 resultlistobject resultListObject�  Y J      jj klk n      mnm 4   � ��o
� 
cobjo o   � ��� 0 	leftindex 	leftIndexn n  � �pqp o   � ��� 
0 _keys_  q o   � ��� $0 resultlistobject resultListObjectl r�r n      sts 4   � ��u
� 
cobju o   � ��� 0 
rightindex 
rightIndext n  � �vwv o   � ��� 
0 _keys_  w o   � ��� $0 resultlistobject resultListObject�  W xyx r   �z{z J   �|| }~} e   � � n   � ���� 4   � ���
� 
cobj� o   � ��
�
 0 
rightindex 
rightIndex� n  � ���� o   � ��	�	 
0 _list_  � o   � ��� $0 resultlistobject resultListObject~ ��� e   � ��� n   � ���� 4   � ���
� 
cobj� o   � ��� 0 	leftindex 	leftIndex� n  � ���� o   � ��� 
0 _list_  � o   � ��� $0 resultlistobject resultListObject�  { J      �� ��� n      ��� 4  	��
� 
cobj� o  
�� 0 	leftindex 	leftIndex� n 	��� o  	� �  
0 _list_  � o  ���� $0 resultlistobject resultListObject� ���� n      ��� 4  ���
�� 
cobj� o  ���� 0 
rightindex 
rightIndex� n ��� o  ���� 
0 _list_  � o  ���� $0 resultlistobject resultListObject��  y ���� r  2��� J  #�� ��� [  ��� o  ���� 0 	leftindex 	leftIndex� m  ���� � ���� \  !��� o  ���� 0 
rightindex 
rightIndex� m   ���� ��  � J      �� ��� o      ���� 0 	leftindex 	leftIndex� ���� o      ���� 0 
rightindex 
rightIndex��  ��  �#  �"  �$  � B   = @��� o   = >���� 0 	leftindex 	leftIndex� o   > ?���� 0 
rightindex 
rightIndex� ���� Q  <p���� k  ?g�� ��� I  ?Q������� 	0 _sort  � ��� o  @A���� $0 resultlistobject resultListObject� ��� o  AB���� 0 	fromindex 	fromIndex� ��� o  BC���� 0 
rightindex 
rightIndex� ��� o  CD����  0 sortcomparator sortComparator� ���� ?  DM��� \  DG��� o  DE���� 0 
rightindex 
rightIndex� o  EF���� 0 	fromindex 	fromIndex� o  GL���� *0 _quicksortthreshold _quicksortThreshold��  ��  � ��� I  Rd������� 	0 _sort  � ��� o  ST���� $0 resultlistobject resultListObject� ��� o  TU���� 0 	leftindex 	leftIndex� ��� o  UV���� 0 toindex toIndex� ��� o  VW����  0 sortcomparator sortComparator� ���� ?  W`��� \  WZ��� o  WX���� 0 toindex toIndex� o  XY���� 0 	leftindex 	leftIndex� o  Z_���� *0 _quicksortthreshold _quicksortThreshold��  ��  � ���� L  eg����  ��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      ����
���  � l oo������  � � � stack overflow, so fall-through to use non-recursive insertion sort -- TO DO: if this is a concern, switch to non-recursive implementation that stores unsorted ranges in its own stack structure   � ����   s t a c k   o v e r f l o w ,   s o   f a l l - t h r o u g h   t o   u s e   n o n - r e c u r s i v e   i n s e r t i o n   s o r t   - -   T O   D O :   i f   t h i s   i s   a   c o n c e r n ,   s w i t c h   t o   n o n - r e c u r s i v e   i m p l e m e n t a t i o n   t h a t   s t o r e s   u n s o r t e d   r a n g e s   i n   i t s   o w n   s t a c k   s t r u c t u r e��  � � � sort mostly uses quicksort, but falls through to insertionsort when sorting small number of items (<8), or when sorting a mostly-sorted list, or when quicksort recursion exceeds AS's stack depth   � ����   s o r t   m o s t l y   u s e s   q u i c k s o r t ,   b u t   f a l l s   t h r o u g h   t o   i n s e r t i o n s o r t   w h e n   s o r t i n g   s m a l l   n u m b e r   o f   i t e m s   ( < 8 ) ,   o r   w h e n   s o r t i n g   a   m o s t l y - s o r t e d   l i s t ,   o r   w h e n   q u i c k s o r t   r e c u r s i o n   e x c e e d s   A S ' s   s t a c k   d e p t h��  ��  � ��� l uu������  � � � fall-through to use loop-based insertion sort when sorting a small number of items (for which it is faster than quicksort), or when quicksort recursion overflows AppleScript's call stack   � ���v   f a l l - t h r o u g h   t o   u s e   l o o p - b a s e d   i n s e r t i o n   s o r t   w h e n   s o r t i n g   a   s m a l l   n u m b e r   o f   i t e m s   ( f o r   w h i c h   i t   i s   f a s t e r   t h a n   q u i c k s o r t ) ,   o r   w h e n   q u i c k s o r t   r e c u r s i o n   o v e r f l o w s   A p p l e S c r i p t ' s   c a l l   s t a c k� ��� r  uz��� [  ux��� o  uv���� 0 	fromindex 	fromIndex� m  vw���� � o      ���� 0 	fromindex 	fromIndex� ���� Y  {�������� Y  �������� k  ��� ��� r  ����� J  ���� ��� e  ���� n  ����� 4  �����
�� 
cobj� l �������� \  ����� o  ������ 0 j  � m  ������ ��  ��  � n ����� o  ������ 
0 _keys_  � o  ������ $0 resultlistobject resultListObject� ���� e  ���� n  ����� 4  ���� 
�� 
cobj  o  ������ 0 j  � n �� o  ������ 
0 _keys_   o  ������ $0 resultlistobject resultListObject��  � J        o      ���� 0 leftkey leftKey �� o      ���� 0 rightkey rightKey��  �  l ��	
	 Z ������ A  �� n �� I  �������� 0 comparekeys compareKeys  o  ������ 0 leftkey leftKey �� o  ������ 0 rightkey rightKey��  ��   o  ������  0 sortcomparator sortComparator m  ������   S  ����  ��  
 !  stop when leftKey�rightKey    � 6   s t o p   w h e n   l e f t K e y"d r i g h t K e y  r  �� J  ��  o  ������ 0 rightkey rightKey �� o  ������ 0 leftkey leftKey��   J        !  n      "#" 4  ����$
�� 
cobj$ l ��%����% \  ��&'& o  ������ 0 j  ' m  ������ ��  ��  # n ��()( o  ������ 
0 _keys_  ) o  ������ $0 resultlistobject resultListObject! *��* n      +,+ 4  ����-
�� 
cobj- o  ������ 0 j  , n ��./. o  ������ 
0 _keys_  / o  ������ $0 resultlistobject resultListObject��   0��0 r  �121 J  ��33 454 e  ��66 n  ��787 4  ����9
�� 
cobj9 o  ������ 0 j  8 n ��:;: o  ������ 
0 _list_  ; o  ������ $0 resultlistobject resultListObject5 <��< e  ��== n  ��>?> 4  ����@
�� 
cobj@ l ��A����A \  ��BCB o  ������ 0 j  C m  ������ ��  ��  ? n ��DED o  ������ 
0 _list_  E o  ������ $0 resultlistobject resultListObject��  2 J      FF GHG n      IJI 4  ���K
�� 
cobjK l �L����L \  �MNM o  ������ 0 j  N m  � ���� ��  ��  J n ��OPO o  ������ 
0 _list_  P o  ������ $0 resultlistobject resultListObjectH Q��Q n      RSR 4  ��T
�� 
cobjT o  ���� 0 j  S n UVU o  	���� 
0 _list_  V o  	���� $0 resultlistobject resultListObject��  ��  �� 0 j  � o  ������ 0 i  � o  ������ 0 	fromindex 	fromIndex� m  ���������� 0 i  � o  ~���� 0 	fromindex 	fromIndex� o  ����� 0 toindex toIndex��  ��  � 1 + performs in-place quicksort/insertionsort	   � �WW V   p e r f o r m s   i n - p l a c e   q u i c k s o r t / i n s e r t i o n s o r t 	� XYX l     ��������  ��  ��  Y Z[Z l     �������  ��  �  [ \]\ l     �~�}�|�~  �}  �|  ] ^_^ i  @ C`a` I     �{bc
�{ .Lst:Sortnull���     ****b o      �z�z 0 thelist theListc �yd�x
�y 
Compd |�w�ve�uf�w  �v  e o      �t�t $0 comparatorobject comparatorObject�u  f m      �s
�s 
msng�x  a k    �gg hih l     �rjk�r  j.( note that `sort list` currently doesn't implement a `reversed order` parameter as its quicksort algorithm isn't stable (i.e. items that compare as equal will appear in any order, not the order in which they were supplied), so such an option would be useless in practice and rather misleading too. (To get a list in descending order, just get the returned list's `reverse` property or else pass a comparator containing a suitable compareKeys handler.) This parameter can always be added in future if/when a stable sorting algorithm is ever implemented.   k �llP   n o t e   t h a t   ` s o r t   l i s t `   c u r r e n t l y   d o e s n ' t   i m p l e m e n t   a   ` r e v e r s e d   o r d e r `   p a r a m e t e r   a s   i t s   q u i c k s o r t   a l g o r i t h m   i s n ' t   s t a b l e   ( i . e .   i t e m s   t h a t   c o m p a r e   a s   e q u a l   w i l l   a p p e a r   i n   a n y   o r d e r ,   n o t   t h e   o r d e r   i n   w h i c h   t h e y   w e r e   s u p p l i e d ) ,   s o   s u c h   a n   o p t i o n   w o u l d   b e   u s e l e s s   i n   p r a c t i c e   a n d   r a t h e r   m i s l e a d i n g   t o o .   ( T o   g e t   a   l i s t   i n   d e s c e n d i n g   o r d e r ,   j u s t   g e t   t h e   r e t u r n e d   l i s t ' s   ` r e v e r s e `   p r o p e r t y   o r   e l s e   p a s s   a   c o m p a r a t o r   c o n t a i n i n g   a   s u i t a b l e   c o m p a r e K e y s   h a n d l e r . )   T h i s   p a r a m e t e r   c a n   a l w a y s   b e   a d d e d   i n   f u t u r e   i f / w h e n   a   s t a b l e   s o r t i n g   a l g o r i t h m   i s   e v e r   i m p l e m e n t e d .i m�qm Q    �nopn k   �qq rsr r    tut n   vwv I    �px�o�p "0 aslistparameter asListParameterx yzy o    	�n�n 0 thelist theListz {�m{ m   	 
|| �}}  �m  �o  w o    �l�l 0 _support  u o      �k�k 0 thelist theLists ~~ h    �j��j $0 resultlistobject resultListObject� k      �� ��� j     	�i��i 
0 _keys_  � n     ��� 2   �h
�h 
cobj� o     �g�g 0 thelist theList� ��f� j   
 �e��e 
0 _list_  � n   
 ��� 2   �d
�d 
cobj� o   
 �c�c 0 thelist theList�f   ��� Z   ,���b�a� A     ��� n   ��� 1    �`
�` 
leng� n   ��� o    �_�_ 
0 _list_  � o    �^�^ $0 resultlistobject resultListObject� m    �]�] � L   # (�� n  # '��� o   $ &�\�\ 
0 _list_  � o   # $�[�[ $0 resultlistobject resultListObject�b  �a  � ��� Z   - J���Z�� =  - 0��� o   - .�Y�Y $0 comparatorobject comparatorObject� m   . /�X
�X 
msng� r   3 :��� I  3 8�W�V�U
�W .Lst:DeSonull��� ��� null�V  �U  � o      �T�T  0 sortcomparator sortComparator�Z  � r   = J��� n  = H��� I   B H�S��R�S &0 asscriptparameter asScriptParameter� ��� o   B C�Q�Q $0 comparatorobject comparatorObject� ��P� m   C D�� ��� 
 u s i n g�P  �R  � o   = B�O�O 0 _support  � o      �N�N  0 sortcomparator sortComparator� ��� l  K K�M���M  ��� note: the quickest way to check types is (count {resultListObject's _list_} each number/text/date) = length of resultListObject's _list_; could also accept number/text/date in `using` and create default comparator according to that; OTOH, a benefit of this extra O(n) pass is that we can check if list is already sorted or almost sorted and return immediately or use insertionsort instead of quicksort if it is   � ���6   n o t e :   t h e   q u i c k e s t   w a y   t o   c h e c k   t y p e s   i s   ( c o u n t   { r e s u l t L i s t O b j e c t ' s   _ l i s t _ }   e a c h   n u m b e r / t e x t / d a t e )   =   l e n g t h   o f   r e s u l t L i s t O b j e c t ' s   _ l i s t _ ;   c o u l d   a l s o   a c c e p t   n u m b e r / t e x t / d a t e   i n   ` u s i n g `   a n d   c r e a t e   d e f a u l t   c o m p a r a t o r   a c c o r d i n g   t o   t h a t ;   O T O H ,   a   b e n e f i t   o f   t h i s   e x t r a   O ( n )   p a s s   i s   t h a t   w e   c a n   c h e c k   i f   l i s t   i s   a l r e a d y   s o r t e d   o r   a l m o s t   s o r t e d   a n d   r e t u r n   i m m e d i a t e l y   o r   u s e   i n s e r t i o n s o r t   i n s t e a d   o f   q u i c k s o r t   i f   i t   i s� ��� l  K K�L���L  � TO DO: if makeKey not specified, throw error if all items are not same type (number/text/date); this'll prevent unpredictable results due to mixed types (e.g. {11,"2"} vs {"11", 2}), forcing users to pass an appropriate comparator if they want to sort mixed lists   � ���   T O   D O :   i f   m a k e K e y   n o t   s p e c i f i e d ,   t h r o w   e r r o r   i f   a l l   i t e m s   a r e   n o t   s a m e   t y p e   ( n u m b e r / t e x t / d a t e ) ;   t h i s ' l l   p r e v e n t   u n p r e d i c t a b l e   r e s u l t s   d u e   t o   m i x e d   t y p e s   ( e . g .   { 1 1 , " 2 " }   v s   { " 1 1 " ,   2 } ) ,   f o r c i n g   u s e r s   t o   p a s s   a n   a p p r o p r i a t e   c o m p a r a t o r   i f   t h e y   w a n t   t o   s o r t   m i x e d   l i s t s� ��� Z   K p���K�� F   K `��� >  K N��� o   K L�J�J $0 comparatorobject comparatorObject� m   L M�I
�I 
msng� n  Q ^��� I   V ^�H��G�H 0 
hashandler 
hasHandler� ��F� N   V Z�� n   V Y��� o   W Y�E�E 0 makekey makeKey� o   V W�D�D  0 sortcomparator sortComparator�F  �G  � o   Q V�C�C 0 _support  � l  c f���� r   c f��� o   c d�B�B  0 sortcomparator sortComparator� o      �A�A 0 keymaker keyMaker� M G call comparator's makeKey method to generate each sortable key in turn   � ��� �   c a l l   c o m p a r a t o r ' s   m a k e K e y   m e t h o d   t o   g e n e r a t e   e a c h   s o r t a b l e   k e y   i n   t u r n�K  � r   i p��� I  i n�@�?�>
�@ .Lst:DeSonull��� ��� null�?  �>  � o      �=�= 0 keymaker keyMaker� ��� l  q ����� r   q ���� J   q u�� ��� m   q r�<�<  � ��;� m   r s�:�:  �;  � J      �� ��� o      �9�9  0 ascendingcount ascendingCount� ��8� o      �7�7 "0 descendingcount descendingCount�8  � � � while generating keys also check if list is already almost/fully sorted (either ascending or descending) and if it is use insertionsort/return as-is   � ���*   w h i l e   g e n e r a t i n g   k e y s   a l s o   c h e c k   i f   l i s t   i s   a l r e a d y   a l m o s t / f u l l y   s o r t e d   ( e i t h e r   a s c e n d i n g   o r   d e s c e n d i n g )   a n d   i f   i t   i s   u s e   i n s e r t i o n s o r t / r e t u r n   a s - i s� ��� Q   �b���� k   �H�� ��� Q   � ����� r   � ���� n  � ���� I   � ��6��5�6 0 makekey makeKey� ��4� e   � ��� n   � ���� 4   � ��3�
�3 
cobj� m   � ��2�2 � n  � ���� o   � ��1�1 
0 _keys_  � o   � ��0�0 $0 resultlistobject resultListObject�4  �5  � o   � ��/�/  0 sortcomparator sortComparator� o      �.�. 0 previouskey previousKey� R      �-��
�- .ascrerr ****      � ****� o      �,�, 0 etext eText� �+��
�+ 
errn� o      �*�* 0 enum eNum� �)��(
�) 
errt� o      �'�' 
0 eto eTo�(  � R   � ��&��
�& .ascrerr ****      � ****� b   � ���� m   � ��� ��� : C o u l d n ' t   m a k e K e y   f o r   i t e m   1 :  � o   � ��%�% 0 etext eText� �$�	 
�$ 
errn� o   � ��#�# 0 enum eNum	  �"		
�" 
erob	 l  � �	�!� 	 N   � �		 n   � �			 4   � ��	
� 
cobj	 m   � ��� 	 l  � �	��	 e   � �				 n  � �	
		
 o   � ��� 
0 _list_  	 o   � ��� $0 resultlistobject resultListObject�  �  �!  �   	 �	�
� 
errt	 o   � ��� 
0 eto eTo�  � 			 r   � �			 o   � ��� 0 previouskey previousKey	 n      			 4   � ��	
� 
cobj	 m   � ��� 	 n  � �			 o   � ��� 
0 _keys_  	 o   � ��� $0 resultlistobject resultListObject	 	�	 Y   �H	�		�	 l  �C				 k   �C		 			 Q   �	 	!	"	  r   � �	#	$	# n  � �	%	&	% I   � ��	'�� 0 makekey makeKey	' 	(�	( n   � �	)	*	) 4   � ��	+
� 
cobj	+ o   � ��
�
 0 i  	* n  � �	,	-	, o   � ��	�	 
0 _keys_  	- o   � ��� $0 resultlistobject resultListObject�  �  	& o   � ���  0 sortcomparator sortComparator	$ o      �� 0 
currentkey 
currentKey	! R      �	.	/
� .ascrerr ****      � ****	. o      �� 0 etext eText	/ �	0	1
� 
errn	0 o      �� 0 enum eNum	1 �	2� 
� 
errt	2 o      ���� 
0 eto eTo�   	" R   ���	3	4
�� .ascrerr ****      � ****	3 b  	5	6	5 b  	7	8	7 b  	9	:	9 m  		;	; �	<	< 4 C o u l d n ' t   m a k e K e y   f o r   i t e m  	: o  	
���� 0 i  	8 m  	=	= �	>	>  :  	6 o  ���� 0 etext eText	4 ��	?	@
�� 
errn	? o   � ����� 0 enum eNum	@ ��	A	B
�� 
erob	A l  � �	C����	C N   � �	D	D n   � �	E	F	E 4   � ���	G
�� 
cobj	G o   � ����� 0 i  	F l  � �	H����	H e   � �	I	I n  � �	J	K	J o   � ����� 
0 _list_  	K o   � ����� $0 resultlistobject resultListObject��  ��  ��  ��  	B ��	L��
�� 
errt	L o  ���� 
0 eto eTo��  	 	M	N	M r  	O	P	O o  ���� 0 
currentkey 
currentKey	P n      	Q	R	Q 4  ��	S
�� 
cobj	S o  ���� 0 i  	R n 	T	U	T o  ���� 
0 _keys_  	U o  ���� $0 resultlistobject resultListObject	N 	V	W	V r  %	X	Y	X n #	Z	[	Z I  #��	\���� 0 comparekeys compareKeys	\ 	]	^	] o  ���� 0 previouskey previousKey	^ 	_��	_ o  ���� 0 
currentkey 
currentKey��  ��  	[ o  ����  0 sortcomparator sortComparator	Y o      ���� 0 keycomparison keyComparison	W 	`��	` Z  &C	a	b	c��	a A  &)	d	e	d o  &'���� 0 keycomparison keyComparison	e m  '(����  	b l ,1	f	g	h	f r  ,1	i	j	i [  ,/	k	l	k o  ,-����  0 ascendingcount ascendingCount	l m  -.���� 	j o      ����  0 ascendingcount ascendingCount	g   current key is larger   	h �	m	m ,   c u r r e n t   k e y   i s   l a r g e r	c 	n	o	n ?  47	p	q	p o  45���� 0 keycomparison keyComparison	q m  56����  	o 	r��	r l :?	s	t	u	s r  :?	v	w	v [  :=	x	y	x o  :;���� "0 descendingcount descendingCount	y m  ;<���� 	w o      ���� "0 descendingcount descendingCount	t   previous key is larger   	u �	z	z .   p r e v i o u s   k e y   i s   l a r g e r��  ��  ��  	 @ : TO DO: once again, need to know index for error reporting   	 �	{	{ t   T O   D O :   o n c e   a g a i n ,   n e e d   t o   k n o w   i n d e x   f o r   e r r o r   r e p o r t i n g� 0 i  	 m   � ����� 	 n  � �	|	}	| 1   � ���
�� 
leng	} n  � �	~		~ o   � ����� 
0 _keys_  	 o   � ����� $0 resultlistobject resultListObject�  �  � R      ��	�	�
�� .ascrerr ****      � ****	� o      ���� 0 etext eText	� ��	�	�
�� 
errn	� o      ���� 0 enum eNum	� ��	�	�
�� 
erob	� o      ���� 0 efrom eFrom	� ��	���
�� 
errt	� o      ���� 
0 eto eTo��  � R  Pb��	�	�
�� .ascrerr ****      � ****	� o  `a���� 0 etext eText	� ��	�	�
�� 
errn	� o  TU���� 0 enum eNum	� ��	�	�
�� 
erob	� o  XY���� 0 efrom eFrom	� ��	���
�� 
errt	� o  \]���� 
0 eto eTo��  � 	�	�	� l cc��	�	���  	� � �	log "   ORDEREDNESS=" & (ascendingCount * 100 div (resultListObject's _list_'s length)) & " " & (descendingCount * 100 div (resultListObject's _list_'s length))   	� �	�	�B 	 l o g   "       O R D E R E D N E S S = "   &   ( a s c e n d i n g C o u n t   *   1 0 0   d i v   ( r e s u l t L i s t O b j e c t ' s   _ l i s t _ ' s   l e n g t h ) )   &   "   "   &   ( d e s c e n d i n g C o u n t   *   1 0 0   d i v   ( r e s u l t L i s t O b j e c t ' s   _ l i s t _ ' s   l e n g t h ) )	� 	�	�	� l cc��	�	���  	� � � TO DO: if list is almost or fully ordered then tell _sort() to use insertionsort or return as-is (remembering to reverse order as necessary), as that will be quicker than quicksorting the whole thing   	� �	�	��   T O   D O :   i f   l i s t   i s   a l m o s t   o r   f u l l y   o r d e r e d   t h e n   t e l l   _ s o r t ( )   t o   u s e   i n s e r t i o n s o r t   o r   r e t u r n   a s - i s   ( r e m e m b e r i n g   t o   r e v e r s e   o r d e r   a s   n e c e s s a r y ) ,   a s   t h a t   w i l l   b e   q u i c k e r   t h a n   q u i c k s o r t i n g   t h e   w h o l e   t h i n g	� 	�	�	� l cc��	�	���  	� TO DO: what about lists containing lots of duplicates, e.g. when sorting a large list containing only numbers from 0 to 10, or only true/false (basic quicksort gets pathological on those cases, so a three-way quicksort or a mergesort would work much better there)   	� �	�	�   T O   D O :   w h a t   a b o u t   l i s t s   c o n t a i n i n g   l o t s   o f   d u p l i c a t e s ,   e . g .   w h e n   s o r t i n g   a   l a r g e   l i s t   c o n t a i n i n g   o n l y   n u m b e r s   f r o m   0   t o   1 0 ,   o r   o n l y   t r u e / f a l s e   ( b a s i c   q u i c k s o r t   g e t s   p a t h o l o g i c a l   o n   t h o s e   c a s e s ,   s o   a   t h r e e - w a y   q u i c k s o r t   o r   a   m e r g e s o r t   w o u l d   w o r k   m u c h   b e t t e r   t h e r e )	� 	�	�	� l cp	�	�	�	� r  cp	�	�	� l cn	�����	� ?  cn	�	�	� n ch	�	�	� 1  fh��
�� 
leng	� n cf	�	�	� o  df���� 
0 _list_  	� o  cd���� $0 resultlistobject resultListObject	� o  hm���� *0 _quicksortthreshold _quicksortThreshold��  ��  	� o      ���� 0 usequicksort useQuickSort	� "  TO DO: or is nearly ordered   	� �	�	� 8   T O   D O :   o r   i s   n e a r l y   o r d e r e d	� 	�	�	� I  q���	����� 	0 _sort  	� 	�	�	� o  rs���� $0 resultlistobject resultListObject	� 	�	�	� m  st���� 	� 	�	�	� n ty	�	�	� 1  wy��
�� 
leng	� n tw	�	�	� o  uw���� 
0 _list_  	� o  tu���� $0 resultlistobject resultListObject	� 	�	�	� o  yz����  0 sortcomparator sortComparator	� 	���	� o  z{���� 0 usequicksort useQuickSort��  ��  	� 	���	� L  ��	�	� n ��	�	�	� o  ������ 
0 _list_  	� o  ������ $0 resultlistobject resultListObject��  o R      ��	�	�
�� .ascrerr ****      � ****	� o      ���� 0 etext eText	� ��	�	�
�� 
errn	� o      ���� 0 enumber eNumber	� ��	�	�
�� 
erob	� o      ���� 0 efrom eFrom	� ��	���
�� 
errt	� o      ���� 
0 eto eTo��  p I  ����	����� 
0 _error  	� 	�	�	� m  ��	�	� �	�	�  s o r t   l i s t	� 	�	�	� o  ������ 0 etext eText	� 	�	�	� o  ������ 0 enumber eNumber	� 	�	�	� o  ������ 0 efrom eFrom	� 	���	� o  ������ 
0 eto eTo��  ��  �q  _ 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� i  D G	�	�	� I     ������
�� .Lst:DeSonull��� ��� null��  ��  	� h     ��	��� &0 defaultcomparator DefaultComparator	� k      	�	� 	�	�	� j     ��	��� "0 _supportedtypes _supportedTypes	� J     	�	� 	�	�	� m     ��
�� 
nmbr	� 	�	�	� m    ��
�� 
ctxt	� 	���	� m    ��
�� 
ldt ��  	� 	�	�	� j    	��	��� 	0 _type  	� m    ��
�� 
msng	� 	�	�	� i   
 	�	�	� I      ��	����� 0 makekey makeKey	� 	���	� o      ���� 0 anobject anObject��  ��  	� k     }	�	� 	�	�	� Z     z	�	�	���	� =    	�	�	� o     ���� 	0 _type  	� m    ��
�� 
msng	� k   
 K	�	� 	�	�	� X   
 B	��	�	� Z    =	�	��~�}	� ?    *	�	�	� l   (
 �|�{
  I   (�z


�z .corecnte****       ****
 J    

 
�y
 o    �x�x 0 anobject anObject�y  
 �w
�v
�w 
kocl
 l    $
�u�t
 e     $

 n    $

	
 1   ! #�s
�s 
pcnt
	 o     !�r�r 0 aref aRef�u  �t  �v  �|  �{  	� m   ( )�q�q  	� k   - 9



 


 r   - 6


 n  - 0


 1   . 0�p
�p 
pcnt
 o   - .�o�o 0 aref aRef
 o      �n�n 	0 _type  
 
�m
 L   7 9

 o   7 8�l�l 0 anobject anObject�m  �~  �}  � 0 aref aRef	� n   


 o    �k�k "0 _supportedtypes _supportedTypes
  f    	� 
�j
 R   C K�i


�i .ascrerr ****      � ****
 m   I J

 �

 � I n v a l i d   i t e m   t y p e   ( d e f a u l t   c o m p a r a t o r   c a n   o n l y   c o m p a r e   i n t e g e r / r e a l ,   t e x t ,   o r   d a t e   t y p e s ) .
 �h


�h 
errn
 m   E F�g�g�\
 �f
�e
�f 
erob
 o   G H�d�d 0 anobject anObject�e  �j  	� 


 =   N ]

 
 l  N [
!�c�b
! I  N [�a
"
#
�a .corecnte****       ****
" J   N Q
$
$ 
%�`
% o   N O�_�_ 0 anobject anObject�`  
# �^
&�]
�^ 
kocl
& o   R W�\�\ 	0 _type  �]  �c  �b  
  m   [ \�[�[  
 
'�Z
' R   ` v�Y
(
)
�Y .ascrerr ****      � ****
( b   f u
*
+
* b   f s
,
-
, b   f o
.
/
. b   f m
0
1
0 m   f g
2
2 �
3
3 ^ I n v a l i d   i t e m   t y p e   ( d e f a u l t   c o m p a r a t o r   e x p e c t e d  
1 o   g l�X�X 	0 _type  
/ m   m n
4
4 �
5
5    b u t   r e c e i v e d  
- l  o r
6�W�V
6 n   o r
7
8
7 m   p r�U
�U 
pcls
8 o   o p�T�T 0 anobject anObject�W  �V  
+ m   s t
9
9 �
:
:  ) .
) �S
;
<
�S 
errn
; m   b c�R�R�\
< �Q
=�P
�Q 
erob
= o   d e�O�O 0 anobject anObject�P  �Z  ��  	� 
>�N
> L   { }
?
? o   { |�M�M 0 anobject anObject�N  	� 
@�L
@ i   
A
B
A I      �K
C�J�K 0 comparekeys compareKeys
C 
D
E
D o      �I�I 0 
leftobject 
leftObject
E 
F�H
F o      �G�G 0 rightobject rightObject�H  �J  
B Z     
G
H
I
J
G A     
K
L
K o     �F�F 0 
leftobject 
leftObject
L o    �E�E 0 rightobject rightObject
H L    
M
M m    �D�D��
I 
N
O
N ?    
P
Q
P o    �C�C 0 
leftobject 
leftObject
Q o    �B�B 0 rightobject rightObject
O 
R�A
R L    
S
S m    �@�@ �A  
J L    
T
T m    �?�?  �L  	� 
U
V
U l     �>�=�<�>  �=  �<  
V 
W
X
W l     �;�:�9�;  �:  �9  
X 
Y
Z
Y i  H K
[
\
[ I     �8�7�6
�8 .Lst:NuSonull��� ��� null�7  �6  
\ h     �5
]�5 &0 numericcomparator NumericComparator
] k      
^
^ 
_
`
_ i    
a
b
a I      �4
c�3�4 0 makekey makeKey
c 
d�2
d o      �1�1 0 anobject anObject�2  �3  
b L     
e
e c     
f
g
f o     �0�0 0 anobject anObject
g m    �/
�/ 
nmbr
` 
h�.
h i   
i
j
i I      �-
k�,�- 0 comparekeys compareKeys
k 
l
m
l o      �+�+ 0 
leftobject 
leftObject
m 
n�*
n o      �)�) 0 rightobject rightObject�*  �,  
j l    
o
p
q
o L     
r
r \     
s
t
s o     �(�( 0 
leftobject 
leftObject
t o    �'�' 0 rightobject rightObject
p�� note: since compareKeys' return value can be any -ve/0/+ve number, a single subtraction operation is sufficient for numbers and dates. (Caveat: this doesn't take into account minor differences due to real imprecision. Currently this doesn't matter as quicksort isn't stable anyway so makes no guarantees about the order of [imprecisely] equal items; however, if quicksort ever gets replaced with a stable sorting algorithm then this method will need revised to use Number library's `cmp` instead.)   
q �
u
u�   n o t e :   s i n c e   c o m p a r e K e y s '   r e t u r n   v a l u e   c a n   b e   a n y   - v e / 0 / + v e   n u m b e r ,   a   s i n g l e   s u b t r a c t i o n   o p e r a t i o n   i s   s u f f i c i e n t   f o r   n u m b e r s   a n d   d a t e s .   ( C a v e a t :   t h i s   d o e s n ' t   t a k e   i n t o   a c c o u n t   m i n o r   d i f f e r e n c e s   d u e   t o   r e a l   i m p r e c i s i o n .   C u r r e n t l y   t h i s   d o e s n ' t   m a t t e r   a s   q u i c k s o r t   i s n ' t   s t a b l e   a n y w a y   s o   m a k e s   n o   g u a r a n t e e s   a b o u t   t h e   o r d e r   o f   [ i m p r e c i s e l y ]   e q u a l   i t e m s ;   h o w e v e r ,   i f   q u i c k s o r t   e v e r   g e t s   r e p l a c e d   w i t h   a   s t a b l e   s o r t i n g   a l g o r i t h m   t h e n   t h i s   m e t h o d   w i l l   n e e d   r e v i s e d   t o   u s e   N u m b e r   l i b r a r y ' s   ` c m p `   i n s t e a d . )�.  
Z 
v
w
v l     �&�%�$�&  �%  �$  
w 
x
y
x l     �#�"�!�#  �"  �!  
y 
z
{
z i  L O
|
}
| I     � ��
�  .Lst:DaSonull��� ��� null�  �  
} h     �
~�  0 datecomparator DateComparator
~ k      

 
�
�
� i    
�
�
� I      �
��� 0 makekey makeKey
� 
��
� o      �� 0 anobject anObject�  �  
� l    
�
�
�
� L     
�
� c     
�
�
� o     �� 0 anobject anObject
� m    �
� 
ldt 
��� TO DO: if coercion fails, try `date anObject` on offchance it's a text value? Am inclined not to, as that's locale dependent so will produce different results on different machines for same input (while text-to-number coercions are also a bit locale-sensitive, those coercions will simply fail whereas `date "05-05-05"` could produce multiple different values or errors). Safest approach is for user to supply her own comparator implementation that implements her exact requirements, rather than trying to second-guess what those requirements are (which has a tendency to create fresh problems faster than it solves them, as AppleScript frequently demonstrates).   
� �
�
�.   T O   D O :   i f   c o e r c i o n   f a i l s ,   t r y   ` d a t e   a n O b j e c t `   o n   o f f c h a n c e   i t ' s   a   t e x t   v a l u e ?   A m   i n c l i n e d   n o t   t o ,   a s   t h a t ' s   l o c a l e   d e p e n d e n t   s o   w i l l   p r o d u c e   d i f f e r e n t   r e s u l t s   o n   d i f f e r e n t   m a c h i n e s   f o r   s a m e   i n p u t   ( w h i l e   t e x t - t o - n u m b e r   c o e r c i o n s   a r e   a l s o   a   b i t   l o c a l e - s e n s i t i v e ,   t h o s e   c o e r c i o n s   w i l l   s i m p l y   f a i l   w h e r e a s   ` d a t e   " 0 5 - 0 5 - 0 5 " `   c o u l d   p r o d u c e   m u l t i p l e   d i f f e r e n t   v a l u e s   o r   e r r o r s ) .   S a f e s t   a p p r o a c h   i s   f o r   u s e r   t o   s u p p l y   h e r   o w n   c o m p a r a t o r   i m p l e m e n t a t i o n   t h a t   i m p l e m e n t s   h e r   e x a c t   r e q u i r e m e n t s ,   r a t h e r   t h a n   t r y i n g   t o   s e c o n d - g u e s s   w h a t   t h o s e   r e q u i r e m e n t s   a r e   ( w h i c h   h a s   a   t e n d e n c y   t o   c r e a t e   f r e s h   p r o b l e m s   f a s t e r   t h a n   i t   s o l v e s   t h e m ,   a s   A p p l e S c r i p t   f r e q u e n t l y   d e m o n s t r a t e s ) .
� 
��
� i   
�
�
� I      �
��� 0 comparekeys compareKeys
� 
�
�
� o      �� 0 
leftobject 
leftObject
� 
��
� o      �� 0 rightobject rightObject�  �  
� l    
�
�
�
� L     
�
� \     
�
�
� o     �� 0 
leftobject 
leftObject
� o    �� 0 rightobject rightObject
� Y S as in NumericComparator, a simple subtraction operation produces a suitable result   
� �
�
� �   a s   i n   N u m e r i c C o m p a r a t o r ,   a   s i m p l e   s u b t r a c t i o n   o p e r a t i o n   p r o d u c e s   a   s u i t a b l e   r e s u l t�  
{ 
�
�
� l     ����  �  �  
� 
�
�
� l     ��
�	�  �
  �	  
� 
�
�
� i  P S
�
�
� I     ��
�
� .Lst:TeSonull��� ��� null�  
� �
��
� 
Cons
� |��
��
��  �  
� o      ��  0 orderingoption orderingOption�  
� m      � 
�  SrtECmpI�  
� l    b
�
�
�
� Q     b
�
�
�
� k    L
�
� 
�
�
� h    
��
��� B0 currentconsiderationscomparator CurrentConsiderationsComparator
� k      
�
� 
�
�
� i    
�
�
� I      ��
����� 0 makekey makeKey
� 
���
� o      ���� 0 anobject anObject��  ��  
� l    
�
�
�
� L     
�
� c     
�
�
� o     ���� 0 anobject anObject
� m    ��
�� 
ctxt
� _ Y TO DO: what if item is a list [of text]? currently it coerces to text using current TIDs   
� �
�
� �   T O   D O :   w h a t   i f   i t e m   i s   a   l i s t   [ o f   t e x t ] ?   c u r r e n t l y   i t   c o e r c e s   t o   t e x t   u s i n g   c u r r e n t   T I D s
� 
���
� i   
�
�
� I      ��
����� 0 comparekeys compareKeys
� 
�
�
� o      ���� 0 
leftobject 
leftObject
� 
���
� o      ���� 0 rightobject rightObject��  ��  
� Z     
�
�
�
�
� A     
�
�
� o     ���� 0 
leftobject 
leftObject
� o    ���� 0 rightobject rightObject
� L    
�
� m    ������
� 
�
�
� ?    
�
�
� o    ���� 0 
leftobject 
leftObject
� o    ���� 0 rightobject rightObject
� 
���
� L    
�
� m    ���� ��  
� L    
�
� m    ����  ��  
� 
���
� Z    L
�
�
�
�
� =   
�
�
� o    ����  0 orderingoption orderingOption
� m    ��
�� SrtECmpI
� k    
�
� 
�
�
� h    ��
��� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator
� k      
�
� 
�
�
� j     ��
�
�� 
pare
� o     ���� B0 currentconsiderationscomparator CurrentConsiderationsComparator
� 
���
� i  	 
�
�
� I      ��
����� 0 comparekeys compareKeys
� 
�
�
� o      ���� 0 
leftobject 
leftObject
� 
���
� o      ���� 0 rightobject rightObject��  ��  
� P     
�
�
�
� L    
�
� M    
�
� I      ��
����� 0 comparekeys compareKeys
� 
�
�
� o    ���� 0 
leftobject 
leftObject
� 
���
� o    ���� 0 rightobject rightObject��  ��  
� ��
�
�� conshyph
� ��
�
�� conspunc
� ��
�
�� conswhit
� ����
�� consnume��  
� ��
�
�� conscase
� ����
�� consdiac��  ��  
� 
���
� L    
�
� o    ���� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator��  
� 
�
�
� =   !
�
�
� o    ����  0 orderingoption orderingOption
� m     ��
�� SrtECmpC
� 
�
�
� k   $ .
�
�    h   $ +���� :0 casesensitivetextcomparator CaseSensitiveTextComparator k        j     ��
�� 
pare o     ���� B0 currentconsiderationscomparator CurrentConsiderationsComparator �� i  	 	 I      ��
���� 0 comparekeys compareKeys
  o      ���� 0 
leftobject 
leftObject �� o      ���� 0 rightobject rightObject��  ��  	 P      L     M     I      ������ 0 comparekeys compareKeys  o    ���� 0 
leftobject 
leftObject �� o    ���� 0 rightobject rightObject��  ��   ��
�� conscase ��
�� conshyph ��
�� conspunc ��
�� conswhit ����
�� consnume��   ����
�� consdiac��  ��   �� L   , . o   , -���� :0 casesensitivetextcomparator CaseSensitiveTextComparator��  
�  =  1 4  o   1 2����  0 orderingoption orderingOption  m   2 3��
�� SrtECmpD !��! L   7 9"" o   7 8���� B0 currentconsiderationscomparator CurrentConsiderationsComparator��  
� R   < L��#$
�� .ascrerr ****      � ****# m   H K%% �&& d I n v a l i d    f o r    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .$ ��'(
�� 
errn' m   > ?�����Y( ��)*
�� 
erob) o   @ A����  0 orderingoption orderingOption* ��+��
�� 
errt+ m   B E��
�� 
enum��  ��  
� R      ��,-
�� .ascrerr ****      � ****, o      ���� 0 etext eText- ��./
�� 
errn. o      ���� 0 enumber eNumber/ ��01
�� 
erob0 o      ���� 0 efrom eFrom1 ��2��
�� 
errt2 o      ���� 
0 eto eTo��  
� I   T b��3���� 
0 _error  3 454 m   U X66 �77  t e x t   c o m p a r a t o r5 898 o   X Y���� 0 etext eText9 :;: o   Y Z���� 0 enumber eNumber; <=< o   Z [���� 0 efrom eFrom= >��> o   [ \���� 
0 eto eTo��  ��  
� � � TO DO: also provide `exact match` option that considers case, diacriticals, hyphens, punctuation and white space but ignores numeric strings?   
� �??   T O   D O :   a l s o   p r o v i d e   ` e x a c t   m a t c h `   o p t i o n   t h a t   c o n s i d e r s   c a s e ,   d i a c r i t i c a l s ,   h y p h e n s ,   p u n c t u a t i o n   a n d   w h i t e   s p a c e   b u t   i g n o r e s   n u m e r i c   s t r i n g s ?
� @A@ l     ��������  ��  ��  A BCB l     ��������  ��  ��  C DED l     ��������  ��  ��  E FGF i  T WHIH I     ��J��
�� .Lst:LiUSnull���     ****J o      ���� 0 thelist theList��  I Q     tKLMK k    bNN OPO h    
��Q�� $0 resultlistobject resultListObjectQ j     ��R�� 
0 _list_  R n     STS 2   ��
�� 
cobjT n    UVU I    ��W���� "0 aslistparameter asListParameterW XYX o    
���� 0 thelist theListY Z��Z m   
 [[ �\\  ��  ��  V o     ���� 0 _support  P ]^] r    _`_ n    aba 1    ��
�� 
lengb n   cdc o    ���� 
0 _list_  d o    ���� $0 resultlistobject resultListObject` o      ���� 0 len  ^ efe Y    \g��hi��g k    Wjj klk r    -mnm I   +o�po z�~�}
�~ .sysorandnmbr    ��� nmbr
�} misccura�  p �|qr
�| 
fromq m   # $�{�{ r �zs�y
�z 
to  s o   % &�x�x 0 len  �y  n o      �w�w 0 idx2  l t�vt r   . Wuvu J   . >ww xyx e   . 5zz n  . 5{|{ 4   1 4�u}
�u 
cobj} o   2 3�t�t 0 idx2  | n  . 1~~ o   / 1�s�s 
0 _list_   o   . /�r�r $0 resultlistobject resultListObjecty ��q� e   5 <�� n  5 <��� 4   8 ;�p�
�p 
cobj� o   9 :�o�o 0 idx1  � n  5 8��� o   6 8�n�n 
0 _list_  � o   5 6�m�m $0 resultlistobject resultListObject�q  v J      �� ��� n     ��� 4   F I�l�
�l 
cobj� o   G H�k�k 0 idx1  � n  C F��� o   D F�j�j 
0 _list_  � o   C D�i�i $0 resultlistobject resultListObject� ��h� n     ��� 4   R U�g�
�g 
cobj� o   S T�f�f 0 idx2  � n  O R��� o   P R�e�e 
0 _list_  � o   O P�d�d $0 resultlistobject resultListObject�h  �v  �� 0 idx1  h m    �c�c i o    �b�b 0 len  ��  f ��a� L   ] b�� n  ] a��� o   ^ `�`�` 
0 _list_  � o   ] ^�_�_ $0 resultlistobject resultListObject�a  L R      �^��
�^ .ascrerr ****      � ****� o      �]�] 0 etext eText� �\��
�\ 
errn� o      �[�[ 0 enumber eNumber� �Z��
�Z 
erob� o      �Y�Y 0 efrom eFrom� �X��W
�X 
errt� o      �V�V 
0 eto eTo�W  M I   j t�U��T�U 
0 _error  � ��� m   k l�� ���  u n s o r t   l i s t� ��� o   l m�S�S 0 etext eText� ��� o   m n�R�R 0 enumber eNumber� ��� o   n o�Q�Q 0 efrom eFrom� ��P� o   o p�O�O 
0 eto eTo�P  �T  G ��� l     �N�M�L�N  �M  �L  � ��K� l     �J�I�H�J  �I  �H  �K       �G��������������F��������G  � �E�D�C�B�A�@�?�>�=�<�;�:�9�8�7�6�5�4�3�2
�E 
pimr�D 0 _support  �C 
0 _error  �B 20 _errorwithpartialresult _errorWithPartialResult�A "0 _makelistobject _makeListObject
�@ .Lst:Instnull���     ****
�? .Lst:Delenull���     ****
�> .Lst:Findnull���     ****
�= .Lst:Trannull���     ****
�< .Lst:Map_null���     ****
�; .Lst:Filtnull���     ****
�: .Lst:Redunull���     ****�9 *0 _quicksortthreshold _quicksortThreshold�8 	0 _sort  
�7 .Lst:Sortnull���     ****
�6 .Lst:DeSonull��� ��� null
�5 .Lst:NuSonull��� ��� null
�4 .Lst:DaSonull��� ��� null
�3 .Lst:TeSonull��� ��� null
�2 .Lst:LiUSnull���     ****� �1��1 �  �� �0��/
�0 
cobj� ��   �.
�. 
osax�/  � ��   �- %
�- 
scpt� �, -�+�*���)�, 
0 _error  �+ �(��( �  �'�&�%�$�#�' 0 handlername handlerName�& 0 etext eText�% 0 enumber eNumber�$ 0 efrom eFrom�# 
0 eto eTo�*  � �"�!� ���" 0 handlername handlerName�! 0 etext eText�  0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� ���
� 
msng� � 20 _errorwithpartialresult _errorWithPartialResult�) *�������+ � � I������ 20 _errorwithpartialresult _errorWithPartialResult� ��� �  ������� 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� 0 epartial ePartial�  � ������
� 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�
 0 epartial ePartial�  [�	��
�	 
msng� � 0 rethrowerror rethrowError� b  ࠡ�����+ � � x������ "0 _makelistobject _makeListObject� ��� �  �� � 0 len  �  0 padvalue padValue�  � �������� 0 len  �� 0 padvalue padValue�� 0 
listobject 
listObject� �� ������������ 0 
listobject 
listObject� �����������
�� .ascrinit****      � ****� k     ��  �����  ��  ��  � ���� 
0 _list_  � ���� 
0 _list_  �� jv��� �� 
0 _list_  
�� 
leng
�� 
cobj� `��K S�O�j L�����v��,FO h��,�,���,��,%��,F[OY��O��,�,� ��,[�\[Zk\Z�2��,FY hY hO��,E� �� ���������
�� .Lst:Instnull���     ****�� 0 thelist theList�� �����
�� 
Valu�� 0 thevalue theValue� ����
�� 
Befo� {�������� 0 beforeindex beforeIndex��  
�� 
msng� �����
�� 
Afte� {�������� 0 
afterindex 
afterIndex��  
�� 
msng��  � 	�������������������� 0 thelist theList�� 0 thevalue theValue�� 0 beforeindex beforeIndex�� 0 
afterindex 
afterIndex�� 0 
listobject 
listObject�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� �� ������������������������>^�������������� 0 
listobject 
listObject� �����������
�� .ascrinit****      � ****� k     ��  �����  ��  ��  � ���� 
0 _list_  �  ������� "0 aslistparameter asListParameter�� 
0 _list_  �� b  b   �l+ �
�� 
msng
�� 
errn���Y�� (0 asintegerparameter asIntegerParameter�� 
0 _list_  
�� 
leng���@
�� 
erob
�� 
cobj
�� 
insl�� 
�� 
bool�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ��J5��K S�O�� [�� )��l�Y hOb  ��l+ E�O�j ��,�,�kE�Y hO���,�, )����,E��/�4�a Y hY ��� tb  �a l+ E�O�j 
�kE�Y '�j ��,�,�E�Y )����,E��/�3�a O���,�,
 	�ja & )����,E��/�3�a Y hY 
)��la O�j  �kv��,%Y 9���,�,  ��,�kv%Y $��,[�\[Zk\Z�2�kv%��,[�\[Z�k\Zi2%W X  *a ����a + � ����������
�� .Lst:Delenull���     ****�� 0 thelist theList�� �����
�� 
Inde� {�������� 0 theindex theIndex��  ������  � ���������������� 0 thelist theList�� 0 theindex theIndex�� 0 
listobject 
listObject�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ���&������������������������������� 0 
listobject 
listObject� �����������
�� .ascrinit****      � ****� k     �� ����  ��  ��  � ���� 
0 _list_  � ������ "0 aslistparameter asListParameter�� 
0 _list_  �� b  b   �l+ ��� (0 asintegerparameter asIntegerParameter�� 
0 _list_  
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
erob�� �� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � ���K S�Ob  ��l+ E�O��,�,k	 �j�& �i��,�,lv�kv ��,[�\[Zl\Zi2EY gk��,�,'lv�kv ��,�,EY M�j	 ���,�,�&
 �j	 ���,�,'�&�& %��,[�\[Zk\Z�k2��,[�\[Z�k\Zi2%Y hY "��,�,k  iklv�kv jvY hY hO)����,E�/��W X  *a ����a + � �����������
�� .Lst:Findnull���     ****�� 0 thelist theList�� �����
�� 
Valu�� 0 theitem theItem� �����
�� 
Retu� {�������� (0 findingoccurrences findingOccurrences��  
�� LFWhLFWA��  � 	������~�}�|�{�z�y�� 0 thelist theList�� 0 theitem theItem� (0 findingoccurrences findingOccurrences�~ 0 
listobject 
listObject�} 0 i  �| 0 etext eText�{ 0 enumber eNumber�z 0 efrom eFrom�y 
0 eto eTo� �x���w�v�u�t�s�r�q�p�o�n�m�l�kS�j�h�i�h�x 0 
listobject 
listObject� �g��f�e���d
�g .ascrinit****      � ****� k     �� ��� ��c�c  �f  �e  � �b�a�b 
0 _list_  �a 0 _result_  � ��`�_�^�` "0 aslistparameter asListParameter�_ 
0 _list_  �^ 0 _result_  �d b  b   �l+ �Ojv�
�w LFWhLFWA�v 
0 _list_  
�u 
leng
�t 
cobj�s 0 _result_  
�r LFWhLFWF
�q LFWhLFWL
�p 
errn�o�Y
�n 
erob
�m 
errt
�l 
enum�k �j 0 etext eText� �]�\�
�] 
errn�\ 0 enumber eNumber� �[�Z�
�[ 
erob�Z 0 efrom eFrom� �Y�X�W
�Y 
errt�X 
0 eto eTo�W  �i �h 
0 _error  �� � ���K S�O��  . (k��,�,Ekh ��,�/�  ���,6FY h[OY��Y v��  0 *k��,�,Ekh ��,�/�  ���,6FOY h[OY��Y B��  0 *��,�,Ekih ��,�/�  ���,6FOY h[OY��Y )������a O��,EW X  *a ����a + � �Vx�U�T���S
�V .Lst:Trannull���     ****�U 0 thelist theList�T �R��
�R 
Whil� {�Q�P�O�Q 0 unevenoption unevenOption�P  
�O LTrhLTrR� �N �M
�N 
PadI  {�L�K�J�L 0 padvalue padValue�K  
�J 
msng�M  � �I�H�G�F�E�D�C�B�A�@�?�>�=�<�I 0 thelist theList�H 0 unevenoption unevenOption�G 0 padvalue padValue�F 0 
listobject 
listObject�E $0 resultlistlength resultListLength�D 0 aref aRef�C (0 emptyresultsublist emptyResultSubList�B $0 resultlistobject resultListObject�A 0 i  �@ 0 j  �? 0 etext eText�> 0 enumber eNumber�= 0 efrom eFrom�< 
0 eto eTo�  �;�:�9�8�7�6�5�4��3��2�1�0�/��.�-�,�+�*�)�(�'w�&�%
�; 
kocl
�: 
list
�9 .corecnte****       ****
�8 
bool
�7 
errn�6�Y
�5 
erob�4 �3 0 
listobject 
listObject �$�#�"�!
�$ .ascrinit****      � **** k      �� �   �#  �"   �� 
0 _list_   �� 
0 _list_  �! b   ��2 
0 _list_  
�1 
cobj
�0 
leng
�/ LTrhLTrR
�. LTrhLTrP
�- LTrhLTrT
�, 
errt
�+ 
enum�* �) "0 _makelistobject _makeListObject�( $0 resultlistobject resultListObject ���	
�
� .ascrinit****      � **** k      ��  �  �  	 �� 
0 _list_  
 �� 
0 _list_  � jv��' 0 etext eText ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom ���
� 
errt� 
0 eto eTo�  �& �% 
0 _error  �S���jv  jvY hO�kv��l j 
 ���l �j �& )�����Y hO��K S�O��,�k/�,E�O��  4 .��,[��l kh ��,� )����,�a Y h[OY��Y z�a   - '��,[��l kh ��,� 
��,E�Y h[OY��Y G�a   - '��,[��l kh ��,� 
��,E�Y h[OY��Y )���a a a a O*��,�,�l+ E�Oa a K S�O k�kkh ��-E��,6F[OY��O���,6FO =k��,�,Ekh  )k��,��/�,Ekh 	��,��/��/��,��/��/F[OY��[OY��O��,EW X  *a ����a + � �����
� .Lst:Map_null���     ****� 0 thelist theList� ��
�	
� 
Usin�
 0 	thescript 	theScript�	   
��������� ��� 0 thelist theList� 0 	thescript 	theScript� $0 resultlistobject resultListObject� 0 i  � 0 etext eText� 0 enumber eNumber� 
0 eto eTo� 0 epartial ePartial�  0 
listobject 
listObject�� 0 efrom eFrom ���������������������������#������ $0 resultlistobject resultListObject ��������
�� .ascrinit****      � **** k      �����  ��  ��   ���� 
0 _list_   ��������� "0 aslistparameter asListParameter
�� 
cobj�� 
0 _list_  �� b  b   �l+ �-E��� &0 asscriptparameter asScriptParameter�� 
0 _list_  
�� 
leng
�� 
cobj�� 0 convertitem convertItem�� 0 etext eText ����
�� 
errn�� 0 enumber eNumber ������
�� 
errt�� 
0 eto eTo��  
�� 
errn
�� 
erob
�� 
errt
�� 
ptlr��  ����
�� 
errn�� 0 enumber eNumber ����
�� 
erob�� 0 efrom eFrom ����
�� 
errt�� 
0 eto eTo ������
�� 
ptlr�� 0 epartial ePartial��  �� �� 20 _errorwithpartialresult _errorWithPartialResult� � ���K S�Ob  ��l+ E�O + %k��,�,Ekh ���,�/k+ ��,�/F[OY��W CX 	 
�k ��,[�\[Zk\Z�k2E�Y jvE�O)���,E�/����a �%a %�%O��,EW X 	 *a �����a + � ��5������
�� .Lst:Filtnull���     ****�� 0 thelist theList�� ������
�� 
Usin�� 0 	thescript 	theScript��   �������������������������� 0 thelist theList�� 0 	thescript 	theScript�� $0 resultlistobject resultListObject�� 0 	lastindex 	lastIndex�� 0 i  �� 0 theitem theItem�� 0 etext eText�� 0 enumber eNumber�� 
0 eto eTo�� 0 epartial ePartial�� 0 
listobject 
listObject�� 0 efrom eFrom ��?U������������������������������� $0 resultlistobject resultListObject �� ����!"��
�� .ascrinit****      � ****  k     ## ?����  ��  ��  ! ���� 
0 _list_  " I�������� "0 aslistparameter asListParameter
�� 
cobj�� 
0 _list_  �� b  b   �l+ �-E��� &0 asscriptparameter asScriptParameter�� 
0 _list_  
�� 
leng
�� 
cobj�� 0 	checkitem 	checkItem�� 0 etext eText ����$
�� 
errn�� 0 enumber eNumber$ ������
�� 
errt�� 
0 eto eTo��  
�� 
errn
�� 
erob
�� 
errt
�� 
ptlr��  ����%
�� 
errn�� 0 enumber eNumber% ����&
�� 
erob�� 0 efrom eFrom& ����'
�� 
errt�� 
0 eto eTo' ������
�� 
ptlr�� 0 epartial ePartial��  �� �� 20 _errorwithpartialresult _errorWithPartialResult�� � ���K S�Ob  ��l+ E�OjE�O = 7k��,�,Ekh ��,�/E�O��k+  �kE�O���,�/FY h[OY��W CX 	 
�k ��,[�\[Zk\Z�k2E�Y jvE�O)���,E�/����a �%a %�%O�j  jvY hO��,[�\[Zk\Z�2EW X 	 *a �����a + � �������()��
�� .Lst:Redunull���     ****�� 0 thelist theList�� ������
�� 
Usin�� 0 	thescript 	theScript��  ( 
���������������������� 0 thelist theList�� 0 	thescript 	theScript�� 0 missingvalue missingValue�� 0 	theresult 	theResult�� 0 
listobject 
listObject�� 0 i  �� 0 etext eText�� 0 enumber eNumber�� 
0 eto eTo�� 0 efrom eFrom) ���*������������ ��������+����QS,o���� 0 
listobject 
listObject* ��-����./�
�� .ascrinit****      � ****- k     00 ��~�~  ��  ��  . �}�} 
0 _list_  / �|�{�| "0 aslistparameter asListParameter�{ 
0 _list_  � b  b   �l+ ��� 
0 _list_  
�� 
leng
�� 
errn���Y
�� 
erob�� �� &0 asscriptparameter asScriptParameter
�� 
cobj�� 0 combineitems combineItems�� 0 etext eText+ �z�y1
�z 
errn�y 0 enumber eNumber1 �x�w�v
�x 
errt�w 
0 eto eTo�v  
�� 
errt�� , �u�t2
�u 
errn�t 0 enumber eNumber2 �s�r3
�s 
erob�r 0 efrom eFrom3 �q�p�o
�q 
errt�p 
0 eto eTo�o  �� 20 _errorwithpartialresult _errorWithPartialResult�� ��E�O ���K S�O��,�,j  )���jv��Y hOb  ��l+ E�O��,�k/E�O ' !l��,�,Ekh ����,�/l+ E�[OY��W &X  )���,E�/a �a a �%a %�%O�W X  *a �����a + �F � �n��m�l45�k�n 	0 _sort  �m �j6�j 6  �i�h�g�f�e�i $0 resultlistobject resultListObject�h 0 	fromindex 	fromIndex�g 0 toindex toIndex�f  0 sortcomparator sortComparator�e 0 usequicksort useQuickSort�l  4 �d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�U�d $0 resultlistobject resultListObject�c 0 	fromindex 	fromIndex�b 0 toindex toIndex�a  0 sortcomparator sortComparator�` 0 usequicksort useQuickSort�_ 0 	leftindex 	leftIndex�^ 0 
rightindex 
rightIndex�] 0 
pivotvalue 
pivotValue�\ 0 etext eText�[ 0 enum eNum�Z 0 efrom eFrom�Y 
0 eto eTo�X 0 i  �W 0 j  �V 0 leftkey leftKey�U 0 rightkey rightKey5 �T�S�R�Q�P7�O�N�M�L>�K�J�I�H8
�T 
cobj�S 
0 _keys_  �R 0 comparekeys compareKeys
�Q 
nmbr�P 0 etext eText7 �G�F9
�G 
errn�F 0 enum eNum9 �E�D:
�E 
erob�D 0 efrom eFrom: �C�B�A
�C 
errt�B 
0 eto eTo�A  
�O 
errn
�N 
erob
�M 
errt�L �K 
0 _list_  �J �I 	0 _sort  �H  8 �@�?�>
�@ 
errn�?�n�>  �k�q��k hY hO��lvE[�k/E�Z[�l/E�ZO��,[�\[Z�\Z�2�.E�Oh�� % h���,�/E�l+ �&j�kE�[OY��W X  )���,�/�lv���%O $ h���,�/�l+ �&j�kE�[OY��W X  )���,�/�lv���%O�� p��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZO��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZO�k�klvE[�k/E�Z[�l/E�ZY h[OY�O -*������b  �+ O*������b  �+ OhW X  hY hO�kE�O ���kh  ���ih ��,�k/E��,�/ElvE[�k/E�Z[�l/E�ZO���l+ k Y hO��lvE[�k/��,�k/FZ[�l/��,�/FZO��,�/E��,�k/ElvE[�k/��,�k/FZ[�l/��,�/FZ[OY�y[OY�j� �=a�<�;;<�:
�= .Lst:Sortnull���     ****�< 0 thelist theList�; �9=�8
�9 
Comp= {�7�6�5�7 $0 comparatorobject comparatorObject�6  
�5 
msng�8  ; �4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�4 0 thelist theList�3 $0 comparatorobject comparatorObject�2 $0 resultlistobject resultListObject�1  0 sortcomparator sortComparator�0 0 keymaker keyMaker�/  0 ascendingcount ascendingCount�. "0 descendingcount descendingCount�- 0 previouskey previousKey�, 0 etext eText�+ 0 enum eNum�* 
0 eto eTo�) 0 i  �( 0 
currentkey 
currentKey�' 0 keycomparison keyComparison�& 0 efrom eFrom�% 0 usequicksort useQuickSort�$ 0 enumber eNumber<  |�#�"�>�!� ����������?�����	;	=�@��A	���# "0 aslistparameter asListParameter�" $0 resultlistobject resultListObject> �B��CD�
� .ascrinit****      � ****B k     EE �FF ��
�
  �  �  C �	��	 
0 _keys_  � 
0 _list_  D ���
� 
cobj� 
0 _keys_  � 
0 _list_  � b   �-E�Ob   �-E��! 
0 _list_  
�  
leng
� 
msng
� .Lst:DeSonull��� ��� null� &0 asscriptparameter asScriptParameter� 0 makekey makeKey� 0 
hashandler 
hasHandler
� 
bool
� 
cobj� 
0 _keys_  � 0 etext eText? ��G
� 
errn� 0 enum eNumG ��� 
� 
errt� 
0 eto eTo�   
� 
errn
� 
erob
� 
errt� � 0 comparekeys compareKeys@ ����H
�� 
errn�� 0 enum eNumH ����I
�� 
erob�� 0 efrom eFromI ������
�� 
errt�� 
0 eto eTo��  � � 	0 _sort  A ����J
�� 
errn�� 0 enumber eNumberJ ����K
�� 
erob�� 0 efrom eFromK ������
�� 
errt�� 
0 eto eTo��  � 
0 _error  �:��b  ��l+ E�O��K S�O��,�,l 
��,EY hO��  *j E�Y b  ��l+ 
E�O��	 b  ��,k+ �& �E�Y 	*j E�OjjlvE[�k/E�Z[�l/E�ZO � ���,�k/Ek+ E�W $X  )a �a ��,E�k/a �a a �%O���,�k/FO l��,�,Ekh  ���,�/k+ E�W *X  )a �a ��,E�/a �a a �%a %�%O���,�/FO���l+ E�O�j 
�kE�Y �j 
�kE�Y h[OY��W X  )a �a �a �a �O��,�,b  E�O*�k��,�,��a + O��,EW X  *a �] ��a + � ��	�����LM��
�� .Lst:DeSonull��� ��� null��  ��  L ���� &0 defaultcomparator DefaultComparatorM ��	�N�� &0 defaultcomparator DefaultComparatorN ��O����PQ��
�� .ascrinit****      � ****O k     RR 	�SS 	�TT 	�UU 
@����  ��  ��  P ���������� "0 _supportedtypes _supportedTypes�� 	0 _type  �� 0 makekey makeKey�� 0 comparekeys compareKeysQ ������������VW
�� 
nmbr
�� 
ctxt
�� 
ldt �� "0 _supportedtypes _supportedTypes
�� 
msng�� 	0 _type  V ��	�����XY���� 0 makekey makeKey�� ��Z�� Z  ���� 0 anobject anObject��  X ������ 0 anobject anObject�� 0 aref aRefY ��������������������

2
4��
9
�� 
msng�� "0 _supportedtypes _supportedTypes
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
errn���\
�� 
erob�� 
�� 
pcls�� ~b  �  F 7)�,[��l kh �kv��,El j ��,Ec  O�Y h[OY��O)�����Y .�kv�b  l j  )�����b  %�%��,%�%Y hO�W ��
B����[\���� 0 comparekeys compareKeys�� ��]�� ]  ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject��  [ ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject\  �� �� iY �� kY j�� ���mv�O�OL OL �� ��K S�� ��
\����^_��
�� .Lst:NuSonull��� ��� null��  ��  ^ ���� &0 numericcomparator NumericComparator_ ��
]`�� &0 numericcomparator NumericComparator` ��a����bc��
�� .ascrinit****      � ****a k     dd 
_ee 
h����  ��  ��  b ������ 0 makekey makeKey�� 0 comparekeys compareKeysc fgf ��
b����hi���� 0 makekey makeKey�� ��j�� j  ���� 0 anobject anObject��  h ���� 0 anobject anObjecti ��
�� 
nmbr�� ��&g ��
j����kl���� 0 comparekeys compareKeys�� ��m�� m  ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject��  k ������ 0 
leftobject 
leftObject�� 0 rightobject rightObjectl  �� ���� L  OL �� ��K S�� ��
}����no��
�� .Lst:DaSonull��� ��� null��  ��  n ����  0 datecomparator DateComparatoro ��
~p��  0 datecomparator DateComparatorp ��q����rs��
�� .ascrinit****      � ****q k     tt 
�uu 
�����  ��  ��  r ������ 0 makekey makeKey�� 0 comparekeys compareKeyss vwv ��
�����xy���� 0 makekey makeKey�� ��z�� z  ���� 0 anobject anObject��  x ���� 0 anobject anObjecty ��
�� 
ldt �� ��&w ��
�����{|���� 0 comparekeys compareKeys�� ��}�� }  ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject��  { ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject|  �� ���� L  OL �� ��K S�� ��
�����~��
�� .Lst:TeSonull��� ��� null��  �� ����
�� 
Cons� {�~�}�|�~  0 orderingoption orderingOption�}  
�| SrtECmpI�  ~ �{�z�y�x�w�v�u�t�{  0 orderingoption orderingOption�z B0 currentconsiderationscomparator CurrentConsiderationsComparator�y >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator�x :0 casesensitivetextcomparator CaseSensitiveTextComparator�w 0 etext eText�v 0 enumber eNumber�u 0 efrom eFrom�t 
0 eto eTo �s
���r�q
���p�o��n�m�l�k�j�i�h%�g�6�f�e�s B0 currentconsiderationscomparator CurrentConsiderationsComparator� �d��c�b���a
�d .ascrinit****      � ****� k     �� 
��� 
��`�`  �c  �b  � �_�^�_ 0 makekey makeKey�^ 0 comparekeys compareKeys� ��� �]
��\�[���Z�] 0 makekey makeKey�\ �Y��Y �  �X�X 0 anobject anObject�[  � �W�W 0 anobject anObject� �V
�V 
ctxt�Z ��&� �U
��T�S���R�U 0 comparekeys compareKeys�T �Q��Q �  �P�O�P 0 
leftobject 
leftObject�O 0 rightobject rightObject�S  � �N�M�N 0 
leftobject 
leftObject�M 0 rightobject rightObject�  �R �� iY �� kY j�a L  OL 
�r SrtECmpI�q >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator� �L��K�J���I
�L .ascrinit****      � ****� k     �� 
��� 
��H�H  �K  �J  � �G�F
�G 
pare�F 0 comparekeys compareKeys� �E�
�E 
pare� �D
��C�B���A�D 0 comparekeys compareKeys�C �@��@ �  �?�>�? 0 
leftobject 
leftObject�> 0 rightobject rightObject�B  � �=�<�= 0 
leftobject 
leftObject�< 0 rightobject rightObject� 
�
��;�; 0 comparekeys compareKeys�A �� )��ld*J V�I b  N  OL 
�p SrtECmpC�o :0 casesensitivetextcomparator CaseSensitiveTextComparator� �:��9�8���7
�: .ascrinit****      � ****� k     �� �� �6�6  �9  �8  � �5�4
�5 
pare�4 0 comparekeys compareKeys� �3�
�3 
pare� �2	�1�0���/�2 0 comparekeys compareKeys�1 �.��. �  �-�,�- 0 
leftobject 
leftObject�, 0 rightobject rightObject�0  � �+�*�+ 0 
leftobject 
leftObject�* 0 rightobject rightObject� �)�) 0 comparekeys compareKeys�/ �� )��ld*J V�7 b  N  OL 
�n SrtECmpD
�m 
errn�l�Y
�k 
erob
�j 
errt
�i 
enum�h �g 0 etext eText� �(�'�
�( 
errn�' 0 enumber eNumber� �&�%�
�& 
erob�% 0 efrom eFrom� �$�#�"
�$ 
errt�# 
0 eto eTo�"  �f �e 
0 _error  �� c N��K S�O��  ��K S�O�Y 0��  ��K 
S�O�Y ��  �Y )����a a a W X  *a ����a + � �!I� ����
�! .Lst:LiUSnull���     ****�  0 thelist theList�  � 	���������� 0 thelist theList� $0 resultlistobject resultListObject� 0 len  � 0 idx1  � 0 idx2  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� �Q�������������
�	� $0 resultlistobject resultListObject� �������
� .ascrinit****      � ****� k     �� Q��  �  �  � �� 
0 _list_  � [��� � "0 aslistparameter asListParameter
� 
cobj�  
0 _list_  � b  b   �l+ �-E�� 
0 _list_  
� 
leng
� misccura
� 
from
� 
to  � 
� .sysorandnmbr    ��� nmbr
� 
cobj� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �
 �	 
0 _error  � u d��K S�O��,�,E�O Hk�kh � *�k�� 	UE�O��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZ[OY��O��,EW X  *������+  ascr  ��ޭ