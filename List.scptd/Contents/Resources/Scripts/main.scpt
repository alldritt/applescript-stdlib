FasdUAS 1.101.10   ��   ��    k             l      ��  ��    List -- manipulate AppleScript lists 

Notes:

- For splitting and joining lists of text, see Text library's `split text` and `join text` commands.


TO DO:


- should text comparator implement exactly the same predefined considering/ignoring options as Text's `search text`? (currently `search text` considers diacriticals for comparison while `sort list`'s text comparison ignores diacriticals for ordering, which may or may not be appropriate)

- if list is almost ordered then tell _sort() to use insertionsort, as that will be quicker than quicksorting the whole thing (will need to run some profiling tests to determine what a good cutoff point is)

- text comparator currently performs simple text coercion; should it explicitly reject lists, constants, etc?
		
     � 	 	   L i s t   - -   m a n i p u l a t e   A p p l e S c r i p t   l i s t s   
 
 N o t e s : 
 
 -   F o r   s p l i t t i n g   a n d   j o i n i n g   l i s t s   o f   t e x t ,   s e e   T e x t   l i b r a r y ' s   ` s p l i t   t e x t `   a n d   ` j o i n   t e x t `   c o m m a n d s . 
 
 
 T O   D O : 
 
 
 -   s h o u l d   t e x t   c o m p a r a t o r   i m p l e m e n t   e x a c t l y   t h e   s a m e   p r e d e f i n e d   c o n s i d e r i n g / i g n o r i n g   o p t i o n s   a s   T e x t ' s   ` s e a r c h   t e x t ` ?   ( c u r r e n t l y   ` s e a r c h   t e x t `   c o n s i d e r s   d i a c r i t i c a l s   f o r   c o m p a r i s o n   w h i l e   ` s o r t   l i s t ` ' s   t e x t   c o m p a r i s o n   i g n o r e s   d i a c r i t i c a l s   f o r   o r d e r i n g ,   w h i c h   m a y   o r   m a y   n o t   b e   a p p r o p r i a t e ) 
 
 -   i f   l i s t   i s   a l m o s t   o r d e r e d   t h e n   t e l l   _ s o r t ( )   t o   u s e   i n s e r t i o n s o r t ,   a s   t h a t   w i l l   b e   q u i c k e r   t h a n   q u i c k s o r t i n g   t h e   w h o l e   t h i n g   ( w i l l   n e e d   t o   r u n   s o m e   p r o f i l i n g   t e s t s   t o   d e t e r m i n e   w h a t   a   g o o d   c u t o f f   p o i n t   i s ) 
 
 -   t e x t   c o m p a r a t o r   c u r r e n t l y   p e r f o r m s   s i m p l e   t e x t   c o e r c i o n ;   s h o u l d   i t   e x p l i c i t l y   r e j e c t   l i s t s ,   c o n s t a n t s ,   e t c ? 
 	 	 
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
listObject��   ~ � � make a new list of specified length using the supplied value as padding; caution: padValue will not be copied, so should be an immutable type (e.g. number, string, constant; not date/list/record/script/reference)     � � ��   m a k e   a   n e w   l i s t   o f   s p e c i f i e d   l e n g t h   u s i n g   t h e   s u p p l i e d   v a l u e   a s   p a d d i n g ;   c a u t i o n :   p a d V a l u e   w i l l   n o t   b e   c o p i e d ,   s o   s h o u l d   b e   a n   i m m u t a b l e   t y p e   ( e . g .   n u m b e r ,   s t r i n g ,   c o n s t a n t ;   n o t   d a t e / l i s t / r e c o r d / s c r i p t / r e f e r e n c e ) v  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 0 	_pinindex 	_pinIndex �  � � � o      ���� 0 theindex theIndex �  ��� � o      ���� 0 
textlength 
textLength��  ��   � l    % � � � � Z     % � � � � � ?      � � � o     �� 0 theindex theIndex � o    �~�~ 0 
textlength 
textLength � L     � � o    �}�} 0 
textlength 
textLength �  � � � A     � � � o    �|�| 0 theindex theIndex � d     � � o    �{�{ 0 
textlength 
textLength �  � � � L     � � d     � � o    �z�z 0 
textlength 
textLength �  � � � =     � � � o    �y�y 0 theindex theIndex � m    �x�x   �  ��w � L      � � m    �v�v �w   � L   # % � � o   # $�u�u 0 theindex theIndex �   used by `slice text`     � � � � ,   u s e d   b y   ` s l i c e   t e x t `   �  � � � l     �t�s�r�t  �s  �r   �  � � � l     �q�p�o�q  �p  �o   �  � � � l     �n � ��n   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �m � ��m   �   basic operations    � � � � "   b a s i c   o p e r a t i o n s �  � � � l     �l�k�j�l  �k  �j   �  � � � i  ! $ �  � I     �i
�i .Lst:Instnull���     **** o      �h�h 0 thelist theList �g
�g 
Valu o      �f�f 0 thevalue theValue �e
�e 
Befo |�d�c�b�d  �c   o      �a�a 0 beforeindex beforeIndex�b   l     	�`�_	 m      �^
�^ 
msng�`  �_   �]

�] 
Afte
 |�\�[�Z�\  �[   o      �Y�Y 0 
afterindex 
afterIndex�Z   l     �X�W m      �V
�V 
msng�X  �W   �U�T
�U 
Conc |�S�R�Q�S  �R   o      �P�P 0 isjoin isJoin�Q   l     �O�N m      �M
�M boovfals�O  �N  �T    k    �  l     �L�L  .( In addition to inserting before/after the list's actual indexes, this also recognizes three 'virtual' indexes: the `after item` parameter uses index 0 and index `-length - 1` to indicate the start of the list; the `before item` parameter uses index `length + 1` to indicate the end of the list.     �P   I n   a d d i t i o n   t o   i n s e r t i n g   b e f o r e / a f t e r   t h e   l i s t ' s   a c t u a l   i n d e x e s ,   t h i s   a l s o   r e c o g n i z e s   t h r e e   ' v i r t u a l '   i n d e x e s :   t h e   ` a f t e r   i t e m `   p a r a m e t e r   u s e s   i n d e x   0   a n d   i n d e x   ` - l e n g t h   -   1 `   t o   i n d i c a t e   t h e   s t a r t   o f   t h e   l i s t ;   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   u s e s   i n d e x   ` l e n g t h   +   1 `   t o   i n d i c a t e   t h e   e n d   o f   t h e   l i s t .    l     �K�K  ~x Note that the `before item` parameter cannot indicate the end of a list using a negative index. (Problem: the next 'virtual' index after -1 would be 0, but index 0 is already used by the `after item` parameter to represent the *start* of a list, and it's easier to disallow `before item 0` than explain to user how 'index 0' can be at both the start *and* the end of a list.)    ��   N o t e   t h a t   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   c a n n o t   i n d i c a t e   t h e   e n d   o f   a   l i s t   u s i n g   a   n e g a t i v e   i n d e x .   ( P r o b l e m :   t h e   n e x t   ' v i r t u a l '   i n d e x   a f t e r   - 1   w o u l d   b e   0 ,   b u t   i n d e x   0   i s   a l r e a d y   u s e d   b y   t h e   ` a f t e r   i t e m `   p a r a m e t e r   t o   r e p r e s e n t   t h e   * s t a r t *   o f   a   l i s t ,   a n d   i t ' s   e a s i e r   t o   d i s a l l o w   ` b e f o r e   i t e m   0 `   t h a n   e x p l a i n   t o   u s e r   h o w   ' i n d e x   0 '   c a n   b e   a t   b o t h   t h e   s t a r t   * a n d *   t h e   e n d   o f   a   l i s t . ) �J Q    � ! k   �"" #$# h    
�I%�I 0 
listobject 
listObject% j     �H&�H 
0 _list_  & n    '(' I    �G)�F�G "0 aslistparameter asListParameter) *+* o    
�E�E 0 thelist theList+ ,�D, m   
 -- �..  �D  �F  ( o     �C�C 0 _support  $ /0/ Z   )12�B�A1 G    343 H    55 o    �@�@ 0 isjoin isJoin4 =    676 l   8�?�>8 I   �=9:
�= .corecnte****       ****9 J    ;; <�<< o    �;�; 0 thevalue theValue�<  : �:=�9
�: 
kocl= m    �8
�8 
list�9  �?  �>  7 m    �7�7  2 r     %>?> J     #@@ A�6A o     !�5�5 0 thevalue theValue�6  ? o      �4�4 0 thevalue theValue�B  �A  0 BCB Z   *7DEFGD >  * -HIH o   * +�3�3 0 
afterindex 
afterIndexI m   + ,�2
�2 
msngE k   0 �JJ KLK Z  0 @MN�1�0M >  0 3OPO o   0 1�/�/ 0 beforeindex beforeIndexP m   1 2�.
�. 
msngN R   6 <�-QR
�- .ascrerr ****      � ****Q m   : ;SS �TT ( T o o   m a n y   p a r a m e t e r s .R �,U�+
�, 
errnU m   8 9�*�*�Y�+  �1  �0  L VWV r   A NXYX n  A LZ[Z I   F L�)\�(�) (0 asintegerparameter asIntegerParameter\ ]^] o   F G�'�' 0 
afterindex 
afterIndex^ _�&_ m   G H`` �aa  a f t e r   i t e m�&  �(  [ o   A F�%�% 0 _support  Y o      �$�$ 0 
afterindex 
afterIndexW bcb r   O \ded n  O Zfgf I   T Z�#h�"�# (0 asbooleanparameter asBooleanParameterh iji o   T U�!�! 0 isjoin isJoinj k� k m   U Vll �mm  c o n c a t e n a t i o n�   �"  g o   O T�� 0 _support  e o      �� 0 isjoin isJoinc non Z  ] tpq��p A   ] `rsr o   ] ^�� 0 
afterindex 
afterIndexs m   ^ _��  q r   c ptut [   c nvwv [   c lxyx l  c jz��z n  c j{|{ 1   f j�
� 
leng| n  c f}~} o   d f�� 
0 _list_  ~ o   c d�� 0 
listobject 
listObject�  �  y o   j k�� 0 
afterindex 
afterIndexw m   l m�� u o      �� 0 
afterindex 
afterIndex�  �  o � Z   u ������ ?   u ~��� o   u v�� 0 
afterindex 
afterIndex� l  v }���� n  v }��� 1   y }�
� 
leng� n  v y��� o   w y�
�
 
0 _list_  � o   v w�	�	 0 
listobject 
listObject�  �  � R   � ����
� .ascrerr ****      � ****� m   � ��� ��� , I n d e x   i s   o u t   o f   r a n g e .� ���
� 
errn� m   � ����@� ���
� 
erob� l  � ����� N   � ��� n   � ���� 9   � ��
� 
insl� n   � ���� 4   � �� �
�  
cobj� o   � ����� 0 
afterindex 
afterIndex� l  � ������� e   � ��� n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject��  ��  �  �  �  �  �  �  F ��� >  � ���� o   � ����� 0 beforeindex beforeIndex� m   � ���
�� 
msng� ���� k   �0�� ��� r   � ���� n  � ���� I   � �������� (0 asintegerparameter asIntegerParameter� ��� o   � ����� 0 beforeindex beforeIndex� ���� m   � ��� ���  b e f o r e   i t e m��  ��  � o   � ����� 0 _support  � o      ���� 0 beforeindex beforeIndex� ��� Z   � ������ ?   � ���� o   � ����� 0 beforeindex beforeIndex� m   � �����  � r   � ���� \   � ���� o   � ����� 0 beforeindex beforeIndex� m   � ����� � o      ���� 0 
afterindex 
afterIndex� ��� A   � ���� o   � ����� 0 beforeindex beforeIndex� m   � �����  � ���� r   � ���� [   � ���� l  � ������� n  � ���� 1   � ���
�� 
leng� n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject��  ��  � o   � ����� 0 beforeindex beforeIndex� o      ���� 0 
afterindex 
afterIndex��  � l  � ����� R   � �����
�� .ascrerr ****      � ****� m   � ��� ���  I n v a l i d   i n d e x .� ����
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
listObject��  ��  ��  ��  ��  � � � the `before item` parameter cannot identify the end of a list by negative index, so throw 'invalid index' error if `before item 0` is used   � ���   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   c a n n o t   i d e n t i f y   t h e   e n d   o f   a   l i s t   b y   n e g a t i v e   i n d e x ,   s o   t h r o w   ' i n v a l i d   i n d e x '   e r r o r   i f   ` b e f o r e   i t e m   0 `   i s   u s e d� ���� Z   �0������� G   ���� ?   ���� o   � ����� 0 
afterindex 
afterIndex� l  ������� n  ���� 1   ���
�� 
leng� n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject��  ��  � A  
��� o  ���� 0 
afterindex 
afterIndex� m  	����  � R  ,����
�� .ascrerr ****      � ****� m  (+�� ��� , I n d e x   i s   o u t   o f   r a n g e .� ����
�� 
errn� m  �����@� �����
�� 
erob� l %������ N  %�� n  $��� 8   $��
�� 
insl� n   ��� 4   ���
�� 
cobj� o  ���� 0 beforeindex beforeIndex� l ������ e  �� n ��� o  ���� 
0 _list_  � o  ���� 0 
listobject 
listObject��  ��  ��  ��  ��  ��  ��  ��  ��  G l 37���� L  37   b  36 o  34���� 0 thelist theList o  45���� 0 thevalue theValue� #  default is to append to list   � � :   d e f a u l t   i s   t o   a p p e n d   t o   l i s tC �� Z  8� =  8;	
	 o  89���� 0 
afterindex 
afterIndex
 m  9:����   L  >D b  >C o  >?���� 0 thevalue theValue n ?B o  @B���� 
0 _list_   o  ?@���� 0 
listobject 
listObject  =  GP o  GH���� 0 
afterindex 
afterIndex n HO 1  KO��
�� 
leng n HK o  IK���� 
0 _list_   o  HI���� 0 
listobject 
listObject �� L  SY b  SX n SV o  TV���� 
0 _list_   o  ST���� 0 
listobject 
listObject o  VW���� 0 thevalue theValue��   L  \� b  \  b  \m!"! l \k#����# n  \k$%$ 7 _k��&'
�� 
cobj& m  eg���� ' o  hj���� 0 
afterindex 
afterIndex% n \_()( o  ]_���� 
0 _list_  ) o  \]���� 0 
listobject 
listObject��  ��  " o  kl���� 0 thevalue theValue  l m~*����* n  m~+,+ 7 p~��-.
�� 
cobj- l vz/����/ [  vz010 o  wx���� 0 
afterindex 
afterIndex1 m  xy���� ��  ��  . m  {}������, n mp232 o  np���� 
0 _list_  3 o  mn���� 0 
listobject 
listObject��  ��  ��    R      ��45
�� .ascrerr ****      � ****4 o      ���� 0 etext eText5 ��67
�� 
errn6 o      ���� 0 enumber eNumber7 ��89
�� 
erob8 o      ���� 0 efrom eFrom9 ��:��
�� 
errt: o      ���� 
0 eto eTo��  ! I  ����;���� 
0 _error  ; <=< m  ��>> �??   i n s e r t   i n t o   l i s t= @A@ o  ������ 0 etext eTextA BCB o  ������ 0 enumber eNumberC DED o  ������ 0 efrom eFromE F��F o  ������ 
0 eto eTo��  ��  �J   � GHG l     ��������  ��  ��  H IJI l     ��������  ��  ��  J KLK i  % (MNM I     ��OP
�� .Lst:Delenull���     ****O o      ���� 0 thelist theListP ��QR
�� 
IndxQ |���S�~T��  �  S o      �}�} 0 theindex theIndex�~  T l     U�|�{U d      VV m      �z�z �|  �{  R �yWX
�y 
FIdxW |�x�wY�vZ�x  �w  Y o      �u�u 0 
startindex 
startIndex�v  Z l     [�t�s[ m      �r
�r 
msng�t  �s  X �q\�p
�q 
TIdx\ |�o�n]�m^�o  �n  ] o      �l�l 0 endindex endIndex�m  ^ l     _�k�j_ m      �i
�i 
msng�k  �j  �p  N Q    �`ab` k   �cc ded h    
�hf�h 0 
listobject 
listObjectf j     �gg�g 
0 _list_  g n    hih I    �fj�e�f "0 aslistparameter asListParameterj klk o    
�d�d 0 thelist theListl m�cm m   
 nn �oo  �c  �e  i o     �b�b 0 _support  e pqp r    rsr n   tut 1    �a
�a 
lengu n   vwv o    �`�` 
0 _list_  w o    �_�_ 0 
listobject 
listObjects o      �^�^ 0 
listlength 
listLengthq xyx Z   *z{�]�\z >   |}| o    �[�[ 0 
startindex 
startIndex} m    �Z
�Z 
msng{ r    &~~ n   $��� I    $�Y��X�Y (0 asintegerparameter asIntegerParameter� ��� o    �W�W 0 
startindex 
startIndex� ��V� m     �� ���  f r o m   i t e m�V  �X  � o    �U�U 0 _support   o      �T�T 0 
startindex 
startIndex�]  �\  y ��� Z  + B���S�R� >  + .��� o   + ,�Q�Q 0 endindex endIndex� m   , -�P
�P 
msng� r   1 >��� n  1 <��� I   6 <�O��N�O (0 asintegerparameter asIntegerParameter� ��� o   6 7�M�M 0 endindex endIndex� ��L� m   7 8�� ���  t o   i t e m�L  �N  � o   1 6�K�K 0 _support  � o      �J�J 0 endindex endIndex�S  �R  � ��� Z   C ���I�� F   C N��� =  C F��� o   C D�H�H 0 
startindex 
startIndex� m   D E�G
�G 
msng� =  I L��� o   I J�F�F 0 endindex endIndex� m   J K�E
�E 
msng� k   Q ��� ��� r   Q ^��� n  Q \��� I   V \�D��C�D (0 asintegerparameter asIntegerParameter� ��� o   V W�B�B 0 theindex theIndex� ��A� m   W X�� ���  i t e m�A  �C  � o   Q V�@�@ 0 _support  � o      �?�? 0 
startindex 
startIndex� ��� r   _ b��� o   _ `�>�> 0 
startindex 
startIndex� o      �=�= 0 endindex endIndex� ��� Z  c t���<�;� A   c f��� o   c d�:�: 0 
startindex 
startIndex� m   d e�9�9  � r   i p��� \   i n��� [   i l��� o   i j�8�8 0 
listlength 
listLength� m   j k�7�7 � o   l m�6�6 0 
startindex 
startIndex� o      �5�5 0 
startindex 
startIndex�<  �;  � ��4� Z  u ����3�2� G   u ���� =   u x��� o   u v�1�1 0 
startindex 
startIndex� m   v w�0�0  � ?   { ~��� o   { |�/�/ 0 
startindex 
startIndex� o   | }�.�. 0 
listlength 
listLength� R   � ��-��
�- .ascrerr ****      � ****� m   � ��� ��� b I n v a l i d   i n d e x   (  i t e m    p a r a m e t e r   i s   o u t   o f   r a n g e ) .� �,��
�, 
errn� m   � ��+�+�@� �*��)
�* 
erob� l  � ���(�'� N   � ��� n   � ���� 4   � ��&�
�& 
cobj� o   � ��%�% 0 
startindex 
startIndex� l  � ���$�#� e   � ��� n  � ���� o   � ��"�" 
0 _list_  � o   � ��!�! 0 
listobject 
listObject�$  �#  �(  �'  �)  �3  �2  �4  �I  � k   � �� ��� Z   � ����� � =  � ���� o   � ��� 0 
startindex 
startIndex� m   � ��
� 
msng� r   � ���� m   � ��� � o      �� 0 
startindex 
startIndex� ��� =  � ���� o   � ��� 0 endindex endIndex� m   � ��
� 
msng� ��� r   � ���� o   � ��� 0 
listlength 
listLength� o      �� 0 endindex endIndex�  �   � ��� Z  � ������ A   � ���� o   � ��� 0 
startindex 
startIndex� m   � ���  � r   � ���� [   � ���� [   � ���� o   � ��� 0 
listlength 
listLength� m   � ��� � o   � ��� 0 
startindex 
startIndex� o      �� 0 
startindex 
startIndex�  �  � ��� Z  � ������ A   � ���� o   � ��� 0 endindex endIndex� m   � ���  � r   � ���� [   � ���� [   � �   o   � ��
�
 0 
listlength 
listLength m   � ��	�	 � o   � ��� 0 endindex endIndex� o      �� 0 endindex endIndex�  �  �  Z  � ��� G   � � =   � �	 o   � ��� 0 
startindex 
startIndex	 m   � ���   ?   � �

 o   � ��� 0 
startindex 
startIndex o   � ��� 0 
listlength 
listLength R   � �� 
�  .ascrerr ****      � **** m   � � � l I n v a l i d   i n d e x   (  f r o m   i t e m    p a r a m e t e r   i s   o u t   o f   r a n g e ) . ��
�� 
errn m   � ������@ ����
�� 
erob l  � ����� N   � � n   � � 4   � ���
�� 
cobj o   � ����� 0 
startindex 
startIndex l  � ����� e   � � n  � � o   � ����� 
0 _list_   o   � ����� 0 
listobject 
listObject��  ��  ��  ��  ��  �  �   �� Z  � ���� G   �  =   � !"! o   � ����� 0 endindex endIndex" m   � �����    ?  #$# o  ���� 0 endindex endIndex$ o  ���� 0 
listlength 
listLength R  ��%&
�� .ascrerr ****      � ****% m  '' �(( h I n v a l i d   i n d e x   (  t o   i t e m    p a r a m e t e r   i s   o u t   o f   r a n g e ) .& ��)*
�� 
errn) m  �����@* ��+��
�� 
erob+ l ,����, N  -- n  ./. 4  ��0
�� 
cobj0 o  ���� 0 endindex endIndex/ l 1����1 e  22 n 343 o  ���� 
0 _list_  4 o  ���� 0 
listobject 
listObject��  ��  ��  ��  ��  ��  ��  ��  � 565 Z !>78����7 ?  !$9:9 o  !"���� 0 
startindex 
startIndex: o  "#���� 0 endindex endIndex8 r  ':;<; J  '+== >?> o  '(���� 0 endindex endIndex? @��@ o  ()���� 0 
startindex 
startIndex��  < J      AA BCB o      ���� 0 
startindex 
startIndexC D��D o      ���� 0 endindex endIndex��  ��  ��  6 EFE Z  ?sGH��IG =  ?BJKJ o  ?@���� 0 
startindex 
startIndexK m  @A���� H k  E_LL MNM Z EZOP����O G  EPQRQ =  EHSTS o  EF���� 0 
startindex 
startIndexT o  FG���� 0 
listlength 
listLengthR =  KNUVU o  KL���� 0 endindex endIndexV o  LM���� 0 
listlength 
listLengthP L  SVWW J  SU����  ��  ��  N X��X r  [_YZY J  []����  Z o      ���� 0 	startlist 	startList��  ��  I r  bs[\[ n bq]^] 7 eq��_`
�� 
cobj_ m  ik���� ` l lpa����a \  lpbcb o  mn���� 0 
startindex 
startIndexc m  no���� ��  ��  ^ n beded o  ce���� 
0 _list_  e o  bc���� 0 
listobject 
listObject\ o      ���� 0 	startlist 	startListF fgf Z  t�hi��jh =  twklk o  tu���� 0 endindex endIndexl o  uv���� 0 
listlength 
listLengthi r  z~mnm J  z|����  n o      ���� 0 endlist endList��  j r  ��opo n ��qrq 7 ����st
�� 
cobjs l ��u����u [  ��vwv o  ������ 0 endindex endIndexw m  ������ ��  ��  t m  ��������r n ��xyx o  ������ 
0 _list_  y o  ������ 0 
listobject 
listObjectp o      ���� 0 endlist endListg z��z L  ��{{ b  ��|}| o  ������ 0 	startlist 	startList} o  ������ 0 endlist endList��  a R      ��~
�� .ascrerr ****      � ****~ o      ���� 0 etext eText ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  b I  ��������� 
0 _error  � ��� m  ���� ���   d e l e t e   f r o m   l i s t� ��� o  ������ 0 etext eText� ��� o  ������ 0 enumber eNumber� ��� o  ������ 0 efrom eFrom� ���� o  ������ 
0 eto eTo��  ��  L ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  ) ,��� I     �����
�� .Lst:RDuLnull���     ****� o      ���� 0 thelist theList��  � Q     ����� k    ��� ��� h    
����� 0 
listobject 
listObject� j     ����� 
0 _list_  � n    ��� 2   ��
�� 
cobj� n    ��� I    ������� "0 aslistparameter asListParameter� ���� o    
���� 0 thelist theList��  ��  � o     ���� 0 _support  � ��� l   ������  �jd not the fastest algorithm as it's O(Nn) (the repeat loop is O(N) and each `is in` test is O(n)), but simple and consistent with AS's existing behaviors (for large lists it'd be more efficient to put each item into an NSMutableSet where practical then check for uniqueness against that, but that wouldn't respect AS's current considering/ignoring settings)   � ����   n o t   t h e   f a s t e s t   a l g o r i t h m   a s   i t ' s   O ( N n )   ( t h e   r e p e a t   l o o p   i s   O ( N )   a n d   e a c h   ` i s   i n `   t e s t   i s   O ( n ) ) ,   b u t   s i m p l e   a n d   c o n s i s t e n t   w i t h   A S ' s   e x i s t i n g   b e h a v i o r s   ( f o r   l a r g e   l i s t s   i t ' d   b e   m o r e   e f f i c i e n t   t o   p u t   e a c h   i t e m   i n t o   a n   N S M u t a b l e S e t   w h e r e   p r a c t i c a l   t h e n   c h e c k   f o r   u n i q u e n e s s   a g a i n s t   t h a t ,   b u t   t h a t   w o u l d n ' t   r e s p e c t   A S ' s   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s )� ��� r    *��� J    �� ��� m    ���� � ��� m    ���� � ���� n   ��� 1    ��
�� 
leng� n   ��� o    ���� 
0 _list_  � o    ���� 0 
listobject 
listObject��  � J      �� ��� o      ���� 0 i  � ��� o      ���� 0 u  � ���� o      ���� 0 
listlength 
listLength��  � ��� W   + ���� k   3 ��� ��� V   3 r��� k   N m�� ��� r   N S��� [   N Q��� o   N O���� 0 i  � m   O P���� � o      ���� 0 i  � ��� Z  T m���~�}� ?   T W��� o   T U�|�| 0 i  � o   U V�{�{ 0 
listlength 
listLength� L   Z i�� n  Z h��� 7  ] g�z��
�z 
cobj� m   a c�y�y � o   d f�x�x 0 u  � n  Z ]��� o   [ ]�w�w 
0 _list_  � o   Z [�v�v 0 
listobject 
listObject�~  �}  �  � E  7 M��� n  7 D��� 7  : D�u��
�u 
cobj� m   > @�t�t � o   A C�s�s 0 u  � n  7 :��� o   8 :�r�r 
0 _list_  � o   7 8�q�q 0 
listobject 
listObject� J   D L�� ��p� n  D J��� 4   G J�o�
�o 
cobj� o   H I�n�n 0 i  � n  D G��� o   E G�m�m 
0 _list_  � o   D E�l�l 0 
listobject 
listObject�p  � ��� r   s x��� [   s v��� o   s t�k�k 0 u  � m   t u�j�j � o      �i�i 0 u  � ��� r   y ���� n  y ��� 4   | �h�
�h 
cobj� o   } ~�g�g 0 i  � n  y |��� o   z |�f�f 
0 _list_  � o   y z�e�e 0 
listobject 
listObject� n     ��� 4   � ��d�
�d 
cobj� o   � ��c�c 0 u  � n   ���� o   � ��b�b 
0 _list_  � o    ��a�a 0 
listobject 
listObject�  �`  r   � � [   � � o   � ��_�_ 0 i   m   � ��^�^  o      �]�] 0 i  �`  � ?   / 2 o   / 0�\�\ 0 i   o   0 1�[�[ 0 
listlength 
listLength� �Z L   � � n  � �	
	 7  � ��Y
�Y 
cobj m   � ��X�X  o   � ��W�W 0 u  
 n  � � o   � ��V�V 
0 _list_   o   � ��U�U 0 
listobject 
listObject�Z  � R      �T
�T .ascrerr ****      � **** o      �S�S 0 etext eText �R
�R 
errn o      �Q�Q 0 enumber eNumber �P
�P 
erob o      �O�O 0 efrom eFrom �N�M
�N 
errt o      �L�L 
0 eto eTo�M  � I   � ��K�J�K 
0 _error    m   � � � 6 r e m o v e   d u p l i c a t e s   f r o m   l i s t  o   � ��I�I 0 etext eText  o   � ��H�H 0 enumber eNumber   o   � ��G�G 0 efrom eFrom  !�F! o   � ��E�E 
0 eto eTo�F  �J  � "#" l     �D�C�B�D  �C  �B  # $%$ l     �A�@�?�A  �@  �?  % &'& i  - 0()( I     �>*+
�> .Lst:SliLnull���     ***** o      �=�= 0 thelist theList+ �<,-
�< 
FIdx, |�;�:.�9/�;  �:  . o      �8�8 0 
startindex 
startIndex�9  / l     0�7�60 m      �5
�5 
msng�7  �6  - �41�3
�4 
TIdx1 |�2�12�03�2  �1  2 o      �/�/ 0 endindex endIndex�0  3 l     4�.�-4 m      �,
�, 
msng�.  �-  �3  ) Q    �5675 k   |88 9:9 r    ;<; n   =>= I    �+?�*�+ "0 aslistparameter asListParameter? @�)@ o    	�(�( 0 thelist theList�)  �*  > o    �'�' 0 _support  < o      �&�& 0 thelist theList: ABA r    CDC n   EFE 1    �%
�% 
lengF o    �$�$ 0 thelist theListD o      �#�# 0 	thelength 	theLengthB GHG Z    �IJK�"I >   LML o    �!�! 0 
startindex 
startIndexM m    � 
�  
msngJ k    oNN OPO r    )QRQ n   'STS I   ! '�U�� (0 asintegerparameter asIntegerParameterU VWV o   ! "�� 0 
startindex 
startIndexW X�X m   " #YY �ZZ  f r o m   i t e m�  �  T o    !�� 0 _support  R o      �� 0 
startindex 
startIndexP [\[ l  * *�]^�  ] J D note: index 0 is disallowed as it makes behavior confusing to users   ^ �__ �   n o t e :   i n d e x   0   i s   d i s a l l o w e d   a s   i t   m a k e s   b e h a v i o r   c o n f u s i n g   t o   u s e r s\ `a` Z  * <bc��b =   * -ded o   * +�� 0 
startindex 
startIndexe m   + ,��  c R   0 8�fg
� .ascrerr ****      � ****f m   6 7hh �ii d I n v a l i d   i n d e x   (  f r o m   i t e m    p a r a m e t e r   c a n n o t   b e   0 ) .g �jk
� 
errnj m   2 3���Yk �l�
� 
erobl o   4 5�� 0 
startindex 
startIndex�  �  �  a m�m Z   = ono��n =  = @pqp o   = >�� 0 endindex endIndexq m   > ?�

�
 
msngo Z   C krstur A   C Gvwv o   C D�	�	 0 
startindex 
startIndexw d   D Fxx o   D E�� 0 	thelength 	theLengths L   J Oyy n  J Nz{z 2  K M�
� 
cobj{ o   J K�� 0 thelist theListt |}| ?   R U~~ o   R S�� 0 
startindex 
startIndex o   S T�� 0 	thelength 	theLength} ��� L   X [�� J   X Z��  �  u L   ^ k�� n  ^ j��� 7  _ i���
� 
ctxt� o   c e� �  0 
startindex 
startIndex� m   f h������� o   ^ _���� 0 thelist theList�  �  �  K ��� =  r u��� o   r s���� 0 endindex endIndex� m   s t��
�� 
msng� ���� R   x ~����
�� .ascrerr ****      � ****� m   | }�� ��� ^ M i s s i n g    f r o m   i t e m    a n d / o r    t o   i t e m    p a r a m e t e r .� �����
�� 
errn� m   z {�����[��  ��  �"  H ��� Z   � �������� >  � ���� o   � ����� 0 endindex endIndex� m   � ���
�� 
msng� k   � ��� ��� r   � ���� n  � ���� I   � �������� (0 asintegerparameter asIntegerParameter� ��� o   � ����� 0 endindex endIndex� ���� m   � ��� ���  t o   i t e m��  ��  � o   � ����� 0 _support  � o      ���� 0 endindex endIndex� ��� Z  � �������� =   � ���� o   � ����� 0 endindex endIndex� m   � �����  � R   � �����
�� .ascrerr ****      � ****� m   � ��� ��� ` I n v a l i d   i n d e x   (  t o   i t e m    p a r a m e t e r   c a n n o t   b e   0 ) .� ����
�� 
errn� m   � ������Y� �����
�� 
erob� o   � ����� 0 endindex endIndex��  ��  ��  � ���� Z   � �������� =  � ���� o   � ����� 0 
startindex 
startIndex� m   � ���
�� 
msng� Z   � ������ A   � ���� o   � ����� 0 endindex endIndex� d   � ��� o   � ����� 0 	thelength 	theLength� L   � ��� J   � �����  � ��� ?   � ���� o   � ����� 0 endindex endIndex� o   � ����� 0 	thelength 	theLength� ���� L   � ��� n  � ���� 2  � ���
�� 
cobj� o   � ����� 0 thelist theList��  � L   � ��� n  � ���� 7  � �����
�� 
ctxt� m   � ����� � o   � ����� 0 endindex endIndex� o   � ����� 0 thelist theList��  ��  ��  ��  ��  � ��� l  � �������  � + % both start and end indexes are given   � ��� J   b o t h   s t a r t   a n d   e n d   i n d e x e s   a r e   g i v e n� ��� Z  � �������� A   � ���� o   � ����� 0 
startindex 
startIndex� m   � �����  � r   � ���� [   � ���� [   � ���� o   � ����� 0 	thelength 	theLength� m   � ����� � o   � ����� 0 
startindex 
startIndex� o      ���� 0 
startindex 
startIndex��  ��  � ��� Z  �������� A   � ���� o   � ����� 0 endindex endIndex� m   � �����  � r   � ��� [   � ���� [   � ���� o   � ����� 0 	thelength 	theLength� m   � ����� � o   � ����� 0 endindex endIndex� o      ���� 0 endindex endIndex��  ��  � ��� Z :������� G  0��� G  ��� ?  ��� o  ���� 0 
startindex 
startIndex� o  ���� 0 endindex endIndex� F  ��� A  ��� o  ���� 0 
startindex 
startIndex� m  ���� � A  ��� o  ���� 0 endindex endIndex� l 
������ m  ���� ��  ��  � F  ,��� ?  "��� o   ���� 0 
startindex 
startIndex� o   !���� 0 	thelength 	theLength� ?  %(��� o  %&���� 0 endindex endIndex� o  &'���� 0 	thelength 	theLength� L  36�� J  35����  ��  ��  �    Z  ;T�� A  ;> o  ;<���� 0 
startindex 
startIndex m  <=����  r  AD m  AB����  o      ���� 0 
startindex 
startIndex 	
	 ?  GJ o  GH���� 0 
startindex 
startIndex o  HI���� 0 	thelength 	theLength
 �� r  MP o  MN���� 0 	thelength 	theLength o      ���� 0 
startindex 
startIndex��  ��    Z  Un�� A  UX o  UV���� 0 endindex endIndex m  VW����  r  [^ m  [\����  o      ���� 0 endindex endIndex  ?  ad o  ab���� 0 endindex endIndex o  bc���� 0 	thelength 	theLength �� r  gj o  gh���� 0 	thelength 	theLength o      ���� 0 endindex endIndex��  ��    ��  L  o|!! n  o{"#" 7 pz��$%
�� 
cobj$ o  tv���� 0 
startindex 
startIndex% o  wy���� 0 endindex endIndex# o  op���� 0 thelist theList��  6 R      ��&'
�� .ascrerr ****      � ****& o      ���� 0 etext eText' ��()
�� 
errn( o      ���� 0 enumber eNumber) ��*+
�� 
erob* o      ���� 0 efrom eFrom+ ��,��
�� 
errt, o      ���� 
0 eto eTo��  7 I  ����-���� 
0 _error  - ./. m  ��00 �11  s l i c e   l i s t/ 232 o  ������ 0 etext eText3 454 o  ������ 0 enumber eNumber5 676 o  ������ 0 efrom eFrom7 8��8 o  ������ 
0 eto eTo��  ��  ' 9:9 l     ��������  ��  ��  : ;<; l     ��������  ��  ��  < =>= i  1 4?@? I     ��AB
�� .Lst:Trannull���     ****A o      ���� 0 thelist theListB ��CD
�� 
WhilC |��~E�}F�  �~  E o      �|�| 0 unevenoption unevenOption�}  F l     G�{�zG m      �y
�y LTrhLTrR�{  �z  D �xH�w
�x 
PadIH |�v�uI�tJ�v  �u  I o      �s�s 0 padvalue padValue�t  J l     K�r�qK m      �p
�p 
msng�r  �q  �w  @ Q    �LMNL k   OO PQP Z   RS�o�nR =   TUT o    �m�m 0 thelist theListU J    �l�l  S L   
 VV J   
 �k�k  �o  �n  Q WXW Z   >YZ�j�iY G    /[\[ =    ]^] l   _�h�g_ I   �f`a
�f .corecnte****       ****` J    bb c�ec o    �d�d 0 thelist theList�e  a �cd�b
�c 
kocld m    �a
�a 
list�b  �h  �g  ^ m    �`�`  \ >     -efe l    'g�_�^g I    '�]hi
�] .corecnte****       ****h o     !�\�\ 0 thelist theListi �[j�Z
�[ 
koclj m   " #�Y
�Y 
list�Z  �_  �^  f l  ' ,k�X�Wk I  ' ,�Vl�U
�V .corecnte****       ****l o   ' (�T�T 0 thelist theList�U  �X  �W  Z R   2 :�Smn
�S .ascrerr ****      � ****m m   8 9oo �pp ( N o t   a   l i s t   o f   l i s t s .n �Rqr
�R 
errnq m   4 5�Q�Q�Yr �Ps�O
�P 
erobs o   6 7�N�N 0 thelist theList�O  �j  �i  X tut h   ? F�Mv�M 0 
listobject 
listObjectv k      ww xyx j     �Lz�L 
0 _list_  z o     �K�K 0 thelist theListy {�J{ j    
�I|�I 0 _resultlist_ _resultList_| J    	�H�H  �J  u }~} r   G Q� n   G O��� 1   M O�G
�G 
leng� n  G M��� 4   J M�F�
�F 
cobj� m   K L�E�E � n  G J��� o   H J�D�D 
0 _list_  � o   G H�C�C 0 
listobject 
listObject� o      �B�B $0 resultlistlength resultListLength~ ��� l  R R�A���A  � K E find the longest/shortest sublist; this will be length of resultList   � ��� �   f i n d   t h e   l o n g e s t / s h o r t e s t   s u b l i s t ;   t h i s   w i l l   b e   l e n g t h   o f   r e s u l t L i s t� ��� Z   R����� =  R U��� o   R S�@�@ 0 unevenoption unevenOption� m   S T�?
�? LTrhLTrR� X   X ���>�� Z  j ����=�<� >   j o��� n  j m��� 1   k m�;
�; 
leng� o   j k�:�: 0 aref aRef� o   m n�9�9 $0 resultlistlength resultListLength� R   r ~�8��
�8 .ascrerr ****      � ****� m   z }�� ��� x I n v a l i d   d i r e c t   p a r a m e t e r   ( s u b l i s t s   a r e   n o t   a l l   s a m e   l e n g t h ) .� �7��
�7 
errn� m   t u�6�6�Y� �5��4
�5 
erob� l  v y��3�2� n  v y��� o   w y�1�1 
0 _list_  � o   v w�0�0 0 
listobject 
listObject�3  �2  �4  �=  �<  �> 0 aref aRef� n  [ ^��� o   \ ^�/�/ 
0 _list_  � o   [ \�.�. 0 
listobject 
listObject� ��� =  � ���� o   � ��-�- 0 unevenoption unevenOption� m   � ��,
�, LTrhLTrP� ��� X   � ���+�� Z  � ����*�)� ?   � ���� n  � ���� 1   � ��(
�( 
leng� o   � ��'�' 0 aref aRef� o   � ��&�& $0 resultlistlength resultListLength� r   � ���� n  � ���� 1   � ��%
�% 
leng� o   � ��$�$ 0 aref aRef� o      �#�# $0 resultlistlength resultListLength�*  �)  �+ 0 aref aRef� n  � ���� o   � ��"�" 
0 _list_  � o   � ��!�! 0 
listobject 
listObject� ��� =  � ���� o   � �� �  0 unevenoption unevenOption� m   � ��
� LTrhLTrT� ��� X   � ����� Z  � ������ A   � ���� n  � ���� 1   � ��
� 
leng� o   � ��� 0 aref aRef� o   � ��� $0 resultlistlength resultListLength� r   � ���� n  � ���� 1   � ��
� 
leng� o   � ��� 0 aref aRef� o      �� $0 resultlistlength resultListLength�  �  � 0 aref aRef� n  � ���� o   � ��� 
0 _list_  � o   � ��� 0 
listobject 
listObject�  � R   ����
� .ascrerr ****      � ****� m   ��� ��� h I n v a l i d    w h i l e    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .� ���
� 
errn� m   � ����Y� ���
� 
erob� o   � ��� 0 unevenoption unevenOption� ���
� 
errt� m   � ��
� 
enum�  � ��� l �
���
  � � � build empty matrix (due to inefficiencies of AS's list implementation, when populating large lists, it's probably quicker to create a padded list then set its items rather than start with an empty list and append items)   � ����   b u i l d   e m p t y   m a t r i x   ( d u e   t o   i n e f f i c i e n c i e s   o f   A S ' s   l i s t   i m p l e m e n t a t i o n ,   w h e n   p o p u l a t i n g   l a r g e   l i s t s ,   i t ' s   p r o b a b l y   q u i c k e r   t o   c r e a t e   a   p a d d e d   l i s t   t h e n   s e t   i t s   i t e m s   r a t h e r   t h a n   s t a r t   w i t h   a n   e m p t y   l i s t   a n d   a p p e n d   i t e m s )� ��� r  ��� I  �	���	 "0 _makelistobject _makeListObject� ��� n 	��� 1  	�
� 
leng� n ��� o  �� 
0 _list_  � o  �� 0 
listobject 
listObject� ��� o  	
�� 0 padvalue padValue�  �  � o      �� (0 emptyresultsublist emptyResultSubList� ��� Y  -����� � l (���� r  (��� l !������ e  !�� n !��� 2  ��
�� 
cobj� o  ���� (0 emptyresultsublist emptyResultSubList��  ��  � n      ���  ;  &'� n !&��� o  "&���� 0 _resultlist_ _resultList_� o  !"���� 0 
listobject 
listObject�   shallow copy   � ���    s h a l l o w   c o p y� 0 i  � m  ���� � l ������ \  ��� o  ���� $0 resultlistlength resultListLength� m  ���� ��  ��  �   �    r  .6 o  ./���� (0 emptyresultsublist emptyResultSubList n        ;  45 n /4 o  04���� 0 _resultlist_ _resultList_ o  /0���� 0 
listobject 
listObject 	 l 77��
��  
   populate matrix    �     p o p u l a t e   m a t r i x	  Y  7w���� Y  Fr���� r  Xm n  Xa 4  ^a��
�� 
cobj o  _`���� 0 j   n  X^ 4  [^��
�� 
cobj o  \]���� 0 i   n X[ o  Y[���� 
0 _list_   o  XY���� 0 
listobject 
listObject n        4  il��!
�� 
cobj! o  jk���� 0 i    n  ai"#" 4  fi��$
�� 
cobj$ o  gh���� 0 j  # n af%&% o  bf���� 0 _resultlist_ _resultList_& o  ab���� 0 
listobject 
listObject�� 0 j   m  IJ����  n  JS'(' 1  PR��
�� 
leng( n JP)*) 4  MP��+
�� 
cobj+ o  NO���� 0 i  * n JM,-, o  KM���� 
0 _list_  - o  JK���� 0 
listobject 
listObject��  �� 0 i   m  :;����  n ;A./. 1  >@��
�� 
leng/ n ;>010 o  <>���� 
0 _list_  1 o  ;<���� 0 
listobject 
listObject��   2��2 L  x33 n x~454 o  y}���� 0 _resultlist_ _resultList_5 o  xy���� 0 
listobject 
listObject��  M R      ��67
�� .ascrerr ****      � ****6 o      ���� 0 etext eText7 ��89
�� 
errn8 o      ���� 0 enumber eNumber9 ��:;
�� 
erob: o      ���� 0 efrom eFrom; ��<��
�� 
errt< o      ���� 
0 eto eTo��  N I  ����=���� 
0 _error  = >?> m  ��@@ �AA  t r a n s p o s e   l i s t? BCB o  ������ 0 etext eTextC DED o  ������ 0 enumber eNumberE FGF o  ������ 0 efrom eFromG H��H o  ������ 
0 eto eTo��  ��  > IJI l     ��������  ��  ��  J KLK l     ��������  ��  ��  L MNM l     ��OP��  O J D--------------------------------------------------------------------   P �QQ � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -N RSR l     ��TU��  T   search   U �VV    s e a r c hS WXW l     ��������  ��  ��  X YZY i  5 8[\[ I     ��]^
�� .Lst:Findnull���     ****] o      ���� 0 thelist theList^ ��_`
�� 
Valu_ o      ���� 0 theitem theItem` ��a��
�� 
Retua |����b��c��  ��  b o      ���� (0 findingoccurrences findingOccurrences��  c l     d����d m      ��
�� LFWhLFWA��  ��  ��  \ Q     �efge k    �hh iji h    
��k�� 0 
listobject 
listObjectk k      ll mnm j     ��o�� 
0 _list_  o n    pqp I    ��r���� "0 aslistparameter asListParameterr sts o    
���� 0 thelist theListt u��u m   
 vv �ww  ��  ��  q o     ���� 0 _support  n x��x j    ��y�� 0 _result_  y J    ����  ��  j z{z Z    �|}~| =   ��� o    ���� (0 findingoccurrences findingOccurrences� m    ��
�� LFWhLFWA} Y    :�������� Z     5������� =    (��� n     &��� 4   # &���
�� 
cobj� o   $ %���� 0 i  � n    #��� o   ! #���� 
0 _list_  � o     !���� 0 
listobject 
listObject� o   & '���� 0 theitem theItem� r   + 1��� o   + ,���� 0 i  � n      ���  ;   / 0� n  , /��� o   - /���� 0 _result_  � o   , -���� 0 
listobject 
listObject��  ��  �� 0 i  � m    ���� � n    ��� 1    ��
�� 
leng� n   ��� o    ���� 
0 _list_  � o    ���� 0 
listobject 
listObject��  ~ ��� =  = @��� o   = >���� (0 findingoccurrences findingOccurrences� m   > ?��
�� LFWhLFWF� ��� Y   C n�������� Z   R i������� =  R Z��� n   R X��� 4   U X���
�� 
cobj� o   V W���� 0 i  � n  R U��� o   S U���� 
0 _list_  � o   R S���� 0 
listobject 
listObject� o   X Y���� 0 theitem theItem� k   ] e�� ��� r   ] c��� o   ] ^���� 0 i  � n      ���  ;   a b� n  ^ a��� o   _ a���� 0 _result_  � o   ^ _���� 0 
listobject 
listObject� ����  S   d e��  ��  ��  �� 0 i  � m   F G���� � n   G M��� 1   J L�
� 
leng� n  G J��� o   H J�~�~ 
0 _list_  � o   G H�}�} 0 
listobject 
listObject��  � ��� =  q t��� o   q r�|�| (0 findingoccurrences findingOccurrences� m   r s�{
�{ LFWhLFWL� ��z� Y   w ���y���� Z   � ����x�w� =  � ���� n   � ���� 4   � ��v�
�v 
cobj� o   � ��u�u 0 i  � n  � ���� o   � ��t�t 
0 _list_  � o   � ��s�s 0 
listobject 
listObject� o   � ��r�r 0 theitem theItem� k   � ��� ��� r   � ���� o   � ��q�q 0 i  � n      ���  ;   � �� n  � ���� o   � ��p�p 0 _result_  � o   � ��o�o 0 
listobject 
listObject� ��n�  S   � ��n  �x  �w  �y 0 i  � n   z ���� 1   } �m
�m 
leng� n  z }��� o   { }�l�l 
0 _list_  � o   z {�k�k 0 
listobject 
listObject� m   � ��j�j � m   � ��i�i���z   R   � ��h��
�h .ascrerr ****      � ****� m   � ��� ��� p I n v a l i d    r e t u r n i n g    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .� �g��
�g 
errn� m   � ��f�f�Y� �e��
�e 
erob� o   � ��d�d (0 findingoccurrences findingOccurrences� �c��b
�c 
errt� m   � ��a
�a 
enum�b  { ��`� L   � ��� n  � ���� o   � ��_�_ 0 _result_  � o   � ��^�^ 0 
listobject 
listObject�`  f R      �]��
�] .ascrerr ****      � ****� o      �\�\ 0 etext eText� �[��
�[ 
errn� o      �Z�Z 0 enumber eNumber� �Y��
�Y 
erob� o      �X�X 0 efrom eFrom� �W��V
�W 
errt� o      �U�U 
0 eto eTo�V  g I   � ��T��S�T 
0 _error  � ��� m   � ��� ���  f i n d   i n   l i s t� ��� o   � ��R�R 0 etext eText� ��� o   � ��Q�Q 0 enumber eNumber� ��� o   � ��P�P 0 efrom eFrom� ��O� o   � ��N�N 
0 eto eTo�O  �S  Z ��� l     �M�L�K�M  �L  �K  � ��� l     �J�I�H�J  �I  �H  � ��� l     �G���G  � J D--------------------------------------------------------------------   � �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -�  l     �F�F  ZT map, filter, reduce (these operations are relatively trivial to perform in AS without the need for callbacks; however, these handlers are more flexible when the convert/check/combine operations are parameterized and also provide more advanced users with idiomatic examples of how to parameterize a general-purpose handler's exact behavior)    ��   m a p ,   f i l t e r ,   r e d u c e   ( t h e s e   o p e r a t i o n s   a r e   r e l a t i v e l y   t r i v i a l   t o   p e r f o r m   i n   A S   w i t h o u t   t h e   n e e d   f o r   c a l l b a c k s ;   h o w e v e r ,   t h e s e   h a n d l e r s   a r e   m o r e   f l e x i b l e   w h e n   t h e   c o n v e r t / c h e c k / c o m b i n e   o p e r a t i o n s   a r e   p a r a m e t e r i z e d   a n d   a l s o   p r o v i d e   m o r e   a d v a n c e d   u s e r s   w i t h   i d i o m a t i c   e x a m p l e s   o f   h o w   t o   p a r a m e t e r i z e   a   g e n e r a l - p u r p o s e   h a n d l e r ' s   e x a c t   b e h a v i o r )  l     �E�D�C�E  �D  �C   	 l     �B
�B  
 � � note: while these handlers prevent the script object from modifying the input list directly, it cannot stop them modifying mutable (date/list/record/script/reference) items within the input list (doing so would be very bad practice, however)    ��   n o t e :   w h i l e   t h e s e   h a n d l e r s   p r e v e n t   t h e   s c r i p t   o b j e c t   f r o m   m o d i f y i n g   t h e   i n p u t   l i s t   d i r e c t l y ,   i t   c a n n o t   s t o p   t h e m   m o d i f y i n g   m u t a b l e   ( d a t e / l i s t / r e c o r d / s c r i p t / r e f e r e n c e )   i t e m s   w i t h i n   t h e   i n p u t   l i s t   ( d o i n g   s o   w o u l d   b e   v e r y   b a d   p r a c t i c e ,   h o w e v e r )	  l     �A�@�?�A  �@  �?    i  9 < I     �>
�> .Lst:Map_null���     **** o      �=�= 0 thelist theList �<�;
�< 
Usin o      �:�: 0 	thescript 	theScript�;   Q     � k    �  h    
�9�9 $0 resultlistobject resultListObject j     �8�8 
0 _list_   n      2   �7
�7 
cobj n     !  I    �6"�5�6 "0 aslistparameter asListParameter" #$# o    
�4�4 0 thelist theList$ %�3% m   
 && �''  �3  �5  ! o     �2�2 0 _support   ()( r    *+* n   ,-, I    �1.�0�1 &0 asscriptparameter asScriptParameter. /0/ o    �/�/ 0 	thescript 	theScript0 1�.1 m    22 �33 
 u s i n g�.  �0  - o    �-�- 0 _support  + o      �,�, 0 	thescript 	theScript) 454 Q    �6786 Y    B9�+:;�*9 l  + =<=>< r   + =?@? n  + 6ABA I   , 6�)C�(�) 0 convertitem convertItemC D�'D n   , 2EFE 4   / 2�&G
�& 
cobjG o   0 1�%�% 0 i  F n  , /HIH o   - /�$�$ 
0 _list_  I o   , -�#�# $0 resultlistobject resultListObject�'  �(  B o   + ,�"�" 0 	thescript 	theScript@ n      JKJ 4   9 <�!L
�! 
cobjL o   : ;� �  0 i  K n  6 9MNM o   7 9�� 
0 _list_  N o   6 7�� $0 resultlistobject resultListObject= � ~ use counting loop rather than `repeat with aRef in theList` as the item's index is also used when constructing error messages   > �OO �   u s e   c o u n t i n g   l o o p   r a t h e r   t h a n   ` r e p e a t   w i t h   a R e f   i n   t h e L i s t `   a s   t h e   i t e m ' s   i n d e x   i s   a l s o   u s e d   w h e n   c o n s t r u c t i n g   e r r o r   m e s s a g e s�+ 0 i  : m     �� ; n     &PQP 1   # %�
� 
lengQ n    #RSR o   ! #�� 
0 _list_  S o     !�� $0 resultlistobject resultListObject�*  7 R      �TU
� .ascrerr ****      � ****T o      �� 0 etext eTextU �VW
� 
errnV o      �� 0 enumber eNumberW �X�
� 
errtX o      �� 
0 eto eTo�  8 k   J �YY Z[Z Z   J h\]�^\ ?   J M_`_ o   J K�� 0 i  ` m   K L�� ] r   P aaba n   P _cdc 7  S _�ef
� 
cobje m   W Y�� f l  Z ^g��g \   Z ^hih o   [ \�� 0 i  i m   \ ]�
�
 �  �  d n  P Sjkj o   Q S�	�	 
0 _list_  k o   P Q�� $0 resultlistobject resultListObjectb o      �� 0 epartial ePartial�  ^ r   d hlml J   d f��  m o      �� 0 epartial ePartial[ n�n R   i ��op
� .ascrerr ****      � ****o b   z �qrq b   z �sts b   z uvu m   z }ww �xx , C o u l d n ' t   c o n v e r t   i t e m  v o   } ~�� 0 i  t m    �yy �zz  :  r o   � ��� 0 etext eTextp � {|
�  
errn{ o   k l���� 0 enumber eNumber| ��}~
�� 
erob} l  m u���� N   m u�� n   m t��� 4   q t���
�� 
cobj� o   r s���� 0 i  � l  m q������ e   m q�� n  m q��� o   n p���� 
0 _list_  � o   m n���� 0 
listobject 
listObject��  ��  ��  ��  ~ ����
�� 
errt� o   v w���� 
0 eto eTo� �����
�� 
ptlr� o   x y���� 0 epartial ePartial��  �  5 ���� L   � ��� n  � ���� o   � ����� 
0 _list_  � o   � ����� $0 resultlistobject resultListObject��   R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� ����
�� 
errt� o      ���� 
0 eto eTo� �����
�� 
ptlr� o      ���� 0 epartial ePartial��   I   � �������� 20 _errorwithpartialresult _errorWithPartialResult� ��� m   � ��� ���  m a p   l i s t� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ��� o   � ����� 
0 eto eTo� ���� o   � ����� 0 epartial ePartial��  ��   ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  = @��� I     ����
�� .Lst:Filtnull���     ****� o      ���� 0 thelist theList� �����
�� 
Usin� o      ���� 0 	thescript 	theScript��  � Q     ����� k    ��� ��� h    
����� $0 resultlistobject resultListObject� j     ����� 
0 _list_  � n     ��� 2   ��
�� 
cobj� n    ��� I    ������� "0 aslistparameter asListParameter� ��� o    
���� 0 thelist theList� ���� m   
 �� ���  ��  ��  � o     ���� 0 _support  � ��� r    ��� n   ��� I    ������� &0 asscriptparameter asScriptParameter� ��� o    ���� 0 	thescript 	theScript� ���� m    �� ��� 
 u s i n g��  ��  � o    ���� 0 _support  � o      ���� 0 	thescript 	theScript� ��� r    ��� m    ����  � o      ���� 0 	lastindex 	lastIndex� ��� Q    ����� Y     X�������� k   / S�� ��� r   / 7��� n   / 5��� 4   2 5���
�� 
cobj� o   3 4���� 0 i  � n  / 2��� o   0 2���� 
0 _list_  � o   / 0���� $0 resultlistobject resultListObject� o      ���� 0 theitem theItem� ���� Z   8 S������� n  8 >��� I   9 >������� 0 	checkitem 	checkItem� ���� o   9 :���� 0 theitem theItem��  ��  � o   8 9���� 0 	thescript 	theScript� k   A O�� ��� r   A F��� [   A D��� o   A B���� 0 	lastindex 	lastIndex� m   B C���� � o      ���� 0 	lastindex 	lastIndex� ���� r   G O��� o   G H���� 0 theitem theItem� n      ��� 4   K N���
�� 
cobj� o   L M���� 0 	lastindex 	lastIndex� n  H K��� o   I K���� 
0 _list_  � o   H I���� $0 resultlistobject resultListObject��  ��  ��  ��  �� 0 i  � m   # $���� � n   $ *��� 1   ' )��
�� 
leng� n  $ '��� o   % '���� 
0 _list_  � o   $ %���� $0 resultlistobject resultListObject��  � R      ��� 
�� .ascrerr ****      � ****� o      ���� 0 etext eText  ��
�� 
errn o      ���� 0 enumber eNumber ����
�� 
errt o      ���� 
0 eto eTo��  � k   ` �  Z   ` ~��	 ?   ` c

 o   ` a���� 0 	lastindex 	lastIndex m   a b����  r   f w n   f u 7  i u��
�� 
cobj m   m o����  l  p t���� \   p t o   q r���� 0 	lastindex 	lastIndex m   r s���� ��  ��   n  f i o   g i���� 
0 _list_   o   f g���� $0 resultlistobject resultListObject o      ���� 0 epartial ePartial��  	 r   z ~ J   z |����   o      ���� 0 epartial ePartial �� R    ���
�� .ascrerr ****      � **** b   � � b   � � b   � � !  m   � �"" �## * C o u l d n ' t   f i l t e r   i t e m  ! o   � ����� 0 i   m   � �$$ �%%  :   o   � ����� 0 etext eText ��&'
�� 
errn& o   � ����� 0 enumber eNumber' ��()
�� 
erob( l  � �*����* N   � �++ n   � �,-, 4   � ���.
�� 
cobj. o   � ����� 0 i  - l  � �/����/ e   � �00 n  � �121 o   � ����� 
0 _list_  2 o   � ����� 0 
listobject 
listObject��  ��  ��  ��  ) �34
� 
errt3 o   � ��~�~ 
0 eto eTo4 �}5�|
�} 
ptlr5 o   � ��{�{ 0 epartial ePartial�|  ��  � 676 Z  � �89�z�y8 =   � �:;: o   � ��x�x 0 	lastindex 	lastIndex; m   � ��w�w  9 L   � �<< J   � ��v�v  �z  �y  7 =�u= L   � �>> n  � �?@? 7  � ��tAB
�t 
cobjA m   � ��s�s B o   � ��r�r 0 	lastindex 	lastIndex@ n  � �CDC o   � ��q�q 
0 _list_  D o   � ��p�p $0 resultlistobject resultListObject�u  � R      �oEF
�o .ascrerr ****      � ****E o      �n�n 0 etext eTextF �mGH
�m 
errnG o      �l�l 0 enumber eNumberH �kIJ
�k 
erobI o      �j�j 0 efrom eFromJ �iKL
�i 
errtK o      �h�h 
0 eto eToL �gM�f
�g 
ptlrM o      �e�e 0 epartial ePartial�f  � I   � ��dN�c�d 20 _errorwithpartialresult _errorWithPartialResultN OPO m   � �QQ �RR  f i l t e r   l i s tP STS o   � ��b�b 0 etext eTextT UVU o   � ��a�a 0 enumber eNumberV WXW o   � ��`�` 0 efrom eFromX YZY o   � ��_�_ 
0 eto eToZ [�^[ o   � ��]�] 0 epartial ePartial�^  �c  � \]\ l     �\�[�Z�\  �[  �Z  ] ^_^ l     �Y�X�W�Y  �X  �W  _ `a` i  A Dbcb I     �Vde
�V .Lst:Redunull���     ****d o      �U�U 0 thelist theListe �Tf�S
�T 
Usinf o      �R�R 0 	thescript 	theScript�S  c k     �gg hih r     jkj o     �Q�Q 0 missingvalue missingValuek o      �P�P 0 	theresult 	theResulti l�Ol Q    �mnom k    �pp qrq h    �Ns�N 0 
listobject 
listObjects j     �Mt�M 
0 _list_  t n    uvu I    �Lw�K�L "0 aslistparameter asListParameterw xyx o    
�J�J 0 thelist theListy z�Iz m   
 {{ �||  �I  �K  v o     �H�H 0 _support  r }~} Z   &��G�F =    ��� n    ��� 1    �E
�E 
leng� n   ��� o    �D�D 
0 _list_  � o    �C�C 0 
listobject 
listObject� m    �B�B  � R    "�A��
�A .ascrerr ****      � ****� m     !�� ���  L i s t   i s   e m p t y .� �@��
�@ 
errn� m    �?�?�Y� �>��=
�> 
erob� J    �<�<  �=  �G  �F  ~ ��� r   ' 4��� n  ' 2��� I   , 2�;��:�; &0 asscriptparameter asScriptParameter� ��� o   , -�9�9 0 	thescript 	theScript� ��8� m   - .�� ��� 
 u s i n g�8  �:  � o   ' ,�7�7 0 _support  � o      �6�6 0 	thescript 	theScript� ��� r   5 =��� n   5 ;��� 4   8 ;�5�
�5 
cobj� m   9 :�4�4 � n  5 8��� o   6 8�3�3 
0 _list_  � o   5 6�2�2 0 
listobject 
listObject� o      �1�1 0 	theresult 	theResult� ��� Q   > ����� Y   A c��0���/� r   P ^��� n  P \��� I   Q \�.��-�. 0 combineitems combineItems� ��� o   Q R�,�, 0 	theresult 	theResult� ��+� n   R X��� 4   U X�*�
�* 
cobj� o   V W�)�) 0 i  � n  R U��� o   S U�(�( 
0 _list_  � o   R S�'�' 0 
listobject 
listObject�+  �-  � o   P Q�&�& 0 	thescript 	theScript� o      �%�% 0 	theresult 	theResult�0 0 i  � m   D E�$�$ � n   E K��� 1   H J�#
�# 
leng� n  E H��� o   F H�"�" 
0 _list_  � o   E F�!�! 0 
listobject 
listObject�/  � R      � ��
�  .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
errt� o      �� 
0 eto eTo�  � R   k ����
� .ascrerr ****      � ****� b   ~ ���� b   ~ ���� b   ~ ���� m   ~ ��� ��� * C o u l d n ' t   r e d u c e   i t e m  � o   � ��� 0 i  � m   � ��� ���  :  � o   � ��� 0 etext eText� ���
� 
errn� o   m n�� 0 enumber eNumber� ���
� 
erob� l  o w���� N   o w�� n   o v��� 4   s v��
� 
cobj� o   t u�� 0 i  � l  o s���� e   o s�� n  o s��� o   p r�� 
0 _list_  � o   o p�� 0 
listobject 
listObject�  �  �  �  � ���

� 
errt� o   z {�	�	 
0 eto eTo�
  � ��� L   � ��� o   � ��� 0 	theresult 	theResult�  n R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� � ���
�  
errt� o      ���� 
0 eto eTo��  o I   � �������� 20 _errorwithpartialresult _errorWithPartialResult� ��� m   � ��� ���  r e d u c e   l i s t� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ��� o   � ����� 
0 eto eTo� ���� o   � ����� 0 	theresult 	theResult��  ��  �O  a ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   sort   � ��� 
   s o r t� 	 		  l     ��������  ��  ��  	 			 l      ��		��  	�� Notes: 

- Quicksort provides between [best case] O(n * log n) and [worst case] O(n * n) efficiency, typically leaning towards the former in all but the most pathological cases.

- One limitation of quicksort is that it isn't stable, i.e. items that compare as equal can appear in any order in the resulting list; their original order isn't preserved. An alternate algorithm such as Heapsort would avoid this, but would likely be significantly slower on average (while heapsort is guaranteed to be O(n * log n), it has much higher constant overhead than quicksort which tends to be fast in all but the most degenerate cases).

- This implementation trades some speed for greater robustness and flexibility, sorting a 10,000-number list in ~1sec, whereas a bare-bones quicksort might be 2x faster. OTOH, if you want fast code then AppleScript's the absolute last language you want to be using anyway, (e.g. Python's `sorted` function is 100x faster). For sorting simple lists of number/text/date values it's probably much quicker to send the AS list across the ASOC bridge and use -[NSArray sortedArray...], but that doesn't generalize to other use cases so isn't used here.

   	 �			0   N o t e s :   
 
 -   Q u i c k s o r t   p r o v i d e s   b e t w e e n   [ b e s t   c a s e ]   O ( n   *   l o g   n )   a n d   [ w o r s t   c a s e ]   O ( n   *   n )   e f f i c i e n c y ,   t y p i c a l l y   l e a n i n g   t o w a r d s   t h e   f o r m e r   i n   a l l   b u t   t h e   m o s t   p a t h o l o g i c a l   c a s e s . 
 
 -   O n e   l i m i t a t i o n   o f   q u i c k s o r t   i s   t h a t   i t   i s n ' t   s t a b l e ,   i . e .   i t e m s   t h a t   c o m p a r e   a s   e q u a l   c a n   a p p e a r   i n   a n y   o r d e r   i n   t h e   r e s u l t i n g   l i s t ;   t h e i r   o r i g i n a l   o r d e r   i s n ' t   p r e s e r v e d .   A n   a l t e r n a t e   a l g o r i t h m   s u c h   a s   H e a p s o r t   w o u l d   a v o i d   t h i s ,   b u t   w o u l d   l i k e l y   b e   s i g n i f i c a n t l y   s l o w e r   o n   a v e r a g e   ( w h i l e   h e a p s o r t   i s   g u a r a n t e e d   t o   b e   O ( n   *   l o g   n ) ,   i t   h a s   m u c h   h i g h e r   c o n s t a n t   o v e r h e a d   t h a n   q u i c k s o r t   w h i c h   t e n d s   t o   b e   f a s t   i n   a l l   b u t   t h e   m o s t   d e g e n e r a t e   c a s e s ) . 
 
 -   T h i s   i m p l e m e n t a t i o n   t r a d e s   s o m e   s p e e d   f o r   g r e a t e r   r o b u s t n e s s   a n d   f l e x i b i l i t y ,   s o r t i n g   a   1 0 , 0 0 0 - n u m b e r   l i s t   i n   ~ 1 s e c ,   w h e r e a s   a   b a r e - b o n e s   q u i c k s o r t   m i g h t   b e   2 x   f a s t e r .   O T O H ,   i f   y o u   w a n t   f a s t   c o d e   t h e n   A p p l e S c r i p t ' s   t h e   a b s o l u t e   l a s t   l a n g u a g e   y o u   w a n t   t o   b e   u s i n g   a n y w a y ,   ( e . g .   P y t h o n ' s   ` s o r t e d `   f u n c t i o n   i s   1 0 0 x   f a s t e r ) .   F o r   s o r t i n g   s i m p l e   l i s t s   o f   n u m b e r / t e x t / d a t e   v a l u e s   i t ' s   p r o b a b l y   m u c h   q u i c k e r   t o   s e n d   t h e   A S   l i s t   a c r o s s   t h e   A S O C   b r i d g e   a n d   u s e   - [ N S A r r a y   s o r t e d A r r a y . . . ] ,   b u t   t h a t   d o e s n ' t   g e n e r a l i z e   t o   o t h e r   u s e   c a s e s   s o   i s n ' t   u s e d   h e r e . 
 
	 			 l     ��������  ��  ��  	 			
		 l     ��������  ��  ��  	
 			 l     				 j   E I��	�� *0 _quicksortthreshold _quicksortThreshold	 m   E H���� 	 T N shorter ranges are sorted using insertion sort; longer ranges using quicksort   	 �		 �   s h o r t e r   r a n g e s   a r e   s o r t e d   u s i n g   i n s e r t i o n   s o r t ;   l o n g e r   r a n g e s   u s i n g   q u i c k s o r t	 			 l     ��������  ��  ��  	 			 i  J M			 I      ��	���� 	0 _sort  	 			 o      ���� $0 resultlistobject resultListObject	 			 o      ���� 0 
startindex 
startIndex	 			 o      ���� 0 endindex endIndex	 		 	 o      ����  0 sortcomparator sortComparator	  	!��	! o      ���� 0 usequicksort useQuickSort��  ��  	 l   	"	#	$	" k    	%	% 	&	'	& Z    t	(	)����	( o     ���� 0 usequicksort useQuickSort	) l  p	*	+	,	* k   p	-	- 	.	/	. Z   	0	1����	0 A    		2	3	2 \    	4	5	4 o    ���� 0 endindex endIndex	5 o    ���� 0 
startindex 
startIndex	3 m    ���� 	1 L    ����  ��  ��  	/ 	6	7	6 r    &	8	9	8 J    	:	: 	;	<	; o    ���� 0 
startindex 
startIndex	< 	=��	= o    ���� 0 endindex endIndex��  	9 J      	>	> 	?	@	? o      ���� 0 	leftindex 	leftIndex	@ 	A��	A o      ���� 0 
rightindex 
rightIndex��  	7 	B	C	B r   ' 8	D	E	D n   ' 6	F	G	F 3   4 6��
�� 
cobj	G n   ' 4	H	I	H 7  * 4��	J	K
�� 
cobj	J o   . 0���� 0 
startindex 
startIndex	K o   1 3���� 0 endindex endIndex	I n  ' *	L	M	L o   ( *���� 
0 _keys_  	M o   ' (���� $0 resultlistobject resultListObject	E o      ���� 0 
pivotvalue 
pivotValue	C 	N	O	N V   9;	P	Q	P k   A6	R	R 	S	T	S Q   A �	U	V	W	U V   D d	X	Y	X l  Z _	Z	[	\	Z r   Z _	]	^	] [   Z ]	_	`	_ o   Z [���� 0 	leftindex 	leftIndex	` m   [ \���� 	^ o      ���� 0 	leftindex 	leftIndex	[ � z while cmp returns -1; note that if compareKeys() returns a non-numeric value/no result, this will throw -1700/-2763 error   	\ �	a	a �   w h i l e   c m p   r e t u r n s   - 1 ;   n o t e   t h a t   i f   c o m p a r e K e y s ( )   r e t u r n s   a   n o n - n u m e r i c   v a l u e / n o   r e s u l t ,   t h i s   w i l l   t h r o w   - 1 7 0 0 / - 2 7 6 3   e r r o r	Y A   H Y	b	c	b c   H W	d	e	d n  H U	f	g	f I   I U��	h���� 0 comparekeys compareKeys	h 	i	j	i e   I P	k	k n   I P	l	m	l 4   L O��	n
�� 
cobj	n o   M N���� 0 	leftindex 	leftIndex	m n  I L	o	p	o o   J L���� 
0 _keys_  	p o   I J���� $0 resultlistobject resultListObject	j 	q��	q o   P Q���� 0 
pivotvalue 
pivotValue��  ��  	g o   H I����  0 sortcomparator sortComparator	e m   U V��
�� 
nmbr	c m   W X����  	V R      ��	r	s
�� .ascrerr ****      � ****	r o      ���� 0 etext eText	s ��	t	u
�� 
errn	t o      ���� 0 enum eNum	u ��	v	w
�� 
erob	v o      ���� 0 efrom eFrom	w ��	x��
�� 
errt	x o      ���� 
0 eto eTo��  	W R   l ���	y	z
�� .ascrerr ****      � ****	y b   | 	{	|	{ m   | }	}	} �	~	~ < C o u l d n ' t   c o m p a r e   o b j e c t   k e y s :  	| o   } ~���� 0 etext eText	z ��		�
�� 
errn	 o   n o���� 0 enum eNum	� ��	�	�
�� 
erob	� J   p y	�	� 	�	�	� n   p v	�	�	� 4   s v��	�
�� 
cobj	� o   t u���� 0 	leftindex 	leftIndex	� n  p s	�	�	� o   q s���� 
0 _keys_  	� o   p q���� $0 resultlistobject resultListObject	� 	���	� o   v w���� 0 
pivotvalue 
pivotValue��  	� ��	���
�� 
errt	� o   z {���� 
0 eto eTo��  	T 	�	�	� Q   � �	�	�	�	� V   � �	�	�	� l  � �	�	�	�	� r   � �	�	�	� \   � �	�	�	� o   � ����� 0 
rightindex 
rightIndex	� m   � ����� 	� o      ���� 0 
rightindex 
rightIndex	�   while cmp returns 1;    	� �	�	� ,   w h i l e   c m p   r e t u r n s   1 ;  	� ?   � �	�	�	� c   � �	�	�	� n  � �	�	�	� I   � ���	����� 0 comparekeys compareKeys	� 	�	�	� n   � �	�	�	� 4   � ���	�
�� 
cobj	� o   � ����� 0 
rightindex 
rightIndex	� n  � �	�	�	� o   � ����� 
0 _keys_  	� o   � ����� $0 resultlistobject resultListObject	� 	���	� o   � ����� 0 
pivotvalue 
pivotValue��  ��  	� o   � �����  0 sortcomparator sortComparator	� m   � ���
�� 
nmbr	� m   � �����  	� R      ��	�	�
�� .ascrerr ****      � ****	� o      ���� 0 etext eText	� ��	�	�
�� 
errn	� o      ���� 0 enum eNum	� ��	�	�
�� 
erob	� o      ���� 0 efrom eFrom	� ��	���
�� 
errt	� o      ���� 
0 eto eTo��  	� R   � ���	�	�
�� .ascrerr ****      � ****	� b   � �	�	�	� m   � �	�	� �	�	� < C o u l d n ' t   c o m p a r e   o b j e c t   k e y s :  	� o   � ����� 0 etext eText	� ��	�	�
�� 
errn	� o   � ����� 0 enum eNum	� ��	�	�
�� 
erob	� J   � �	�	� 	�	�	� n   � �	�	�	� 4   � ��	�
� 
cobj	� o   � ��~�~ 0 
rightindex 
rightIndex	� n  � �	�	�	� o   � ��}�} 
0 _keys_  	� o   � ��|�| $0 resultlistobject resultListObject	� 	��{	� o   � ��z�z 0 
pivotvalue 
pivotValue�{  	� �y	��x
�y 
errt	� o   � ��w�w 
0 eto eTo�x  	� 	��v	� Z   �6	�	��u�t	� l  � �	��s�r	� H   � �	�	� ?   � �	�	�	� o   � ��q�q 0 	leftindex 	leftIndex	� o   � ��p�p 0 
rightindex 
rightIndex�s  �r  	� k   �2	�	� 	�	�	� r   � �	�	�	� J   � �	�	� 	�	�	� e   � �	�	� n   � �	�	�	� 4   � ��o	�
�o 
cobj	� o   � ��n�n 0 
rightindex 
rightIndex	� n  � �	�	�	� o   � ��m�m 
0 _keys_  	� o   � ��l�l $0 resultlistobject resultListObject	� 	��k	� e   � �	�	� n   � �	�	�	� 4   � ��j	�
�j 
cobj	� o   � ��i�i 0 	leftindex 	leftIndex	� n  � �	�	�	� o   � ��h�h 
0 _keys_  	� o   � ��g�g $0 resultlistobject resultListObject�k  	� J      	�	� 	�	�	� n      	�	�	� 4   � ��f	�
�f 
cobj	� o   � ��e�e 0 	leftindex 	leftIndex	� n  � �	�	�	� o   � ��d�d 
0 _keys_  	� o   � ��c�c $0 resultlistobject resultListObject	� 	��b	� n      	�	�	� 4   � ��a	�
�a 
cobj	� o   � ��`�` 0 
rightindex 
rightIndex	� n  � �	�	�	� o   � ��_�_ 
0 _keys_  	� o   � ��^�^ $0 resultlistobject resultListObject�b  	� 	�	�	� r   �	�	�	� J   �	�	� 	�	�	� e   � �	�	� n   � �	�	�	� 4   � ��]	�
�] 
cobj	� o   � ��\�\ 0 
rightindex 
rightIndex	� n  � �	�	�	� o   � ��[�[ 
0 _list_  	� o   � ��Z�Z $0 resultlistobject resultListObject	� 	��Y	� e   � �	�	� n   � �	�
 	� 4   � ��X

�X 
cobj
 o   � ��W�W 0 	leftindex 	leftIndex
  n  � �


 o   � ��V�V 
0 _list_  
 o   � ��U�U $0 resultlistobject resultListObject�Y  	� J      

 


 n      


 4  	�T
	
�T 
cobj
	 o  
�S�S 0 	leftindex 	leftIndex
 n 	




 o  	�R�R 
0 _list_  
 o  �Q�Q $0 resultlistobject resultListObject
 
�P
 n      


 4  �O

�O 
cobj
 o  �N�N 0 
rightindex 
rightIndex
 n 


 o  �M�M 
0 _list_  
 o  �L�L $0 resultlistobject resultListObject�P  	� 
�K
 r  2


 J  #

 


 [  


 o  �J�J 0 	leftindex 	leftIndex
 m  �I�I 
 
�H
 \  !


 o  �G�G 0 
rightindex 
rightIndex
 m   �F�F �H  
 J      

 


 o      �E�E 0 	leftindex 	leftIndex
 
 �D
  o      �C�C 0 
rightindex 
rightIndex�D  �K  �u  �t  �v  	Q B   = @
!
"
! o   = >�B�B 0 	leftindex 	leftIndex
" o   > ?�A�A 0 
rightindex 
rightIndex	O 
#�@
# Q  <p
$
%
&
$ k  ?g
'
' 
(
)
( I  ?Q�?
*�>�? 	0 _sort  
* 
+
,
+ o  @A�=�= $0 resultlistobject resultListObject
, 
-
.
- o  AB�<�< 0 
startindex 
startIndex
. 
/
0
/ o  BC�;�; 0 
rightindex 
rightIndex
0 
1
2
1 o  CD�:�:  0 sortcomparator sortComparator
2 
3�9
3 ?  DM
4
5
4 \  DG
6
7
6 o  DE�8�8 0 
rightindex 
rightIndex
7 o  EF�7�7 0 
startindex 
startIndex
5 o  GL�6�6 *0 _quicksortthreshold _quicksortThreshold�9  �>  
) 
8
9
8 I  Rd�5
:�4�5 	0 _sort  
: 
;
<
; o  ST�3�3 $0 resultlistobject resultListObject
< 
=
>
= o  TU�2�2 0 	leftindex 	leftIndex
> 
?
@
? o  UV�1�1 0 endindex endIndex
@ 
A
B
A o  VW�0�0  0 sortcomparator sortComparator
B 
C�/
C ?  W`
D
E
D \  WZ
F
G
F o  WX�.�. 0 endindex endIndex
G o  XY�-�- 0 	leftindex 	leftIndex
E o  Z_�,�, *0 _quicksortthreshold _quicksortThreshold�/  �4  
9 
H�+
H L  eg�*�*  �+  
% R      �)�(
I
�) .ascrerr ****      � ****�(  
I �'
J�&
�' 
errn
J d      
K
K m      �%�%
��&  
& l oo�$
L
M�$  
L r l stack overflow, so fall-through to use non-recursive insertion sort (this should rarely happen in practice)   
M �
N
N �   s t a c k   o v e r f l o w ,   s o   f a l l - t h r o u g h   t o   u s e   n o n - r e c u r s i v e   i n s e r t i o n   s o r t   ( t h i s   s h o u l d   r a r e l y   h a p p e n   i n   p r a c t i c e )�@  	+ � � sort mostly uses quicksort, but falls through to insertionsort when sorting small number of items (<8), or when sorting a mostly-sorted list, or when quicksort recursion exceeds AS's stack depth   	, �
O
O�   s o r t   m o s t l y   u s e s   q u i c k s o r t ,   b u t   f a l l s   t h r o u g h   t o   i n s e r t i o n s o r t   w h e n   s o r t i n g   s m a l l   n u m b e r   o f   i t e m s   ( < 8 ) ,   o r   w h e n   s o r t i n g   a   m o s t l y - s o r t e d   l i s t ,   o r   w h e n   q u i c k s o r t   r e c u r s i o n   e x c e e d s   A S ' s   s t a c k   d e p t h��  ��  	' 
P
Q
P l uu�#
R
S�#  
R � � fall-through to use loop-based insertion sort when sorting a small number of items (for which it is faster than quicksort), or when quicksort recursion overflows AppleScript's call stack   
S �
T
Tv   f a l l - t h r o u g h   t o   u s e   l o o p - b a s e d   i n s e r t i o n   s o r t   w h e n   s o r t i n g   a   s m a l l   n u m b e r   o f   i t e m s   ( f o r   w h i c h   i t   i s   f a s t e r   t h a n   q u i c k s o r t ) ,   o r   w h e n   q u i c k s o r t   r e c u r s i o n   o v e r f l o w s   A p p l e S c r i p t ' s   c a l l   s t a c k
Q 
U
V
U r  uz
W
X
W [  ux
Y
Z
Y o  uv�"�" 0 
startindex 
startIndex
Z m  vw�!�! 
X o      � �  0 
startindex 
startIndex
V 
[�
[ Y  {
\�
]
^�
\ Y  �
_�
`
a
b
_ k  �
c
c 
d
e
d r  ��
f
g
f J  ��
h
h 
i
j
i e  ��
k
k n  ��
l
m
l 4  ���
n
� 
cobj
n l ��
o��
o \  ��
p
q
p o  ���� 0 j  
q m  ���� �  �  
m n ��
r
s
r o  ���� 
0 _keys_  
s o  ���� $0 resultlistobject resultListObject
j 
t�
t e  ��
u
u n  ��
v
w
v 4  ���
x
� 
cobj
x o  ���� 0 j  
w n ��
y
z
y o  ���� 
0 _keys_  
z o  ���� $0 resultlistobject resultListObject�  
g J      
{
{ 
|
}
| o      �� 0 leftkey leftKey
} 
~�
~ o      �� 0 rightkey rightKey�  
e 

�
 l ��
�
�
�
� Z ��
�
���
� A  ��
�
�
� n ��
�
�
� I  ���

��	�
 0 comparekeys compareKeys
� 
�
�
� o  ���� 0 leftkey leftKey
� 
��
� o  ���� 0 rightkey rightKey�  �	  
� o  ����  0 sortcomparator sortComparator
� m  ���� 
�  S  ���  �  
� !  stop when leftKey�rightKey   
� �
�
� 6   s t o p   w h e n   l e f t K e y"d r i g h t K e y
� 
�
�
� r  ��
�
�
� J  ��
�
� 
�
�
� o  ���� 0 rightkey rightKey
� 
��
� o  ���� 0 leftkey leftKey�  
� J      
�
� 
�
�
� n      
�
�
� 4  ��� 
�
�  
cobj
� l ��
�����
� \  ��
�
�
� o  ������ 0 j  
� m  ������ ��  ��  
� n ��
�
�
� o  ������ 
0 _keys_  
� o  ������ $0 resultlistobject resultListObject
� 
���
� n      
�
�
� 4  ����
�
�� 
cobj
� o  ������ 0 j  
� n ��
�
�
� o  ������ 
0 _keys_  
� o  ������ $0 resultlistobject resultListObject��  
� 
���
� r  �
�
�
� J  ��
�
� 
�
�
� e  ��
�
� n  ��
�
�
� 4  ����
�
�� 
cobj
� o  ������ 0 j  
� n ��
�
�
� o  ������ 
0 _list_  
� o  ������ $0 resultlistobject resultListObject
� 
���
� e  ��
�
� n  ��
�
�
� 4  ����
�
�� 
cobj
� l ��
�����
� \  ��
�
�
� o  ������ 0 j  
� m  ������ ��  ��  
� n ��
�
�
� o  ������ 
0 _list_  
� o  ������ $0 resultlistobject resultListObject��  
� J      
�
� 
�
�
� n      
�
�
� 4  ���
�
�� 
cobj
� l �
�����
� \  �
�
�
� o  ������ 0 j  
� m  � ���� ��  ��  
� n ��
�
�
� o  ������ 
0 _list_  
� o  ������ $0 resultlistobject resultListObject
� 
���
� n      
�
�
� 4  ��
�
�� 
cobj
� o  ���� 0 j  
� n 
�
�
� o  	���� 
0 _list_  
� o  	���� $0 resultlistobject resultListObject��  ��  � 0 j  
` o  ������ 0 i  
a o  ������ 0 
startindex 
startIndex
b m  ��������� 0 i  
] o  ~���� 0 
startindex 
startIndex
^ o  ����� 0 endindex endIndex�  �  	# 1 + performs in-place quicksort/insertionsort	   	$ �
�
� V   p e r f o r m s   i n - p l a c e   q u i c k s o r t / i n s e r t i o n s o r t 		 
�
�
� l     ��������  ��  ��  
� 
�
�
� l     ��������  ��  ��  
� 
�
�
� l     ��������  ��  ��  
� 
�
�
� i  N Q
�
�
� I     ��
�
�
�� .Lst:Sortnull���     ****
� o      ���� 0 thelist theList
� ��
���
�� 
Comp
� |����
���
���  ��  
� o      ����  0 sortcomparator sortComparator��  
� l     
�����
� m      ��
�� 
msng��  ��  ��  
� k    �
�
� 
�
�
� l     ��
�
���  
�.( note that `sort list` currently doesn't implement a `reversed order` parameter as its quicksort algorithm isn't stable (i.e. items that compare as equal will appear in any order, not the order in which they were supplied), so such an option would be useless in practice and rather misleading too. (To get a list in descending order, just get the returned list's `reverse` property or else pass a comparator containing a suitable compareKeys handler.) This parameter can always be added in future if/when a stable sorting algorithm is ever implemented.   
� �
�
�P   n o t e   t h a t   ` s o r t   l i s t `   c u r r e n t l y   d o e s n ' t   i m p l e m e n t   a   ` r e v e r s e d   o r d e r `   p a r a m e t e r   a s   i t s   q u i c k s o r t   a l g o r i t h m   i s n ' t   s t a b l e   ( i . e .   i t e m s   t h a t   c o m p a r e   a s   e q u a l   w i l l   a p p e a r   i n   a n y   o r d e r ,   n o t   t h e   o r d e r   i n   w h i c h   t h e y   w e r e   s u p p l i e d ) ,   s o   s u c h   a n   o p t i o n   w o u l d   b e   u s e l e s s   i n   p r a c t i c e   a n d   r a t h e r   m i s l e a d i n g   t o o .   ( T o   g e t   a   l i s t   i n   d e s c e n d i n g   o r d e r ,   j u s t   g e t   t h e   r e t u r n e d   l i s t ' s   ` r e v e r s e `   p r o p e r t y   o r   e l s e   p a s s   a   c o m p a r a t o r   c o n t a i n i n g   a   s u i t a b l e   c o m p a r e K e y s   h a n d l e r . )   T h i s   p a r a m e t e r   c a n   a l w a y s   b e   a d d e d   i n   f u t u r e   i f / w h e n   a   s t a b l e   s o r t i n g   a l g o r i t h m   i s   e v e r   i m p l e m e n t e d .
� 
���
� Q    �
�
�
�
� k   o
�
� 
�
�
� r    
�
�
� n   
�
�
� I    ��
����� "0 aslistparameter asListParameter
� 
�
�
� o    	���� 0 thelist theList
� 
���
� m   	 

�
� �
�
�  ��  ��  
� o    ���� 0 _support  
� o      ���� 0 thelist theList
� 
�
�
� h    ��
��� $0 resultlistobject resultListObject
� k      
�
� 
�
�
� l     
�
�
�
� j     	�� �� 
0 _keys_    n      2   ��
�� 
cobj o     ���� 0 thelist theList
� ~ x (replacing items in an existing list of the correct length is a little faster than appending items to a new empty list)   
� � �   ( r e p l a c i n g   i t e m s   i n   a n   e x i s t i n g   l i s t   o f   t h e   c o r r e c t   l e n g t h   i s   a   l i t t l e   f a s t e r   t h a n   a p p e n d i n g   i t e m s   t o   a   n e w   e m p t y   l i s t )
� �� j   
 ���� 
0 _list_   n   
  2   ��
�� 
cobj o   
 ���� 0 thelist theList��  
� 	 Z   ,
����
 A      n    1    ��
�� 
leng n    o    ���� 
0 _list_   o    ���� $0 resultlistobject resultListObject m    ����  L   # ( n  # ' o   $ &���� 
0 _list_   o   # $���� $0 resultlistobject resultListObject��  ��  	  Z   - J�� =  - 0 o   - .����  0 sortcomparator sortComparator m   . /��
�� 
msng r   3 : I  3 8������
�� .Lst:DeSonull��� ��� null��  ��   o      ����  0 sortcomparator sortComparator��   r   = J n  = H !  I   B H��"���� &0 asscriptparameter asScriptParameter" #$# o   B C����  0 sortcomparator sortComparator$ %��% m   C D&& �'' 
 u s i n g��  ��  ! o   = B���� 0 _support   o      ����  0 sortcomparator sortComparator ()( l  K K��*+��  * M G call comparator's makeKey method to generate each sortable key in turn   + �,, �   c a l l   c o m p a r a t o r ' s   m a k e K e y   m e t h o d   t o   g e n e r a t e   e a c h   s o r t a b l e   k e y   i n   t u r n) -.- l  K ^/01/ r   K ^232 J   K O44 565 m   K L����  6 7��7 m   L M����  ��  3 J      88 9:9 o      ����  0 ascendingcount ascendingCount: ;��; o      ���� "0 descendingcount descendingCount��  0 � � while generating keys also check if list is already almost/fully sorted (either ascending or descending) and if it is use insertionsort/return as-is   1 �<<*   w h i l e   g e n e r a t i n g   k e y s   a l s o   c h e c k   i f   l i s t   i s   a l r e a d y   a l m o s t / f u l l y   s o r t e d   ( e i t h e r   a s c e n d i n g   o r   d e s c e n d i n g )   a n d   i f   i t   i s   u s e   i n s e r t i o n s o r t / r e t u r n   a s - i s. =>= Q   _@?@A? k   b&BB CDC Q   b �EFGE r   e sHIH n  e qJKJ I   f q��L���� 0 makekey makeKeyL M��M e   f mNN n   f mOPO 4   i l��Q
�� 
cobjQ m   j k���� P n  f iRSR o   g i���� 
0 _keys_  S o   f g���� $0 resultlistobject resultListObject��  ��  K o   e f����  0 sortcomparator sortComparatorI o      ���� 0 previouskey previousKeyF R      ��TU
�� .ascrerr ****      � ****T o      ���� 0 etext eTextU ��VW
�� 
errnV o      ���� 0 enum eNumW ��X��
�� 
errtX o      ���� 
0 eto eTo��  G R   { ���YZ
�� .ascrerr ****      � ****Y b   � �[\[ m   � �]] �^^ : C o u l d n ' t   m a k e K e y   f o r   i t e m   1 :  \ o   � ����� 0 etext eTextZ ��_`
�� 
errn_ o    ����� 0 enum eNum` ��ab
�� 
eroba l  � �c����c N   � �dd n   � �efe 4   � ��g
� 
cobjg m   � ��~�~ f l  � �h�}�|h e   � �ii n  � �jkj o   � ��{�{ 
0 _list_  k o   � ��z�z $0 resultlistobject resultListObject�}  �|  ��  ��  b �yl�x
�y 
errtl o   � ��w�w 
0 eto eTo�x  D mnm r   � �opo o   � ��v�v 0 previouskey previousKeyp n      qrq 4   � ��us
�u 
cobjs m   � ��t�t r n  � �tut o   � ��s�s 
0 _keys_  u o   � ��r�r $0 resultlistobject resultListObjectn v�qv Y   �&w�pxy�ow k   �!zz {|{ Q   � �}~} r   � ���� n  � ���� I   � ��n��m�n 0 makekey makeKey� ��l� n   � ���� 4   � ��k�
�k 
cobj� o   � ��j�j 0 i  � n  � ���� o   � ��i�i 
0 _keys_  � o   � ��h�h $0 resultlistobject resultListObject�l  �m  � o   � ��g�g  0 sortcomparator sortComparator� o      �f�f 0 
currentkey 
currentKey~ R      �e��
�e .ascrerr ****      � ****� o      �d�d 0 etext eText� �c��
�c 
errn� o      �b�b 0 enum eNum� �a��`
�a 
errt� o      �_�_ 
0 eto eTo�`   R   � ��^��
�^ .ascrerr ****      � ****� b   � ���� b   � ���� b   � ���� m   � ��� ��� 4 C o u l d n ' t   m a k e K e y   f o r   i t e m  � o   � ��]�] 0 i  � m   � ��� ���  :  � o   � ��\�\ 0 etext eText� �[��
�[ 
errn� o   � ��Z�Z 0 enum eNum� �Y��
�Y 
erob� l  � ���X�W� N   � ��� n   � ���� 4   � ��V�
�V 
cobj� o   � ��U�U 0 i  � l  � ���T�S� e   � ��� n  � ���� o   � ��R�R 
0 _list_  � o   � ��Q�Q $0 resultlistobject resultListObject�T  �S  �X  �W  � �P��O
�P 
errt� o   � ��N�N 
0 eto eTo�O  | ��� r   � ���� o   � ��M�M 0 
currentkey 
currentKey� n      ��� 4   � ��L�
�L 
cobj� o   � ��K�K 0 i  � n  � ���� o   � ��J�J 
0 _keys_  � o   � ��I�I $0 resultlistobject resultListObject� ��� r   � ���� n  � ���� I   � ��H��G�H 0 comparekeys compareKeys� ��� o   � ��F�F 0 previouskey previousKey� ��E� o   � ��D�D 0 
currentkey 
currentKey�E  �G  � o   � ��C�C  0 sortcomparator sortComparator� o      �B�B 0 keycomparison keyComparison� ��� Z   ����A� A   ��� o   �@�@ 0 keycomparison keyComparison� m  �?�?  � l ���� r  ��� [  	��� o  �>�>  0 ascendingcount ascendingCount� m  �=�= � o      �<�<  0 ascendingcount ascendingCount�   current key is larger   � ��� ,   c u r r e n t   k e y   i s   l a r g e r� ��� ?  ��� o  �;�; 0 keycomparison keyComparison� m  �:�:  � ��9� l ���� r  ��� [  ��� o  �8�8 "0 descendingcount descendingCount� m  �7�7 � o      �6�6 "0 descendingcount descendingCount�   previous key is larger   � ��� .   p r e v i o u s   k e y   i s   l a r g e r�9  �A  � ��5� r  !��� o  �4�4 0 
currentkey 
currentKey� o      �3�3 0 previouskey previousKey�5  �p 0 i  x m   � ��2�2 y n  � ���� 1   � ��1
�1 
leng� n  � ���� o   � ��0�0 
0 _keys_  � o   � ��/�/ $0 resultlistobject resultListObject�o  �q  @ R      �.��
�. .ascrerr ****      � ****� o      �-�- 0 etext eText� �,��
�, 
errn� o      �+�+ 0 enum eNum� �*��
�* 
erob� o      �)�) 0 efrom eFrom� �(��'
�( 
errt� o      �&�& 
0 eto eTo�'  A R  .@�%��
�% .ascrerr ****      � ****� o  >?�$�$ 0 etext eText� �#��
�# 
errn� o  23�"�" 0 enum eNum� �!��
�! 
erob� o  67� �  0 efrom eFrom� ���
� 
errt� o  :;�� 
0 eto eTo�  > ��� l AA����  � � �	log "   ORDEREDNESS=" & (ascendingCount * 100 div ((resultListObject's _list_'s length) - 1)) & " " & (descendingCount * 100 div ((resultListObject's _list_'s length) - 1))   � ���Z 	 l o g   "       O R D E R E D N E S S = "   &   ( a s c e n d i n g C o u n t   *   1 0 0   d i v   ( ( r e s u l t L i s t O b j e c t ' s   _ l i s t _ ' s   l e n g t h )   -   1 ) )   &   "   "   &   ( d e s c e n d i n g C o u n t   *   1 0 0   d i v   ( ( r e s u l t L i s t O b j e c t ' s   _ l i s t _ ' s   l e n g t h )   -   1 ) )� ��� l AA����  � B <		log "  ASC=" & ascendingCount & " DESC=" & descendingCount   � ��� x 	 	 l o g   "     A S C = "   &   a s c e n d i n g C o u n t   &   "   D E S C = "   &   d e s c e n d i n g C o u n t� ��� Z  Ai����� ?  AD��� o  AB�� "0 descendingcount descendingCount� m  BC��  � l Ge�� � k  Ge  l GT r  GT l GR	��	 ?  GR

 n GL 1  JL�
� 
leng n GJ o  HJ�� 
0 _list_   o  GH�� $0 resultlistobject resultListObject o  LQ�� *0 _quicksortthreshold _quicksortThreshold�  �   o      �� 0 usequicksort useQuickSort B < TO DO: or if list is nearly ordered then use insertion sort    � x   T O   D O :   o r   i f   l i s t   i s   n e a r l y   o r d e r e d   t h e n   u s e   i n s e r t i o n   s o r t � I  Ue��� 	0 _sort    o  VW�� $0 resultlistobject resultListObject  m  WX��   n X] 1  []�

�
 
leng n X[ o  Y[�	�	 
0 _list_   o  XY�� $0 resultlistobject resultListObject  o  ]^��  0 sortcomparator sortComparator � o  ^_�� 0 usequicksort useQuickSort�  �  �  �   some sorting required     �   ,   s o m e   s o r t i n g   r e q u i r e d�  �  � !�! L  jo"" n jn#$# o  km�� 
0 _list_  $ o  jk�� $0 resultlistobject resultListObject�  
� R      �%&
� .ascrerr ****      � ****% o      � �  0 etext eText& ��'(
�� 
errn' o      ���� 0 enumber eNumber( ��)*
�� 
erob) o      ���� 0 efrom eFrom* ��+��
�� 
errt+ o      ���� 
0 eto eTo��  
� I  w���,���� 
0 _error  , -.- m  x{// �00  s o r t   l i s t. 121 o  {|���� 0 etext eText2 343 o  |}���� 0 enumber eNumber4 565 o  }~���� 0 efrom eFrom6 7��7 o  ~���� 
0 eto eTo��  ��  ��  
� 898 l     ��������  ��  ��  9 :;: l     ��������  ��  ��  ; <=< i  R U>?> I     ������
�� .Lst:DeSonull��� ��� null��  ��  ? h     ��@�� &0 defaultcomparator DefaultComparator@ k      AA BCB j     ��D�� "0 _supportedtypes _supportedTypesD J     EE FGF m     ��
�� 
nmbrG HIH m    ��
�� 
ctxtI J��J m    ��
�� 
ldt ��  C KLK j    	��M�� 	0 _type  M m    ��
�� 
msngL NON i   
 PQP I      ��R���� 0 makekey makeKeyR S��S o      ���� 0 anobject anObject��  ��  Q k     }TT UVU Z     zWXY��W =    Z[Z o     ���� 	0 _type  [ m    ��
�� 
msngX k   
 K\\ ]^] X   
 B_��`_ Z    =ab����a ?    *cdc l   (e����e I   (��fg
�� .corecnte****       ****f J    hh i��i o    ���� 0 anobject anObject��  g ��j��
�� 
koclj l    $k����k e     $ll n    $mnm 1   ! #��
�� 
pcntn o     !���� 0 aref aRef��  ��  ��  ��  ��  d m   ( )����  b k   - 9oo pqp r   - 6rsr n  - 0tut 1   . 0��
�� 
pcntu o   - .���� 0 aref aRefs o      ���� 	0 _type  q v��v L   7 9ww o   7 8���� 0 anobject anObject��  ��  ��  �� 0 aref aRef` n   xyx o    ���� "0 _supportedtypes _supportedTypesy  f    ^ z��z R   C K��{|
�� .ascrerr ****      � ****{ m   I J}} �~~ � I n v a l i d   i t e m   t y p e   ( d e f a u l t   c o m p a r a t o r   c a n   o n l y   c o m p a r e   i n t e g e r / r e a l ,   t e x t ,   o r   d a t e   t y p e s ) .| ���
�� 
errn m   E F�����\� �����
�� 
erob� o   G H���� 0 anobject anObject��  ��  Y ��� =   N ]��� l  N [������ I  N [����
�� .corecnte****       ****� J   N Q�� ���� o   N O���� 0 anobject anObject��  � �����
�� 
kocl� o   R W���� 	0 _type  ��  ��  ��  � m   [ \����  � ���� R   ` v����
�� .ascrerr ****      � ****� b   f u��� b   f s��� b   f o��� b   f m��� m   f g�� ��� ^ I n v a l i d   i t e m   t y p e   ( d e f a u l t   c o m p a r a t o r   e x p e c t e d  � o   g l���� 	0 _type  � m   m n�� ���    b u t   r e c e i v e d  � l  o r������ n   o r��� m   p r��
�� 
pcls� o   o p���� 0 anobject anObject��  ��  � m   s t�� ���  ) .� ����
�� 
errn� m   b c�����\� �����
�� 
erob� o   d e���� 0 anobject anObject��  ��  ��  V ���� L   { }�� o   { |���� 0 anobject anObject��  O ���� i   ��� I      ������� 0 comparekeys compareKeys� ��� o      ���� 0 
leftobject 
leftObject� ���� o      ���� 0 rightobject rightObject��  ��  � Z     ����� A     ��� o     ���� 0 
leftobject 
leftObject� o    ���� 0 rightobject rightObject� L    �� m    ������� ��� ?    ��� o    ���� 0 
leftobject 
leftObject� o    ���� 0 rightobject rightObject� ���� L    �� m    ���� ��  � L    �� m    ����  ��  = ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  V Y��� I     ������
�� .Lst:NuSonull��� ��� null��  ��  � h     ����� &0 numericcomparator NumericComparator� k      �� ��� i    ��� I      ������� 0 makekey makeKey� ���� o      ���� 0 anobject anObject��  ��  � L     �� c     ��� o     ���� 0 anobject anObject� m    ��
�� 
nmbr� ���� i   ��� I      ������� 0 comparekeys compareKeys� ��� o      ���� 0 
leftobject 
leftObject� ���� o      ���� 0 rightobject rightObject��  ��  � l    ���� L     �� \     ��� o     ���� 0 
leftobject 
leftObject� o    ���� 0 rightobject rightObject��� note: since compareKeys' return value can be any -ve/0/+ve number, a single subtraction operation is sufficient for numbers and dates. (Caveat: this doesn't take into account minor differences due to real imprecision. Currently this doesn't matter as quicksort isn't stable anyway so makes no guarantees about the order of [imprecisely] equal items; however, if quicksort ever gets replaced with a stable sorting algorithm then this method will need revised to use Number library's `cmp` instead.)   � ����   n o t e :   s i n c e   c o m p a r e K e y s '   r e t u r n   v a l u e   c a n   b e   a n y   - v e / 0 / + v e   n u m b e r ,   a   s i n g l e   s u b t r a c t i o n   o p e r a t i o n   i s   s u f f i c i e n t   f o r   n u m b e r s   a n d   d a t e s .   ( C a v e a t :   t h i s   d o e s n ' t   t a k e   i n t o   a c c o u n t   m i n o r   d i f f e r e n c e s   d u e   t o   r e a l   i m p r e c i s i o n .   C u r r e n t l y   t h i s   d o e s n ' t   m a t t e r   a s   q u i c k s o r t   i s n ' t   s t a b l e   a n y w a y   s o   m a k e s   n o   g u a r a n t e e s   a b o u t   t h e   o r d e r   o f   [ i m p r e c i s e l y ]   e q u a l   i t e m s ;   h o w e v e r ,   i f   q u i c k s o r t   e v e r   g e t s   r e p l a c e d   w i t h   a   s t a b l e   s o r t i n g   a l g o r i t h m   t h e n   t h i s   m e t h o d   w i l l   n e e d   r e v i s e d   t o   u s e   N u m b e r   l i b r a r y ' s   ` c m p `   i n s t e a d . )��  � ��� l     ����~��  �  �~  � ��� l     �}�|�{�}  �|  �{  � ��� i  Z ]��� I     �z�y�x
�z .Lst:DaSonull��� ��� null�y  �x  � h     �w��w  0 datecomparator DateComparator� k      �� ��� i    ��� I      �v��u�v 0 makekey makeKey� ��t� o      �s�s 0 anobject anObject�t  �u  � L     �� c     ��� o     �r�r 0 anobject anObject� m    �q
�q 
ldt � ��p� i   ��� I      �o��n�o 0 comparekeys compareKeys� ��� o      �m�m 0 
leftobject 
leftObject� ��l� o      �k�k 0 rightobject rightObject�l  �n  � l    ���� L     �� \     ��� o     �j�j 0 
leftobject 
leftObject� o    �i�i 0 rightobject rightObject� Y S as in NumericComparator, a simple subtraction operation produces a suitable result   � ��� �   a s   i n   N u m e r i c C o m p a r a t o r ,   a   s i m p l e   s u b t r a c t i o n   o p e r a t i o n   p r o d u c e s   a   s u i t a b l e   r e s u l t�p  � ��� l     �h�g�f�h  �g  �f  � ��� l     �e�d�c�e  �d  �c  �    i  ^ a I     �b�a
�b .Lst:TeSonull��� ��� null�a   �`�_
�` 
Cons |�^�]�\�^  �]   o      �[�[  0 orderingoption orderingOption�\   l     �Z�Y m      �X
�X SrtECmpI�Z  �Y  �_   Q     }	
	 k    g  h    
�W�W B0 currentconsiderationscomparator CurrentConsiderationsComparator k        i     I      �V�U�V 0 makekey makeKey �T o      �S�S 0 anobject anObject�T  �U   l     L      c      o     �R�R 0 anobject anObject m    �Q
�Q 
ctxt _ Y TO DO: what if item is a list [of text]? currently it coerces to text using current TIDs    � �   T O   D O :   w h a t   i f   i t e m   i s   a   l i s t   [ o f   t e x t ] ?   c u r r e n t l y   i t   c o e r c e s   t o   t e x t   u s i n g   c u r r e n t   T I D s �P i     I      �O!�N�O 0 comparekeys compareKeys! "#" o      �M�M 0 
leftobject 
leftObject# $�L$ o      �K�K 0 rightobject rightObject�L  �N    Z     %&'(% A     )*) o     �J�J 0 
leftobject 
leftObject* o    �I�I 0 rightobject rightObject& L    ++ m    �H�H��' ,-, ?    ./. o    �G�G 0 
leftobject 
leftObject/ o    �F�F 0 rightobject rightObject- 0�E0 L    11 m    �D�D �E  ( L    22 m    �C�C  �P   3�B3 Z    g45674 =   898 o    �A�A  0 orderingoption orderingOption9 m    �@
�@ SrtECmpI5 k    :: ;<; h    �?=�? >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator= k      >> ?@? j     �>A
�> 
pareA o     �=�= B0 currentconsiderationscomparator CurrentConsiderationsComparator@ B�<B i  	 CDC I      �;E�:�; 0 comparekeys compareKeysE FGF o      �9�9 0 
leftobject 
leftObjectG H�8H o      �7�7 0 rightobject rightObject�8  �:  D P     IJKI L    LL M    MM I      �6N�5�6 0 comparekeys compareKeysN OPO o    �4�4 0 
leftobject 
leftObjectP Q�3Q o    �2�2 0 rightobject rightObject�3  �5  J �1R
�1 conshyphR �0S
�0 conspuncS �/T
�/ conswhitT �.�-
�. consnume�-  K �,U
�, conscaseU �+�*
�+ consdiac�*  �<  < V�)V L    WW o    �(�( >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator�)  6 XYX =   !Z[Z o    �'�'  0 orderingoption orderingOption[ m     �&
�& SrtECmpCY \]\ k   $ .^^ _`_ h   $ +�%a�% :0 casesensitivetextcomparator CaseSensitiveTextComparatora k      bb cdc j     �$e
�$ 
paree o     �#�# B0 currentconsiderationscomparator CurrentConsiderationsComparatord f�"f i  	 ghg I      �!i� �! 0 comparekeys compareKeysi jkj o      �� 0 
leftobject 
leftObjectk l�l o      �� 0 rightobject rightObject�  �   h P     mnom L    pp M    qq I      �r�� 0 comparekeys compareKeysr sts o    �� 0 
leftobject 
leftObjectt u�u o    �� 0 rightobject rightObject�  �  n �v
� conscasev �w
� conshyphw �x
� conspuncx �y
� conswhity ��
� consnume�  o ��
� consdiac�  �"  ` z�z L   , .{{ o   , -�� :0 casesensitivetextcomparator CaseSensitiveTextComparator�  ] |}| =  1 4~~ o   1 2��  0 orderingoption orderingOption m   2 3�
� SrtECmpE} ��� k   7 A�� ��� h   7 >��� 40 exactmatchtextcomparator ExactMatchTextComparator� k      �� ��� j     �
�
�
 
pare� o     �	�	 B0 currentconsiderationscomparator CurrentConsiderationsComparator� ��� i  	 ��� I      ���� 0 comparekeys compareKeys� ��� o      �� 0 
leftobject 
leftObject� ��� o      �� 0 rightobject rightObject�  �  � P     ���� L    �� M    �� I      ���� 0 comparekeys compareKeys� ��� o    � �  0 
leftobject 
leftObject� ���� o    ���� 0 rightobject rightObject��  �  � ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  � ����
�� consnume��  �  � ���� L   ? A�� o   ? @���� 40 exactmatchtextcomparator ExactMatchTextComparator��  � ��� =  D G��� o   D E����  0 orderingoption orderingOption� m   E F��
�� SrtECmpD� ���� L   J L�� o   J K���� B0 currentconsiderationscomparator CurrentConsiderationsComparator��  7 R   O g����
�� .ascrerr ****      � ****� m   c f�� ��� d I n v a l i d    f o r    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .� ����
�� 
errn� m   S V�����Y� ����
�� 
erob� o   Y Z����  0 orderingoption orderingOption� �����
�� 
errt� m   ] `��
�� 
enum��  �B  
 R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��   I   o }������� 
0 _error  � ��� m   p s�� ���  t e x t   c o m p a r a t o r� ��� o   s t���� 0 etext eText� ��� o   t u���� 0 enumber eNumber� ��� o   u v���� 0 efrom eFrom� ���� o   v w���� 
0 eto eTo��  ��   ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  b e��� I     �����
�� .Lst:LiSonull��� ��� null��  � �����
�� 
Comp� |����������  ��  � o      ����  0 comparatorlist comparatorList��  � l     ������ m      ��
�� 
msng��  ��  ��  � Q     T���� Z    @������ =    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ����  0 comparatorlist comparatorList��  � �����
�� 
kocl� m    ��
�� 
list��  ��  ��  � m    ����  � k    6�� ��� Z    .������ =   ��� o    ����  0 comparatorlist comparatorList� m    ��
�� 
msng� r    ��� I   ������
�� .Lst:DeSonull��� ��� null��  ��  � o      ���� $0 comparatorobject comparatorObject��  � r   ! .��� n  ! ,��� I   & ,������� &0 asscriptparameter asScriptParameter� ��� o   & '����  0 comparatorlist comparatorList� ���� m   ' (�� ���  f o r��  ��  � o   ! &���� 0 _support  � o      ���� $0 comparatorobject comparatorObject� ���� h   / 6����� .0 uniformlistcomparator UniformListComparator� l     ���� k      �� ��� l     ��������  ��  ��  � ��� i    ��� I      ������� 0 makekey makeKey� ���� o      ���� 0 sublist subList��  ��  � h     ����� 0 	keyobject 	KeyObject� k          j     ���� 
0 _list_   o     ���� 0 sublist subList  l      j    
��	�� 
0 _keys_  	 J    	����     cached keys    �

    c a c h e d   k e y s  l     ��������  ��  ��   �� i    I      ������ 0 getkey getKey �� o      ���� 0 	itemindex 	itemIndex��  ��   k     0  V     ' r    " n    I    ������ 0 makekey makeKey �� n     4    ��
�� 
cobj o    ���� 0 	itemindex 	itemIndex n    !  o    ���� 
0 _list_  !  f    ��  ��   o    ���� $0 comparatorobject comparatorObject n      "#"  ;     !# o     ���� 
0 _keys_   ?    $%$ o    ���� 0 	itemindex 	itemIndex% n    
&'& 1    
��
�� 
leng' n   ()( o    ���� 
0 _keys_  )  f     *��* L   ( 0++ n   ( /,-, 4   + .��.
�� 
cobj. o   , -���� 0 	itemindex 	itemIndex- n  ( +/0/ o   ) +���� 
0 _keys_  0  f   ( )��  ��  � 121 l     ��������  ��  ��  2 343 i   565 I      ��7���� 0 comparekeys compareKeys7 898 o      ���� 0 leftkeyobject leftKeyObject9 :��: o      ����  0 rightkeyobject rightKeyObject��  ��  6 k     z;; <=< r     >?> J     @@ ABA n    CDC 1    ��
�� 
lengD n    EFE o    ���� 
0 _list_  F o     ���� 0 leftkeyobject leftKeyObjectB G�G n   
HIH 1    
�~
�~ 
lengI n   JKJ o    �}�} 
0 _list_  K o    �|�|  0 rightkeyobject rightKeyObject�  ? J      LL MNM o      �{�{ 0 
leftlength 
leftLengthN O�zO o      �y�y 0 rightlength rightLength�z  = PQP r    RSR o    �x�x 0 
leftlength 
leftLengthS o      �w�w 0 commonlength commonLengthQ TUT Z    -VW�v�uV A     #XYX o     !�t�t 0 rightlength rightLengthY o   ! "�s�s 0 commonlength commonLengthW r   & )Z[Z o   & '�r�r 0 rightlength rightLength[ o      �q�q 0 commonlength commonLength�v  �u  U \]\ Y   . a^�p_`�o^ l  8 \abca k   8 \dd efe r   8 Oghg n  8 Miji I   = M�nk�m�n 0 comparekeys compareKeysk lml n  = Cnon I   > C�lp�k�l 0 getkey getKeyp q�jq o   > ?�i�i 0 i  �j  �k  o o   = >�h�h 0 leftkeyobject leftKeyObjectm r�gr n  C Ists I   D I�fu�e�f 0 getkey getKeyu v�dv o   D E�c�c 0 i  �d  �e  t o   C D�b�b  0 rightkeyobject rightKeyObject�g  �m  j o   8 =�a�a $0 comparatorobject comparatorObjecth o      �`�` $0 comparisonresult comparisonResultf w�_w Z  P \xy�^�]x >   P Sz{z o   P Q�\�\ $0 comparisonresult comparisonResult{ m   Q R�[�[  y L   V X|| o   V W�Z�Z $0 comparisonresult comparisonResult�^  �]  �_  b E ? iterate over item indexes common to both lists, comparing keys   c �}} ~   i t e r a t e   o v e r   i t e m   i n d e x e s   c o m m o n   t o   b o t h   l i s t s ,   c o m p a r i n g   k e y s�p 0 i  _ m   1 2�Y�Y ` o   2 3�X�X 0 commonlength commonLength�o  ] ~�W~ Z   b z��� A   b e��� o   b c�V�V 0 
leftlength 
leftLength� o   c d�U�U 0 rightlength rightLength� l  h j���� L   h j�� m   h i�T�T��� A ; left sublist is shorter than right sublist, so comes first   � ��� v   l e f t   s u b l i s t   i s   s h o r t e r   t h a n   r i g h t   s u b l i s t ,   s o   c o m e s   f i r s t� ��� ?   m p��� o   m n�S�S 0 
leftlength 
leftLength� o   n o�R�R 0 rightlength rightLength� ��Q� l  s u���� L   s u�� m   s t�P�P � A ; right sublist is shorter than left sublist, so comes first   � ��� v   r i g h t   s u b l i s t   i s   s h o r t e r   t h a n   l e f t   s u b l i s t ,   s o   c o m e s   f i r s t�Q  � l  x z���� L   x z�� m   x y�O�O  �   both lists are identical   � ��� 2   b o t h   l i s t s   a r e   i d e n t i c a l�W  4 ��N� l     �M�L�K�M  �L  �K  �N  � 9 3 compares sublists of same type and variable length   � ��� f   c o m p a r e s   s u b l i s t s   o f   s a m e   t y p e   a n d   v a r i a b l e   l e n g t h��  ��  � h   9 @�J��J *0 mixedlistcomparator MixedListComparator� l     ���� k      �� ��� l     �I�H�G�I  �H  �G  � ��� i    ��� I      �F��E�F 0 makekey makeKey� ��D� o      �C�C 0 sublist subList�D  �E  � h     �B��B 0 	keyobject 	KeyObject� k      �� ��� j     �A��A 
0 _list_  � o     �@�@ 0 sublist subList� ��� j    
�?��? 
0 _keys_  � J    	�>�>  � ��� l     �=�<�;�=  �<  �;  � ��:� i   ��� I      �9��8�9 0 getkey getKey� ��7� o      �6�6 "0 comparatorindex comparatorIndex�7  �8  � k     ��� ��� V     ���� k    |�� ��� Q    @���� r    (��� n    ��� 4    �5�
�5 
cobj� o    �4�4 "0 comparatorindex comparatorIndex� o    �3�3  0 comparatorlist comparatorList� K      �� �2���2 0 	itemindex 	itemIndex� o      �1�1 0 i  � �0��/�0  0 itemcomparator itemComparator� o      �.�. $0 comparatorobject comparatorObject�/  � R      �-�,�
�- .ascrerr ****      � ****�,  � �+��*
�+ 
errn� d      �� m      �)�)��*  � R   0 @�(��
�( .ascrerr ****      � ****� m   > ?�� ��� 4 I n v a l i d   c o m p a r a t o r   r e c o r d .� �'��
�' 
errn� m   2 3�&�&�Y� �%��$
�% 
erob� l  4 =��#�"� N   4 =�� n   4 <��� 4   9 <�!�
�! 
cobj� o   : ;� �  "0 comparatorindex comparatorIndex� o   4 9��  0 comparatorlist comparatorList�#  �"  �$  � ��� Q   A j���� r   D L��� n   D J��� 4   G J��
� 
cobj� o   H I�� 0 i  � n  D G��� o   E G�� 
0 _list_  �  f   D E� o      �� 0 subitem subItem� R      ���
� .ascrerr ****      � ****�  � ���
� 
errn� d      �� m      ����  � R   T j���
� .ascrerr ****      � ****� b   b i��� b   b g��� m   b c�� ��� & C a n  t   c o m p a r e   i t e m  � l  c f���� n  c f��� o   d f�� 0 	itemindex 	itemIndex� o   c d�� (0 listitemcomparator listItemComparator�  �  � m   g h�� ��� F   o f   s u b l i s t   ( s u b l i s t   i s   t o o   s h o r t ) .� ���
� 
errn� m   V W���@� ���
� 
erob� l  X a���� N   X a�� n  X `��� 4   ] `�
�
�
 
cobj� o   ^ _�	�	 0 i  � o   X ]�� 0 sublist subList�  �  �  � ��� r   k |� � n  k u I   p u��� 0 makekey makeKey � o   p q�� 0 subitem subItem�  �   o   k p�� $0 comparatorobject comparatorObject  n        ;   z { o   u z�� 
0 _keys_  �  � ?     o    � �  "0 comparatorindex comparatorIndex n    
	
	 1    
��
�� 
leng
 n    o    ���� 
0 _keys_    f    � �� L   � � n   � � 4   � ���
�� 
cobj o   � ����� "0 comparatorindex comparatorIndex n  � � o   � ����� 
0 _keys_    f   � ���  �:  �  l     ��������  ��  ��    i    I      ������ 0 comparekeys compareKeys  o      ���� 0 leftkeyobject leftKeyObject �� o      ����  0 rightkeyobject rightKeyObject��  ��   k     B   Y     ?!��"#��! k    :$$ %&% r    -'(' n   +)*) I    +��+���� 0 comparekeys compareKeys+ ,-, n   !./. I    !��0���� 0 getkey getKey0 1��1 o    ���� 0 i  ��  ��  / o    ���� 0 leftkeyobject leftKeyObject- 2��2 n  ! '343 I   " '��5���� 0 getkey getKey5 6��6 o   " #���� 0 i  ��  ��  4 o   ! "����  0 rightkeyobject rightKeyObject��  ��  * l   7����7 n   898 o    ����  0 itemcomparator itemComparator9 n   :;: 4    ��<
�� 
cobj< o    ���� 0 i  ; o    ����  0 comparatorlist comparatorList��  ��  ( o      ���� $0 comparisonresult comparisonResult& =��= Z  . :>?����> >   . 1@A@ o   . /���� $0 comparisonresult comparisonResultA m   / 0����  ? L   4 6BB o   4 5���� $0 comparisonresult comparisonResult��  ��  ��  �� 0 i  " m    ���� # n   CDC 1   	 ��
�� 
lengD o    	����  0 comparatorlist comparatorList��    E��E l  @ BFGHF L   @ BII m   @ A����  G   both lists are identical   H �JJ 2   b o t h   l i s t s   a r e   i d e n t i c a l��   K��K l     ��������  ��  ��  ��  � 9 3 compares sublists of same length and variable type   � �LL f   c o m p a r e s   s u b l i s t s   o f   s a m e   l e n g t h   a n d   v a r i a b l e   t y p e� R      ��MN
�� .ascrerr ****      � ****M o      ���� 0 etext eTextN ��OP
�� 
errnO o      ���� 0 enumber eNumberP ��QR
�� 
erobQ o      ���� 0 efrom eFromR ��S��
�� 
errtS o      ���� 
0 eto eTo��  � I   H T��T���� 
0 _error  T UVU m   I JWW �XX  l i s t   c o m p a r a t o rV YZY o   J K���� 0 etext eTextZ [\[ o   K L���� 0 enumber eNumber\ ]^] o   L M���� 0 efrom eFrom^ _��_ o   M N���� 
0 eto eTo��  ��  � `a` l     ��������  ��  ��  a bcb l     ��������  ��  ��  c ded i  f ifgf I     ����h
�� .Lst:ReSonull��� ��� null��  h ��i��
�� 
Compi |����j��k��  ��  j o      ���� $0 comparatorobject comparatorObject��  k l     l����l m      ��
�� 
msng��  ��  ��  g Q     :mnom k    (pp qrq Z     st��us =   vwv o    ���� $0 comparatorobject comparatorObjectw m    ��
�� 
msngt r   	 xyx I  	 ������
�� .Lst:DeSonull��� ��� null��  ��  y o      ���� $0 comparatorobject comparatorObject��  u r     z{z n   |}| I    ��~���� &0 asscriptparameter asScriptParameter~ � o    ���� $0 comparatorobject comparatorObject� ���� m    �� ���  f o r��  ��  } o    ���� 0 _support  { o      ���� $0 comparatorobject comparatorObjectr ���� h   ! (����� &0 reversecomparator ReverseComparator� k      �� ��� j     ���
�� 
pare� o     ���� $0 comparatorobject comparatorObject� ���� i  	 ��� I      ������� 0 comparekeys compareKeys� ��� o      ���� 0 leftkey leftKey� ���� o      ���� 0 rightkey rightKey��  ��  � l    ���� L     �� d     
�� l    	������ M     	�� I      ������� 0 comparekeys compareKeys� ��� o    ���� 0 leftkey leftKey� ���� o    ���� 0 rightkey rightKey��  ��  ��  ��  � 4 . flip negative flag to positive and vice-versa   � ��� \   f l i p   n e g a t i v e   f l a g   t o   p o s i t i v e   a n d   v i c e - v e r s a��  ��  n R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  o I   0 :������� 
0 _error  � ��� m   1 2�� ��� $ r e v e r s e   c o m p a r a t o r� ��� o   2 3���� 0 etext eText� ��� o   3 4���� 0 enumber eNumber� ��� o   4 5���� 0 efrom eFrom� ��� o   5 6�~�~ 
0 eto eTo�  ��  e ��� l     �}�|�{�}  �|  �{  � ��� l     �z�y�x�z  �y  �x  � ��� l     �w�v�u�w  �v  �u  � ��� l     �t�s�r�t  �s  �r  � ��� i  j m��� I     �q��p
�q .Lst:LiUSnull���     ****� o      �o�o 0 thelist theList�p  � Q     t���� k    b�� ��� h    
�n��n $0 resultlistobject resultListObject� j     �m��m 
0 _list_  � n     ��� 2   �l
�l 
cobj� n    ��� I    �k��j�k "0 aslistparameter asListParameter� ��� o    
�i�i 0 thelist theList� ��h� m   
 �� ���  �h  �j  � o     �g�g 0 _support  � ��� r    ��� n    ��� 1    �f
�f 
leng� n   ��� o    �e�e 
0 _list_  � o    �d�d $0 resultlistobject resultListObject� o      �c�c 0 len  � ��� Y    \��b���a� k    W�� ��� r    -��� I   +��`�� z�_�^
�_ .sysorandnmbr    ��� nmbr
�^ misccura�`  � �]��
�] 
from� m   # $�\�\ � �[��Z
�[ 
to  � o   % &�Y�Y 0 len  �Z  � o      �X�X 0 idx2  � ��W� r   . W��� J   . >�� ��� e   . 5�� n  . 5��� 4   1 4�V�
�V 
cobj� o   2 3�U�U 0 idx2  � n  . 1��� o   / 1�T�T 
0 _list_  � o   . /�S�S $0 resultlistobject resultListObject� ��R� e   5 <�� n  5 <��� 4   8 ;�Q�
�Q 
cobj� o   9 :�P�P 0 idx1  � n  5 8��� o   6 8�O�O 
0 _list_  � o   5 6�N�N $0 resultlistobject resultListObject�R  � J      �� ��� n     ��� 4   F I�M�
�M 
cobj� o   G H�L�L 0 idx1  � n  C F� � o   D F�K�K 
0 _list_    o   C D�J�J $0 resultlistobject resultListObject� �I n      4   R U�H
�H 
cobj o   S T�G�G 0 idx2   n  O R o   P R�F�F 
0 _list_   o   O P�E�E $0 resultlistobject resultListObject�I  �W  �b 0 idx1  � m    �D�D � o    �C�C 0 len  �a  � �B L   ] b n  ] a	
	 o   ^ `�A�A 
0 _list_  
 o   ] ^�@�@ $0 resultlistobject resultListObject�B  � R      �?
�? .ascrerr ****      � **** o      �>�> 0 etext eText �=
�= 
errn o      �<�< 0 enumber eNumber �;
�; 
erob o      �:�: 0 efrom eFrom �9�8
�9 
errt o      �7�7 
0 eto eTo�8  � I   j t�6�5�6 
0 _error    m   k l �  u n s o r t   l i s t  o   l m�4�4 0 etext eText  o   m n�3�3 0 enumber eNumber  o   n o�2�2 0 efrom eFrom �1 o   o p�0�0 
0 eto eTo�1  �5  �  l     �/�.�-�/  �.  �-    �,  l     �+�*�)�+  �*  �)  �,       �(!"#$%&'()*+,-./0�'123456789�(  ! �&�%�$�#�"�!� ������������������
�& 
pimr�% 0 _support  �$ 
0 _error  �# 20 _errorwithpartialresult _errorWithPartialResult�" "0 _makelistobject _makeListObject�! 0 	_pinindex 	_pinIndex
�  .Lst:Instnull���     ****
� .Lst:Delenull���     ****
� .Lst:RDuLnull���     ****
� .Lst:SliLnull���     ****
� .Lst:Trannull���     ****
� .Lst:Findnull���     ****
� .Lst:Map_null���     ****
� .Lst:Filtnull���     ****
� .Lst:Redunull���     ****� *0 _quicksortthreshold _quicksortThreshold� 	0 _sort  
� .Lst:Sortnull���     ****
� .Lst:DeSonull��� ��� null
� .Lst:NuSonull��� ��� null
� .Lst:DaSonull��� ��� null
� .Lst:TeSonull��� ��� null
� .Lst:LiSonull��� ��� null
� .Lst:ReSonull��� ��� null
� .Lst:LiUSnull���     ****" �:� :  ;; �<�
� 
cobj< ==   �

�
 
osax�  # >>   �	 %
�	 
scpt$ � -��?@�� 
0 _error  � �A� A  ���� ��� 0 handlername handlerName� 0 etext eText� 0 enumber eNumber�  0 efrom eFrom�� 
0 eto eTo�  ? ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo@ ������
�� 
msng�� �� 20 _errorwithpartialresult _errorWithPartialResult� *�������+ % �� I����BC���� 20 _errorwithpartialresult _errorWithPartialResult�� ��D�� D  �������������� 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�� 0 epartial ePartial��  B �������������� 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�� 0 epartial ePartialC  [������
�� 
msng�� �� 0 rethrowerror rethrowError�� b  ࠡ�����+ & �� x����EF���� "0 _makelistobject _makeListObject�� ��G�� G  ������ 0 len  �� 0 padvalue padValue��  E �������� 0 len  �� 0 padvalue padValue�� 0 
listobject 
listObjectF �� �H���������� 0 
listobject 
listObjectH ��I����JK��
�� .ascrinit****      � ****I k     LL  �����  ��  ��  J ���� 
0 _list_  K ���� 
0 _list_  �� jv��� �� 
0 _list_  
�� 
leng
�� 
cobj�� `��K S�O�j L�����v��,FO h��,�,���,��,%��,F[OY��O��,�,� ��,[�\[Zk\Z�2��,FY hY hO��,E' �� �����MN���� 0 	_pinindex 	_pinIndex�� ��O�� O  ������ 0 theindex theIndex�� 0 
textlength 
textLength��  M ������ 0 theindex theIndex�� 0 
textlength 
textLengthN  �� &�� �Y ��' �'Y �j  kY �( �� ����PQ��
�� .Lst:Instnull���     ****�� 0 thelist theList�� ����R
�� 
Valu�� 0 thevalue theValueR ��ST
�� 
BefoS {�������� 0 beforeindex beforeIndex��  
�� 
msngT ��UV
�� 
AfteU {�������� 0 
afterindex 
afterIndex��  
�� 
msngV ��W��
�� 
ConcW {�������� 0 isjoin isJoin��  
�� boovfals��  P 
���������������������� 0 thelist theList�� 0 thevalue theValue�� 0 beforeindex beforeIndex�� 0 
afterindex 
afterIndex�� 0 isjoin isJoin�� 0 
listobject 
listObject�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToQ ��%X��������������S`��l����������������������Y>������ 0 
listobject 
listObjectX ��Z����[\�
�� .ascrinit****      � ****Z k     ]] %��  ��  ��  [ �� 
0 _list_  \ -��� "0 aslistparameter asListParameter� 
0 _list_  � b  b   �l+ �
�� 
kocl
�� 
list
�� .corecnte****       ****
�� 
bool
�� 
msng
�� 
errn���Y�� (0 asintegerparameter asIntegerParameter�� (0 asbooleanparameter asBooleanParameter�� 
0 _list_  
�� 
leng���@
�� 
erob
�� 
cobj
�� 
insl�� �� 0 etext eTextY ��^
� 
errn� 0 enumber eNumber^ ��_
� 
erob� 0 efrom eFrom_ ���
� 
errt� 
0 eto eTo�  �� �� 
0 _error  ������K S�O�
 �kv��l j �& 
�kvE�Y hO�� w�� )��l�Y hOb  ��l+ E�Ob  ��l+ E�O�j ��,a ,�kE�Y hO���,a , ")�a a ��,Ea �/a 4a a Y hY ��� �b  �a l+ E�O�j 
�kE�Y 3�j ��,a ,�E�Y )�a a ��,Ea �/a 3a a O���,a ,
 �j�& ")�a a ��,Ea �/a 3a a Y hY ��%O�j  ���,%Y ;���,a ,  ��,�%Y &��,[a \[Zk\Z�2�%��,[a \[Z�k\Zi2%W X  *a ����a + ) �N��`a�
� .Lst:Delenull���     ****� 0 thelist theList� �bc
� 
Indxb {�~�}�|�~ 0 theindex theIndex�}  �|��c �{de
�{ 
FIdxd {�z�y�x�z 0 
startindex 
startIndex�y  
�x 
msnge �wf�v
�w 
TIdxf {�u�t�s�u 0 endindex endIndex�t  
�s 
msng�v  ` �r�q�p�o�n�m�l�k�j�i�h�g�r 0 thelist theList�q 0 theindex theIndex�p 0 
startindex 
startIndex�o 0 endindex endIndex�n 0 
listobject 
listObject�m 0 
listlength 
listLength�l 0 	startlist 	startList�k 0 endlist endList�j 0 etext eText�i 0 enumber eNumber�h 0 efrom eFrom�g 
0 eto eToa �ffg�e�d�c��b��a��`�_�^�]�\�'�[h��Z�Y�f 0 
listobject 
listObjectg �Xi�W�Vjk�U
�X .ascrinit****      � ****i k     ll f�T�T  �W  �V  j �S�S 
0 _list_  k n�R�Q�R "0 aslistparameter asListParameter�Q 
0 _list_  �U b  b   �l+ ��e 
0 _list_  
�d 
leng
�c 
msng�b (0 asintegerparameter asIntegerParameter
�a 
bool
�` 
errn�_�@
�^ 
erob
�] 
cobj�\ �[ 0 etext eTexth �P�Om
�P 
errn�O 0 enumber eNumberm �N�Mn
�N 
erob�M 0 efrom eFromn �L�K�J
�L 
errt�K 
0 eto eTo�J  �Z �Y 
0 _error  �����K S�O��,�,E�O�� b  ��l+ E�Y hO�� b  ��l+ E�Y hO�� 	 �� �& Lb  ��l+ E�O�E�O�j �k�E�Y hO�j 
 ���& )�����,E�/�a Y hY ���  kE�Y ��  �E�Y hO�j �k�E�Y hO�j �k�E�Y hO�j 
 ���& )�����,E�/�a Y hO�j 
 ���& )�����,E�/�a Y hO�� ��lvE[�k/E�Z[�l/E�ZY hO�k  �� 
 �� �& jvY hOjvE�Y ��,[�\[Zk\Z�k2E�O��  	jvE�Y ��,[�\[Z�k\Zi2E�O��%W X  *a ����a + * �I��H�Gop�F
�I .Lst:RDuLnull���     ****�H 0 thelist theList�G  o 	�E�D�C�B�A�@�?�>�=�E 0 thelist theList�D 0 
listobject 
listObject�C 0 i  �B 0 u  �A 0 
listlength 
listLength�@ 0 etext eText�? 0 enumber eNumber�> 0 efrom eFrom�= 
0 eto eTop �<�q�;�:�9�8r�7�6�< 0 
listobject 
listObjectq �5s�4�3tu�2
�5 .ascrinit****      � ****s k     vv ��1�1  �4  �3  t �0�0 
0 _list_  u �/�.�-�/ "0 aslistparameter asListParameter
�. 
cobj�- 
0 _list_  �2 b  b   k+  �-E��; 
0 _list_  
�: 
leng
�9 
cobj�8 0 etext eTextr �,�+w
�, 
errn�+ 0 enumber eNumberw �*�)x
�* 
erob�) 0 efrom eFromx �(�'�&
�( 
errt�' 
0 eto eTo�&  �7 �6 
0 _error  �F � ���K S�Olk��,�,mvE[�k/E�Z[�l/E�Z[�m/E�ZO eh�� >h��,[�\[Zk\Z�2��,�/kv�kE�O�� ��,[�\[Zk\Z�2EY h[OY��O�kE�O��,�/��,�/FO�kE�[OY��O��,[�\[Zk\Z�2EW X  *襦���+ 
+ �%)�$�#yz�"
�% .Lst:SliLnull���     ****�$ 0 thelist theList�# �!{|
�! 
FIdx{ {� ���  0 
startindex 
startIndex�  
� 
msng| �}�
� 
TIdx} {���� 0 endindex endIndex�  
� 
msng�  y ��������� 0 thelist theList� 0 
startindex 
startIndex� 0 endindex endIndex� 0 	thelength 	theLength� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToz ���Y����
�	h��������~0��� "0 aslistparameter asListParameter
� 
leng
� 
msng� (0 asintegerparameter asIntegerParameter
� 
errn��Y
�
 
erob�	 
� 
cobj
� 
ctxt��[
� 
bool� 0 etext eText~ �� 
� 
errn�  0 enumber eNumber �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  �"�~b  �k+  E�O��,E�O�� Xb  ��l+ E�O�j  )�����Y hO��  -��' 
��-EY �� jvY �[�\[Z�\Zi2EY hY ��  )��l�Y hO�� Xb  ��l+ E�O�j  )�����Y hO��  -��' jvY �� 
��-EY �[�\[Zk\Z�2EY hY hO�j �k�E�Y hO�j �k�E�Y hO��
 �k	 	�ka &a &
 ��	 	��a &a & jvY hO�k kE�Y �� �E�Y hO�k kE�Y �� �E�Y hO�[�\[Z�\Z�2EW X  *a ����a + , ��@��������
�� .Lst:Trannull���     ****�� 0 thelist theList�� ����
�� 
Whil� {�������� 0 unevenoption unevenOption��  
�� LTrhLTrR� �����
�� 
PadI� {�������� 0 padvalue padValue��  
�� 
msng��  � ���������������������������� 0 thelist theList�� 0 unevenoption unevenOption�� 0 padvalue padValue�� 0 
listobject 
listObject�� $0 resultlistlength resultListLength�� 0 aref aRef�� (0 emptyresultsublist emptyResultSubList�� 0 i  �� 0 j  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ����������������o��v����������������������������@����
�� 
kocl
�� 
list
�� .corecnte****       ****
�� 
bool
�� 
errn���Y
�� 
erob�� �� 0 
listobject 
listObject� �����������
�� .ascrinit****      � ****� k     
�� x�� {����  ��  ��  � ������ 
0 _list_  �� 0 _resultlist_ _resultList_� ������ 
0 _list_  �� 0 _resultlist_ _resultList_�� b   �Ojv��� 
0 _list_  
�� 
cobj
�� 
leng
�� LTrhLTrR
�� LTrhLTrP
�� LTrhLTrT
�� 
errt
�� 
enum�� �� "0 _makelistobject _makeListObject�� 0 _resultlist_ _resultList_�� 0 etext eText� ����
�� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  �� �� 
0 _error  �����jv  jvY hO�kv��l j 
 ���l �j �& )�����Y hO��K S�O��,�k/�,E�O��  4 .��,[��l kh ��,� )����,�a Y h[OY��Y z�a   - '��,[��l kh ��,� 
��,E�Y h[OY��Y G�a   - '��,[��l kh ��,� 
��,E�Y h[OY��Y )���a a a a O*��,�,�l+ E�O k�kkh ��-E�a ,6F[OY��O��a ,6FO ?k��,�,Ekh  +k��,��/�,Ekh ��,��/��/�a ,��/��/F[OY��[OY��O�a ,EW X  *a ����a + - �\�����
� .Lst:Findnull���     ****� 0 thelist theList� ���
� 
Valu� 0 theitem theItem� ���
� 
Retu� {���� (0 findingoccurrences findingOccurrences�  
� LFWhLFWA�  � 	���������� 0 thelist theList� 0 theitem theItem� (0 findingoccurrences findingOccurrences� 0 
listobject 
listObject� 0 i  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� �k��������������������� 0 
listobject 
listObject� �������
� .ascrinit****      � ****� k     �� m�� x��  �  �  � ��� 
0 _list_  � 0 _result_  � v���� "0 aslistparameter asListParameter� 
0 _list_  � 0 _result_  � b  b   �l+ �Ojv�
� LFWhLFWA� 
0 _list_  
� 
leng
� 
cobj� 0 _result_  
� LFWhLFWF
� LFWhLFWL
� 
errn��Y
� 
erob
� 
errt
� 
enum� � 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � � ���K S�O��  . (k��,�,Ekh ��,�/�  ���,6FY h[OY��Y v��  0 *k��,�,Ekh ��,�/�  ���,6FOY h[OY��Y B��  0 *��,�,Ekih ��,�/�  ���,6FOY h[OY��Y )������a O��,EW X  *a ����a + . ������
� .Lst:Map_null���     ****� 0 thelist theList� ��~�}
� 
Usin�~ 0 	thescript 	theScript�}  � 
�|�{�z�y�x�w�v�u�t�s�| 0 thelist theList�{ 0 	thescript 	theScript�z $0 resultlistobject resultListObject�y 0 i  �x 0 etext eText�w 0 enumber eNumber�v 
0 eto eTo�u 0 epartial ePartial�t 0 
listobject 
listObject�s 0 efrom eFrom� �r�2�q�p�o�n�m�l��k�j�i�h�gwy���f�e�r $0 resultlistobject resultListObject� �d��c�b���a
�d .ascrinit****      � ****� k     �� �`�`  �c  �b  � �_�_ 
0 _list_  � &�^�]�\�^ "0 aslistparameter asListParameter
�] 
cobj�\ 
0 _list_  �a b  b   �l+ �-E��q &0 asscriptparameter asScriptParameter�p 
0 _list_  
�o 
leng
�n 
cobj�m 0 convertitem convertItem�l 0 etext eText� �[�Z�
�[ 
errn�Z 0 enumber eNumber� �Y�X�W
�Y 
errt�X 
0 eto eTo�W  
�k 
errn
�j 
erob
�i 
errt
�h 
ptlr�g � �V�U�
�V 
errn�U 0 enumber eNumber� �T�S�
�T 
erob�S 0 efrom eFrom� �R�Q�
�R 
errt�Q 
0 eto eTo� �P�O�N
�P 
ptlr�O 0 epartial ePartial�N  �f �e 20 _errorwithpartialresult _errorWithPartialResult� � ���K S�Ob  ��l+ E�O + %k��,�,Ekh ���,�/k+ ��,�/F[OY��W CX 	 
�k ��,[�\[Zk\Z�k2E�Y jvE�O)���,E�/����a �%a %�%O��,EW X 	 *a �����a + / �M��L�K���J
�M .Lst:Filtnull���     ****�L 0 thelist theList�K �I�H�G
�I 
Usin�H 0 	thescript 	theScript�G  � �F�E�D�C�B�A�@�?�>�=�<�;�F 0 thelist theList�E 0 	thescript 	theScript�D $0 resultlistobject resultListObject�C 0 	lastindex 	lastIndex�B 0 i  �A 0 theitem theItem�@ 0 etext eText�? 0 enumber eNumber�> 
0 eto eTo�= 0 epartial ePartial�< 0 
listobject 
listObject�; 0 efrom eFrom� �:����9�8�7�6�5�4��3�2�1�0�/"$�Q�.�-�: $0 resultlistobject resultListObject� �,��+�*���)
�, .ascrinit****      � ****� k     �� ��(�(  �+  �*  � �'�' 
0 _list_  � ��&�%�$�& "0 aslistparameter asListParameter
�% 
cobj�$ 
0 _list_  �) b  b   �l+ �-E��9 &0 asscriptparameter asScriptParameter�8 
0 _list_  
�7 
leng
�6 
cobj�5 0 	checkitem 	checkItem�4 0 etext eText� �#�"�
�# 
errn�" 0 enumber eNumber� �!� �
�! 
errt�  
0 eto eTo�  
�3 
errn
�2 
erob
�1 
errt
�0 
ptlr�/ � ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo� ���
� 
ptlr� 0 epartial ePartial�  �. �- 20 _errorwithpartialresult _errorWithPartialResult�J � ���K S�Ob  ��l+ E�OjE�O = 7k��,�,Ekh ��,�/E�O��k+  �kE�O���,�/FY h[OY��W CX 	 
�k ��,[�\[Zk\Z�k2E�Y jvE�O)���,E�/����a �%a %�%O�j  jvY hO��,[�\[Zk\Z�2EW X 	 *a �����a + 0 �c�����
� .Lst:Redunull���     ****� 0 thelist theList� ���
� 
Usin� 0 	thescript 	theScript�  � 
�����
�	����� 0 thelist theList� 0 	thescript 	theScript� 0 missingvalue missingValue� 0 	theresult 	theResult�
 0 
listobject 
listObject�	 0 i  � 0 etext eText� 0 enumber eNumber� 
0 eto eTo� 0 efrom eFrom� �s����� �������������������������� 0 
listobject 
listObject� �����������
�� .ascrinit****      � ****� k     �� s����  ��  ��  � ���� 
0 _list_  � {������ "0 aslistparameter asListParameter�� 
0 _list_  �� b  b   �l+ �� 
0 _list_  
� 
leng
� 
errn� �Y
�� 
erob�� �� &0 asscriptparameter asScriptParameter
�� 
cobj�� 0 combineitems combineItems�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� ������
�� 
errt�� 
0 eto eTo��  
�� 
errt�� � �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� 20 _errorwithpartialresult _errorWithPartialResult� ��E�O ���K S�O��,�,j  )���jv��Y hOb  ��l+ E�O��,�k/E�O ' !l��,�,Ekh ����,�/l+ E�[OY��W &X  )���,E�/a �a a �%a %�%O�W X  *a �����a + �' 1 ��	���������� 	0 _sort  �� ����� �  ������������ $0 resultlistobject resultListObject�� 0 
startindex 
startIndex�� 0 endindex endIndex��  0 sortcomparator sortComparator�� 0 usequicksort useQuickSort��  � ���������������������������������� $0 resultlistobject resultListObject�� 0 
startindex 
startIndex�� 0 endindex endIndex��  0 sortcomparator sortComparator�� 0 usequicksort useQuickSort�� 0 	leftindex 	leftIndex�� 0 
rightindex 
rightIndex�� 0 
pivotvalue 
pivotValue�� 0 etext eText�� 0 enum eNum�� 0 efrom eFrom�� 
0 eto eTo�� 0 i  �� 0 j  �� 0 leftkey leftKey�� 0 rightkey rightKey� �������������������	}	������
�� 
cobj�� 
0 _keys_  �� 0 comparekeys compareKeys
�� 
nmbr�� 0 etext eText� ���
� 
errn� 0 enum eNum� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  
�� 
errn
�� 
erob
�� 
errt�� � 
0 _list_  � � 	0 _sort  �  � ���
� 
errn��n�  ���q��k hY hO��lvE[�k/E�Z[�l/E�ZO��,[�\[Z�\Z�2�.E�Oh�� % h���,�/E�l+ �&j�kE�[OY��W X  )���,�/�lv���%O $ h���,�/�l+ �&j�kE�[OY��W X  )���,�/�lv���%O�� p��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZO��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZO�k�klvE[�k/E�Z[�l/E�ZY h[OY�O -*������b  �+ O*������b  �+ OhW X  hY hO�kE�O ���kh  ���ih ��,�k/E��,�/ElvE[�k/E�Z[�l/E�ZO���l+ k Y hO��lvE[�k/��,�k/FZ[�l/��,�/FZO��,�/E��,�k/ElvE[�k/��,�k/FZ[�l/��,�/FZ[OY�y[OY�j2 �
������
� .Lst:Sortnull���     ****� 0 thelist theList� ���
� 
Comp� {����  0 sortcomparator sortComparator�  
� 
msng�  � ���������������� 0 thelist theList�  0 sortcomparator sortComparator� $0 resultlistobject resultListObject�  0 ascendingcount ascendingCount� "0 descendingcount descendingCount� 0 previouskey previousKey� 0 etext eText� 0 enum eNum� 
0 eto eTo� 0 i  � 0 
currentkey 
currentKey� 0 keycomparison keyComparison� 0 efrom eFrom� 0 usequicksort useQuickSort� 0 enumber eNumber� 
���
������&����������]�������/�� "0 aslistparameter asListParameter� $0 resultlistobject resultListObject� �������
� .ascrinit****      � ****� k     �� 
��� ��  �  �  � ��� 
0 _keys_  � 
0 _list_  � ��~�}
� 
cobj�~ 
0 _keys_  �} 
0 _list_  � b   �-E�Ob   �-E�� 
0 _list_  
� 
leng
� 
msng
� .Lst:DeSonull��� ��� null� &0 asscriptparameter asScriptParameter
� 
cobj� 
0 _keys_  � 0 makekey makeKey� 0 etext eText� �|�{�
�| 
errn�{ 0 enum eNum� �z�y�x
�z 
errt�y 
0 eto eTo�x  
� 
errn
� 
erob
� 
errt� � 0 comparekeys compareKeys� �w�v�
�w 
errn�v 0 enum eNum� �u�t�
�u 
erob�t 0 efrom eFrom� �s�r�q
�s 
errt�r 
0 eto eTo�q  � � 	0 _sort  � �p�o�
�p 
errn�o 0 enumber eNumber� �n�m�
�n 
erob�m 0 efrom eFrom� �l�k�j
�l 
errt�k 
0 eto eTo�j  � 
0 _error  ��qb  ��l+ E�O��K S�O��,�,l 
��,EY hO��  *j E�Y b  ��l+ 
E�OjjlvE[�k/E�Z[�l/E�ZO � ���,�k/Ek+ E�W $X  )a �a ��,E�k/a �a a �%O���,�k/FO �l��,�,Ekh 	 ���,�/k+ E�W *X  )a �a ��,E�/a �a a �%a %�%O���,�/FO���l+ E�O�j 
�kE�Y �j 
�kE�Y hO�E�[OY��W X  )a �a �a �a �O�j #��,�,b  E�O*�k��,�,��a + Y hO��,EW X  *a ����a + 3 �i?�h�g���f
�i .Lst:DeSonull��� ��� null�h  �g  � �e�e &0 defaultcomparator DefaultComparator� �d@��d &0 defaultcomparator DefaultComparator� �c��b�a���`
�c .ascrinit****      � ****� k     �� B�� K�� N�� ��_�_  �b  �a  � �^�]�\�[�^ "0 _supportedtypes _supportedTypes�] 	0 _type  �\ 0 makekey makeKey�[ 0 comparekeys compareKeys� �Z�Y�X�W�V�U��
�Z 
nmbr
�Y 
ctxt
�X 
ldt �W "0 _supportedtypes _supportedTypes
�V 
msng�U 	0 _type  � �TQ�S�R���Q�T 0 makekey makeKey�S �P��P �  �O�O 0 anobject anObject�R  � �N�M�N 0 anobject anObject�M 0 aref aRef� �L�K�J�I�H�G�F�E�D�C}���B�
�L 
msng�K "0 _supportedtypes _supportedTypes
�J 
kocl
�I 
cobj
�H .corecnte****       ****
�G 
pcnt
�F 
errn�E�\
�D 
erob�C 
�B 
pcls�Q ~b  �  F 7)�,[��l kh �kv��,El j ��,Ec  O�Y h[OY��O)�����Y .�kv�b  l j  )�����b  %�%��,%�%Y hO�� �A��@�?���>�A 0 comparekeys compareKeys�@ �=��= �  �<�;�< 0 
leftobject 
leftObject�; 0 rightobject rightObject�?  � �:�9�: 0 
leftobject 
leftObject�9 0 rightobject rightObject�  �> �� iY �� kY j�` ���mv�O�OL OL �f ��K S�4 �8��7�6���5
�8 .Lst:NuSonull��� ��� null�7  �6  � �4�4 &0 numericcomparator NumericComparator� �3���3 &0 numericcomparator NumericComparator� �2��1�0���/
�2 .ascrinit****      � ****� k     �� ��� ��.�.  �1  �0  � �-�,�- 0 makekey makeKey�, 0 comparekeys compareKeys� ��� �+��*�)���(�+ 0 makekey makeKey�* �'��' �  �&�& 0 anobject anObject�)  � �%�% 0 anobject anObject� �$
�$ 
nmbr�( ��&� �#��"�!��� �# 0 comparekeys compareKeys�" ��� �  ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�!  � ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�  �  ���/ L  OL �5 ��K S�5 �������
� .Lst:DaSonull��� ��� null�  �  � ��  0 datecomparator DateComparator� ����  0 datecomparator DateComparator� ���� �
� .ascrinit****      � ****� k      � ���  �  �    ��� 0 makekey makeKey� 0 comparekeys compareKeys  �����
� 0 makekey makeKey� �	�	   �� 0 anobject anObject�   �� 0 anobject anObject �
� 
ldt �
 ��& ����	
�� 0 comparekeys compareKeys� ��   � ���  0 
leftobject 
leftObject�� 0 rightobject rightObject�  	 ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject
  � ��� L  OL � ��K S�6 ��������
�� .Lst:TeSonull��� ��� null��  �� ����
�� 
Cons {��������  0 orderingoption orderingOption��  
�� SrtECmpI��   	��������������������  0 orderingoption orderingOption�� B0 currentconsiderationscomparator CurrentConsiderationsComparator�� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator�� :0 casesensitivetextcomparator CaseSensitiveTextComparator�� 40 exactmatchtextcomparator ExactMatchTextComparator�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo ������=����a����������������������������� B0 currentconsiderationscomparator CurrentConsiderationsComparator ��������
�� .ascrinit****      � **** k       ����  ��  ��   ������ 0 makekey makeKey�� 0 comparekeys compareKeys  ���������� 0 makekey makeKey�� ����   ���� 0 anobject anObject��   ���� 0 anobject anObject ��
�� 
ctxt�� ��& �� �������� 0 comparekeys compareKeys�� �� ��    ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject��   ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject  �� �� iY �� kY j�� L  OL 
�� SrtECmpI�� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator ��!���"#�
�� .ascrinit****      � ****! k     $$ ?%% B��  ��  �  " ��
� 
pare� 0 comparekeys compareKeys# �&
� 
pare& �D��'(�� 0 comparekeys compareKeys� �)� )  ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�  ' ��� 0 
leftobject 
leftObject� 0 rightobject rightObject( JK�� 0 comparekeys compareKeys� �� )��ld*J V� b  N  OL 
�� SrtECmpC�� :0 casesensitivetextcomparator CaseSensitiveTextComparator �*��+,�
� .ascrinit****      � ***** k     -- c.. f��  �  �  + ��
� 
pare� 0 comparekeys compareKeys, �/
� 
pare/ �h��01�� 0 comparekeys compareKeys� �2� 2  ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�  0 ��� 0 
leftobject 
leftObject� 0 rightobject rightObject1 no�� 0 comparekeys compareKeys� �� )��ld*J V� b  N  OL 
�� SrtECmpE�� 40 exactmatchtextcomparator ExactMatchTextComparator �3��45�
� .ascrinit****      � ****3 k     66 �77 ���  �  �  4 ��
� 
pare� 0 comparekeys compareKeys5 �8
� 
pare8 ����9:�� 0 comparekeys compareKeys� �;� ;  ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�  9 ��� 0 
leftobject 
leftObject� 0 rightobject rightObject: ���� 0 comparekeys compareKeys� �� )��ld*J V� b  N  OL 
�� SrtECmpD
�� 
errn���Y
�� 
erob
�� 
errt
�� 
enum�� �� 0 etext eText ��<
� 
errn� 0 enumber eNumber< ��=
� 
erob� 0 efrom eFrom= ���
� 
errt� 
0 eto eTo�  �� �� 
0 _error  �� ~ i��K S�O��  ��K S�O�Y K��  ��K 
S�O�Y 8��  ��K S�O�Y %��  �Y )a a a �a a a a W X  *a ����a + 7 ����>?�
� .Lst:LiSonull��� ��� null�  � �@�
� 
Comp@ {�~�}�|�~  0 comparatorlist comparatorList�}  
�| 
msng�  > �{�z�y�x�w�v�u�t�{  0 comparatorlist comparatorList�z $0 comparatorobject comparatorObject�y .0 uniformlistcomparator UniformListComparator�x *0 mixedlistcomparator MixedListComparator�w 0 etext eText�v 0 enumber eNumber�u 0 efrom eFrom�t 
0 eto eTo? �s�r�q�p�o��n�m�A�l�B�kCW�j�i
�s 
kocl
�r 
list
�q .corecnte****       ****
�p 
msng
�o .Lst:DeSonull��� ��� null�n &0 asscriptparameter asScriptParameter�m .0 uniformlistcomparator UniformListComparatorA �hD�g�fEF�e
�h .ascrinit****      � ****D k     GG �HH 3�d�d  �g  �f  E �c�b�c 0 makekey makeKey�b 0 comparekeys compareKeysF IJI �a��`�_KL�^�a 0 makekey makeKey�` �]M�] M  �\�\ 0 sublist subList�_  K �[�Z�[ 0 sublist subList�Z 0 	keyobject 	KeyObjectL �Y�N�Y 0 	keyobject 	KeyObjectN �XO�W�VPQ�U
�X .ascrinit****      � ****O k     RR SS TT �T�T  �W  �V  P �S�R�Q�S 
0 _list_  �R 
0 _keys_  �Q 0 getkey getKeyQ �P�OU�P 
0 _list_  �O 
0 _keys_  U �N�M�LVW�K�N 0 getkey getKey�M �JX�J X  �I�I 0 	itemindex 	itemIndex�L  V �H�H 0 	itemindex 	itemIndexW �G�F�E�D�C�G 
0 _keys_  
�F 
leng�E 
0 _list_  
�D 
cobj�C 0 makekey makeKey�K 1 &h�)�,�,b  )�,�/k+ b  6F[OY��O)�,�/E�U b   �Ojv�OL �^ ��K S�J �B6�A�@YZ�?�B 0 comparekeys compareKeys�A �>[�> [  �=�<�= 0 leftkeyobject leftKeyObject�<  0 rightkeyobject rightKeyObject�@  Y �;�:�9�8�7�6�5�; 0 leftkeyobject leftKeyObject�:  0 rightkeyobject rightKeyObject�9 0 
leftlength 
leftLength�8 0 rightlength rightLength�7 0 commonlength commonLength�6 0 i  �5 $0 comparisonresult comparisonResultZ �4�3�2�1�0�4 
0 _list_  
�3 
leng
�2 
cobj�1 0 getkey getKey�0 0 comparekeys compareKeys�? {��,�,��,�,lvE[�k/E�Z[�l/E�ZO�E�O�� �E�Y hO 2k�kh b  ��k+ ��k+ l+ E�O�j �Y h[OY��O�� iY �� kY j�e L  OL �l *0 mixedlistcomparator MixedListComparatorB �/\�.�-]^�,
�/ .ascrinit****      � ****\ k     __ �`` �+�+  �.  �-  ] �*�)�* 0 makekey makeKey�) 0 comparekeys compareKeys^ aba �(��'�&cd�%�( 0 makekey makeKey�' �$e�$ e  �#�# 0 sublist subList�&  c �"�!�" 0 sublist subList�! 0 	keyobject 	KeyObjectd � �f�  0 	keyobject 	KeyObjectf �g��hi�
� .ascrinit****      � ****g k     jj �kk �ll ���  �  �  h ���� 
0 _list_  � 
0 _keys_  � 0 getkey getKeyi ��m� 
0 _list_  � 
0 _keys_  m ����no�� 0 getkey getKey� �p� p  �� "0 comparatorindex comparatorIndex�  n ����� "0 comparatorindex comparatorIndex� 0 i  � 0 subitem subItem� (0 listitemcomparator listItemComparatoro ��
�	���q������� ����� 
0 _keys_  
�
 
leng
�	 
cobj� 0 	itemindex 	itemIndex�  0 itemcomparator itemComparator�  q ������
�� 
errn���@��  
� 
errn��Y
� 
erob� � 
0 _list_  � �@�� 0 makekey makeKey� � �h�)�,�, b   �/E[�,E�Z[�,Ec  ZW X  )���b   �/��O )�,�/E�W X  )���b   �/���,%�%Ob  �k+ b  6F[OY��O)�,�/E� b   �Ojv�OL �% ��K S�b ������rs���� 0 comparekeys compareKeys�� ��t�� t  ������ 0 leftkeyobject leftKeyObject��  0 rightkeyobject rightKeyObject��  r ���������� 0 leftkeyobject leftKeyObject��  0 rightkeyobject rightKeyObject�� 0 i  �� $0 comparisonresult comparisonResults ����������
�� 
leng
�� 
cobj��  0 itemcomparator itemComparator�� 0 getkey getKey�� 0 comparekeys compareKeys�� C >kb   �,Ekh b   �/�,��k+ ��k+ l+ E�O�j �Y h[OY��Oj�, L  OL �k 0 etext eTextC ����u
�� 
errn�� 0 enumber eNumberu ����v
�� 
erob�� 0 efrom eFromv ������
�� 
errt�� 
0 eto eTo��  �j �i 
0 _error  � U B�kv��l j  *��  *j E�Y b  ��l+ E�O��K 	S�Y 	��K S�W X  *拉��a + 8 ��g����wx��
�� .Lst:ReSonull��� ��� null��  �� ��y��
�� 
Compy {�������� $0 comparatorobject comparatorObject��  
�� 
msng��  w �������������� $0 comparatorobject comparatorObject�� &0 reversecomparator ReverseComparator�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTox ����������z��{�����
�� 
msng
�� .Lst:DeSonull��� ��� null�� &0 asscriptparameter asScriptParameter�� &0 reversecomparator ReverseComparatorz ��|����}~��
�� .ascrinit****      � ****| k      ��� �����  ��  ��  } ����
�� 
pare�� 0 comparekeys compareKeys~ ���
�� 
pare� ������������� 0 comparekeys compareKeys�� ����� �  ������ 0 leftkey leftKey�� 0 rightkey rightKey��  � ��� 0 leftkey leftKey� 0 rightkey rightKey� �� 0 comparekeys compareKeys�� )��ld*J  '�� b   N  OL �� 0 etext eText{ ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  �� �� 
0 _error  �� ; *��  *j E�Y b  ��l+ E�O��K S�W X  *颣���+ 9 �������
� .Lst:LiUSnull���     ****� 0 thelist theList�  � 	���������� 0 thelist theList� $0 resultlistobject resultListObject� 0 len  � 0 idx1  � 0 idx2  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� ���������������� $0 resultlistobject resultListObject� �������
� .ascrinit****      � ****� k     �� ���  �  �  � �� 
0 _list_  � ����� "0 aslistparameter asListParameter
� 
cobj� 
0 _list_  � b  b   �l+ �-E�� 
0 _list_  
� 
leng
� misccura
� 
from
� 
to  � 
� .sysorandnmbr    ��� nmbr
� 
cobj� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  � u d��K S�O��,�,E�O Hk�kh � *�k�� 	UE�O��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZ[OY��O��,EW X  *������+ ascr  ��ޭ