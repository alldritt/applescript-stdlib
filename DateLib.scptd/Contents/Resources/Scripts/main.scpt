FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� DateLib -- make, parse, and format dates and date strings

Caution:

- AppleScript's date objects are mutable(!), so any time a new date object is needed, either construct it from scratch using ASOC's `(NSDate's date...()) as date`, Standard Additions' `current date` command, or `copy _defaultDate to newDate` and work on the *copy*. NEVER use, modify, or return _defaultDate (or any other retained date object) directly, as allowing a shared mutable object to escape from this library and run loose around users' programs is a guaranteed recipe for chaos and disaster. (It's bad enough when lists and records do this, but dates don't look like mutable collections so users are even less likely to realize they contain shareable state.)

Notes:

- NSDateFormatters (like all other ASOC objects) shouldn't be retained in library (or script objects returned by it) as that breaks store script/save/autosave (caveat: if there is a significant performance difference between creating a formatter once and reusing it vs creating it each time, DateFormatterObjects could be returned as an _alternative_ to using `parse date`/`format date` handlers where user really needs the extra speed; however, documentation would need to state clearly that returned object contains ASOC data so can cause autosave, etc. to fail)

TO DO: 

- should `datetime` implement optional `with/without rollover allowed` parameter to determine if out-of-range values should be allowed to rollover or not (default: error if rollover detected) check for any out-of-range properties, as AS will silently roll over (Q. what about leap-seconds?) TBH, probably be simpler and safer to range-check year+month+hours+minutes (all those ranges are fixed, so as long as the rec's properties are anywhere within those ranges they're ok), and comparison-check the day (allowing some flexibility in the event that a leap second nudges it over to the next day), and finally check the seconds isn't obviously invalid (e.g. -1,70)

- should `convert` handlers implement optional `using [ISO8601 format/RFC822 format/AppleScript format/etc]` parameter? or just stick to ISO8601, and tell user to use FormatLib when working with other formats

- put all parsing/formatting (number, date, general) into a single 'FormatLib'?; note that formatting should accept either template text or constants for standard formats - `default` (`long datetime`? i.e. AppleScript's standard, localized representation), (also `long date`, `long time`, `short date`, �?), `ISO8601` ('YYYY-MM-DDTHH:MM:SS'; what about choice of separator? 'T' or space? maybe also have `ISO8601 date and time` so user can choose? or even take a list of constants which will appear whitespace-separated?), `ISO8601 date`, `ISO8601 time`, etc. Will also need to consider TZ handling; AS dates don't hold TZ info, so a separate optional TZ parameter would be needed for adjusting dates to local TZ when parsing/formatting

- what about timezone support? (obviously this is problematic as AS's date type and AEM's typeLongDateTime support current TZ only, but for general date manipulation tasks a script object wrapper, or (perhaps preferable from user's POV since it's transparent) a {class:date with timezone,time:...,timezone:...} record, could be defined that stores an arbitrary TZ in addition to standard date value)

- naming convention? (`datetime` vs `make datetime` vs `new date`? the former is in keeping with existing `date TEXT` specifier syntax; the latter matches naming convention used in TypesLib)

- what about adding optional `using current day/current time/OS X epoch/Unix epoch/classic Mac epoch` parameter to `datetime` for specifying default year/month/date/time (currently default values are hardcoded for OS X epoch)? also, what about optional `for first`, `for second`, etc. parameters for specifying first/second/third/fourth/fifth Monday/Tuesday/Wednesday/../Sunday in a month? 



- see also NSFormattingContext... constants in NSFormatter.h for fine-tuning capitalization for standalone/start-of-sentence/in-sentence use

- also allow `datetime`'s direct parameter to be no of seconds since `using`? or is it better (i.e. simpler API) for user just to create date and add seconds to that, e.g. `(datetime)+noOfSeconds`?

- Q. any value to having `random month/weekday/day/etc` commands? (probably not)
     � 	 	!�   D a t e L i b   - -   m a k e ,   p a r s e ,   a n d   f o r m a t   d a t e s   a n d   d a t e   s t r i n g s 
 
 C a u t i o n : 
 
 -   A p p l e S c r i p t ' s   d a t e   o b j e c t s   a r e   m u t a b l e ( ! ) ,   s o   a n y   t i m e   a   n e w   d a t e   o b j e c t   i s   n e e d e d ,   e i t h e r   c o n s t r u c t   i t   f r o m   s c r a t c h   u s i n g   A S O C ' s   ` ( N S D a t e ' s   d a t e . . . ( ) )   a s   d a t e ` ,   S t a n d a r d   A d d i t i o n s '   ` c u r r e n t   d a t e `   c o m m a n d ,   o r   ` c o p y   _ d e f a u l t D a t e   t o   n e w D a t e `   a n d   w o r k   o n   t h e   * c o p y * .   N E V E R   u s e ,   m o d i f y ,   o r   r e t u r n   _ d e f a u l t D a t e   ( o r   a n y   o t h e r   r e t a i n e d   d a t e   o b j e c t )   d i r e c t l y ,   a s   a l l o w i n g   a   s h a r e d   m u t a b l e   o b j e c t   t o   e s c a p e   f r o m   t h i s   l i b r a r y   a n d   r u n   l o o s e   a r o u n d   u s e r s '   p r o g r a m s   i s   a   g u a r a n t e e d   r e c i p e   f o r   c h a o s   a n d   d i s a s t e r .   ( I t ' s   b a d   e n o u g h   w h e n   l i s t s   a n d   r e c o r d s   d o   t h i s ,   b u t   d a t e s   d o n ' t   l o o k   l i k e   m u t a b l e   c o l l e c t i o n s   s o   u s e r s   a r e   e v e n   l e s s   l i k e l y   t o   r e a l i z e   t h e y   c o n t a i n   s h a r e a b l e   s t a t e . ) 
 
 N o t e s : 
 
 -   N S D a t e F o r m a t t e r s   ( l i k e   a l l   o t h e r   A S O C   o b j e c t s )   s h o u l d n ' t   b e   r e t a i n e d   i n   l i b r a r y   ( o r   s c r i p t   o b j e c t s   r e t u r n e d   b y   i t )   a s   t h a t   b r e a k s   s t o r e   s c r i p t / s a v e / a u t o s a v e   ( c a v e a t :   i f   t h e r e   i s   a   s i g n i f i c a n t   p e r f o r m a n c e   d i f f e r e n c e   b e t w e e n   c r e a t i n g   a   f o r m a t t e r   o n c e   a n d   r e u s i n g   i t   v s   c r e a t i n g   i t   e a c h   t i m e ,   D a t e F o r m a t t e r O b j e c t s   c o u l d   b e   r e t u r n e d   a s   a n   _ a l t e r n a t i v e _   t o   u s i n g   ` p a r s e   d a t e ` / ` f o r m a t   d a t e `   h a n d l e r s   w h e r e   u s e r   r e a l l y   n e e d s   t h e   e x t r a   s p e e d ;   h o w e v e r ,   d o c u m e n t a t i o n   w o u l d   n e e d   t o   s t a t e   c l e a r l y   t h a t   r e t u r n e d   o b j e c t   c o n t a i n s   A S O C   d a t a   s o   c a n   c a u s e   a u t o s a v e ,   e t c .   t o   f a i l ) 
 
 T O   D O :   
 
 -   s h o u l d   ` d a t e t i m e `   i m p l e m e n t   o p t i o n a l   ` w i t h / w i t h o u t   r o l l o v e r   a l l o w e d `   p a r a m e t e r   t o   d e t e r m i n e   i f   o u t - o f - r a n g e   v a l u e s   s h o u l d   b e   a l l o w e d   t o   r o l l o v e r   o r   n o t   ( d e f a u l t :   e r r o r   i f   r o l l o v e r   d e t e c t e d )   c h e c k   f o r   a n y   o u t - o f - r a n g e   p r o p e r t i e s ,   a s   A S   w i l l   s i l e n t l y   r o l l   o v e r   ( Q .   w h a t   a b o u t   l e a p - s e c o n d s ? )   T B H ,   p r o b a b l y   b e   s i m p l e r   a n d   s a f e r   t o   r a n g e - c h e c k   y e a r + m o n t h + h o u r s + m i n u t e s   ( a l l   t h o s e   r a n g e s   a r e   f i x e d ,   s o   a s   l o n g   a s   t h e   r e c ' s   p r o p e r t i e s   a r e   a n y w h e r e   w i t h i n   t h o s e   r a n g e s   t h e y ' r e   o k ) ,   a n d   c o m p a r i s o n - c h e c k   t h e   d a y   ( a l l o w i n g   s o m e   f l e x i b i l i t y   i n   t h e   e v e n t   t h a t   a   l e a p   s e c o n d   n u d g e s   i t   o v e r   t o   t h e   n e x t   d a y ) ,   a n d   f i n a l l y   c h e c k   t h e   s e c o n d s   i s n ' t   o b v i o u s l y   i n v a l i d   ( e . g .   - 1 , 7 0 ) 
 
 -   s h o u l d   ` c o n v e r t `   h a n d l e r s   i m p l e m e n t   o p t i o n a l   ` u s i n g   [ I S O 8 6 0 1   f o r m a t / R F C 8 2 2   f o r m a t / A p p l e S c r i p t   f o r m a t / e t c ] `   p a r a m e t e r ?   o r   j u s t   s t i c k   t o   I S O 8 6 0 1 ,   a n d   t e l l   u s e r   t o   u s e   F o r m a t L i b   w h e n   w o r k i n g   w i t h   o t h e r   f o r m a t s 
 
 -   p u t   a l l   p a r s i n g / f o r m a t t i n g   ( n u m b e r ,   d a t e ,   g e n e r a l )   i n t o   a   s i n g l e   ' F o r m a t L i b ' ? ;   n o t e   t h a t   f o r m a t t i n g   s h o u l d   a c c e p t   e i t h e r   t e m p l a t e   t e x t   o r   c o n s t a n t s   f o r   s t a n d a r d   f o r m a t s   -   ` d e f a u l t `   ( ` l o n g   d a t e t i m e ` ?   i . e .   A p p l e S c r i p t ' s   s t a n d a r d ,   l o c a l i z e d   r e p r e s e n t a t i o n ) ,   ( a l s o   ` l o n g   d a t e ` ,   ` l o n g   t i m e ` ,   ` s h o r t   d a t e ` ,   & ? ) ,   ` I S O 8 6 0 1 `   ( ' Y Y Y Y - M M - D D T H H : M M : S S ' ;   w h a t   a b o u t   c h o i c e   o f   s e p a r a t o r ?   ' T '   o r   s p a c e ?   m a y b e   a l s o   h a v e   ` I S O 8 6 0 1   d a t e   a n d   t i m e `   s o   u s e r   c a n   c h o o s e ?   o r   e v e n   t a k e   a   l i s t   o f   c o n s t a n t s   w h i c h   w i l l   a p p e a r   w h i t e s p a c e - s e p a r a t e d ? ) ,   ` I S O 8 6 0 1   d a t e ` ,   ` I S O 8 6 0 1   t i m e ` ,   e t c .   W i l l   a l s o   n e e d   t o   c o n s i d e r   T Z   h a n d l i n g ;   A S   d a t e s   d o n ' t   h o l d   T Z   i n f o ,   s o   a   s e p a r a t e   o p t i o n a l   T Z   p a r a m e t e r   w o u l d   b e   n e e d e d   f o r   a d j u s t i n g   d a t e s   t o   l o c a l   T Z   w h e n   p a r s i n g / f o r m a t t i n g 
 
 -   w h a t   a b o u t   t i m e z o n e   s u p p o r t ?   ( o b v i o u s l y   t h i s   i s   p r o b l e m a t i c   a s   A S ' s   d a t e   t y p e   a n d   A E M ' s   t y p e L o n g D a t e T i m e   s u p p o r t   c u r r e n t   T Z   o n l y ,   b u t   f o r   g e n e r a l   d a t e   m a n i p u l a t i o n   t a s k s   a   s c r i p t   o b j e c t   w r a p p e r ,   o r   ( p e r h a p s   p r e f e r a b l e   f r o m   u s e r ' s   P O V   s i n c e   i t ' s   t r a n s p a r e n t )   a   { c l a s s : d a t e   w i t h   t i m e z o n e , t i m e : . . . , t i m e z o n e : . . . }   r e c o r d ,   c o u l d   b e   d e f i n e d   t h a t   s t o r e s   a n   a r b i t r a r y   T Z   i n   a d d i t i o n   t o   s t a n d a r d   d a t e   v a l u e ) 
 
 -   n a m i n g   c o n v e n t i o n ?   ( ` d a t e t i m e `   v s   ` m a k e   d a t e t i m e `   v s   ` n e w   d a t e ` ?   t h e   f o r m e r   i s   i n   k e e p i n g   w i t h   e x i s t i n g   ` d a t e   T E X T `   s p e c i f i e r   s y n t a x ;   t h e   l a t t e r   m a t c h e s   n a m i n g   c o n v e n t i o n   u s e d   i n   T y p e s L i b ) 
 
 -   w h a t   a b o u t   a d d i n g   o p t i o n a l   ` u s i n g   c u r r e n t   d a y / c u r r e n t   t i m e / O S   X   e p o c h / U n i x   e p o c h / c l a s s i c   M a c   e p o c h `   p a r a m e t e r   t o   ` d a t e t i m e `   f o r   s p e c i f y i n g   d e f a u l t   y e a r / m o n t h / d a t e / t i m e   ( c u r r e n t l y   d e f a u l t   v a l u e s   a r e   h a r d c o d e d   f o r   O S   X   e p o c h ) ?   a l s o ,   w h a t   a b o u t   o p t i o n a l   ` f o r   f i r s t ` ,   ` f o r   s e c o n d ` ,   e t c .   p a r a m e t e r s   f o r   s p e c i f y i n g   f i r s t / s e c o n d / t h i r d / f o u r t h / f i f t h   M o n d a y / T u e s d a y / W e d n e s d a y / . . / S u n d a y   i n   a   m o n t h ?   
 
 
 
 -   s e e   a l s o   N S F o r m a t t i n g C o n t e x t . . .   c o n s t a n t s   i n   N S F o r m a t t e r . h   f o r   f i n e - t u n i n g   c a p i t a l i z a t i o n   f o r   s t a n d a l o n e / s t a r t - o f - s e n t e n c e / i n - s e n t e n c e   u s e 
 
 -   a l s o   a l l o w   ` d a t e t i m e ` ' s   d i r e c t   p a r a m e t e r   t o   b e   n o   o f   s e c o n d s   s i n c e   ` u s i n g ` ?   o r   i s   i t   b e t t e r   ( i . e .   s i m p l e r   A P I )   f o r   u s e r   j u s t   t o   c r e a t e   d a t e   a n d   a d d   s e c o n d s   t o   t h a t ,   e . g .   ` ( d a t e t i m e ) + n o O f S e c o n d s ` ? 
 
 -   Q .   a n y   v a l u e   t o   h a v i n g   ` r a n d o m   m o n t h / w e e k d a y / d a y / e t c `   c o m m a n d s ?   ( p r o b a b l y   n o t ) 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �        s u p p o r t   ! " ! l     ��������  ��  ��   "  # $ # l      % & ' % j    �� (�� 0 _supportlib _supportLib ( N     ) ) 4    �� *
�� 
scpt * m     + + � , , " L i b r a r y S u p p o r t L i b & "  used for parameter checking    ' � - - 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g $  . / . l     ��������  ��  ��   /  0 1 0 i   ! 2 3 2 I      �� 4���� 
0 _error   4  5 6 5 o      ���� 0 handlername handlerName 6  7 8 7 o      ���� 0 etext eText 8  9 : 9 o      ���� 0 enumber eNumber :  ; < ; o      ���� 0 efrom eFrom <  =�� = o      ���� 
0 eto eTo��  ��   3 n     > ? > I    �� @���� &0 throwcommanderror throwCommandError @  A B A m     C C � D D  D a t e L i b B  E F E o    ���� 0 handlername handlerName F  G H G o    ���� 0 etext eText H  I J I o    	���� 0 enumber eNumber J  K L K o   	 
���� 0 efrom eFrom L  M�� M o   
 ���� 
0 eto eTo��  ��   ? o     ���� 0 _supportlib _supportLib 1  N O N l     ��������  ��  ��   O  P Q P l     ��������  ��  ��   Q  R S R l     ��������  ��  ��   S  T U T i  " % V W V I      �������� $0 _makedefaultdate _makeDefaultDate��  ��   W l    E X Y Z X O     E [ \ [ k    D ] ]  ^ _ ^ r    ) ` a ` J     b b  c d c m    	����� d  e f e m   	 
����  f  g�� g m   
 ���� ��   a J       h h  i j i n      k l k 1    ��
�� 
year l  g     j  m n m n      o p o m    ��
�� 
mnth p  g     n  q�� q n      r s r 1   % '��
�� 
day  s  g   $ %��   _  t u t l  * A v w x v r   * A y z y J   * . { {  | } | m   * +����  }  ~�� ~ m   + ,����  ��   z J          � � � n      � � � m   4 6��
�� 
mnth �  g   3 4 �  ��� � n      � � � 1   = ?��
�� 
time �  g   < =��   w=7 note: month property normally needs set twice as it may have rolled over to next month if date's original `day` property was greater than no. of days in the new month (it doesn't actually matter in this particular case as January always has 31 days, but it's included anyway as a cautionary reminder to others)    x � � �n   n o t e :   m o n t h   p r o p e r t y   n o r m a l l y   n e e d s   s e t   t w i c e   a s   i t   m a y   h a v e   r o l l e d   o v e r   t o   n e x t   m o n t h   i f   d a t e ' s   o r i g i n a l   ` d a y `   p r o p e r t y   w a s   g r e a t e r   t h a n   n o .   o f   d a y s   i n   t h e   n e w   m o n t h   ( i t   d o e s n ' t   a c t u a l l y   m a t t e r   i n   t h i s   p a r t i c u l a r   c a s e   a s   J a n u a r y   a l w a y s   h a s   3 1   d a y s ,   b u t   i t ' s   i n c l u d e d   a n y w a y   a s   a   c a u t i o n a r y   r e m i n d e r   t o   o t h e r s ) u  ��� � L   B D � �  g   B C��   \ l     ����� � I    ������
�� .misccurdldt    ��� null��  ��  ��  ��   Y � � kludge that avoids having to use AppleScript's `date "..."` specifier syntax in this code (which requires the string literal to be written in the host system's localized date format, making the source code non-portable)    Z � � ��   k l u d g e   t h a t   a v o i d s   h a v i n g   t o   u s e   A p p l e S c r i p t ' s   ` d a t e   " . . . " `   s p e c i f i e r   s y n t a x   i n   t h i s   c o d e   ( w h i c h   r e q u i r e s   t h e   s t r i n g   l i t e r a l   t o   b e   w r i t t e n   i n   t h e   h o s t   s y s t e m ' s   l o c a l i z e d   d a t e   f o r m a t ,   m a k i n g   t h e   s o u r c e   c o d e   n o n - p o r t a b l e ) U  � � � l     ��������  ��  ��   �  � � � l      � � � � j   & ,�� ��� 0 _defaultdate _defaultDate � I   & +�������� $0 _makedefaultdate _makeDefaultDate��  ��   �   1 January 2001, 00:00:00    � � � � 2   1   J a n u a r y   2 0 0 1 ,   0 0 : 0 0 : 0 0 �  � � � l     ��������  ��  ��   �  � � � j   - L�� ��� 0 _months   � J   - K � �  � � � m   - .��
�� 
jan  �  � � � m   . /��
�� 
feb  �  � � � m   / 0��
�� 
mar  �  � � � m   0 1��
�� 
apr  �  � � � m   1 2��
�� 
may  �  � � � m   2 5��
�� 
jun  �  � � � m   5 8��
�� 
jul  �  � � � m   8 ;��
�� 
aug  �  � � � m   ; >��
�� 
sep  �  � � � m   > A��
�� 
oct  �  � � � m   A D��
�� 
nov  �  ��� � m   D G��
�� 
dec ��   �  � � � j   M g�� ��� 0 	_weekdays   � J   M f � �  � � � m   M P��
�� 
mon  �  � � � m   P S��
�� 
tue  �  � � � m   S V��
�� 
wed  �  � � � m   V Y��
�� 
thu  �  � � � m   Y \��
�� 
fri  �  � � � m   \ _��
�� 
sat  �  ��� � m   _ b��
�� 
sun ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �� � ���   �   Date creation    � � � �    D a t e   c r e a t i o n �  � � � l     �� � ���   �[U robust alternatives to `date TEXT` specifier for constructing date objects, (`date dateString` has serious portability and usability problems as it requires a precisely formatted *localized* date string): `datetime` takes a record of numeric year/month/day/etc values; `convert text to date` takes date text in a canonical format (ISO-8601)    � � � ��   r o b u s t   a l t e r n a t i v e s   t o   ` d a t e   T E X T `   s p e c i f i e r   f o r   c o n s t r u c t i n g   d a t e   o b j e c t s ,   ( ` d a t e   d a t e S t r i n g `   h a s   s e r i o u s   p o r t a b i l i t y   a n d   u s a b i l i t y   p r o b l e m s   a s   i t   r e q u i r e s   a   p r e c i s e l y   f o r m a t t e d   * l o c a l i z e d *   d a t e   s t r i n g ) :   ` d a t e t i m e `   t a k e s   a   r e c o r d   o f   n u m e r i c   y e a r / m o n t h / d a y / e t c   v a l u e s ;   ` c o n v e r t   t e x t   t o   d a t e `   t a k e s   d a t e   t e x t   i n   a   c a n o n i c a l   f o r m a t   ( I S O - 8 6 0 1 ) �  � � � l     ��������  ��  ��   �  � � � i  h k � � � I     �� ���
�� .Dat:ReDanull��� ��� reco � |���� ��� ���  ��   � o      ����  0 withproperties withProperties��   � J      ����  ��   � Q     � � � � k   � � �  � � � s     � � � o    ���� 0 _defaultdate _defaultDate � o      ���� 0 newdate newDate �  � � � r    * � � � l   ( ���� � b    ( � � � n    � � � I    �~ ��}�~ &0 asrecordparameter asRecordParameter �  � � � o    �|�|  0 withproperties withProperties �  ��{ � m     � � � � �  �{  �}   � o    �z�z 0 _supportlib _supportLib � K    ' � � �y � �
�y 
year � m    �x�x� � �w � �
�w 
mnth � m    �v�v  � �u � �
�u 
day  � m    �t�t  � �s � �
�s 
hour � m    �r�r   � �q � 
�q 
min  � m     !�p�p    �o
�o 
scnd m   " #�n�n   �m�l
�m 
time m   $ %�k
�k 
msng�l  ��  �   � o      �j�j 0 rec   �  Q   +� k   .		 

 r   . [ J   . ?  c   . 3 n  . 1 1   / 1�i
�i 
year o   . /�h�h 0 rec   m   1 2�g
�g 
long  c   3 8 n  3 6 m   4 6�f
�f 
mnth o   3 4�e�e 0 rec   m   6 7�d
�d 
long �c c   8 = n  8 ; 1   9 ;�b
�b 
day  o   8 9�a�a 0 rec   m   ; <�`
�` 
long�c   J         !"! n     #$# 1   E G�_
�_ 
year$ o   D E�^�^ 0 newdate newDate" %&% n     '(' m   N P�]
�] 
mnth( o   M N�\�\ 0 newdate newDate& )�[) n     *+* 1   W Y�Z
�Z 
day + o   V W�Y�Y 0 newdate newDate�[   ,-, l  \ \�X./�X  .�� note: unlike other properties, which take numbers, a date object's `month` property accepts either integer or month constant symbol value; however, it also happily accepts weekday constants which is obviously wrong, so explicitly validate the record's `month` property -- TO DO: may be simpler just to use `asIntegerParameter` (or variant thereof), which ought to be checking for and rejecting these stupidities already   / �00H   n o t e :   u n l i k e   o t h e r   p r o p e r t i e s ,   w h i c h   t a k e   n u m b e r s ,   a   d a t e   o b j e c t ' s   ` m o n t h `   p r o p e r t y   a c c e p t s   e i t h e r   i n t e g e r   o r   m o n t h   c o n s t a n t   s y m b o l   v a l u e ;   h o w e v e r ,   i t   a l s o   h a p p i l y   a c c e p t s   w e e k d a y   c o n s t a n t s   w h i c h   i s   o b v i o u s l y   w r o n g ,   s o   e x p l i c i t l y   v a l i d a t e   t h e   r e c o r d ' s   ` m o n t h `   p r o p e r t y   - -   T O   D O :   m a y   b e   s i m p l e r   j u s t   t o   u s e   ` a s I n t e g e r P a r a m e t e r `   ( o r   v a r i a n t   t h e r e o f ) ,   w h i c h   o u g h t   t o   b e   c h e c k i n g   f o r   a n d   r e j e c t i n g   t h e s e   s t u p i d i t i e s   a l r e a d y- 121 Z   \ �34�W�V3 F   \ �565 F   \ 787 =   \ i9:9 l  \ g;�U�T; I  \ g�S<=
�S .corecnte****       ****< J   \ a>> ?�R? n  \ _@A@ m   ] _�Q
�Q 
mnthA o   \ ]�P�P 0 rec  �R  = �OB�N
�O 
koclB m   b c�M
�M 
nmbr�N  �U  �T  : m   g h�L�L  8 =   l {CDC l  l yE�K�JE I  l y�IFG
�I .corecnte****       ****F J   l qHH I�HI n  l oJKJ m   m o�G
�G 
mnthK o   l m�F�F 0 rec  �H  G �EL�D
�E 
koclL m   r u�C
�C 
ctxt�D  �K  �J  D m   y z�B�B  6 H   � �MM E  � �NON o   � ��A�A 0 _months  O J   � �PP Q�@Q n  � �RSR m   � ��?
�? 
mnthS o   � ��>�> 0 rec  �@  4 R   � ��=TU
�= .ascrerr ****      � ****T m   � �VV �WW p I n v a l i d    m o n t h    p r o p e r t y   ( e x p e c t e d   i n t e g e r   o r   c o n s t a n t ) .U �<XY
�< 
errnX m   � ��;�;�YY �:Z[
�: 
erobZ l  � �\�9�8\ N   � �]] n   � �^_^ m   � ��7
�7 
mnth_ o   � ��6�6  0 withproperties withProperties�9  �8  [ �5`�4
�5 
errt` J   � �aa bcb m   � ��3
�3 
enumc d�2d m   � ��1
�1 
long�2  �4  �W  �V  2 efe r   � �ghg [   � �iji [   � �klk ]   � �mnm l  � �o�0�/o 1   � ��.
�. 
hour�0  �/  n l  � �p�-�,p c   � �qrq n  � �sts 1   � ��+
�+ 
hourt o   � ��*�* 0 rec  r m   � ��)
�) 
long�-  �,  l ]   � �uvu l  � �w�(�'w 1   � ��&
�& 
min �(  �'  v l  � �x�%�$x c   � �yzy n  � �{|{ 1   � ��#
�# 
min | o   � ��"�" 0 rec  z m   � ��!
�! 
long�%  �$  j l  � �}� �} c   � �~~ n  � ���� m   � ��
� 
scnd� o   � ��� 0 rec   m   � ��
� 
long�   �  h o      �� 0 newtime newTimef ��� Z   ������ >  � ���� n  � ���� 1   � ��
� 
time� o   � ��� 0 rec  � m   � ��
� 
msng� k   � ��� ��� Z  � ������ >   � ���� o   � ��� 0 newtime newTime� n  � ���� 1   � ��
� 
time� o   � ��� 0 rec  � R   � ����
� .ascrerr ****      � ****� m   � ��� ��� | C o n f l i c t i n g    t i m e    a n d    h o u r s  /  m i n u t e s  /  s e c o n d s    p r o p e r t i e s .� ���
� 
errn� m   � ����Y� ���
� 
erob� o   � ��� 0 rec  �  �  �  � ��
� r   � ���� n  � ���� 1   � ��	
�	 
time� o   � ��� 0 rec  � n     ��� 1   � ��
� 
time� o   � ��� 0 newdate newDate�
  �  � r  ��� o  �� 0 newtime newTime� n     ��� 1  �
� 
time� o  �� 0 newdate newDate�   R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� � ��
�  
errn� d      �� m      ������ ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��   l ����� k  ��� ��� l ������  � � � construct a reference to the guilty property of the original record for inclusion in error (note that month property isn't checked here, as that already has its own validation above)   � ���n   c o n s t r u c t   a   r e f e r e n c e   t o   t h e   g u i l t y   p r o p e r t y   o f   t h e   o r i g i n a l   r e c o r d   f o r   i n c l u s i o n   i n   e r r o r   ( n o t e   t h a t   m o n t h   p r o p e r t y   i s n ' t   c h e c k e d   h e r e ,   a s   t h a t   a l r e a d y   h a s   i t s   o w n   v a l i d a t i o n   a b o v e )� ��� X  ������ k  b��� ��� r  by��� o  bc���� 0 aref aRef� J      �� ��� o      ���� 0 testref testRef� ��� o      ���� 0 originalref originalRef� ���� o      ���� 0 propertyname propertyName��  � ���� Q  z����� e  }��� c  }���� o  }~���� 0 testref testRef� m  ~��
�� 
long� R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� �����
�� 
errn� d      �� m      �������  � R  ������
�� .ascrerr ****      � ****� b  ����� b  ����� b  ����� m  ���� ���  I n v a l i d   � o  ������ 0 propertyname propertyName� m  ���� ��� >    p r o p e r t y   ( e x p e c t e d   i n t e g e r ) :  � o  ������ 0 etext eText� ����
�� 
errn� m  �������\� ����
�� 
erob� o  ������ 0 originalref originalRef� �����
�� 
errt� m  ����
�� 
long��  ��  �� 0 aref aRef� J  V�� ��� l 	������ J  �� ��� N  �� n  ��� 1  ��
�� 
year� o  ���� 0 rec  � ��� N  �� n  ��� 1  ��
�� 
year� o  ����  0 withproperties withProperties� ���� m  �� ���  y e a r��  ��  ��  � ��� l 	+������ J  +�� ��� N  "�� n  !��� 1  !��
�� 
day � o  ���� 0 rec  � ��� N  "&�� n  "%� � 1  #%��
�� 
day   o  "#����  0 withproperties withProperties� �� m  &) �  d a y��  ��  ��  �  l 	+8���� J  +8 	 N  +/

 n  +. 1  ,.��
�� 
hour o  +,���� 0 rec  	  N  /3 n  /2 1  02��
�� 
hour o  /0����  0 withproperties withProperties �� m  36 � 
 h o u r s��  ��  ��    l 	8E���� J  8E  N  8< n  8; 1  9;��
�� 
min  o  89���� 0 rec    N  <@   n  <?!"! 1  =?��
�� 
min " o  <=����  0 withproperties withProperties #��# m  @C$$ �%%  m i n u t e s��  ��  ��   &��& l 	ER'����' J  ER(( )*) N  EI++ n  EH,-, m  FH��
�� 
scnd- o  EF���� 0 rec  * ./. N  IM00 n  IL121 m  JL��
�� 
scnd2 o  IJ����  0 withproperties withProperties/ 3��3 m  MP44 �55  s e c o n d s��  ��  ��  ��  � 676 Z  ��89����8 > ��:;: n  ��<=< 1  ����
�� 
time= o  ������ 0 rec  ; m  ����
�� 
msng9 Q  ��>?@> e  ��AA c  ��BCB n  ��DED 1  ����
�� 
timeE o  ������  0 withproperties withPropertiesC m  ����
�� 
long? R      ��FG
�� .ascrerr ****      � ****F o      ���� 0 etext eTextG ��H��
�� 
errnH d      II m      �������  @ R  ����JK
�� .ascrerr ****      � ****J b  ��LML m  ��NN �OO X I n v a l i d    t i m e    p r o p e r t y   ( e x p e c t e d   i n t e g e r ) :  M o  ������ 0 etext eTextK ��PQ
�� 
errnP m  �������\Q ��RS
�� 
erobR l ��T����T N  ��UU n  ��VWV 1  ����
�� 
timeW o  ������  0 withproperties withProperties��  ��  S ��X��
�� 
errtX m  ����
�� 
long��  ��  ��  7 Y��Y l ��Z[\Z R  ����]^
�� .ascrerr ****      � ****] o  ������ 0 etext eText^ ��_`
�� 
errn_ m  �������\` ��ab
�� 
eroba o  ������ 0 efrom eFromb ��c��
�� 
errtc o  ������ 
0 eto eTo��  [ "  else rethrow original error   \ �dd 8   e l s e   r e t h r o w   o r i g i n a l   e r r o r��  � i c coercion error [presumably] caused by one of the supplied record's properties being the wrong type   � �ee �   c o e r c i o n   e r r o r   [ p r e s u m a b l y ]   c a u s e d   b y   o n e   o f   t h e   s u p p l i e d   r e c o r d ' s   p r o p e r t i e s   b e i n g   t h e   w r o n g   t y p e f��f L  ��gg o  ������ 0 newdate newDate��   � R      ��hi
�� .ascrerr ****      � ****h o      ���� 0 etext eTexti ��jk
�� 
errnj o      ���� 0 enumber eNumberk ��lm
�� 
erobl o      ���� 0 efrom eFromm ��n��
�� 
errtn o      ���� 
0 eto eTo��   � I  ��o���� 
0 _error  o pqp m  rr �ss , c o n v e r t   r e c o r d   t o   d a t eq tut o  ���� 0 etext eTextu vwv o  	���� 0 enumber eNumberw xyx o  	
���� 0 efrom eFromy z��z o  
���� 
0 eto eTo��  ��   � {|{ l     ��������  ��  ��  | }~} l     ��������  ��  ��  ~ � i  l o��� I     �����
�� .Dat:MkDtnull��� ��� reco� |��~��}��  �~  � o      �|�|  0 withproperties withProperties�}  � J      �{�{  ��  � l    ���� L     �� I    �z��y
�z .Dat:ReDanull��� ��� reco� o     �x�x  0 withproperties withProperties�y  �*$ TO DO: decide if shortcuts for existing commands are a good or bad idea; e.g. `datetime DATA` provides a more concise syntax that's similar to traditional `date DATA` syntax, but not convinced that is sufficiently advantageous to offset the increase in namespace clutter and dictionary bloat   � ���H   T O   D O :   d e c i d e   i f   s h o r t c u t s   f o r   e x i s t i n g   c o m m a n d s   a r e   a   g o o d   o r   b a d   i d e a ;   e . g .   ` d a t e t i m e   D A T A `   p r o v i d e s   a   m o r e   c o n c i s e   s y n t a x   t h a t ' s   s i m i l a r   t o   t r a d i t i o n a l   ` d a t e   D A T A `   s y n t a x ,   b u t   n o t   c o n v i n c e d   t h a t   i s   s u f f i c i e n t l y   a d v a n t a g e o u s   t o   o f f s e t   t h e   i n c r e a s e   i n   n a m e s p a c e   c l u t t e r   a n d   d i c t i o n a r y   b l o a t� ��� l     �w�v�u�w  �v  �u  � ��� l     �t�s�r�t  �s  �r  � ��� i  p s��� I     �q��p
�q .Dat:DaRenull��� ��� ldt � |�o�n��m��o  �n  � o      �l�l 0 thedate theDate�m  � l     ��k�j� m      �i
�i 
msng�k  �j  �p  � Q     ^���� k    H�� ��� Z     ���h�� =   ��� o    �g�g 0 thedate theDate� m    �f
�f 
msng� r   	 ��� o   	 �e�e 0 _defaultdate _defaultDate� o      �d�d 0 thedate theDate�h  � r     ��� n   ��� I    �c��b�c "0 asdateparameter asDateParameter� ��� o    �a�a 0 thedate theDate� ��`� m    �� ���  �`  �b  � o    �_�_ 0 _supportlib _supportLib� o      �^�^ 0 thedate theDate� ��]� L   ! H�� K   ! G�� �\��
�\ 
year� n  " &��� 1   # %�[
�[ 
year� o   " #�Z�Z 0 thedate theDate� �Y��
�Y 
mnth� c   ' ,��� n  ' *��� m   ( *�X
�X 
mnth� o   ' (�W�W 0 thedate theDate� m   * +�V
�V 
long� �U��
�U 
day � n  - 1��� 1   . 0�T
�T 
day � o   - .�S�S 0 thedate theDate� �R��
�R 
hour� _   2 7��� l  2 5��Q�P� n  2 5��� 1   3 5�O
�O 
time� o   2 3�N�N 0 thedate theDate�Q  �P  � m   5 6�M�M� �L��
�L 
min � `   8 ?��� _   8 =��� l  8 ;��K�J� n  8 ;��� 1   9 ;�I
�I 
time� o   8 9�H�H 0 thedate theDate�K  �J  � m   ; <�G�G <� m   = >�F�F <� �E��D
�E 
scnd� `   @ E��� l  @ C��C�B� n  @ C��� 1   A C�A
�A 
time� o   @ A�@�@ 0 thedate theDate�C  �B  � m   C D�?�? <�D  �]  � R      �>��
�> .ascrerr ****      � ****� o      �=�= 0 etext eText� �<��
�< 
errn� o      �;�; 0 enumber eNumber� �:��
�: 
erob� o      �9�9 0 efrom eFrom� �8��7
�8 
errt� o      �6�6 
0 eto eTo�7  � I   P ^�5��4�5 
0 _error  � ��� m   Q T�� ��� , c o n v e r t   d a t e   t o   r e c o r d� ��� o   T U�3�3 0 etext eText� ��� o   U V�2�2 0 enumber eNumber� ��� o   V W�1�1 0 efrom eFrom� ��0� o   W X�/�/ 
0 eto eTo�0  �4  � ��� l     �.�-�,�.  �-  �,  � ��� l     �+�*�)�+  �*  �)  � ��� l     �(���(  �  -----   � ��� 
 - - - - -� ��� l     �'�&�%�'  �&  �%  � ��� l     �$�#�"�$  �#  �"  � ��� i  t w��� I     �!�� 
�! .Dat:TeDanull���     ctxt� o      �� 0 thetext theText�   � Q     X���� k    B�� � � r     n    I   
 ���� 0 init  �  �   n   
 I    
���� 	0 alloc  �  �   n    o    �� "0 nsdateformatter NSDateFormatter m    �
� misccura o      �� 0 dateformatter dateFormatter  	
	 n    I    ���  0 setdateformat_ setDateFormat_ � m     � 4 y y y y - M M - d d ' T ' H H : m m : s s Z Z Z Z Z�  �   o    �� 0 dateformatter dateFormatter
  r    * l   (�� n   ( I    (��� "0 datefromstring_ dateFromString_ � l   $�� n   $ I    $�
�	�
 "0 astextparameter asTextParameter  o    �� 0 thetext theText  �  m     !! �""  �  �	   o    �� 0 _supportlib _supportLib�  �  �  �   o    �� 0 dateformatter dateFormatter�  �   o      �� 0 thedate theDate #$# Z  + =%&��% =  + .'(' o   + ,�� 0 thedate theDate( m   , -� 
�  
msng& R   1 9��)*
�� .ascrerr ****      � ****) m   7 8++ �,, X I n v a l i d   d a t e   t e x t   ( e x p e c t e d   I S O 8 6 0 1   f o r m a t ) .* ��-.
�� 
errn- m   3 4�����Y. ��/��
�� 
erob/ o   5 6���� 0 thetext theText��  �  �  $ 0��0 L   > B11 c   > A232 o   > ?���� 0 thedate theDate3 m   ? @��
�� 
ldt ��  � R      ��45
�� .ascrerr ****      � ****4 o      ���� 0 etext eText5 ��67
�� 
errn6 o      ���� 0 enumber eNumber7 ��89
�� 
erob8 o      ���� 0 efrom eFrom9 ��:��
�� 
errt: o      ���� 
0 eto eTo��  � I   J X��;���� 
0 _error  ; <=< m   K N>> �?? ( c o n v e r t   t e x t   t o   d a t e= @A@ o   N O���� 0 etext eTextA BCB o   O P���� 0 enumber eNumberC DED o   P Q���� 0 efrom eFromE F��F o   Q R���� 
0 eto eTo��  ��  � GHG l     ��������  ��  ��  H IJI l     ��������  ��  ��  J KLK i  x {MNM I     ��OP
�� .Dat:DaTenull���     ldt O o      ���� 0 thedate theDateP ��Q��
�� 
TZonQ |����R��S��  ��  R o      ���� ,0 timezonenameoroffset timezoneNameOrOffset��  S l     T����T m      ��
�� 
msng��  ��  ��  N l    =UVWU Q     =XYZX k    +[[ \]\ r    ^_^ n   `a` I   
 �������� 0 init  ��  ��  a n   
bcb I    
�������� 	0 alloc  ��  ��  c n   ded o    ���� "0 nsdateformatter NSDateFormattere m    ��
�� misccura_ o      ���� 0 dateformatter dateFormatter] fgf n   hih I    ��j����  0 setdateformat_ setDateFormat_j k��k m    ll �mm 4 y y y y - M M - d d ' T ' H H : m m : s s Z Z Z Z Z��  ��  i o    ���� 0 dateformatter dateFormatterg n��n L    +oo c    *pqp l   (r����r n   (sts I    (��u���� "0 stringfromdate_ stringFromDate_u v��v l   $w����w n   $xyx I    $��z���� "0 asdateparameter asDateParameterz {|{ o    ���� 0 thedate theDate| }��} m     ~~ �  ��  ��  y o    ���� 0 _supportlib _supportLib��  ��  ��  ��  t o    ���� 0 dateformatter dateFormatter��  ��  q m   ( )��
�� 
ctxt��  Y R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  Z I   3 =������� 
0 _error  � ��� m   4 5�� ��� ( c o n v e r t   d a t e   t o   t e x t� ��� o   5 6���� 0 etext eText� ��� o   6 7���� 0 enumber eNumber� ��� o   7 8���� 0 efrom eFrom� ���� o   8 9���� 
0 eto eTo��  ��  V � � TO DO: implement `for timezone` parameter (AS's date type doesn't support TZ data/operations itself, so always uses current locale, but users may want to format date for other locales)   W ���r   T O   D O :   i m p l e m e n t   ` f o r   t i m e z o n e `   p a r a m e t e r   ( A S ' s   d a t e   t y p e   d o e s n ' t   s u p p o r t   T Z   d a t a / o p e r a t i o n s   i t s e l f ,   s o   a l w a y s   u s e s   c u r r e n t   l o c a l e ,   b u t   u s e r s   m a y   w a n t   t o   f o r m a t   d a t e   f o r   o t h e r   l o c a l e s )L ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �   TEST   � ��� 
   T E S T� ��� l     ��������  ��  ��  � ��� l     ������  � � �(datetime {year:2015, hours:yes}) -- error "DateLib can't datetime: Invalid record property: Can�t make yes into type integer." number -1700 from hours of {year:2015, hours:yes} to integer   � ���x ( d a t e t i m e   { y e a r : 2 0 1 5 ,   h o u r s : y e s } )   - -   e r r o r   " D a t e L i b   c a n ' t   d a t e t i m e :   I n v a l i d   r e c o r d   p r o p e r t y :   C a n  t   m a k e   y e s   i n t o   t y p e   i n t e g e r . "   n u m b e r   - 1 7 0 0   f r o m   h o u r s   o f   { y e a r : 2 0 1 5 ,   h o u r s : y e s }   t o   i n t e g e r� ��� l     ��������  ��  ��  � ��� l     ������  � e _convert text to date "2016-01-07T00:41:34-0800" --> date "Thursday, 7 January 2016 at 08:41:34"   � ��� � c o n v e r t   t e x t   t o   d a t e   " 2 0 1 6 - 0 1 - 0 7 T 0 0 : 4 1 : 3 4 - 0 8 0 0 "   - - >   d a t e   " T h u r s d a y ,   7   J a n u a r y   2 0 1 6   a t   0 8 : 4 1 : 3 4 "� ��� l     ��������  ��  ��  � ���� l     ��������  ��  ��  ��       �����������������  � ������������������������
�� 
pimr�� 0 _supportlib _supportLib�� 
0 _error  �� $0 _makedefaultdate _makeDefaultDate�� 0 _defaultdate _defaultDate�� 0 _months  �� 0 	_weekdays  
�� .Dat:ReDanull��� ��� reco
�� .Dat:MkDtnull��� ��� reco
�� .Dat:DaRenull��� ��� ldt 
�� .Dat:TeDanull���     ctxt
�� .Dat:DaTenull���     ldt � ����� �  ��� �����
�� 
cobj� ��   �� 
�� 
frmk��  � �����
�� 
cobj� ��   ��
�� 
osax��  � ��   � +
� 
scpt� �~ 3�}�|���{�~ 
0 _error  �} �z��z �  �y�x�w�v�u�y 0 handlername handlerName�x 0 etext eText�w 0 enumber eNumber�v 0 efrom eFrom�u 
0 eto eTo�|  � �t�s�r�q�p�t 0 handlername handlerName�s 0 etext eText�r 0 enumber eNumber�q 0 efrom eFrom�p 
0 eto eTo�  C�o�n�o �n &0 throwcommanderror throwCommandError�{ b  ࠡ����+ � �m W�l�k���j�m $0 _makedefaultdate _makeDefaultDate�l  �k  �  � �i�h�g�f�e�d�c
�i .misccurdldt    ��� null�h�
�g 
cobj
�f 
year
�e 
mnth
�d 
day 
�c 
time�j F*j   >�kkmvE[�k/*�,FZ[�l/*�,FZ[�m/*�,FZOkjlvE[�k/*�,FZ[�l/*�,FZO*U� ldt     �uy � �b��b �  �a�`�_�^�]�\�[�Z�Y�X�W�V
�a 
jan 
�` 
feb 
�_ 
mar 
�^ 
apr 
�] 
may 
�\ 
jun 
�[ 
jul 
�Z 
aug 
�Y 
sep 
�X 
oct 
�W 
nov 
�V 
dec � �U��U �  �T�S�R�Q�P�O�N
�T 
mon 
�S 
tue 
�R 
wed 
�Q 
thu 
�P 
fri 
�O 
sat 
�N 
sun � �M ��L�K���J
�M .Dat:ReDanull��� ��� reco�L {�I�H�G�I  0 withproperties withProperties�H  �G  �K  � �F�E�D�C�B�A�@�?�>�=�<�;�F  0 withproperties withProperties�E 0 newdate newDate�D 0 rec  �C 0 newtime newTime�B 0 etext eText�A 0 efrom eFrom�@ 
0 eto eTo�? 0 aref aRef�> 0 testref testRef�= 0 originalref originalRef�< 0 propertyname propertyName�; 0 enumber eNumber� , ��:�9�8�7�6�5�4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#V�"��!��$4� ����N�r��: &0 asrecordparameter asRecordParameter
�9 
year�8�
�7 
mnth
�6 
day 
�5 
hour
�4 
min 
�3 
scnd
�2 
time
�1 
msng�0 
�/ 
long
�. 
cobj
�- 
kocl
�, 
nmbr
�+ .corecnte****       ****
�* 
ctxt
�) 
bool
�( 
errn�'�Y
�& 
erob
�% 
errt
�$ 
enum�# �" �! 0 etext eText� ���
� 
errn��\� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  �  � ���
� 
errn��\�  ��\� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � 
0 _error  �J�b  EQ�Ob  ��l+ ���k�k�j�j�j���%E�O ݢ�,�&��,�&��,�&mvE[�k/��,FZ[�l/��,FZ[�m/��,FZO��,kv��l j 	 ��,kv�a l j a &	 b  ��,kva & #)a a a ��,a a �lva a Y hOƢ�,�& Ǣ�,�& ��,�&E�O��,� +���, )a a a �a a Y hO��,��,FY ���,FW �X   ���,��,a mv��,��,a mv��,��,a  mv��,��,a !mv��,��,a "mva #v[��l kh �E[�k/E�Z[�l/E�Z[�m/E�ZO ��&W %X  $)a a %a �a �a a &�%a '%�%[OY��O��,� 0 
��,�&W "X  $)a a %a ��,a �a a (�%Y hO)a a %a �a �a �O�W X  )*a *����a #+ +� ����
���	
� .Dat:MkDtnull��� ��� reco� {����  0 withproperties withProperties�  �  �
  � ��  0 withproperties withProperties� �
� .Dat:ReDanull��� ��� reco�	 �j  � ������� 
� .Dat:DaRenull��� ��� ldt � {�������� 0 thedate theDate��  
�� 
msng�  � ������������ 0 thedate theDate�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� �����������������������������������
�� 
msng�� "0 asdateparameter asDateParameter
�� 
year
�� 
mnth
�� 
long
�� 
day 
�� 
hour
�� 
time��
�� 
min �� <
�� 
scnd�� �� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �  _ J��  b  E�Y b  ��l+ E�O��,E��,�&��,E��,�"��,�"�#��,�#�W X  *a ����a + � �����������
�� .Dat:TeDanull���     ctxt�� 0 thetext theText��  � ���������������� 0 thetext theText�� 0 dateformatter dateFormatter�� 0 thedate theDate�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ����������!��������������+�����>����
�� misccura�� "0 nsdateformatter NSDateFormatter�� 	0 alloc  �� 0 init  ��  0 setdateformat_ setDateFormat_�� "0 astextparameter asTextParameter�� "0 datefromstring_ dateFromString_
�� 
msng
�� 
errn���Y
�� 
erob�� 
�� 
ldt �� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� Y D��,j+ j+ E�O��k+ O�b  ��l+ k+ E�O��  )�����Y hO��&W X  *a ����a + � ��N��������
�� .Dat:DaTenull���     ldt �� 0 thedate theDate�� �����
�� 
TZon� {�������� ,0 timezonenameoroffset timezoneNameOrOffset��  
�� 
msng��  � ���������������� 0 thedate theDate�� ,0 timezonenameoroffset timezoneNameOrOffset�� 0 dateformatter dateFormatter�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ��������l��~��������������
�� misccura�� "0 nsdateformatter NSDateFormatter�� 	0 alloc  �� 0 init  ��  0 setdateformat_ setDateFormat_�� "0 asdateparameter asDateParameter�� "0 stringfromdate_ stringFromDate_
�� 
ctxt�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� > -��,j+ j+ E�O��k+ O�b  ��l+ k+ �&W X 
 *죤���+ ascr  ��ޭ