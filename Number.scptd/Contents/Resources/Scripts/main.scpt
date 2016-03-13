FasdUAS 1.101.10   ��   ��    k             l      ��  ��    Number -- manipulate numeric values and perform common math functions

Notes:

- The Trigonometry and Logarithm handlers are slightly modified versions of handlers found in ESG MathLib <http://www.esglabs.com/>, which in turn are conversions of functions in the Cephes Mathematical Library by Stephen L. Moshier <http://netlib.org/cephes/>.

- see <http://www.unicode.org/reports/tr35/tr35-31/tr35-numbers.html#Number_Format_Patterns> for recognized format patterns when passing text values as `parse/format number`'s `using` parameter

- caution: -[NSNumberFormatter setMinimumFractionDigits:] may be buggy; see workarounds and notes in _setBasicFormat()


TO DO: 

- test, finalize `parse/format number` behaviors

- should `tan` return `infinity` symbol instead of erroring?

- use identifiers rather than properties in number format record? (other libraries already do this to mimimize namespace pollution)

- in _setBasicFormat, use text pattern for canonical scientific notation to include "+" prefix on exponent, same as in AS
     � 	 	   N u m b e r   - -   m a n i p u l a t e   n u m e r i c   v a l u e s   a n d   p e r f o r m   c o m m o n   m a t h   f u n c t i o n s 
 
 N o t e s : 
 
 -   T h e   T r i g o n o m e t r y   a n d   L o g a r i t h m   h a n d l e r s   a r e   s l i g h t l y   m o d i f i e d   v e r s i o n s   o f   h a n d l e r s   f o u n d   i n   E S G   M a t h L i b   < h t t p : / / w w w . e s g l a b s . c o m / > ,   w h i c h   i n   t u r n   a r e   c o n v e r s i o n s   o f   f u n c t i o n s   i n   t h e   C e p h e s   M a t h e m a t i c a l   L i b r a r y   b y   S t e p h e n   L .   M o s h i e r   < h t t p : / / n e t l i b . o r g / c e p h e s / > . 
 
 -   s e e   < h t t p : / / w w w . u n i c o d e . o r g / r e p o r t s / t r 3 5 / t r 3 5 - 3 1 / t r 3 5 - n u m b e r s . h t m l # N u m b e r _ F o r m a t _ P a t t e r n s >   f o r   r e c o g n i z e d   f o r m a t   p a t t e r n s   w h e n   p a s s i n g   t e x t   v a l u e s   a s   ` p a r s e / f o r m a t   n u m b e r ` ' s   ` u s i n g `   p a r a m e t e r 
 
 -   c a u t i o n :   - [ N S N u m b e r F o r m a t t e r   s e t M i n i m u m F r a c t i o n D i g i t s : ]   m a y   b e   b u g g y ;   s e e   w o r k a r o u n d s   a n d   n o t e s   i n   _ s e t B a s i c F o r m a t ( ) 
 
 
 T O   D O :   
 
 -   t e s t ,   f i n a l i z e   ` p a r s e / f o r m a t   n u m b e r `   b e h a v i o r s 
 
 -   s h o u l d   ` t a n `   r e t u r n   ` i n f i n i t y `   s y m b o l   i n s t e a d   o f   e r r o r i n g ? 
 
 -   u s e   i d e n t i f i e r s   r a t h e r   t h a n   p r o p e r t i e s   i n   n u m b e r   f o r m a t   r e c o r d ?   ( o t h e r   l i b r a r i e s   a l r e a d y   d o   t h i s   t o   m i m i m i z e   n a m e s p a c e   p o l l u t i o n ) 
 
 -   i n   _ s e t B a s i c F o r m a t ,   u s e   t e x t   p a t t e r n   f o r   c a n o n i c a l   s c i e n t i f i c   n o t a t i o n   t o   i n c l u d e   " + "   p r e f i x   o n   e x p o n e n t ,   s a m e   a s   i n   A S 
   
  
 l     ��������  ��  ��        l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        l     ��������  ��  ��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -     !   l     �� " #��   "   support    # � $ $    s u p p o r t !  % & % l     ��������  ��  ��   &  ' ( ' l      ) * + ) j    �� ,�� 0 _support   , N     - - 4    �� .
�� 
scpt . m     / / � 0 0  T y p e S u p p o r t * "  used for parameter checking    + � 1 1 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g (  2 3 2 l     ��������  ��  ��   3  4 5 4 i   ! 6 7 6 I      �� 8���� 
0 _error   8  9 : 9 o      ���� 0 handlername handlerName :  ; < ; o      ���� 0 etext eText <  = > = o      ���� 0 enumber eNumber >  ? @ ? o      ���� 0 efrom eFrom @  A�� A o      ���� 
0 eto eTo��  ��   7 n     B C B I    �� D���� &0 throwcommanderror throwCommandError D  E F E m     G G � H H  N u m b e r F  I J I o    ���� 0 handlername handlerName J  K L K o    ���� 0 etext eText L  M N M o    	���� 0 enumber eNumber N  O P O o   	 
���� 0 efrom eFrom P  Q�� Q o   
 ���� 
0 eto eTo��  ��   C o     ���� 0 _support   5  R S R l     ��������  ��  ��   S  T U T l     ��������  ��  ��   U  V W V l     �� X Y��   X J D--------------------------------------------------------------------    Y � Z Z � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - W  [ \ [ l     �� ] ^��   ]  
 constants    ^ � _ _    c o n s t a n t s \  ` a ` l     ��������  ��  ��   a  b c b l      d e f d j   " $�� g�� 	0 __e__   g m   " # h h @�
�_� e ; 5 the mathematical constant e (natural logarithm base)    f � i i j   t h e   m a t h e m a t i c a l   c o n s t a n t   e   ( n a t u r a l   l o g a r i t h m   b a s e ) c  j k j l     ��������  ��  ��   k  l m l l      n o p n j   % '�� q�� 0 _isequaldelta _isEqualDelta q m   % & r r =q���-� o i c multiplier used by `cmp` to allow for slight differences due to floating point's limited precision    p � s s �   m u l t i p l i e r   u s e d   b y   ` c m p `   t o   a l l o w   f o r   s l i g h t   d i f f e r e n c e s   d u e   t o   f l o a t i n g   p o i n t ' s   l i m i t e d   p r e c i s i o n m  t u t l     ��������  ��  ��   u  v w v l     �� x y��   x � � [positive] numeric range within which `basic format` uses decimal rather than scientific notation when formatting reals (this mimics AS's own behavior); the corresponding negative range is calcuated automatically    y � z z�   [ p o s i t i v e ]   n u m e r i c   r a n g e   w i t h i n   w h i c h   ` b a s i c   f o r m a t `   u s e s   d e c i m a l   r a t h e r   t h a n   s c i e n t i f i c   n o t a t i o n   w h e n   f o r m a t t i n g   r e a l s   ( t h i s   m i m i c s   A S ' s   o w n   b e h a v i o r ) ;   t h e   c o r r e s p o n d i n g   n e g a t i v e   r a n g e   i s   c a l c u a t e d   a u t o m a t i c a l l y w  { | { j   ( *�� }�� $0 _mindecimalrange _minDecimalRange } m   ( ) ~ ~ ?PbM��� |   �  j   + -�� ��� $0 _maxdecimalrange _maxDecimalRange � m   + , � � @È      �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �� � ���   �   parse and format    � � � � "   p a r s e   a n d   f o r m a t �  � � � l     ��������  ��  ��   �  � � � i  . 1 � � � I      �� ����� (0 _asintegerproperty _asIntegerProperty �  � � � o      ���� 0 thevalue theValue �  � � � o      ���� 0 propertyname propertyName �  ��� � o      ���� 0 minvalue minValue��  ��   � l    8 � � � � Q     8 � � � � k    & � �  � � � r     � � � c     � � � o    ���� 0 thevalue theValue � m    ��
�� 
long � o      ���� 0 n   �  � � � Z  	 # � ����� � G   	  � � � >   	  � � � o   	 
���� 0 n   � c   
  � � � o   
 ���� 0 thevalue theValue � m    ��
�� 
doub � A     � � � o    ���� 0 n   � o    ���� 0 minvalue minValue � R    ���� �
�� .ascrerr ****      � ****��   � �� ���
�� 
errn � m    �����Y��  ��  ��   �  ��� � L   $ & � � o   $ %���� 0 n  ��   � R      ���� �
�� .ascrerr ****      � ****��   � �� ���
�� 
errn � d       � � m      �������   � R   . 8�� � �
�� .ascrerr ****      � **** � b   2 7 � � � b   2 5 � � � m   2 3 � � � � � R T h e    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    � o   3 4���� 0 propertyname propertyName � m   5 6 � � � � � R    p r o p e r t y   i s   n o t   a   n o n - n e g a t i v e   i n t e g e r . � �� ���
�� 
errn � m   0 1�����Y��   � . ( TO DO: what about sensible upper bound?    � � � � P   T O   D O :   w h a t   a b o u t   s e n s i b l e   u p p e r   b o u n d ? �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  2 5 � � � I      �� ����� ,0 _makenumberformatter _makeNumberFormatter �  � � � o      ���� 0 formatstyle formatStyle �  � � � o      ���� 0 
localecode 
localeCode �  ��� � o      ���� 0 	thenumber 	theNumber��  ��   � l   � � � � � k    � � �  � � � l     � � � � r      � � � n     � � � I    �������� 0 init  ��  ��   � n     � � � I    ��~�}� 	0 alloc  �~  �}   � n     � � � o    �|�| &0 nsnumberformatter NSNumberFormatter � m     �{
�{ misccura � o      �z�z 0 asocformatter asocFormatter �	 (note that while NSFormatter provides a global +setDefaultFormatterBehavior: option to change all NSNumberFormatters to use pre-10.4 behavior, we don't bother to call setFormatterBehavior: as it's very unlikely nowadays that a host process would change this)    � � � �   ( n o t e   t h a t   w h i l e   N S F o r m a t t e r   p r o v i d e s   a   g l o b a l   + s e t D e f a u l t F o r m a t t e r B e h a v i o r :   o p t i o n   t o   c h a n g e   a l l   N S N u m b e r F o r m a t t e r s   t o   u s e   p r e - 1 0 . 4   b e h a v i o r ,   w e   d o n ' t   b o t h e r   t o   c a l l   s e t F o r m a t t e r B e h a v i o r :   a s   i t ' s   v e r y   u n l i k e l y   n o w a d a y s   t h a t   a   h o s t   p r o c e s s   w o u l d   c h a n g e   t h i s ) �  � � � Q   � � � � � Z   w � ��y � � =     � � � l    ��x�w � I   �v � �
�v .corecnte****       **** � J     � �  ��u � o    �t�t 0 formatstyle formatStyle�u   � �s ��r
�s 
kocl � m    �q
�q 
reco�r  �x  �w   � m    �p�p  � k   [ � �  � � � r    P � � � n   N � � � I   $ N�o �n�o 60 asoptionalrecordparameter asOptionalRecordParameter   o   $ %�m�m 0 formatstyle formatStyle  K   % G �l
�l 
pcls l  & '�k�j m   & '�i
�i 
MthR�k  �j   �h	

�h 
MthA	 n  ( / o   - /�g�g 0 requiredvalue RequiredValue o   ( -�f�f 0 _support  
 �e
�e 
MthB m   0 1�d
�d 
msng �c
�c 
MthC m   2 3�b
�b 
msng �a
�a 
MthD m   4 5�`
�` 
msng �_
�_ 
MthE m   6 7�^
�^ 
msng �]
�] 
MthF m   : ;�\
�\ 
msng �[
�[ 
MthG m   > ?�Z
�Z 
msng �Y�X
�Y 
MthH m   B C�W
�W 
msng�X   �V m   G J � 
 u s i n g�V  �n   � o    $�U�U 0 _support   � o      �T�T 0 formatrecord formatRecord �  I   Q [�S�R�S "0 _setbasicformat _setBasicFormat  !  o   R S�Q�Q 0 asocformatter asocFormatter! "#" n  S V$%$ 1   T V�P
�P 
MthA% o   S T�O�O 0 formatrecord formatRecord# &�N& o   V W�M�M 0 	thenumber 	theNumber�N  �R   '(' Z   \ �)*�L�K) >  \ a+,+ n  \ _-.- 1   ] _�J
�J 
MthB. o   \ ]�I�I 0 formatrecord formatRecord, m   _ `�H
�H 
msng* k   d �// 010 n  d u232 I   e u�G4�F�G 60 setminimumfractiondigits_ setMinimumFractionDigits_4 5�E5 I   e q�D6�C�D (0 _asintegerproperty _asIntegerProperty6 787 n  f i9:9 1   g i�B
�B 
MthB: o   f g�A�A 0 formatrecord formatRecord8 ;<; m   i l== �>> , m i n i m u m   d e c i m a l   p l a c e s< ?�@? m   l m�?�?  �@  �C  �E  �F  3 o   d e�>�> 0 asocformatter asocFormatter1 @A@ l  v ~BCDB n  v ~EFE I   w ~�=G�<�= 60 setmaximumfractiondigits_ setMaximumFractionDigits_G H�;H m   w z�:�:��;  �<  F o   v w�9�9 0 asocformatter asocFormatterC L F kludge for NSNumberFormatterBug; see notes in _setBasicFormat() below   D �II �   k l u d g e   f o r   N S N u m b e r F o r m a t t e r B u g ;   s e e   n o t e s   i n   _ s e t B a s i c F o r m a t ( )   b e l o wA J�8J l   �7KL�7  KasocFormatter's setAlwaysShowsDecimalSeparator:true -- note: doesn't work well when significant digits are specified (may leave hanging separator char with no "0" after it), but doesn't seem to be essential when fraction digits are already specified, so just disable/omit it   L �MM$ a s o c F o r m a t t e r ' s   s e t A l w a y s S h o w s D e c i m a l S e p a r a t o r : t r u e   - -   n o t e :   d o e s n ' t   w o r k   w e l l   w h e n   s i g n i f i c a n t   d i g i t s   a r e   s p e c i f i e d   ( m a y   l e a v e   h a n g i n g   s e p a r a t o r   c h a r   w i t h   n o   " 0 "   a f t e r   i t ) ,   b u t   d o e s n ' t   s e e m   t o   b e   e s s e n t i a l   w h e n   f r a c t i o n   d i g i t s   a r e   a l r e a d y   s p e c i f i e d ,   s o   j u s t   d i s a b l e / o m i t   i t�8  �L  �K  ( NON Z   � �PQ�6�5P >  � �RSR n  � �TUT 1   � ��4
�4 
MthCU o   � ��3�3 0 formatrecord formatRecordS m   � ��2
�2 
msngQ k   � �VV WXW n  � �YZY I   � ��1[�0�1 60 setmaximumfractiondigits_ setMaximumFractionDigits_[ \�/\ I   � ��.]�-�. (0 _asintegerproperty _asIntegerProperty] ^_^ n  � �`a` 1   � ��,
�, 
MthCa o   � ��+�+ 0 formatrecord formatRecord_ bcb m   � �dd �ee , m a x i m u m   d e c i m a l   p l a c e sc f�*f m   � ��)�)  �*  �-  �/  �0  Z o   � ��(�( 0 asocformatter asocFormatterX g�'g l  � ��&hi�&  h B <asocFormatter's setAlwaysShowsDecimalSeparator:true -- ditto   i �jj x a s o c F o r m a t t e r ' s   s e t A l w a y s S h o w s D e c i m a l S e p a r a t o r : t r u e   - -   d i t t o�'  �6  �5  O klk Z   � �mn�%�$m >  � �opo n  � �qrq 1   � ��#
�# 
MthDr o   � ��"�" 0 formatrecord formatRecordp m   � ��!
�! 
msngn k   � �ss tut n  � �vwv I   � �� x��  <0 setminimumsignificantdigits_ setMinimumSignificantDigits_x y�y I   � ��z�� (0 _asintegerproperty _asIntegerPropertyz {|{ n  � �}~} 1   � ��
� 
MthD~ o   � ��� 0 formatrecord formatRecord| � m   � ��� ��� 4 m i n i m u m   s i g n i f i c a n t   d i g i t s� ��� m   � ���  �  �  �  �  w o   � ��� 0 asocformatter asocFormatteru ��� n  � ���� I   � ����� 60 setusessignificantdigits_ setUsesSignificantDigits_� ��� m   � ��
� boovtrue�  �  � o   � ��� 0 asocformatter asocFormatter�  �%  �$  l ��� Z   � ������ >  � ���� n  � ���� 1   � ��
� 
MthE� o   � ��� 0 formatrecord formatRecord� m   � ��
� 
msng� k   � ��� ��� n  � ���� I   � ����
� <0 setmaximumsignificantdigits_ setMaximumSignificantDigits_� ��	� I   � ����� (0 _asintegerproperty _asIntegerProperty� ��� n  � ���� 1   � ��
� 
MthE� o   � ��� 0 formatrecord formatRecord� ��� m   � ��� ��� 4 m a x i m u m   s i g n i f i c a n t   d i g i t s� ��� m   � ���  �  �  �	  �
  � o   � ��� 0 asocformatter asocFormatter� ��� n  � ���� I   � �� ����  60 setusessignificantdigits_ setUsesSignificantDigits_� ���� m   � ���
�� boovtrue��  ��  � o   � ����� 0 asocformatter asocFormatter�  �  �  � ��� Z   �?������� >  � ���� n  � ���� 1   � ���
�� 
MthF� o   � ����� 0 formatrecord formatRecord� m   � ���
�� 
msng� Q   �;���� k   �'�� ��� r   ���� c   ���� n  ���� 1   ���
�� 
MthF� o   � ����� 0 formatrecord formatRecord� m  ��
�� 
ctxt� o      ���� 0 s  � ��� Z  ������� =  ��� n ��� 1  	��
�� 
leng� o  	���� 0 s  � m  ����  � R  �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� m  �����Y��  ��  ��  � ���� n !'��� I  "'������� ,0 setdecimalseparator_ setDecimalSeparator_� ���� o  "#���� 0 s  ��  ��  � o  !"���� 0 asocformatter asocFormatter��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � R  /;����
�� .ascrerr ****      � ****� m  7:�� ��� � T h e    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    d e c i m a l   s e p a r a t o r    p r o p e r t y   i s   n o t   n o n - e m p t y   t e x t .� �����
�� 
errn� m  36�����Y��  ��  ��  � ��� Z  @�������� > @G��� n @E��� 1  AE��
�� 
MthG� o  @A���� 0 formatrecord formatRecord� m  EF��
�� 
msng� Q  J����� k  My�� ��� r  MX��� c  MV��� n MR��� 1  NR��
�� 
MthG� o  MN���� 0 formatrecord formatRecord� m  RU��
�� 
ctxt� o      ���� 0 s  � ���� Z  Yy������ =  Y`��� n Y^��� 1  Z^��
�� 
leng� o  YZ���� 0 s  � m  ^_����  � n ci��� I  di������� 60 setusesgroupingseparator_ setUsesGroupingSeparator_� ���� m  de��
�� boovfals��  ��  � o  cd���� 0 asocformatter asocFormatter��  � k  ly�� ��� n lr��� I  mr������� 60 setusesgroupingseparator_ setUsesGroupingSeparator_� ���� m  mn��
�� boovtrue��  ��  � o  lm���� 0 asocformatter asocFormatter� ���� n sy��� I  ty������� .0 setgroupingseparator_ setGroupingSeparator_� ���� o  tu���� 0 s  ��  ��  � o  st���� 0 asocformatter asocFormatter��  ��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d         m      �������  � R  ����
�� .ascrerr ****      � **** m  �� � � T h e    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    g r o u p i n g   s e p a r a t o r    p r o p e r t y   i s   n o t   t e x t . ����
�� 
errn m  �������Y��  ��  ��  � �� Z  �[���� > ��	
	 n �� 1  ����
�� 
MthH o  ������ 0 formatrecord formatRecord
 m  ����
�� 
msng Z  �W = �� n �� 1  ����
�� 
MthH o  ������ 0 formatrecord formatRecord l ������ m  ����
�� MRndRNhE��  ��   n �� I  �������� $0 setroundingmode_ setRoundingMode_ �� l ������ n �� o  ������ @0 nsnumberformatterroundhalfeven NSNumberFormatterRoundHalfEven m  ����
�� misccura��  ��  ��  ��   o  ������ 0 asocformatter asocFormatter  = ��  n ��!"! 1  ����
�� 
MthH" o  ������ 0 formatrecord formatRecord  l ��#����# m  ����
�� MRndRNhT��  ��   $%$ n ��&'& I  ����(���� $0 setroundingmode_ setRoundingMode_( )��) l ��*����* n ��+,+ o  ������ @0 nsnumberformatterroundhalfdown NSNumberFormatterRoundHalfDown, m  ����
�� misccura��  ��  ��  ��  ' o  ������ 0 asocformatter asocFormatter% -.- = ��/0/ n ��121 1  ����
�� 
MthH2 o  ������ 0 formatrecord formatRecord0 l ��3����3 m  ����
�� MRndRNhF��  ��  . 454 n ��676 I  ����8���� $0 setroundingmode_ setRoundingMode_8 9��9 l ��:����: n ��;<; o  ������ <0 nsnumberformatterroundhalfup NSNumberFormatterRoundHalfUp< m  ����
�� misccura��  ��  ��  ��  7 o  ������ 0 asocformatter asocFormatter5 =>= = ��?@? n ��ABA 1  ����
�� 
MthHB o  ������ 0 formatrecord formatRecord@ l ��C����C m  ����
�� MRndRN_T��  ��  > DED n ��FGF I  ����H��� $0 setroundingmode_ setRoundingMode_H I�~I l ��J�}�|J n ��KLK o  ���{�{ 80 nsnumberformatterrounddown NSNumberFormatterRoundDownL m  ���z
�z misccura�}  �|  �~  �  G o  ���y�y 0 asocformatter asocFormatterE MNM =  	OPO n  QRQ 1  �x
�x 
MthHR o   �w�w 0 formatrecord formatRecordP l S�v�uS m  �t
�t MRndRN_F�v  �u  N TUT n VWV I  �sX�r�s $0 setroundingmode_ setRoundingMode_X Y�qY l Z�p�oZ n [\[ o  �n�n 40 nsnumberformatterroundup NSNumberFormatterRoundUp\ m  �m
�m misccura�p  �o  �q  �r  W o  �l�l 0 asocformatter asocFormatterU ]^] = "_`_ n aba 1  �k
�k 
MthHb o  �j�j 0 formatrecord formatRecord` l !c�i�hc m  !�g
�g MRndRN_U�i  �h  ^ ded n %/fgf I  &/�fh�e�f $0 setroundingmode_ setRoundingMode_h i�di l &+j�c�bj n &+klk o  '+�a�a >0 nsnumberformatterroundceiling NSNumberFormatterRoundCeilingl m  &'�`
�` misccura�c  �b  �d  �e  g o  %&�_�_ 0 asocformatter asocFormattere mnm = 2;opo n 27qrq 1  37�^
�^ 
MthHr o  23�]�] 0 formatrecord formatRecordp l 7:s�\�[s m  7:�Z
�Z MRndRN_D�\  �[  n t�Yt n >Huvu I  ?H�Xw�W�X $0 setroundingmode_ setRoundingMode_w x�Vx l ?Dy�U�Ty n ?Dz{z o  @D�S�S :0 nsnumberformatterroundfloor NSNumberFormatterRoundFloor{ m  ?@�R
�R misccura�U  �T  �V  �W  v o  >?�Q�Q 0 asocformatter asocFormatter�Y   R  KW�P|}
�P .ascrerr ****      � ****| m  SV~~ � � T h e    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    r o u n d i n g   b e h a v i o r    i s   n o t   a n   a l l o w e d   c o n s t a n t .} �O��N
�O 
errn� m  OR�M�M�Y�N  ��  ��  ��  �y   � Q  ^w���� I  ai�L��K�L "0 _setbasicformat _setBasicFormat� ��� o  bc�J�J 0 asocformatter asocFormatter� ��� o  cd�I�I 0 formatstyle formatStyle� ��H� o  de�G�G 0 	thenumber 	theNumber�H  �K  � R      �F�E�
�F .ascrerr ****      � ****�E  � �D��C
�D 
errn� d      �� m      �B�B��C  � R  qw�A��@
�A .ascrerr ****      � ****� m  sv�� ��� ~ N o t   a    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d   o r   a n   a l l o w e d   c o n s t a n t .�@   � R      �?��
�? .ascrerr ****      � ****� o      �>�> 0 etext eText� �=��<
�= 
errn� d      �� m      �;�;��<   � n ���� I  ���:��9�: .0 throwinvalidparameter throwInvalidParameter� ��� o  ���8�8 0 formatstyle formatStyle� ��� m  ���� ��� 
 u s i n g� ��� J  ���� ��� m  ���7
�7 
reco� ��6� m  ���5
�5 
enum�6  � ��4� o  ���3�3 0 etext eText�4  �9  � o  ��2�2 0 _support   � ��� n ����� I  ���1��0�1 0 
setlocale_ 
setLocale_� ��/� l ����.�-� n ����� I  ���,��+�, *0 asnslocaleparameter asNSLocaleParameter� ��� o  ���*�* 0 
localecode 
localeCode� ��)� m  ���� ���  f o r   l o c a l e�)  �+  � o  ���(�( 0 _support  �.  �-  �/  �0  � o  ���'�' 0 asocformatter asocFormatter� ��&� L  ���� o  ���%�% 0 asocformatter asocFormatter�&   � � � theNumber is either the number being formatted or `missing value` when parsing; determines appropriate formatting style based on number's type and value when `native format` is specified    � ���v   t h e N u m b e r   i s   e i t h e r   t h e   n u m b e r   b e i n g   f o r m a t t e d   o r   ` m i s s i n g   v a l u e `   w h e n   p a r s i n g ;   d e t e r m i n e s   a p p r o p r i a t e   f o r m a t t i n g   s t y l e   b a s e d   o n   n u m b e r ' s   t y p e   a n d   v a l u e   w h e n   ` n a t i v e   f o r m a t `   i s   s p e c i f i e d � ��� l     �$�#�"�$  �#  �"  � ��� l     �!� ��!  �   �  � ��� i  6 9��� I      ���� "0 _setbasicformat _setBasicFormat� ��� o      �� 0 asocformatter asocFormatter� ��� o      �� 0 
formatname 
formatName� ��� o      �� 0 	thenumber 	theNumber�  �  � Z    F����� =    ��� o     �� 0 
formatname 
formatName� m    �
� MthZMth0� Z    ������ =   	��� o    �� 0 	thenumber 	theNumber� m    �
� 
msng� l   ���� n   ��� I    ���� "0 setnumberstyle_ setNumberStyle_� ��� l   ���� n   ��� o    �� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� m    �
� misccura�  �  �  �  � o    �� 0 asocformatter asocFormatter� ? 9 parsing always recognizes scientific notation by default   � ��� r   p a r s i n g   a l w a y s   r e c o g n i z e s   s c i e n t i f i c   n o t a t i o n   b y   d e f a u l t�  � l   ����� Z    ������ =   ��� n   ��� m    �
� 
pcls� o    �
�
 0 	thenumber 	theNumber� m    �	
�	 
long� l   '���� n   '��� I     '���� "0 setnumberstyle_ setNumberStyle_� ��� l    #���� n    #��� o   ! #�� 40 nsnumberformatternostyle NSNumberFormatterNoStyle� m     !�
� misccura�  �  �  �  � o     �� 0 asocformatter asocFormatter�   format integer   � ���    f o r m a t   i n t e g e r� ��� G   * _��� G   * W��� l 
 * ?�� ��� l  * ?������ F   * ?��� A   * 2��� d   * 0�� o   * /���� $0 _maxdecimalrange _maxDecimalRange� o   0 1���� 0 	thenumber 	theNumber� A   5 =��� o   5 6���� 0 	thenumber 	theNumber� d   6 <�� o   6 ;���� $0 _mindecimalrange _minDecimalRange��  ��  �   ��  � l 
 B U ����  l  B U���� F   B U A   B I o   B G���� $0 _mindecimalrange _minDecimalRange o   G H���� 0 	thenumber 	theNumber A   L S o   L M���� 0 	thenumber 	theNumber o   M R���� $0 _maxdecimalrange _maxDecimalRange��  ��  ��  ��  � =   Z ]	 o   Z [���� 0 	thenumber 	theNumber	 m   [ \����  � 
��
 l  b � k   b �  l  b b����   Y S use {basic format:decimal format, minimum decimal places:1, grouping separator:""}    � �   u s e   { b a s i c   f o r m a t : d e c i m a l   f o r m a t ,   m i n i m u m   d e c i m a l   p l a c e s : 1 ,   g r o u p i n g   s e p a r a t o r : " " }  n  b j I   c j������ "0 setnumberstyle_ setNumberStyle_ �� l  c f���� n  c f o   d f���� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle m   c d��
�� misccura��  ��  ��  ��   o   b c���� 0 asocformatter asocFormatter  n  k q  I   l q��!���� 60 setminimumfractiondigits_ setMinimumFractionDigits_! "��" m   l m���� ��  ��    o   k l���� 0 asocformatter asocFormatter #$# l  r x%&'% n  r x()( I   s x��*���� 60 setmaximumfractiondigits_ setMaximumFractionDigits_* +��+ m   s t�������  ��  ) o   r s���� 0 asocformatter asocFormatter&   kludge; see note below   ' �,, .   k l u d g e ;   s e e   n o t e   b e l o w$ -.- n  y /0/ I   z ��1���� 60 setusesgroupingseparator_ setUsesGroupingSeparator_1 2��2 m   z {��
�� boovfals��  ��  0 o   y z���� 0 asocformatter asocFormatter. 3��3 l  � ���45��  4 a [ asocFormatter's setAlwaysShowsDecimalSeparator:true -- see notes in _makeNumberFormatter()   5 �66 �   a s o c F o r m a t t e r ' s   s e t A l w a y s S h o w s D e c i m a l S e p a r a t o r : t r u e   - -   s e e   n o t e s   i n   _ m a k e N u m b e r F o r m a t t e r ( )��     format real as decimal    �77 .   f o r m a t   r e a l   a s   d e c i m a l��  � l  � �89:8 k   � �;; <=< n  � �>?> I   � ���@���� "0 setnumberstyle_ setNumberStyle_@ A��A l  � �B����B n  � �CDC o   � ����� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyleD m   � ���
�� misccura��  ��  ��  ��  ? o   � ����� 0 asocformatter asocFormatter= EFE l  � ���GH��  G S M for consistency with AS, always include minimum 1DP, e.g. "1.0E8", not "1E8"   H �II �   f o r   c o n s i s t e n c y   w i t h   A S ,   a l w a y s   i n c l u d e   m i n i m u m   1 D P ,   e . g .   " 1 . 0 E 8 " ,   n o t   " 1 E 8 "F JKJ n  � �LML I   � ���N���� 60 setminimumfractiondigits_ setMinimumFractionDigits_N O��O m   � ����� ��  ��  M o   � ����� 0 asocformatter asocFormatterK PQP l  � ���RS��  R note: for some reason `setAlwaysShowsDecimalSeparator:true` is ignored, while `setMinimumFractionDigits:1` causes number to be truncated (note: maximum seems to change as well as minimum, which is wrong) unless maximum is set to a higher value afterwards (NSNumberFormatter bugs?)   S �TT2   n o t e :   f o r   s o m e   r e a s o n   ` s e t A l w a y s S h o w s D e c i m a l S e p a r a t o r : t r u e `   i s   i g n o r e d ,   w h i l e   ` s e t M i n i m u m F r a c t i o n D i g i t s : 1 `   c a u s e s   n u m b e r   t o   b e   t r u n c a t e d   ( n o t e :   m a x i m u m   s e e m s   t o   c h a n g e   a s   w e l l   a s   m i n i m u m ,   w h i c h   i s   w r o n g )   u n l e s s   m a x i m u m   i s   s e t   t o   a   h i g h e r   v a l u e   a f t e r w a r d s   ( N S N u m b e r F o r m a t t e r   b u g s ? )Q UVU n  � �WXW I   � ���Y���� 60 setmaximumfractiondigits_ setMaximumFractionDigits_Y Z��Z m   � ��������  ��  X o   � ����� 0 asocformatter asocFormatterV [��[ l  � ���\]��  \ C = asocFormatter's setAlwaysShowsDecimalSeparator:true -- ditto   ] �^^ z   a s o c F o r m a t t e r ' s   s e t A l w a y s S h o w s D e c i m a l S e p a r a t o r : t r u e   - -   d i t t o��  9    format real as scientific   : �__ 4   f o r m a t   r e a l   a s   s c i e n t i f i c� Q K formatting switches between notations depending on number's type and value   � �`` �   f o r m a t t i n g   s w i t c h e s   b e t w e e n   n o t a t i o n s   d e p e n d i n g   o n   n u m b e r ' s   t y p e   a n d   v a l u e� aba =  � �cdc o   � ����� 0 
formatname 
formatNamed m   � ���
�� MthZMth3b efe l  � �ghig n  � �jkj I   � ���l���� "0 setnumberstyle_ setNumberStyle_l m��m l  � �n����n n  � �opo o   � ����� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStylep m   � ���
�� misccura��  ��  ��  ��  k o   � ����� 0 asocformatter asocFormatterh   uses exponent notation   i �qq .   u s e s   e x p o n e n t   n o t a t i o nf rsr =  � �tut o   � ����� 0 
formatname 
formatNameu m   � ���
�� MthZMth1s vwv l  � �xyzx n  � �{|{ I   � ���}���� "0 setnumberstyle_ setNumberStyle_} ~��~ l  � ����� n  � ���� o   � ����� 40 nsnumberformatternostyle NSNumberFormatterNoStyle� m   � ���
�� misccura��  ��  ��  ��  | o   � ����� 0 asocformatter asocFormattery n h uses plain integer notation (caution: do not use for reals unless rounding to whole number is intended)   z ��� �   u s e s   p l a i n   i n t e g e r   n o t a t i o n   ( c a u t i o n :   d o   n o t   u s e   f o r   r e a l s   u n l e s s   r o u n d i n g   t o   w h o l e   n u m b e r   i s   i n t e n d e d )w ��� =  � ���� o   � ����� 0 
formatname 
formatName� m   � ���
�� MthZMth2� ��� l  � ����� n  � ���� I   � �������� "0 setnumberstyle_ setNumberStyle_� ���� l  � ������� n  � ���� o   � ����� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle� m   � ���
�� misccura��  ��  ��  ��  � o   � ����� 0 asocformatter asocFormatter� 8 2 uses thousands separators by default, no exponent   � ��� d   u s e s   t h o u s a n d s   s e p a r a t o r s   b y   d e f a u l t ,   n o   e x p o n e n t� ��� =  � ���� o   � ����� 0 
formatname 
formatName� m   � ���
�� MthZMth5� ��� l  � ����� n  � ���� I   � �������� "0 setnumberstyle_ setNumberStyle_� ���� l  � ������� n  � ���� o   � ����� @0 nsnumberformattercurrencystyle NSNumberFormatterCurrencyStyle� m   � ���
�� misccura��  ��  ��  ��  � o   � ����� 0 asocformatter asocFormatter�   adds currency symbol   � ��� *   a d d s   c u r r e n c y   s y m b o l� ��� =  � ���� o   � ����� 0 
formatname 
formatName� m   � ���
�� MthZMth4� ��� l  � ����� n  � ���� I   � �������� "0 setnumberstyle_ setNumberStyle_� ���� l  � ������� n  � ���� o   � ����� >0 nsnumberformatterpercentstyle NSNumberFormatterPercentStyle� m   � ���
�� misccura��  ��  ��  ��  � o   � ����� 0 asocformatter asocFormatter� ( " multiplies by 100 and appends '%'   � ��� D   m u l t i p l i e s   b y   1 0 0   a n d   a p p e n d s   ' % '� ��� =  ���� o   � ����� 0 
formatname 
formatName� m   ���
�� MthZMth6� ��� l ���� n ��� I  ������� "0 setnumberstyle_ setNumberStyle_� ���� l ������ n ��� o  ���� @0 nsnumberformatterspelloutstyle NSNumberFormatterSpellOutStyle� m  ��
�� misccura��  ��  ��  ��  � o  ���� 0 asocformatter asocFormatter�   uses words   � ���    u s e s   w o r d s� ��� >  "��� l  ������ I  ���
� .corecnte****       ****� J  �� ��~� o  �}�} 0 
formatname 
formatName�~  � �|��{
�| 
kocl� m  �z
�z 
ctxt�{  ��  ��  � m   !�y�y  � ��x� n %+��� I  &+�w��v�w 0 
setformat_ 
setFormat_� ��u� o  &'�t�t 0 
formatname 
formatName�u  �v  � o  %&�s�s 0 asocformatter asocFormatter�x  � R  .F�r��
�r .ascrerr ****      � ****� m  BE�� ��� r I n v a l i d    b a s i c   f o r m a t    p r o p e r t y :   n o t   a n   a l l o w e d   c o n s t a n t .� �q��
�q 
errn� m  25�p�p�Y� �o��
�o 
erob� o  89�n�n 0 
formatname 
formatName� �m��l
�m 
errt� m  <?�k
�k 
enum�l  � ��� l     �j�i�h�j  �i  �h  � ��� l     �g�f�e�g  �f  �e  � ��� i  : =��� I      �d��c�d  0 _nameforformat _nameForFormat� ��b� o      �a�a 0 formatstyle formatStyle�b  �c  � l    H���� Z     H����� =    ��� o     �`�` 0 formatstyle formatStyle� m    �_
�_ MthZMth1� L    �� m    �� ���  i n t e g e r� ��� =   ��� o    �^�^ 0 formatstyle formatStyle� m    �]
�] MthZMth2� ��� L    �� m    �� ���  d e c i m a l� ��� =      o    �\�\ 0 formatstyle formatStyle m    �[
�[ MthZMth5�  L     m     �  c u r r e n c y  =  ! $	
	 o   ! "�Z�Z 0 formatstyle formatStyle
 m   " #�Y
�Y MthZMth4  L   ' ) m   ' ( �  p e r c e n t  =  , / o   , -�X�X 0 formatstyle formatStyle m   - .�W
�W MthZMth3  L   2 4 m   2 3 �  s c i e n t i f i c  =  7 : o   7 8�V�V 0 formatstyle formatStyle m   8 9�U
�U MthZMth6 �T L   = ? m   = > �    w o r d�T  � L   B H!! b   B G"#" b   B E$%$ m   B C&& �''  % o   C D�S�S 0 formatstyle formatStyle# m   E F(( �))  � G A used for error reporting; formatStyle is either constant or text   � �** �   u s e d   f o r   e r r o r   r e p o r t i n g ;   f o r m a t S t y l e   i s   e i t h e r   c o n s t a n t   o r   t e x t� +,+ l     �R�Q�P�R  �Q  �P  , -.- l     �O�N�M�O  �N  �M  . /0/ l     �L12�L  1  -----   2 �33 
 - - - - -0 454 l     �K�J�I�K  �J  �I  5 676 i  > A898 I     �H:;
�H .Mth:FNumnull���     nmbr: o      �G�G 0 	thenumber 	theNumber; �F<=
�F 
Usin< |�E�D>�C?�E  �D  > o      �B�B 0 formatstyle formatStyle�C  ? l     @�A�@@ m      �?
�? MthZMth0�A  �@  = �>A�=
�> 
LocaA |�<�;B�:C�<  �;  B o      �9�9 0 
localecode 
localeCode�:  C l     D�8�7D m      EE �FF  n o n e�8  �7  �=  9 Q     dGHIG k    NJJ KLK l   "MNOM Z   "PQ�6�5P =    RSR l   T�4�3T I   �2UV
�2 .corecnte****       ****U J    WW X�1X o    �0�0 0 	thenumber 	theNumber�1  V �/Y�.
�/ 
koclY m    �-
�- 
nmbr�.  �4  �3  S m    �,�,  Q n   Z[Z I    �+\�*�+ 60 throwinvalidparametertype throwInvalidParameterType\ ]^] o    �)�) 0 	thenumber 	theNumber^ _`_ m    aa �bb  ` cdc m    �(
�( 
nmbrd e�'e m    ff �gg  n u m b e r�'  �*  [ o    �&�& 0 _support  �6  �5  N � � only accept integer or real types (i.e. allowing a text parameter to be coerced to number would defeat the purpose of these handlers, which is to avoid unintended localization behavior)   O �hht   o n l y   a c c e p t   i n t e g e r   o r   r e a l   t y p e s   ( i . e .   a l l o w i n g   a   t e x t   p a r a m e t e r   t o   b e   c o e r c e d   t o   n u m b e r   w o u l d   d e f e a t   t h e   p u r p o s e   o f   t h e s e   h a n d l e r s ,   w h i c h   i s   t o   a v o i d   u n i n t e n d e d   l o c a l i z a t i o n   b e h a v i o r )L iji r   # -klk I   # +�%m�$�% ,0 _makenumberformatter _makeNumberFormatterm non o   $ %�#�# 0 formatstyle formatStyleo pqp o   % &�"�" 0 
localecode 
localeCodeq r�!r o   & '� �  0 	thenumber 	theNumber�!  �$  l o      �� 0 asocformatter asocFormatterj sts r   . 6uvu n  . 4wxw I   / 4�y�� &0 stringfromnumber_ stringFromNumber_y z�z o   / 0�� 0 	thenumber 	theNumber�  �  x o   . /�� 0 asocformatter asocFormatterv o      �� 0 
asocstring 
asocStringt {|{ l  7 I}~} Z  7 I����� =  7 :��� o   7 8�� 0 
asocstring 
asocString� m   8 9�
� 
msng� R   = E���
� .ascrerr ****      � ****� m   C D�� ��� F I n v a l i d   n u m b e r   ( c o n v e r s i o n   f a i l e d ) .� ���
� 
errn� m   ? @���Y� ���
� 
erob� o   A B�� 0 	thenumber 	theNumber�  �  �  ~ n h shouldn't fail, but -stringFromNumber:'s return type isn't declared as non-nullable so check to be sure    ��� �   s h o u l d n ' t   f a i l ,   b u t   - s t r i n g F r o m N u m b e r : ' s   r e t u r n   t y p e   i s n ' t   d e c l a r e d   a s   n o n - n u l l a b l e   s o   c h e c k   t o   b e   s u r e| ��� L   J N�� c   J M��� o   J K�� 0 
asocstring 
asocString� m   K L�
� 
ctxt�  H R      ���
� .ascrerr ****      � ****� o      �
�
 0 etext eText� �	��
�	 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  I I   V d���� 
0 _error  � ��� m   W Z�� ���  f o r m a t   n u m b e r� ��� o   Z [� �  0 etext eText� ��� o   [ \���� 0 enumber eNumber� ��� o   \ ]���� 0 efrom eFrom� ���� o   ] ^���� 
0 eto eTo��  �  7 ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  B E��� I     ����
�� .Mth:PNumnull���     ctxt� o      ���� 0 thetext theText� ����
�� 
Usin� |����������  ��  � o      ���� 0 formatstyle formatStyle��  � l     ������ m      ��
�� MthZMth0��  ��  � �����
�� 
Loca� |����������  ��  � o      ���� 0 
localecode 
localeCode��  � l     ������ m      �� ���  n o n e��  ��  ��  � Q     ����� k    ��� ��� l   "���� Z   "������� =    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ���� 0 thetext theText��  � �����
�� 
kocl� m    ��
�� 
ctxt��  ��  ��  � m    ����  � n   ��� I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 thetext theText� ��� m    �� ���  � ��� m    ��
�� 
ctxt� ���� m    �� ���  t e x t��  ��  � o    ���� 0 _support  ��  ��  � 1 + only accept text, for same reason as above   � ��� V   o n l y   a c c e p t   t e x t ,   f o r   s a m e   r e a s o n   a s   a b o v e� ��� r   # -��� I   # +������� ,0 _makenumberformatter _makeNumberFormatter� ��� o   $ %���� 0 formatstyle formatStyle� ��� o   % &���� 0 
localecode 
localeCode� ���� m   & '��
�� 
msng��  ��  � o      ���� 0 asocformatter asocFormatter� ��� r   . 6��� n  . 4��� I   / 4������� &0 numberfromstring_ numberFromString_� ���� o   / 0���� 0 thetext theText��  ��  � o   . /���� 0 asocformatter asocFormatter� o      ���� 0 
asocnumber 
asocNumber� ��� Z   7 �������� =  7 :��� o   7 8���� 0 
asocnumber 
asocNumber� m   8 9��
�� 
msng� k   = ��� ��� r   = J��� c   = H��� n  = F��� I   B F�������� $0 localeidentifier localeIdentifier��  ��  � n  = B��� I   > B�������� 
0 locale  ��  ��  � o   = >���� 0 asocformatter asocFormatter� m   F G��
�� 
ctxt� o      ���� $0 localeidentifier localeIdentifier� ��� Z   K `� ��� =   K P n  K N 1   L N��
�� 
leng o   K L���� $0 localeidentifier localeIdentifier m   N O����    l  S V r   S V	
	 m   S T �  n o
 o      ���� $0 localeidentifier localeIdentifier #  empty string = system locale    � :   e m p t y   s t r i n g   =   s y s t e m   l o c a l e��   r   Y ` b   Y ^ b   Y \ m   Y Z � 
 t h e    o   Z [���� $0 localeidentifier localeIdentifier m   \ ] �   o      ���� $0 localeidentifier localeIdentifier� �� R   a ���
�� .ascrerr ****      � **** l  m ����� b   m � b   m } b   m { !  b   m w"#" m   m p$$ �%% R I n v a l i d   t e x t   ( e x p e c t e d   n u m e r i c a l   t e x t   i n  # I   p v��&����  0 _nameforformat _nameForFormat& '��' o   q r���� 0 formatstyle formatStyle��  ��  ! m   w z(( �))    f o r m a t   f o r   o   { |���� $0 localeidentifier localeIdentifier m   } �** �++    l o c a l e ) .��  ��   ��,-
�� 
errn, m   e h�����Y- ��.��
�� 
erob. o   k l���� 0 thetext theText��  ��  ��  ��  � /��/ L   � �00 c   � �121 o   � ����� 0 
asocnumber 
asocNumber2 m   � ���
�� 
****��  � R      ��34
�� .ascrerr ****      � ****3 o      ���� 0 etext eText4 ��56
�� 
errn5 o      ���� 0 enumber eNumber6 ��78
�� 
erob7 o      ���� 0 efrom eFrom8 ��9��
�� 
errt9 o      ���� 
0 eto eTo��  � I   � ���:���� 
0 _error  : ;<; m   � �== �>>  p a r s e   n u m b e r< ?@? o   � ����� 0 etext eText@ ABA o   � ����� 0 enumber eNumberB CDC o   � ����� 0 efrom eFromD E��E o   � ����� 
0 eto eTo��  ��  � FGF l     ��������  ��  ��  G HIH l     ��������  ��  ��  I JKJ l     ��LM��  L J D--------------------------------------------------------------------   M �NN � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -K OPO l     ��QR��  Q $  Hexadecimal number conversion   R �SS <   H e x a d e c i m a l   n u m b e r   c o n v e r s i o nP TUT l     ��������  ��  ��  U VWV i  F IXYX I     ��Z[
�� .Mth:NuHenull���     ****Z o      ���� 0 	thenumber 	theNumber[ ��\]
�� 
Plac\ |����^��_��  ��  ^ o      �� 0 	chunksize 	chunkSize��  _ l     `�~�}` m      �|�|  �~  �}  ] �{a�z
�{ 
Prefa |�y�xb�wc�y  �x  b o      �v�v 0 	hasprefix 	hasPrefix�w  c l     d�u�td m      �s
�s boovfals�u  �t  �z  Y Q    efge k   �hh iji r    klk n   mnm I    �ro�q�r (0 asintegerparameter asIntegerParametero pqp o    	�p�p 0 	chunksize 	chunkSizeq r�or m   	 
ss �tt 
 w i d t h�o  �q  n o    �n�n 0 _support  l o      �m�m 0 	chunksize 	chunkSizej uvu l   wxyw r    z{z n   |}| I    �l~�k�l (0 asbooleanparameter asBooleanParameter~ � o    �j�j 0 	hasprefix 	hasPrefix� ��i� m    �� ���  p r e f i x�i  �k  } o    �h�h 0 _support  { o      �g�g 0 	hasprefix 	hasPrefixx � � (users shouldn't concatenate their own prefix as that would result in negative numbers appearing as "0x-N�" instead of "-0xN�")   y ���    ( u s e r s   s h o u l d n ' t   c o n c a t e n a t e   t h e i r   o w n   p r e f i x   a s   t h a t   w o u l d   r e s u l t   i n   n e g a t i v e   n u m b e r s   a p p e a r i n g   a s   " 0 x - N & "   i n s t e a d   o f   " - 0 x N & " )v ��f� Z   ����e�� =    *��� l   (��d�c� I   (�b��
�b .corecnte****       ****� J    "�� ��a� o     �`�` 0 	thenumber 	theNumber�a  � �_��^
�_ 
kocl� m   # $�]
�] 
list�^  �d  �c  � m   ( )�\�\  � l  -d���� k   -d�� ��� l  - :���� r   - :��� n  - 8��� I   2 8�[��Z�[ 00 aswholenumberparameter asWholeNumberParameter� ��� o   2 3�Y�Y 0 	thenumber 	theNumber� ��X� m   3 4�� ���  �X  �Z  � o   - 2�W�W 0 _support  � o      �V�V 0 	thenumber 	theNumber� ^ X numbers greater than 2^30 (max integer size) are okay as long as they're non-fractional   � ��� �   n u m b e r s   g r e a t e r   t h a n   2 ^ 3 0   ( m a x   i n t e g e r   s i z e )   a r e   o k a y   a s   l o n g   a s   t h e y ' r e   n o n - f r a c t i o n a l� ��� l  ; ;�U���U  � � � note that the 1024 max chunk size is somewhat arbitrary (the largest representable number requires ~309 chars; anything more will always be left-hand padding), but prevents completely silly values   � ����   n o t e   t h a t   t h e   1 0 2 4   m a x   c h u n k   s i z e   i s   s o m e w h a t   a r b i t r a r y   ( t h e   l a r g e s t   r e p r e s e n t a b l e   n u m b e r   r e q u i r e s   ~ 3 0 9   c h a r s ;   a n y t h i n g   m o r e   w i l l   a l w a y s   b e   l e f t - h a n d   p a d d i n g ) ,   b u t   p r e v e n t s   c o m p l e t e l y   s i l l y   v a l u e s� ��� Z  ; Z���T�S� G   ; F��� A   ; >��� o   ; <�R�R 0 	chunksize 	chunkSize� m   < =�Q�Q  � ?   A D��� o   A B�P�P 0 	chunksize 	chunkSize� m   B C�O�O � n  I V��� I   N V�N��M�N .0 throwinvalidparameter throwInvalidParameter� ��� o   N O�L�L 0 	chunksize 	chunkSize� ��� m   O P�� ��� 
 w i d t h� ��� m   P Q�K
�K 
long� ��J� m   Q R�� ��� L M u s t   b e   a n   i n t e g e r   b e t w e e n   0   a n d   1 0 2 4 .�J  �M  � o   I N�I�I 0 _support  �T  �S  � ��� r   [ `��� m   [ ^�� ���  � o      �H�H 0 hextext hexText� ��� Z   a���G�� A   a d��� o   a b�F�F 0 	thenumber 	theNumber� m   b c�E�E  � k   g ��� ��� Z  g ����D�C� F   g w��� ?   g j��� o   g h�B�B 0 	chunksize 	chunkSize� m   h i�A�A  � l  m u��@�?� A   m u��� o   m n�>�> 0 	thenumber 	theNumber� d   n t�� l  n s��=�<� a   n s��� m   n q�;�; � o   q r�:�: 0 	chunksize 	chunkSize�=  �<  �@  �?  � n  z ���� I    ��9��8�9 .0 throwinvalidparameter throwInvalidParameter� ��� o    ��7�7 0 	thenumber 	theNumber� ��� m   � ��� ���  � ��� m   � ��6
�6 
long� ��5� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ��� H N u m b e r   i s   t o o   l a r g e   t o   r e p r e s e n t   a s  � o   � ��4�4 0 	chunksize 	chunkSize� m   � ��� ��� J - d i g i t   h e x a d e c i m a l   t e x t   ( n o t   b e t w e e n  � _   � ���� d   � ��� l  � ���3�2� a   � �� � m   � ��1�1   o   � ��0�0 0 	chunksize 	chunkSize�3  �2  � m   � ��/�/ � m   � � � 
   a n d  � _   � � l  � ��.�- \   � � a   � �	 m   � ��,�, 	 o   � ��+�+ 0 	chunksize 	chunkSize m   � ��*�* �.  �-   m   � ��)�) � m   � �

 �  ) .�5  �8  � o   z �(�( 0 _support  �D  �C  �  r   � � m   � � �  - o      �'�' 0 	hexprefix 	hexPrefix �& r   � � d   � � o   � ��%�% 0 	thenumber 	theNumber o      �$�$ 0 	thenumber 	theNumber�&  �G  � k   �  r   � � m   � � �   o      �#�# 0 	hexprefix 	hexPrefix �" Z  ��!�  F   � � !  ?   � �"#" o   � ��� 0 	chunksize 	chunkSize# m   � ���  ! l  � �$��$ ?   � �%&% o   � ��� 0 	thenumber 	theNumber& \   � �'(' a   � �)*) m   � ��� * o   � ��� 0 	chunksize 	chunkSize( m   � ��� �  �   n  �
+,+ I   �
�-�� .0 throwinvalidparameter throwInvalidParameter- ./. o   � ��� 0 	thenumber 	theNumber/ 010 m   � �22 �33  1 454 m   � ��
� 
long5 6�6 b   �787 b   �9:9 b   � �;<; b   � �=>= b   � �?@? b   � �ABA m   � �CC �DD H N u m b e r   i s   t o o   l a r g e   t o   r e p r e s e n t   a s  B o   � ��� 0 	chunksize 	chunkSize@ m   � �EE �FF J - d i g i t   h e x a d e c i m a l   t e x t   ( n o t   b e t w e e n  > _   � �GHG d   � �II l  � �J��J a   � �KLK m   � ��� L o   � ��� 0 	chunksize 	chunkSize�  �  H m   � ��� < m   � �MM �NN 
   a n d  : _   �OPO l  � �Q��Q \   � �RSR a   � �TUT m   � ��
�
 U o   � ��	�	 0 	chunksize 	chunkSizeS m   � ��� �  �  P m   � �� 8 m  VV �WW  ) .�  �  , o   � ��� 0 _support  �!  �   �"  � XYX Z Z[��Z o  �� 0 	hasprefix 	hasPrefix[ r  \]\ b  ^_^ o  �� 0 	hexprefix 	hexPrefix_ m  `` �aa  0 x] o      �� 0 	hexprefix 	hexPrefix�  �  Y bcb V  Fded k  'Aff ghg r  '9iji b  '7klk l '5m� ��m n  '5non 4  *5��p
�� 
cobjp l -4q����q [  -4rsr `  -2tut o  -.���� 0 	thenumber 	theNumberu m  .1���� s m  23���� ��  ��  o m  '*vv �ww   0 1 2 3 4 5 6 7 8 9 A B C D E F�   ��  l o  56���� 0 hextext hexTextj o      ���� 0 hextext hexTexth x��x r  :Ayzy _  :?{|{ o  :;���� 0 	thenumber 	theNumber| m  ;>���� z o      ���� 0 	thenumber 	theNumber��  e ?  #&}~} o  #$���� 0 	thenumber 	theNumber~ m  $%����  c � V  G_��� r  SZ��� b  SX��� m  SV�� ���  0� o  VW���� 0 hextext hexText� o      ���� 0 hextext hexText� A  KR��� n  KP��� 1  LP��
�� 
leng� o  KL���� 0 hextext hexText� o  PQ���� 0 	chunksize 	chunkSize� ���� L  `d�� b  `c��� o  `a���� 0 	hexprefix 	hexPrefix� o  ab���� 0 hextext hexText��  �   format single number   � ��� *   f o r m a t   s i n g l e   n u m b e r�e  � l g����� k  g��� ��� l g����� Z g�������� G  gr��� A  gj��� o  gh���� 0 	chunksize 	chunkSize� m  hi���� � ?  mp��� o  mn���� 0 	chunksize 	chunkSize� m  no���� � n u���� I  z�������� .0 throwinvalidparameter throwInvalidParameter� ��� o  z{���� 0 	chunksize 	chunkSize� ��� m  {~�� ��� 
 w i d t h� ��� m  ~��
�� 
long� ���� m  ��� ��� L M u s t   b e   a n   i n t e g e r   b e t w e e n   1   a n d   1 0 2 4 .��  ��  � o  uz���� 0 _support  ��  ��  �   chunksize must be given   � ��� 0   c h u n k s i z e   m u s t   b e   g i v e n� ��� r  ����� J  ���� ��� m  ���� ���  � ���� \  ����� a  ����� m  ������ � o  ������ 0 	chunksize 	chunkSize� m  ������ ��  � J      �� ��� o      ���� 0 padtext padText� ���� o      ���� 0 maxsize maxSize��  � ��� U  ����� r  ����� b  ����� o  ������ 0 padtext padText� m  ���� ���  0� o      ���� 0 padtext padText� o  ������ 0 	chunksize 	chunkSize� ��� h  ������� 0 
resultlist 
resultList� j     	����� 
0 _list_  � n    ��� 2   ��
�� 
cobj� o     ���� 0 	thenumber 	theNumber� ��� Y  ���������� k  ���� ��� Q  �e���� k  ��� ��� r  ����� n ����� 4  �����
�� 
cobj� o  ������ 0 i  � n ����� o  ������ 
0 _list_  � o  ������ 0 
resultlist 
resultList� o      ���� 0 	thenumber 	theNumber� ��� r  ����� c  ����� o  ������ 0 	thenumber 	theNumber� m  ����
�� 
long� o      ���� 0 
theinteger 
theInteger� ���� Z �������� G  ���� G  ���� >  ����� o  ������ 0 
theinteger 
theInteger� c  ����� o  ������ 0 	thenumber 	theNumber� m  ����
�� 
doub� A  ���� o  ������ 0 
theinteger 
theInteger� m  � ����  � ?  	��� o  ���� 0 
theinteger 
theInteger� o  ���� 0 maxsize maxSize� R  �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� m  �����\��  ��  ��  ��  � R      ���� 
�� .ascrerr ****      � ****��    ����
�� 
errn d       m      �������  � k  $e  Z  $K�� ?  $'	
	 o  $%���� 0 
theinteger 
theInteger
 o  %&���� 0 maxsize maxSize r  *C b  *A b  *= b  *3 b  */ m  *- � H N u m b e r   i s   t o o   l a r g e   t o   r e p r e s e n t   a s   o  -.���� 0 	chunksize 	chunkSize m  /2 � V - d i g i t   h e x a d e c i m a l   t e x t   ( n o t   b e t w e e n   0   a n d   _  3< l 3:���� \  3: a  38 m  36����  o  67���� 0 	chunksize 	chunkSize m  89���� ��  ��   m  :;����  m  =@   �!!  ) . o      ���� 0 etext eText��   r  FK"#" m  FI$$ �%% T N o t   a   n o n - n e g a t i v e ,   n o n - f r a c t i o n a l   n u m b e r .# o      ���� 0 etext eText &��& n Le'(' I  Qe��)���� .0 throwinvalidparameter throwInvalidParameter) *+* N  Q\,, n Q[-.- 4  V[��/
�� 
cobj/ o  YZ���� 0 i  . n QV010 o  RV���� 
0 _list_  1 o  QR���� 0 
resultlist 
resultList+ 232 m  \_44 �55  3 676 m  _`��
�� 
long7 8��8 o  `a���� 0 etext eText��  ��  ( o  LQ���� 0 _support  ��  � 9:9 r  fk;<; m  fi== �>>  < o      ���� 0 hextext hexText: ?@? V  l�ABA k  t�CC DED r  t�FGF b  t�HIH l t�J����J n  t�KLK 4  w���M
�� 
cobjM l z�N����N [  z�OPO `  zQRQ o  z{���� 0 
theinteger 
theIntegerR m  {~���� P m  ����� ��  ��  L m  twSS �TT   0 1 2 3 4 5 6 7 8 9 A B C D E F��  ��  I o  ������ 0 hextext hexTextG o      ���� 0 hextext hexTextE U��U r  ��VWV _  ��XYX o  ������ 0 
theinteger 
theIntegerY m  ������ W o      ���� 0 
theinteger 
theInteger��  B ?  psZ[Z o  pq���� 0 
theinteger 
theInteger[ m  qr����  @ \��\ r  ��]^] n ��_`_ 7 ����ab
�� 
ctxta d  ��cc o  ������ 0 	chunksize 	chunkSizeb m  ��������` l ��d����d b  ��efe o  ������ 0 padtext padTextf o  ������ 0 hextext hexText��  ��  ^ n     ghg 4  ����i
�� 
cobji o  ���� 0 i  h n ��jkj o  ���~�~ 
0 _list_  k o  ���}�} 0 
resultlist 
resultList��  �� 0 i  � m  ���|�| � n ��lml 1  ���{
�{ 
lengm n ��non o  ���z�z 
0 _list_  o o  ���y�y 0 
resultlist 
resultList��  � pqp r  ��rsr n ��tut 1  ���x
�x 
txdlu 1  ���w
�w 
ascrs o      �v�v 0 oldtids oldTIDsq vwv r  ��xyx m  ��zz �{{  y n     |}| 1  ���u
�u 
txdl} 1  ���t
�t 
ascrw ~~ Z  �����s�� o  ���r�r 0 	hasprefix 	hasPrefix� r  ����� b  ����� m  ���� ���  0 x� n ����� o  ���q�q 
0 _list_  � o  ���p�p 0 
resultlist 
resultList� o      �o�o 0 hextext hexText�s  � r  ����� c  ����� n ����� o  ���n�n 
0 _list_  � o  ���m�m 0 
resultlist 
resultList� m  ���l
�l 
ctxt� o      �k�k 0 hextext hexText ��� r  ����� o  ���j�j 0 oldtids oldTIDs� n     ��� 1  ���i
�i 
txdl� 1  ���h
�h 
ascr� ��g� L  ���� o  ���f�f 0 hextext hexText�g  �   format list of number   � ��� ,   f o r m a t   l i s t   o f   n u m b e r�f  f R      �e��
�e .ascrerr ****      � ****� o      �d�d 0 etext eText� �c��
�c 
errn� o      �b�b 0 enumber eNumber� �a��
�a 
erob� o      �`�` 0 efrom eFrom� �_��^
�_ 
errt� o      �]�] 
0 eto eTo�^  g I  ��\��[�\ 
0 _error  � ��� m  ��� ���  f o r m a t   h e x� ��� o  �Z�Z 0 etext eText� ��� o  �Y�Y 0 enumber eNumber� ��� o  �X�X 0 efrom eFrom� ��W� o  �V�V 
0 eto eTo�W  �[  W ��� l     �U�T�S�U  �T  �S  � ��� l     �R�Q�P�R  �Q  �P  � ��� i  J M��� I     �O��
�O .Mth:HeNunull���     ctxt� o      �N�N 0 hextext hexText� �M��
�M 
Plac� |�L�K��J��L  �K  � o      �I�I 0 	chunksize 	chunkSize�J  � l     ��H�G� m      �F�F  �H  �G  � �E��D
�E 
Prec� |�C�B��A��C  �B  � o      �@�@ 0 	isprecise 	isPrecise�A  � l     ��?�>� m      �=
�= boovfals�?  �>  �D  � Q    `���� P   J���� k   I�� ��� r    ��� n   ��� I    �<��;�< "0 astextparameter asTextParameter� ��� o    �:�: 0 hextext hexText� ��9� m    �� ���  �9  �;  � o    �8�8 0 _support  � o      �7�7 0 hextext hexText� ��� r    #��� n   !��� I    !�6��5�6 (0 asintegerparameter asIntegerParameter� ��� o    �4�4 0 	chunksize 	chunkSize� ��3� m    �� ��� 
 w i d t h�3  �5  � o    �2�2 0 _support  � o      �1�1 0 	chunksize 	chunkSize� ��� Z  $ C���0�/� G   $ /��� A   $ '��� o   $ %�.�. 0 	chunksize 	chunkSize� m   % &�-�-  � ?   * -��� o   * +�,�, 0 	chunksize 	chunkSize� m   + ,�+�+ � n  2 ?��� I   7 ?�*��)�* .0 throwinvalidparameter throwInvalidParameter� ��� o   7 8�(�( 0 	chunksize 	chunkSize� ��� m   8 9�� ��� 
 w i d t h� ��� m   9 :�'
�' 
long� ��&� m   : ;�� ��� L M u s t   b e   a n   i n t e g e r   b e t w e e n   0   a n d   1 0 2 4 .�&  �)  � o   2 7�%�% 0 _support  �0  �/  � ��� r   D R��� H   D P�� n  D O��� I   I O�$��#�$ (0 asbooleanparameter asBooleanParameter� � � o   I J�"�" 0 	isprecise 	isPrecise  �! m   J K �  p r e c i s i o n   l o s s�!  �#  � o   D I� �  0 _support  � o      �� 0 	isprecise 	isPrecise� � Z   SI� =   S V	 o   S T�� 0 	chunksize 	chunkSize	 m   T U��   l  YA

 k   YA  Q   Y k   \ �  r   \ _ m   \ ]��   o      �� 0 	thenumber 	theNumber  r   ` e C   ` c o   ` a�� 0 hextext hexText m   a b �  - o      �� 0 
isnegative 
isNegative  !  Z  f }"#��" o   f g�� 0 
isnegative 
isNegative# r   j y$%$ n   j w&'& 7  k w�()
� 
ctxt( m   q s�� ) m   t v����' o   j k�� 0 hextext hexText% o      �� 0 hextext hexText�  �  ! *+* Z  ~ �,-��, C   ~ �./. o   ~ �� 0 hextext hexText/ m    �00 �11  0 x- r   � �232 n   � �454 7  � ��67
� 
ctxt6 m   � ��
�
 7 m   � ��	�	��5 o   � ��� 0 hextext hexText3 o      �� 0 hextext hexText�  �  + 8�8 X   � �9�:9 k   � �;; <=< r   � �>?> ]   � �@A@ o   � ��� 0 	thenumber 	theNumberA m   � ��� ? o      �� 0 	thenumber 	theNumber= BCB r   � �DED I  � �F�GF z� ��
�  .sysooffslong    ��� null
�� misccura�  G ��HI
�� 
psofH o   � ����� 0 charref charRefI ��J��
�� 
psinJ m   � �KK �LL   0 1 2 3 4 5 6 7 8 9 A B C D E F��  E o      ���� 0 i  C MNM Z  � �OP����O =   � �QRQ o   � ����� 0 i  R m   � �����  P R   � �����S
�� .ascrerr ****      � ****��  S ��T��
�� 
errnT m   � ������@��  ��  ��  N U��U r   � �VWV \   � �XYX [   � �Z[Z o   � ����� 0 	thenumber 	theNumber[ o   � ����� 0 i  Y m   � ����� W o      ���� 0 	thenumber 	theNumber��  � 0 charref charRef: o   � ����� 0 hextext hexText�   R      ����\
�� .ascrerr ****      � ****��  \ ��]��
�� 
errn] d      ^^ m      �������   l  �_`a_ n  �bcb I   ���d���� .0 throwinvalidparameter throwInvalidParameterd efe o   � ����� 0 hextext hexTextf ghg m   �ii �jj  h klk m  ��
�� 
ctxtl m��m m  nn �oo N T e x t   i s   n o t   a   v a l i d   h e x a d e c i m a l   n u m b e r .��  ��  c o   � ����� 0 _support  ` E ? catch errors if hexText is too short or contains non-hex chars   a �pp ~   c a t c h   e r r o r s   i f   h e x T e x t   i s   t o o   s h o r t   o r   c o n t a i n s   n o n - h e x   c h a r s qrq Z 1st����s F  uvu o  ���� 0 	isprecise 	isPrecisev l w����w =  xyx o  ���� 0 	thenumber 	theNumbery [  z{z o  ���� 0 	thenumber 	theNumber{ m  ���� ��  ��  t n -|}| I  -��~���� .0 throwinvalidparameter throwInvalidParameter~ � o   ���� 0 hextext hexText� ��� m   #�� ���  � ��� m  #&��
�� 
ctxt� ���� m  &)�� ��� � H e x a d e c i m a l   t e x t   i s   t o o   l a r g e   t o   r e p r e s e n t   a s   a   r e a l   n u m b e r   w i t h o u t   l o s i n g   p r e c i s i o n .��  ��  } o  ���� 0 _support  ��  ��  r ��� Z 2>������� o  23���� 0 
isnegative 
isNegative� r  6:��� d  68�� o  67���� 0 	thenumber 	theNumber� o      ���� 0 	thenumber 	theNumber��  ��  � ���� L  ?A�� o  ?@���� 0 	thenumber 	theNumber��     read as single number    ��� ,   r e a d   a s   s i n g l e   n u m b e r�   l DI���� k  DI�� ��� Z Dm������� >  DM��� `  DK��� l DI������ n DI��� 1  EI��
�� 
leng� o  DE���� 0 hextext hexText��  ��  � o  IJ���� 0 	chunksize 	chunkSize� m  KL����  � n Pi��� I  Ui������� .0 throwinvalidparameter throwInvalidParameter� ��� o  UV���� 0 hextext hexText� ��� m  VY�� ���  � ��� m  Y\��
�� 
ctxt� ���� b  \e��� b  \a��� m  \_�� ��� T C a n ' t   s p l i t   h e x a d e c i m a l   t e x t   e x a c t l y   i n t o  � o  _`���� 0 	chunksize 	chunkSize� m  ad�� ���  - d i g i t   c h u n k s .��  ��  � o  PU���� 0 _support  ��  ��  � ��� h  ny����� 0 
resultlist 
resultList� j     ����� 
0 _list_  � J     ����  � ��� Y  zA������� k  �<�� ��� r  ����� m  ������  � o      ���� 0 	thenumber 	theNumber� ��� X  ������� k  ���� ��� r  ����� ]  ����� o  ������ 0 	thenumber 	theNumber� m  ������ � o      ���� 0 	thenumber 	theNumber� ��� r  ����� I ������� z����
�� .sysooffslong    ��� null
�� misccura��  � ����
�� 
psof� o  ������ 0 charref charRef� �����
�� 
psin� m  ���� ���   0 1 2 3 4 5 6 7 8 9 A B C D E F��  � o      ���� 0 i  � ��� Z ��������� =  ����� o  ������ 0 i  � m  ������  � n ����� I  ��������� .0 throwinvalidparameter throwInvalidParameter� ��� o  ������ 0 hextext hexText� ��� m  ���� ���  � ��� m  ����
�� 
ctxt� ���� m  ���� ��� N T e x t   i s   n o t   a   v a l i d   h e x a d e c i m a l   n u m b e r .��  ��  � o  ������ 0 _support  ��  ��  � ���� r  ����� \  ����� [  ����� o  ������ 0 	thenumber 	theNumber� o  ������ 0 i  � m  ������ � o      ���� 0 	thenumber 	theNumber��  �� 0 charref charRef� n ����� 7 ������
�� 
ctxt� o  ������ 0 i  � l �������� \  ����� [  ����� o  ������ 0 i  � o  ������ 0 	chunksize 	chunkSize� m  ������ ��  ��  � o  ������ 0 hextext hexText� 	 		  Z �3		����	 F  �			 o  ������ 0 	isprecise 	isPrecise	 l 	����	 =  			 o  ���� 0 	thenumber 	theNumber	 [  			
		 o  ���� 0 	thenumber 	theNumber	
 m  ���� ��  ��  	 n /			 I  /��	���� .0 throwinvalidparameter throwInvalidParameter	 			 N  "		 n  !			 7 !��		
�� 
ctxt	 o  ���� 0 i  	 l  	����	 \   			 [  			 o  ���� 0 i  	 o  ���� 0 	chunksize 	chunkSize	 m  ���� ��  ��  	 o  ���� 0 hextext hexText	 			 m  "%		 �		  	 			 m  %(��
�� 
ctxt	 	 �	  m  (+	!	! �	"	" � H e x a d e c i m a l   t e x t   i s   t o o   l a r g e   t o   c o n v e r t   t o   n u m b e r   w i t h o u t   l o s i n g   p r e c i s i o n .�  ��  	 o  �~�~ 0 _support  ��  ��  	 	#�}	# r  4<	$	%	$ o  45�|�| 0 	thenumber 	theNumber	% n      	&	'	&  ;  :;	' n 5:	(	)	( o  6:�{�{ 
0 _list_  	) o  56�z�z 0 
resultlist 
resultList�}  �� 0 i  � m  }~�y�y � n ~�	*	+	* 1  ��x
�x 
leng	+ o  ~�w�w 0 hextext hexText� o  ���v�v 0 	chunksize 	chunkSize� 	,�u	, L  BI	-	- n BH	.	/	. o  CG�t�t 
0 _list_  	/ o  BC�s�s 0 
resultlist 
resultList�u  �   read as list of numbers   � �	0	0 0   r e a d   a s   l i s t   o f   n u m b e r s�  � �r	1
�r consdiac	1 �q	2
�q conshyph	2 �p	3
�p conspunc	3 �o�n
�o conswhit�n  � �m	4
�m conscase	4 �l�k
�l consnume�k  � R      �j	5	6
�j .ascrerr ****      � ****	5 o      �i�i 0 etext eText	6 �h	7	8
�h 
errn	7 o      �g�g 0 enumber eNumber	8 �f	9	:
�f 
erob	9 o      �e�e 0 efrom eFrom	: �d	;�c
�d 
errt	; o      �b�b 
0 eto eTo�c  � I  R`�a	<�`�a 
0 _error  	< 	=	>	= m  SV	?	? �	@	@  p a r s e   h e x	> 	A	B	A o  VW�_�_ 0 etext eText	B 	C	D	C o  WX�^�^ 0 enumber eNumber	D 	E	F	E o  XY�]�] 0 efrom eFrom	F 	G�\	G o  YZ�[�[ 
0 eto eTo�\  �`  � 	H	I	H l     �Z�Y�X�Z  �Y  �X  	I 	J	K	J l     �W�V�U�W  �V  �U  	K 	L	M	L l     �T	N	O�T  	N J D--------------------------------------------------------------------   	O �	P	P � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -	M 	Q	R	Q l     �S	S	T�S  	S !  General numeric operations   	T �	U	U 6   G e n e r a l   n u m e r i c   o p e r a t i o n s	R 	V	W	V l     �R�Q�P�R  �Q  �P  	W 	X	Y	X i  N Q	Z	[	Z I     �O	\�N
�O .Mth:DeRanull���     doub	\ o      �M�M 0 x  �N  	[ Q     	]	^	_	] L    	`	` ]    
	a	b	a l   	c�L�K	c c    	d	e	d o    �J�J 0 x  	e m    �I
�I 
doub�L  �K  	b l   		f�H�G	f ^    		g	h	g 1    �F
�F 
pi  	h m    �E�E ��H  �G  	^ R      �D	i	j
�D .ascrerr ****      � ****	i o      �C�C 0 etext eText	j �B	k	l
�B 
errn	k o      �A�A 0 enumber eNumber	l �@	m	n
�@ 
erob	m o      �?�? 0 efrom eFrom	n �>	o�=
�> 
errt	o o      �<�< 
0 eto eTo�=  	_ I    �;	p�:�; 
0 _error  	p 	q	r	q m    	s	s �	t	t  r a d i a n s	r 	u	v	u o    �9�9 0 etext eText	v 	w	x	w o    �8�8 0 enumber eNumber	x 	y	z	y o    �7�7 0 efrom eFrom	z 	{�6	{ o    �5�5 
0 eto eTo�6  �:  	Y 	|	}	| l     �4�3�2�4  �3  �2  	} 	~		~ l     �1�0�/�1  �0  �/  	 	�	�	� i  R U	�	�	� I     �.	��-
�. .Mth:RaDenull���     doub	� o      �,�, 0 x  �-  	� Q     	�	�	�	� L    	�	� ^    
	�	�	� l   	��+�*	� c    	�	�	� o    �)�) 0 x  	� m    �(
�( 
doub�+  �*  	� l   		��'�&	� ^    		�	�	� 1    �%
�% 
pi  	� m    �$�$ ��'  �&  	� R      �#	�	�
�# .ascrerr ****      � ****	� o      �"�" 0 etext eText	� �!	�	�
�! 
errn	� o      � �  0 enumber eNumber	� �	�	�
� 
erob	� o      �� 0 efrom eFrom	� �	��
� 
errt	� o      �� 
0 eto eTo�  	� I    �	��� 
0 _error  	� 	�	�	� m    	�	� �	�	�  d e g r e e s	� 	�	�	� o    �� 0 etext eText	� 	�	�	� o    �� 0 enumber eNumber	� 	�	�	� o    �� 0 efrom eFrom	� 	��	� o    �� 
0 eto eTo�  �  	� 	�	�	� l     ����  �  �  	� 	�	�	� l     ����  �  �  	� 	�	�	� l     ����  �  �  	� 	�	�	� i  V Y	�	�	� I     �
	��	
�
 .Mth:Abs_null���     nmbr	� o      �� 0 x  �	  	� Q     )	�	�	�	� k    	�	� 	�	�	� r    	�	�	� c    	�	�	� o    �� 0 x  	� m    �
� 
nmbr	� o      �� 0 x  	� 	��	� Z   	 	�	��	�	� A   	 	�	�	� o   	 
�� 0 x  	� m   
 ��  	� L    	�	� d    	�	� o    � �  0 x  �  	� L    	�	� o    ���� 0 x  �  	� R      ��	�	�
�� .ascrerr ****      � ****	� o      ���� 0 etext eText	� ��	�	�
�� 
errn	� o      ���� 0 enumber eNumber	� ��	�	�
�� 
erob	� o      ���� 0 efrom eFrom	� ��	���
�� 
errt	� o      ���� 
0 eto eTo��  	� I    )��	����� 
0 _error  	� 	�	�	� m     !	�	� �	�	�  a b s	� 	�	�	� o   ! "���� 0 etext eText	� 	�	�	� o   " #���� 0 enumber eNumber	� 	�	�	� o   # $���� 0 efrom eFrom	� 	���	� o   $ %���� 
0 eto eTo��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� i  Z ]	�	�	� I     ��	���
�� .Mth:CmpNnull���     ****	� J      	�	� 	�	�	� o      ���� 0 n1  	� 	���	� o      ���� 0 n2  ��  ��  	� Q     �	�	�	�	� k    �	�	� 	�	�	� Z    �	�	���	�	� =    	�	�	� l   	�����	� I   ��	�	�
�� .corecnte****       ****	� J    	�	� 	�	�	� o    ���� 0 n1  	� 	���	� o    ���� 0 n2  ��  	� ��	���
�� 
kocl	� m    	��
�� 
long��  ��  ��  	� m    ���� 	� Z   	�	�����	� =    	�	�	� o    ���� 0 n1  	� o    ���� 0 n2  	� L    	�	� m    ����  ��  ��  ��  	� k   ! �	�	� 	�	�	� r   ! 8	�	�	� J   ! )	�	� 
 

  c   ! $


 o   ! "���� 0 n1  
 m   " #��
�� 
doub
 
��
 c   $ '


 o   $ %���� 0 n2  
 m   % &��
�� 
doub��  	� J      

 

	
 o      ���� 0 n1  
	 

��

 o      ���� 0 n2  ��  	� 


 Z   9 T

��

 =   9 <


 o   9 :���� 0 n1  
 m   : ;����  
 r   ? H


 ]   ? F


 o   ? D���� 0 _isequaldelta _isEqualDelta
 o   D E���� 0 n2  
 o      ���� 0 dn  ��  
 r   K T


 ]   K R


 o   K P���� 0 _isequaldelta _isEqualDelta
 o   P Q���� 0 n1  
 o      ���� 0 dn  
 


 r   U Y


 d   U W

 o   U V���� 0 dn  
 o      ���� 0 dm  
 

 
 Z  Z w
!
"����
! ?   Z ]
#
$
# o   Z [���� 0 dm  
$ o   [ \���� 0 dn  
" r   ` s
%
&
% J   ` d
'
' 
(
)
( o   ` a���� 0 dm  
) 
*��
* o   a b���� 0 dn  ��  
& J      
+
+ 
,
-
, o      ���� 0 dn  
- 
.��
. o      ���� 0 dm  ��  ��  ��  
  
/
0
/ r   x }
1
2
1 \   x {
3
4
3 o   x y���� 0 n2  
4 o   y z���� 0 n1  
2 o      ���� 0 d  
0 
5��
5 Z  ~ �
6
7����
6 F   ~ �
8
9
8 ?   ~ �
:
;
: o   ~ ���� 0 d  
; o    ����� 0 dm  
9 A   � �
<
=
< o   � ����� 0 d  
= o   � ����� 0 dn  
7 L   � �
>
> m   � �����  ��  ��  ��  	� 
?��
? Z   � �
@
A��
B
@ A   � �
C
D
C o   � ����� 0 n1  
D o   � ����� 0 n2  
A L   � �
E
E m   � ���������  
B L   � �
F
F m   � ����� ��  	� R      ��
G
H
�� .ascrerr ****      � ****
G o      ���� 0 etext eText
H ��
I
J
�� 
errn
I o      ���� 0 enumber eNumber
J ��
K
L
�� 
erob
K o      ���� 0 efrom eFrom
L ��
M��
�� 
errt
M o      ���� 
0 eto eTo��  	� I   � ���
N���� 
0 _error  
N 
O
P
O m   � �
Q
Q �
R
R  c m p
P 
S
T
S o   � ����� 0 etext eText
T 
U
V
U o   � ����� 0 enumber eNumber
V 
W
X
W o   � ����� 0 efrom eFrom
X 
Y��
Y o   � ����� 
0 eto eTo��  ��  	� 
Z
[
Z l     ��������  ��  ��  
[ 
\
]
\ l     ��������  ��  ��  
] 
^
_
^ i  ^ a
`
a
` I     ��
b��
�� .Mth:MinNnull���     ****
b o      ���� 0 thelist theList��  
a Q     �
c
d
e
c k    �
f
f 
g
h
g h    
��
i�� 0 
listobject 
listObject
i j     ��
j�� 
0 _list_  
j n    
k
l
k I    ��
m���� 0 aslist asList
m 
n��
n o    
���� 0 thelist theList��  ��  
l o     ���� 0 _support  
h 
o
p
o Z   &
q
r����
q =    
s
t
s n   
u
v
u 1    ��
�� 
leng
v n   
w
x
w o    ���� 
0 _list_  
x o    ���� 0 
listobject 
listObject
t m    ����  
r n   "
y
z
y I    "�
{�~� .0 throwinvalidparameter throwInvalidParameter
{ 
|
}
| o    �}�} 0 thelist theList
} 
~

~ m    
�
� �
�
�  
 
�
�
� m    �|
�| 
list
� 
��{
� m    
�
� �
�
� ( L i s t   c a n  t   b e   e m p t y .�{  �~  
z o    �z�z 0 _support  ��  ��  
p 
�
�
� r   ' *
�
�
� m   ' (�y�y 
� o      �x�x 0 i  
� 
�
�
� Q   + �
�
�
�
� k   . e
�
� 
�
�
� r   . 8
�
�
� c   . 6
�
�
� l  . 4
��w�v
� n   . 4
�
�
� 4   1 4�u
�
�u 
cobj
� m   2 3�t�t 
� n  . 1
�
�
� o   / 1�s�s 
0 _list_  
� o   . /�r�r 0 
listobject 
listObject�w  �v  
� m   4 5�q
�q 
nmbr
� o      �p�p 0 	theresult 	theResult
� 
��o
� Y   9 e
��n
�
��m
� k   H `
�
� 
�
�
� r   H R
�
�
� c   H P
�
�
� n  H N
�
�
� 4   K N�l
�
�l 
cobj
� o   L M�k�k 0 i  
� n  H K
�
�
� o   I K�j�j 
0 _list_  
� o   H I�i�i 0 
listobject 
listObject
� m   N O�h
�h 
nmbr
� o      �g�g 0 n  
� 
��f
� Z  S `
�
��e�d
� A   S V
�
�
� o   S T�c�c 0 n  
� o   T U�b�b 0 	theresult 	theResult
� r   Y \
�
�
� o   Y Z�a�a 0 n  
� o      �`�` 0 	theresult 	theResult�e  �d  �f  �n 0 i  
� m   < =�_�_ 
� n  = C
�
�
� 1   @ B�^
�^ 
leng
� n  = @
�
�
� o   > @�]�] 
0 _list_  
� o   = >�\�\ 0 
listobject 
listObject�m  �o  
� R      �[
�
�
�[ .ascrerr ****      � ****
� o      �Z�Z 0 etext eText
� �Y
��X
�Y 
errn
� d      
�
� m      �W�W��X  
� l  m �
�
�
�
� l  m �
�
�
�
� n  m �
�
�
� I   r ��V
��U�V .0 throwinvalidparameter throwInvalidParameter
� 
�
�
� N   r w
�
� n   r v
�
�
� 4   s v�T
�
�T 
cobj
� o   t u�S�S 0 i  
� o   r s�R�R 0 thelist theList
� 
�
�
� m   w x
�
� �
�
�  
� 
�
�
� m   x y�Q
�Q 
nmbr
� 
��P
� b   y |
�
�
� m   y z
�
� �
�
� 2 L i s t   i t e m   i s   w r o n g   t y p e :  
� o   z {�O�O 0 etext eText�P  �U  
� o   m r�N�N 0 _support  
� note: AS doesn't provide a meaningful reference when `repeat with aRef in  listObject's _list_` is used (e.g. `item 2 of _list_`), so to provide useful error messages a counting loop is used and a readable reference constructed using that (e.g. `item 2 of {3, "x"}`)   
� �
�
�   n o t e :   A S   d o e s n ' t   p r o v i d e   a   m e a n i n g f u l   r e f e r e n c e   w h e n   ` r e p e a t   w i t h   a R e f   i n     l i s t O b j e c t ' s   _ l i s t _ `   i s   u s e d   ( e . g .   ` i t e m   2   o f   _ l i s t _ ` ) ,   s o   t o   p r o v i d e   u s e f u l   e r r o r   m e s s a g e s   a   c o u n t i n g   l o o p   i s   u s e d   a n d   a   r e a d a b l e   r e f e r e n c e   c o n s t r u c t e d   u s i n g   t h a t   ( e . g .   ` i t e m   2   o f   { 3 ,   " x " } ` )
� ( " couldn't coerce an item to number   
� �
�
� D   c o u l d n ' t   c o e r c e   a n   i t e m   t o   n u m b e r
� 
��M
� L   � �
�
� o   � ��L�L 0 	theresult 	theResult�M  
d R      �K
�
�
�K .ascrerr ****      � ****
� o      �J�J 0 etext eText
� �I
�
�
�I 
errn
� o      �H�H 0 enumber eNumber
� �G
�
�
�G 
erob
� o      �F�F 0 efrom eFrom
� �E
��D
�E 
errt
� o      �C�C 
0 eto eTo�D  
e I   � ��B
��A�B 
0 _error  
� 
�
�
� m   � �
�
� �
�
�  m i n
� 
�
�
� o   � ��@�@ 0 etext eText
� 
�
�
� o   � ��?�? 0 enumber eNumber
� 
�
�
� o   � ��>�> 0 efrom eFrom
� 
��=
� o   � ��<�< 
0 eto eTo�=  �A  
_ 
�
�
� l     �;�:�9�;  �:  �9  
� 
�
�
� l     �8�7�6�8  �7  �6  
� 
�
�
� i  b e
�
�
� I     �5
��4
�5 .Mth:MaxNnull���     ****
� o      �3�3 0 thelist theList�4  
� Q     �
�
�
�
� k    �
�
� 
�
�
� h    
�2
��2 0 
listobject 
listObject
� j     �1
��1 
0 _list_  
� n    
�
�
� I    �0 �/�0 0 aslist asList  �. o    
�-�- 0 thelist theList�.  �/  
� o     �,�, 0 _support  
�  Z   &�+�* =     n   	 1    �)
�) 
leng	 n   

 o    �(�( 
0 _list_   o    �'�' 0 
listobject 
listObject m    �&�&   n   " I    "�%�$�% .0 throwinvalidparameter throwInvalidParameter  o    �#�# 0 thelist theList  m     �    m    �"
�" 
list �! m     � ( L i s t   c a n  t   b e   e m p t y .�!  �$   o    � �  0 _support  �+  �*    r   ' * m   ' (��  o      �� 0 i    Q   + � !"  k   . e## $%$ r   . 8&'& c   . 6()( l  . 4*��* n   . 4+,+ 4   1 4�-
� 
cobj- m   2 3�� , n  . 1./. o   / 1�� 
0 _list_  / o   . /�� 0 
listobject 
listObject�  �  ) m   4 5�
� 
nmbr' o      �� 0 	theresult 	theResult% 0�0 Y   9 e1�23�1 k   H `44 565 r   H R787 c   H P9:9 n  H N;<; 4   K N�=
� 
cobj= o   L M�� 0 i  < n  H K>?> o   I K�� 
0 _list_  ? o   H I�� 0 
listobject 
listObject: m   N O�
� 
nmbr8 o      �� 0 n  6 @�@ Z  S `AB��
A ?   S VCDC o   S T�	�	 0 n  D o   T U�� 0 	theresult 	theResultB r   Y \EFE o   Y Z�� 0 n  F o      �� 0 	theresult 	theResult�  �
  �  � 0 i  2 m   < =�� 3 n  = CGHG 1   @ B�
� 
lengH n  = @IJI o   > @�� 
0 _list_  J o   = >�� 0 
listobject 
listObject�  �  ! R      �KL
� .ascrerr ****      � ****K o      � �  0 etext eTextL ��M��
�� 
errnM d      NN m      �������  " n  m �OPO I   r ���Q���� .0 throwinvalidparameter throwInvalidParameterQ RSR N   r wTT n   r vUVU 4   s v��W
�� 
cobjW o   t u���� 0 i  V o   r s���� 0 thelist theListS XYX m   w xZZ �[[  Y \]\ m   x y��
�� 
nmbr] ^��^ b   y |_`_ m   y zaa �bb 2 L i s t   i t e m   i s   w r o n g   t y p e :  ` o   z {���� 0 etext eText��  ��  P o   m r���� 0 _support   c��c L   � �dd o   � ����� 0 	theresult 	theResult��  
� R      ��ef
�� .ascrerr ****      � ****e o      ���� 0 etext eTextf ��gh
�� 
errng o      ���� 0 enumber eNumberh ��ij
�� 
erobi o      ���� 0 efrom eFromj ��k��
�� 
errtk o      ���� 
0 eto eTo��  
� I   � ���l���� 
0 _error  l mnm m   � �oo �pp  m a xn qrq o   � ����� 0 etext eTextr sts o   � ����� 0 enumber eNumbert uvu o   � ����� 0 efrom eFromv w��w o   � ����� 
0 eto eTo��  ��  
� xyx l     ��������  ��  ��  y z{z l     ��������  ��  ��  { |}| i  f i~~ I     ����
�� .Mth:RouNnull���     nmbr� o      ���� 0 num  � ����
�� 
Plac� |����������  ��  � o      ���� 0 decimalplaces decimalPlaces��  � l     ������ m      ����  ��  ��  � �����
�� 
Dire� |����������  ��  � o      ���� &0 roundingdirection roundingDirection��  � l     ������ m      ��
�� MRndRNhE��  ��  ��   Q    ����� k   ��� ��� r    ��� n   ��� I    ������� "0 asrealparameter asRealParameter� ��� o    	���� 0 num  � ���� m   	 
�� ���  ��  ��  � o    ���� 0 _support  � o      ���� 0 num  � ��� r    ��� n   ��� I    ������� (0 asintegerparameter asIntegerParameter� ��� o    ���� 0 decimalplaces decimalPlaces� ���� m    �� ���  t o   p l a c e s��  ��  � o    ���� 0 _support  � o      ���� 0 decimalplaces decimalPlaces� ��� Z    8������� >    "��� o     ���� 0 decimalplaces decimalPlaces� m     !����  � k   % 4�� ��� r   % *��� a   % (��� m   % &���� 
� o   & '���� 0 decimalplaces decimalPlaces� o      ���� 0 themultiplier theMultiplier� ���� l  + 4���� r   + 4��� ^   + 2��� ]   + 0��� ]   + .��� o   + ,���� 0 num  � m   , -���� 
� o   . /���� 0 themultiplier theMultiplier� m   0 1���� 
� o      ���� 0 num  ��� multiplying and dividing by 10 before and after applying the multiplier helps avoid poor rounding results for some numbers due to inevitable loss of precision in floating-point math (e.g. `324.21 * 100 div 1 / 100` returns 324.2 but needs to be 324.21), though this hasn't been tested on all possible values for obvious reasons -- TO DO: shouldn't /10 be done after rounding is applied (in which case following calculations should use mod 10, etc)?   � ����   m u l t i p l y i n g   a n d   d i v i d i n g   b y   1 0   b e f o r e   a n d   a f t e r   a p p l y i n g   t h e   m u l t i p l i e r   h e l p s   a v o i d   p o o r   r o u n d i n g   r e s u l t s   f o r   s o m e   n u m b e r s   d u e   t o   i n e v i t a b l e   l o s s   o f   p r e c i s i o n   i n   f l o a t i n g - p o i n t   m a t h   ( e . g .   ` 3 2 4 . 2 1   *   1 0 0   d i v   1   /   1 0 0 `   r e t u r n s   3 2 4 . 2   b u t   n e e d s   t o   b e   3 2 4 . 2 1 ) ,   t h o u g h   t h i s   h a s n ' t   b e e n   t e s t e d   o n   a l l   p o s s i b l e   v a l u e s   f o r   o b v i o u s   r e a s o n s   - -   T O   D O :   s h o u l d n ' t   / 1 0   b e   d o n e   a f t e r   r o u n d i n g   i s   a p p l i e d   ( i n   w h i c h   c a s e   f o l l o w i n g   c a l c u l a t i o n s   s h o u l d   u s e   m o d   1 0 ,   e t c ) ?��  ��  ��  � ��� Z   9������ =  9 <��� o   9 :���� &0 roundingdirection roundingDirection� l  : ;������ m   : ;��
�� MRndRNhE��  ��  � Z   ? m����� E  ? K��� J   ? C�� ��� m   ? @�� ��      � ���� m   @ A�� ?�      ��  � J   C J�� ���� `   C H��� l  C F������ ^   C F��� o   C D���� 0 num  � m   D E���� ��  ��  � m   F G���� ��  � l  N S���� r   N S��� _   N Q��� o   N O���� 0 num  � m   O P���� � o      ���� 0 num  � T N if num ends in .5 and its div is even then round toward zero so it stays even   � ��� �   i f   n u m   e n d s   i n   . 5   a n d   i t s   d i v   i s   e v e n   t h e n   r o u n d   t o w a r d   z e r o   s o   i t   s t a y s   e v e n� ��� ?   V Y��� o   V W���� 0 num  � m   W X����  � ���� l  \ c���� r   \ c��� _   \ a��� l  \ _������ [   \ _��� o   \ ]���� 0 num  � m   ] ^�� ?�      ��  ��  � m   _ `���� � o      ���� 0 num  � H B else round to nearest whole digit (.5 will round up if positive�)   � ��� �   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t   ( . 5   w i l l   r o u n d   u p   i f   p o s i t i v e & )��  � l  f m���� r   f m��� _   f k��� l  f i������ \   f i��� o   f g���� 0 num  � m   g h   ?�      ��  ��  � m   i j���� � o      ���� 0 num  � 4 . (�or down if negative to give an even result)   � � \   ( & o r   d o w n   i f   n e g a t i v e   t o   g i v e   a n   e v e n   r e s u l t )�  =  p s o   p q���� &0 roundingdirection roundingDirection l  q r���� m   q r��
�� MRndRNhT��  ��    Z   v �	
	 E  v � J   v z  m   v w ��       �� m   w x ?�      ��   J   z  �� `   z } o   z {���� 0 num   m   { |���� ��  
 l  � � r   � � _   � � o   � ����� 0 num   m   � �����  o      ���� 0 num   0 * if num ends in .5 then round towards zero    �   T   i f   n u m   e n d s   i n   . 5   t h e n   r o u n d   t o w a r d s   z e r o !"! ?   � �#$# o   � ����� 0 num  $ m   � �����  " %��% l  � �&'(& r   � �)*) _   � �+,+ l  � �-����- [   � �./. o   � ����� 0 num  / m   � �00 ?�      ��  ��  , m   � ����� * o      ���� 0 num  ' ( " else round to nearest whole digit   ( �11 D   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t��   r   � �232 _   � �454 l  � �6����6 \   � �787 o   � ��� 0 num  8 m   � �99 ?�      ��  ��  5 m   � ��~�~ 3 o      �}�} 0 num   :;: =  � �<=< o   � ��|�| &0 roundingdirection roundingDirection= l  � �>�{�z> m   � ��y
�y MRndRNhF�{  �z  ; ?@? Z   � �ABCDA E  � �EFE J   � �GG HIH m   � �JJ ��      I K�xK m   � �LL ?�      �x  F J   � �MM N�wN `   � �OPO o   � ��v�v 0 num  P m   � ��u�u �w  B l  � �QRSQ Z   � �TU�tVT ?   � �WXW o   � ��s�s 0 num  X m   � ��r�r  U r   � �YZY [   � �[\[ _   � �]^] o   � ��q�q 0 num  ^ m   � ��p�p \ m   � ��o�o Z o      �n�n 0 num  �t  V r   � �_`_ \   � �aba _   � �cdc o   � ��m�m 0 num  d m   � ��l�l b m   � ��k�k ` o      �j�j 0 num  R 0 * if num ends in .5 then round towards zero   S �ee T   i f   n u m   e n d s   i n   . 5   t h e n   r o u n d   t o w a r d s   z e r oC fgf ?   � �hih o   � ��i�i 0 num  i m   � ��h�h  g j�gj l  � �klmk r   � �non _   � �pqp l  � �r�f�er [   � �sts o   � ��d�d 0 num  t m   � �uu ?�      �f  �e  q m   � ��c�c o o      �b�b 0 num  l ( " else round to nearest whole digit   m �vv D   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t�g  D r   � �wxw _   � �yzy l  � �{�a�`{ \   � �|}| o   � ��_�_ 0 num  } m   � �~~ ?�      �a  �`  z m   � ��^�^ x o      �]�] 0 num  @ � =  � ���� o   � ��\�\ &0 roundingdirection roundingDirection� l  � ���[�Z� m   � ��Y
�Y MRndRN_T�[  �Z  � ��� r   � ���� _   � ���� o   � ��X�X 0 num  � m   � ��W�W � o      �V�V 0 num  � ��� =  � ���� o   � ��U�U &0 roundingdirection roundingDirection� l  � ���T�S� m   � ��R
�R MRndRN_F�T  �S  � ��� Z   '����� =   ��� `   ��� o   �Q�Q 0 num  � m  �P�P � m  �O�O  � r  ��� _  ��� o  	�N�N 0 num  � m  	
�M�M � o      �L�L 0 num  � ��� ?  ��� o  �K�K 0 num  � m  �J�J  � ��I� r  ��� [  ��� _  ��� o  �H�H 0 num  � m  �G�G � m  �F�F � o      �E�E 0 num  �I  � r   '��� \   %��� _   #��� o   !�D�D 0 num  � m  !"�C�C � m  #$�B�B � o      �A�A 0 num  � ��� = *-��� o  *+�@�@ &0 roundingdirection roundingDirection� l +,��?�>� m  +,�=
�= MRndRN_U�?  �>  � ��� l 0O���� Z  0O���<�� G  0=��� A  03��� o  01�;�; 0 num  � m  12�:�:  � =  6;��� `  69��� o  67�9�9 0 num  � m  78�8�8 � m  9:�7�7  � r  @E��� _  @C��� o  @A�6�6 0 num  � m  AB�5�5 � o      �4�4 0 num  �<  � r  HO��� [  HM��� _  HK��� o  HI�3�3 0 num  � m  IJ�2�2 � m  KL�1�1 � o      �0�0 0 num  �   ceil()   � ���    c e i l ( )� ��� = RW��� o  RS�/�/ &0 roundingdirection roundingDirection� l SV��.�-� m  SV�,
�, MRndRN_D�.  �-  � ��+� l Zy���� Z  Zy���*�� G  Zg��� ?  Z]��� o  Z[�)�) 0 num  � m  [\�(�(  � =  `e��� `  `c��� o  `a�'�' 0 num  � m  ab�&�& � m  cd�%�%  � r  jo��� _  jm��� o  jk�$�$ 0 num  � m  kl�#�# � o      �"�" 0 num  �*  � r  ry��� \  rw��� _  ru��� o  rs�!�! 0 num  � m  st� �  � m  uv�� � o      �� 0 num  �   floor()   � ���    f l o o r ( )�+  � n |���� I  ������ >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o  ���� &0 roundingdirection roundingDirection� ��� m  ���� ���  b y�  �  � o  |��� 0 _support  � ��� Z  ������� =  ����� o  ���� 0 decimalplaces decimalPlaces� m  ����  � L  ���� _  ����� o  ���� 0 num  � m  ���� � � � A  �� o  ���� 0 decimalplaces decimalPlaces m  ����    � L  �� _  �� o  ���� 0 num   o  ���� 0 themultiplier theMultiplier�  � L  �� ^  ��	 o  ���� 0 num  	 o  ���� 0 themultiplier theMultiplier�  � R      �

� .ascrerr ****      � ****
 o      �� 0 etext eText �

�
 
errn o      �	�	 0 enumber eNumber �
� 
erob o      �� 0 efrom eFrom ��
� 
errt o      �� 
0 eto eTo�  � I  ����� 
0 _error    m  �� �  r o u n d   n u m b e r  o  ���� 0 etext eText  o  ��� �  0 enumber eNumber  o  ������ 0 efrom eFrom �� o  ������ 
0 eto eTo��  �  }  l     ��������  ��  ��     l     ��������  ��  ��    !"! l     ��#$��  # J D--------------------------------------------------------------------   $ �%% � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -" &'& l     ��()��  (   Trigonometry   ) �**    T r i g o n o m e t r y' +,+ l     ��������  ��  ��  , -.- i  j m/0/ I      ��1���� 0 _sin  1 2��2 o      ���� 0 x  ��  ��  0 k     �33 454 l    	6786 r     	9:9 ]     ;<; l    =����= `     >?> o     ���� 0 x  ? m    ����h��  ��  < l   @����@ ^    ABA 1    ��
�� 
pi  B m    ���� ���  ��  : o      ���� 0 x  7 &   convert from degrees to radians   8 �CC @   c o n v e r t   f r o m   d e g r e e s   t o   r a d i a n s5 DED r   
 FGF A   
 HIH o   
 ���� 0 x  I m    ����  G o      ���� 0 isneg isNegE JKJ Z   LM����L o    ���� 0 isneg isNegM r    NON d    PP o    ���� 0 x  O o      ���� 0 x  ��  ��  K QRQ r    &STS _    $UVU l   "W����W ]    "XYX o    ���� 0 x  Y l   !Z����Z ^    ![\[ m    ���� \ 1     ��
�� 
pi  ��  ��  ��  ��  V m   " #���� T o      ���� 0 y  R ]^] r   ' 2_`_ \   ' 0aba o   ' (���� 0 y  b ]   ( /cdc l  ( -e����e _   ( -fgf ]   ( +hih o   ( )���� 0 y  i m   ) *jj ?�      g m   + ,���� ��  ��  d m   - .���� ` o      ���� 0 z  ^ klk Z   3 Jmn����m =  3 8opo `   3 6qrq o   3 4���� 0 z  r m   4 5���� p m   6 7���� n k   ; Fss tut r   ; @vwv [   ; >xyx o   ; <���� 0 z  y m   < =���� w o      ���� 0 z  u z��z r   A F{|{ [   A D}~} o   A B���� 0 y  ~ m   B C���� | o      ���� 0 y  ��  ��  ��  l � r   K P��� `   K N��� o   K L���� 0 z  � m   L M���� � o      ���� 0 z  � ��� Z   Q e������� ?   Q T��� o   Q R���� 0 z  � m   R S���� � k   W a�� ��� r   W [��� H   W Y�� o   W X���� 0 isneg isNeg� o      ���� 0 isneg isNeg� ���� r   \ a��� \   \ _��� o   \ ]���� 0 z  � m   ] ^���� � o      ���� 0 z  ��  ��  ��  � ��� r   f u��� \   f s��� l  f o������ \   f o��� l  f k������ \   f k��� o   f g���� 0 x  � ]   g j��� o   g h���� 0 y  � m   h i�� ?�!�?��v��  ��  � ]   k n��� o   k l���� 0 y  � m   l m�� >dD,���J��  ��  � ]   o r��� o   o p���� 0 y  � m   p q�� <�F���P�� o      ���� 0 z2  � ��� r   v {��� ]   v y��� o   v w���� 0 z2  � o   w x���� 0 z2  � o      ���� 0 zz  � ��� Z   | ������� G   | ���� =  | ��� o   | }���� 0 z  � m   } ~���� � =  � ���� o   � ����� 0 z  � m   � ����� � r   � ���� [   � ���� \   � ���� m   � ��� ?�      � ^   � ���� o   � ����� 0 zz  � m   � ����� � ]   � ���� ]   � ���� o   � ����� 0 zz  � o   � ����� 0 zz  � l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� m   � ��� ���I���� o   � ����� 0 zz  � m   � ��� >!�{N>���  ��  � o   � ����� 0 zz  � m   � ��� >�~O~�K���  ��  � o   � ����� 0 zz  � m   � ��� >���D���  ��  � o   � ����� 0 zz  � m   � ��� ?V�l�=���  ��  � o   � ����� 0 zz  � m   � ��� ?�UUUV���  ��  � o      ���� 0 y  ��  � r   � ���� [   � ���� o   � ����� 0 z2  � ]   � ���� ]   � ���� o   � ����� 0 z2  � o   � ����� 0 zz  � l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � �   ]   � � l  � ����� \   � � ]   � � m   � �		 =���ќ� o   � ����� 0 zz   m   � �

 >Z��)[��  ��   o   � ����� 0 zz   m   � � >��V}H���  ��  � o   � ��� 0 zz  � m   � � ?*������  ��  � o   � ��~�~ 0 zz  � m   � � ?�"w��  ��  � o   � ��}�} 0 zz  � m   � � ?�UUUU�?��  ��  � o      �|�| 0 y  �  Z  � ��{�z o   � ��y�y 0 isneg isNeg r   � � d   � � o   � ��x�x 0 y   o      �w�w 0 y  �{  �z   �v L   � � o   � ��u�u 0 y  �v  .  l     �t�s�r�t  �s  �r    l     �q�p�o�q  �p  �o    l     �n�m�l�n  �m  �l    i  n q !  I     �k"�j
�k .Mth:Sin_null���     doub" o      �i�i 0 x  �j  ! Q     #$%# L    && I    �h'�g�h 0 _sin  ' (�f( c    )*) o    �e�e 0 x  * m    �d
�d 
nmbr�f  �g  $ R      �c+,
�c .ascrerr ****      � ****+ o      �b�b 0 etext eText, �a-.
�a 
errn- o      �`�` 0 enumber eNumber. �_/0
�_ 
erob/ o      �^�^ 0 efrom eFrom0 �]1�\
�] 
errt1 o      �[�[ 
0 eto eTo�\  % I    �Z2�Y�Z 
0 _error  2 343 m    55 �66  s i n4 787 o    �X�X 0 etext eText8 9:9 o    �W�W 0 enumber eNumber: ;<; o    �V�V 0 efrom eFrom< =�U= o    �T�T 
0 eto eTo�U  �Y   >?> l     �S�R�Q�S  �R  �Q  ? @A@ l     �P�O�N�P  �O  �N  A BCB i  r uDED I     �MF�L
�M .Mth:Cos_null���     doubF o      �K�K 0 x  �L  E Q      GHIG L    JJ I    �JK�I�J 0 _sin  K L�HL [    	MNM l   O�G�FO c    PQP o    �E�E 0 x  Q m    �D
�D 
nmbr�G  �F  N m    �C�C Z�H  �I  H R      �BRS
�B .ascrerr ****      � ****R o      �A�A 0 etext eTextS �@TU
�@ 
errnT o      �?�? 0 enumber eNumberU �>VW
�> 
erobV o      �=�= 0 efrom eFromW �<X�;
�< 
errtX o      �:�: 
0 eto eTo�;  I I     �9Y�8�9 
0 _error  Y Z[Z m    \\ �]]  c o s[ ^_^ o    �7�7 0 etext eText_ `a` o    �6�6 0 enumber eNumbera bcb o    �5�5 0 efrom eFromc d�4d o    �3�3 
0 eto eTo�4  �8  C efe l     �2�1�0�2  �1  �0  f ghg l     �/�.�-�/  �.  �-  h iji i  v yklk I     �,m�+
�, .Mth:Tan_null���     doubm o      �*�* 0 x  �+  l k    nn opo l     �)qr�)  q a [ note: this starts to lose accuracy between 89.9999999 and 90�, but should be 'good enough'   r �ss �   n o t e :   t h i s   s t a r t s   t o   l o s e   a c c u r a c y   b e t w e e n   8 9 . 9 9 9 9 9 9 9   a n d   9 0 � ,   b u t   s h o u l d   b e   ' g o o d   e n o u g h 'p t�(t Q    uvwu k    �xx yzy r    {|{ c    }~} o    �'�' 0 x  ~ m    �&
�& 
nmbr| o      �%�% 0 x  z � l  	 #���� Z  	 #���$�#� G   	 ��� =  	 ��� o   	 
�"�" 0 x  � m   
 �!�! Z� =   ��� o    � �  0 x  � m    ��� R    ���
� .ascrerr ****      � ****� m    �� ��� F I n v a l i d   n u m b e r   ( r e s u l t   w o u l d   b e  " ) .� ���
� 
errn� m    ���s� ���
� 
erob� o    �� 0 x  �  �$  �#  � 4 . -2701 normally indicates divide-by-zero error   � ��� \   - 2 7 0 1   n o r m a l l y   i n d i c a t e s   d i v i d e - b y - z e r o   e r r o r� ��� l  $ -���� r   $ -��� ]   $ +��� l  $ '���� `   $ '��� o   $ %�� 0 x  � m   % &��h�  �  � l  ' *���� ^   ' *��� 1   ' (�
� 
pi  � m   ( )�� ��  �  � o      �� 0 x  � &   convert from degrees to radians   � ��� @   c o n v e r t   f r o m   d e g r e e s   t o   r a d i a n s� ��� r   . 3��� A   . 1��� o   . /�� 0 x  � m   / 0��  � o      �� 0 isneg isNeg� ��� Z  4 @����� o   4 5�
�
 0 isneg isNeg� r   8 <��� d   8 :�� o   8 9�	�	 0 x  � o      �� 0 x  �  �  � ��� r   A J��� _   A H��� l  A F���� ^   A F��� o   A B�� 0 x  � l  B E���� ^   B E��� 1   B C�
� 
pi  � m   C D�� �  �  �  �  � m   F G� �  � o      ���� 0 y  � ��� r   K V��� \   K T��� o   K L���� 0 y  � ]   L S��� l  L Q������ _   L Q��� ]   L O��� o   L M���� 0 y  � m   M N�� ?�      � m   O P���� ��  ��  � m   Q R���� � o      ���� 0 z  � ��� Z   W n������� =  W \��� `   W Z��� o   W X���� 0 z  � m   X Y���� � m   Z [���� � k   _ j�� ��� r   _ d��� [   _ b��� o   _ `���� 0 z  � m   ` a���� � o      ���� 0 z  � ���� r   e j��� [   e h��� o   e f���� 0 y  � m   f g���� � o      ���� 0 y  ��  ��  ��  � ��� r   o ���� \   o ~��� l  o x������ \   o x��� l  o t������ \   o t��� o   o p���� 0 x  � ]   p s��� o   p q���� 0 y  � m   q r�� ?�!�P M��  ��  � ]   t w��� o   t u���� 0 y  � m   u v�� >A�`  ��  ��  � ]   x }��� o   x y���� 0 y  � m   y |�� <��&3\� o      ���� 0 z2  � ��� r   � ���� ]   � ���� o   � ����� 0 z2  � o   � ����� 0 z2  � o      ���� 0 zz  � ��� Z   � ������� ?   � �� � o   � ����� 0 zz    m   � � =����+�� r   � � [   � � o   � ����� 0 z2   ^   � � ]   � �	 ]   � �

 o   � ����� 0 z2   o   � ����� 0 zz  	 l  � ����� \   � � ]   � � l  � ����� [   � � ]   � � m   � � �ɒ��O?D o   � ����� 0 zz   m   � � A1�������  ��   o   � ����� 0 zz   m   � � Aq��)�y��  ��   l  � ����� \   � � ]   � � l  � ����� [   � �  ]   � �!"! l  � �#����# \   � �$%$ ]   � �&'& l  � �(����( [   � �)*) o   � ����� 0 zz  * m   � �++ @ʸ��et��  ��  ' o   � ����� 0 zz  % m   � �,, A4'�X*����  ��  " o   � ����� 0 zz    m   � �-- Awُ������  ��   o   � ����� 0 zz   m   � �.. A���<�Z6��  ��   o      ���� 0 y  ��  � r   � �/0/ o   � ����� 0 z2  0 o      ���� 0 y  � 121 Z  � �34����3 G   � �565 =  � �787 o   � ����� 0 z  8 m   � ����� 6 =  � �9:9 o   � ����� 0 z  : m   � ����� 4 r   � �;<; ^   � �=>= m   � �������> o   � ����� 0 y  < o      ���� 0 y  ��  ��  2 ?@? Z  � �AB����A o   � ����� 0 isneg isNegB r   � �CDC d   � �EE o   � ����� 0 y  D o      ���� 0 y  ��  ��  @ F��F L   � �GG o   � ����� 0 y  ��  v R      ��HI
�� .ascrerr ****      � ****H o      ���� 0 etext eTextI ��JK
�� 
errnJ o      ���� 0 enumber eNumberK ��LM
�� 
erobL o      ���� 0 efrom eFromM ��N��
�� 
errtN o      ���� 
0 eto eTo��  w I   ���O���� 
0 _error  O PQP m   � �RR �SS  t a nQ TUT o   � ����� 0 etext eTextU VWV o   � ����� 0 enumber eNumberW XYX o   � ����� 0 efrom eFromY Z��Z o   � ����� 
0 eto eTo��  ��  �(  j [\[ l     ��������  ��  ��  \ ]^] l     ��������  ��  ��  ^ _`_ l     ��ab��  a  -----   b �cc 
 - - - - -` ded l     ��fg��  f   inverse   g �hh    i n v e r s ee iji l     ��������  ��  ��  j klk i  z }mnm I      ��o���� 	0 _asin  o p��p o      ���� 0 x  ��  ��  n k     �qq rsr r     tut A     vwv o     ���� 0 x  w m    ����  u o      ���� 0 isneg isNegs xyx Z   z{����z o    ���� 0 isneg isNeg{ r   
 |}| d   
 ~~ o   
 ���� 0 x  } o      ���� 0 x  ��  ��  y � Z   %������� ?    ��� o    ���� 0 x  � m    ���� � R    !����
�� .ascrerr ****      � ****� m     �� ��� T I n v a l i d   n u m b e r   ( n o t   b e t w e e n   - 1 . 0   a n d   1 . 0 ) .� ����
�� 
errn� m    �����Y� �����
�� 
erob� o    ���� 0 x  ��  ��  ��  � ��� Z   & ������ ?   & )��� o   & '���� 0 x  � m   ' (�� ?�      � k   , �� ��� r   , 1��� \   , /��� m   , -���� � o   - .���� 0 x  � o      ���� 0 zz  � ��� r   2 W��� ^   2 U��� ]   2 E��� o   2 3���� 0 zz  � l  3 D���~� [   3 D��� ]   3 B��� l  3 @��}�|� \   3 @��� ]   3 >��� l  3 <��{�z� [   3 <��� ]   3 :��� l  3 8��y�x� \   3 8��� ]   3 6��� m   3 4�� ?hOØ��� o   4 5�w�w 0 zz  � m   6 7�� ?��Y�,��y  �x  � o   8 9�v�v 0 zz  � m   : ;�� @����?��{  �z  � o   < =�u�u 0 zz  � m   > ?�� @9����"�}  �|  � o   @ A�t�t 0 zz  � m   B C�� @<�b@���  �~  � l  E T��s�r� [   E T��� ]   E R��� l  E P��q�p� \   E P��� ]   E N��� l  E L��o�n� [   E L��� ]   E J��� l  E H��m�l� \   E H��� o   E F�k�k 0 zz  � m   F G�� @5򢶿]R�m  �l  � o   H I�j�j 0 zz  � m   J K�� @bb�j1�o  �n  � o   L M�i�i 0 zz  � m   N O�� @w���c��q  �p  � o   P Q�h�h 0 zz  � m   R S�� @ug	��D��s  �r  � o      �g�g 0 p  � ��� r   X _��� a   X ]��� l  X [��f�e� [   X [��� o   X Y�d�d 0 zz  � o   Y Z�c�c 0 zz  �f  �e  � m   [ \�� ?�      � o      �b�b 0 zz  � ��� r   ` i��� \   ` g��� l  ` e��a�`� ^   ` e��� 1   ` c�_
�_ 
pi  � m   c d�^�^ �a  �`  � o   e f�]�] 0 zz  � o      �\�\ 0 z  � ��� r   j s��� \   j q��� ]   j m��� o   j k�[�[ 0 zz  � o   k l�Z�Z 0 p  � m   m p�� <��&3\
� o      �Y�Y 0 zz  � ��X� r   t ��� [   t }��� \   t w��� o   t u�W�W 0 z  � o   u v�V�V 0 zz  � l  w |��U�T� ^   w |��� 1   w z�S
�S 
pi  � m   z {�R�R �U  �T  � o      �Q�Q 0 z  �X  � ��� A   � ���� o   � ��P�P 0 x  � m   � ��� >Ey��0�:� ��O� r   � �� � o   � ��N�N 0 x    o      �M�M 0 z  �O  � k   � �  r   � � ]   � � o   � ��L�L 0 x   o   � ��K�K 0 x   o      �J�J 0 zz   �I r   � �	
	 [   � � ]   � � ^   � � ]   � � o   � ��H�H 0 zz   l  � ��G�F \   � � ]   � � l  � ��E�D [   � � ]   � � l  � ��C�B \   � � ]   � � !  l  � �"�A�@" [   � �#$# ]   � �%&% l  � �'�?�>' \   � �()( ]   � �*+* m   � �,, ?qk��v�+ o   � ��=�= 0 zz  ) m   � �-- ?�CA3>M��?  �>  & o   � ��<�< 0 zz  $ m   � �.. @�K�/�A  �@  ! o   � ��;�; 0 zz   m   � �// @0C1�'���C  �B   o   � ��:�: 0 zz   m   � �00 @3��w���E  �D   o   � ��9�9 0 zz   m   � �11 @ elΰ8�G  �F   l  � �2�8�72 \   � �343 ]   � �565 l  � �7�6�57 [   � �898 ]   � �:;: l  � �<�4�3< \   � �=>= ]   � �?@? l  � �A�2�1A [   � �BCB ]   � �DED l  � �F�0�/F \   � �GHG o   � ��.�. 0 zz  H m   � �II @-{Y^��0  �/  E o   � ��-�- 0 zz  C m   � �JJ @Q��%��6�2  �1  @ o   � ��,�, 0 zz  > m   � �KK @be�m5v��4  �3  ; o   � ��+�+ 0 zz  9 m   � �LL @apV�����6  �5  6 o   � ��*�* 0 zz  4 m   � �MM @H�"
6��8  �7   o   � ��)�) 0 x   o   � ��(�( 0 x  
 o      �'�' 0 z  �I  � NON Z  � �PQ�&�%P o   � ��$�$ 0 isneg isNegQ r   � �RSR d   � �TT o   � ��#�# 0 z  S o      �"�" 0 z  �&  �%  O U�!U L   � �VV ^   � �WXW o   � �� �  0 z  X l  � �Y��Y ^   � �Z[Z 1   � ��
� 
pi  [ m   � ��� ��  �  �!  l \]\ l     ����  �  �  ] ^_^ l     ����  �  �  _ `a` l     ����  �  �  a bcb i  ~ �ded I     �f�
� .Mth:Sinanull���     doubf o      �� 0 x  �  e Q     ghig L    jj I    �k�� 	0 _asin  k l�l c    mnm o    �� 0 x  n m    �
� 
nmbr�  �  h R      �
op
�
 .ascrerr ****      � ****o o      �	�	 0 etext eTextp �qr
� 
errnq o      �� 0 enumber eNumberr �st
� 
erobs o      �� 0 efrom eFromt �u�
� 
errtu o      �� 
0 eto eTo�  i I    �v� � 
0 _error  v wxw m    yy �zz  a s i nx {|{ o    ���� 0 etext eText| }~} o    ���� 0 enumber eNumber~ � o    ���� 0 efrom eFrom� ���� o    ���� 
0 eto eTo��  �   c ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Mth:Cosanull���     doub� o      ���� 0 x  ��  � Q      ���� L    �� \    ��� m    ���� Z� l   ������ I    ������� 	0 _asin  � ���� c    ��� o    ���� 0 x  � m    ��
�� 
nmbr��  ��  ��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I     ������� 
0 _error  � ��� m    �� ���  a c o s� ��� o    ���� 0 etext eText� ��� o    ���� 0 enumber eNumber� ��� o    ���� 0 efrom eFrom� ���� o    ���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Mth:Tananull���     doub� o      ���� 0 x  ��  � Q     *���� k    �� ��� r    ��� c    ��� o    ���� 0 x  � m    ��
�� 
nmbr� o      ���� 0 x  � ���� L   	 �� I   	 ������� 	0 _asin  � ���� ^   
 ��� o   
 ���� 0 x  � l   ������ a    ��� l   ������ [    ��� ]    ��� o    ���� 0 x  � o    ���� 0 x  � m    ���� ��  ��  � m    �� ?�      ��  ��  ��  ��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I     *������� 
0 _error  � ��� m   ! "�� ���  a t a n� ��� o   " #���� 0 etext eText� ��� o   # $���� 0 enumber eNumber� ��� o   $ %���� 0 efrom eFrom� ���� o   % &���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ������  �   hyperbolic   � ���    h y p e r b o l i c� ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Mth:Sinhnull���     doub� o      ���� 0 x  ��  � Q     .���� k    �� ��� r    ��� c    ��� o    ���� 0 x  � m    ��
�� 
nmbr� o      ���� 0 x  � ���� L   	 �� ]   	 � � m   	 
 ?�        l  
 ���� \   
  a   
  o   
 ���� 	0 __e__   o    ���� 0 x   a     o    ���� 	0 __e__   d    		 o    ���� 0 x  ��  ��  ��  � R      ��

�� .ascrerr ****      � ****
 o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  � I   $ .������ 
0 _error    m   % & � 
 a s i n h  o   & '���� 0 etext eText  o   ' (���� 0 enumber eNumber  o   ( )���� 0 efrom eFrom �� o   ) *���� 
0 eto eTo��  ��  �  l     ��������  ��  ��     l     ��������  ��  ��    !"! i  � �#$# I     ��%��
�� .Mth:Coshnull���     doub% o      ���� 0 x  ��  $ Q     .&'(& k    )) *+* r    ,-, c    ./. o    ���� 0 x  / m    �
� 
nmbr- o      �~�~ 0 x  + 0�}0 L   	 11 ]   	 232 m   	 
44 ?�      3 l  
 5�|�{5 [   
 676 a   
 898 o   
 �z�z 	0 __e__  9 o    �y�y 0 x  7 a    :;: o    �x�x 	0 __e__  ; d    << o    �w�w 0 x  �|  �{  �}  ' R      �v=>
�v .ascrerr ****      � ****= o      �u�u 0 etext eText> �t?@
�t 
errn? o      �s�s 0 enumber eNumber@ �rAB
�r 
erobA o      �q�q 0 efrom eFromB �pC�o
�p 
errtC o      �n�n 
0 eto eTo�o  ( I   $ .�mD�l�m 
0 _error  D EFE m   % &GG �HH 
 a c o s hF IJI o   & '�k�k 0 etext eTextJ KLK o   ' (�j�j 0 enumber eNumberL MNM o   ( )�i�i 0 efrom eFromN O�hO o   ) *�g�g 
0 eto eTo�h  �l  " PQP l     �f�e�d�f  �e  �d  Q RSR l     �c�b�a�c  �b  �a  S TUT i  � �VWV I     �`X�_
�` .Mth:Tanhnull���     doubX o      �^�^ 0 x  �_  W Q     =YZ[Y k    +\\ ]^] r    _`_ c    aba o    �]�] 0 x  b m    �\
�\ 
nmbr` o      �[�[ 0 x  ^ c�Zc L   	 +dd ^   	 *efe l  	 g�Y�Xg \   	 hih a   	 jkj o   	 �W�W 	0 __e__  k o    �V�V 0 x  i a    lml o    �U�U 	0 __e__  m d    nn o    �T�T 0 x  �Y  �X  f l   )o�S�Ro [    )pqp a     rsr o    �Q�Q 	0 __e__  s o    �P�P 0 x  q a     (tut o     %�O�O 	0 __e__  u d   % 'vv o   % &�N�N 0 x  �S  �R  �Z  Z R      �Mwx
�M .ascrerr ****      � ****w o      �L�L 0 etext eTextx �Kyz
�K 
errny o      �J�J 0 enumber eNumberz �I{|
�I 
erob{ o      �H�H 0 efrom eFrom| �G}�F
�G 
errt} o      �E�E 
0 eto eTo�F  [ I   3 =�D~�C�D 
0 _error  ~ � m   4 5�� ��� 
 a t a n h� ��� o   5 6�B�B 0 etext eText� ��� o   6 7�A�A 0 enumber eNumber� ��� o   7 8�@�@ 0 efrom eFrom� ��?� o   8 9�>�> 
0 eto eTo�?  �C  U ��� l     �=�<�;�=  �<  �;  � ��� l     �:�9�8�:  �9  �8  � ��� l     �7���7  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �6���6  �   Logarithms   � ���    L o g a r i t h m s� ��� l     �5�4�3�5  �4  �3  � ��� i  � ���� I      �2��1�2 
0 _frexp  � ��0� o      �/�/ 0 m  �0  �1  � k     n�� ��� Z    ���.�-� =    ��� o     �,�, 0 m  � m    �+�+  � L    �� J    
�� ��� m    ��         � ��*� m    �)�)  �*  �.  �-  � ��� r    ��� A    ��� o    �(�( 0 m  � m    �'�'  � o      �&�& 0 isneg isNeg� ��� Z   "���%�$� o    �#�# 0 isneg isNeg� r    ��� d    �� o    �"�" 0 m  � o      �!�! 0 m  �%  �$  � ��� r   # &��� m   # $� �   � o      �� 0 e  � ��� W   ' [��� Z   7 V����� @   7 :��� o   7 8�� 0 m  � m   8 9�� � k   = H�� ��� r   = B��� ^   = @��� o   = >�� 0 m  � m   > ?�� � o      �� 0 m  � ��� r   C H��� [   C F��� o   C D�� 0 e  � m   D E�� � o      �� 0 e  �  �  � k   K V�� ��� r   K P��� ]   K N��� o   K L�� 0 m  � m   L M�� � o      �� 0 m  � ��� r   Q V��� \   Q T��� o   Q R�� 0 e  � m   R S�� � o      �� 0 e  �  � F   + 6��� @   + .��� o   + ,�� 0 m  � m   , -�� ?�      � A   1 4��� o   1 2�� 0 m  � m   2 3�� � ��� Z  \ h���
�	� o   \ ]�� 0 isneg isNeg� r   ` d��� d   ` b�� o   ` a�� 0 m  � o      �� 0 m  �
  �	  � ��� L   i n�� J   i m�� ��� o   i j�� 0 m  � ��� o   j k�� 0 e  �  �  � ��� l     �� ���  �   ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I      ������� 	0 _logn  � ���� o      ���� 0 x  ��  ��  � k    ;�� ��� Z     ����  B      o     ���� 0 x   m    ����   R    ��
�� .ascrerr ****      � **** m   
  � 8 I n v a l i d   n u m b e r   ( m u s t   b e   > 0 ) . ����
�� 
errn m    	�����Y��  ��  ��  � 	
	 r    & I      ������ 
0 _frexp   �� o    ���� 0 x  ��  ��   J        o      ���� 0 x   �� o      ���� 0 e  ��  
  Z   '8�� G   ' 2 A   ' * o   ' (���� 0 e   m   ( )������ ?   - 0 o   - .���� 0 e   m   . /����  k   5 �   Z   5 ^!"��#! A   5 8$%$ o   5 6���� 0 x  % m   6 7&& ?栞fK�" l  ; N'()' k   ; N** +,+ r   ; @-.- \   ; >/0/ o   ; <���� 0 e  0 m   < =���� . o      ���� 0 e  , 121 r   A F343 \   A D565 o   A B���� 0 x  6 m   B C77 ?�      4 o      ���� 0 z  2 8��8 r   G N9:9 [   G L;<; ]   G J=>= m   G H?? ?�      > o   H I���� 0 z  < m   J K@@ ?�      : o      ���� 0 y  ��  (   (2 ^ 0.5) / 2   ) �AA    ( 2   ^   0 . 5 )   /   2��  # k   Q ^BB CDC r   Q VEFE \   Q TGHG o   Q R���� 0 x  H m   R S���� F o      ���� 0 z  D I��I r   W ^JKJ [   W \LML ]   W ZNON m   W XPP ?�      O o   X Y���� 0 x  M m   Z [QQ ?�      K o      ���� 0 y  ��    RSR r   _ dTUT ^   _ bVWV o   _ `���� 0 z  W o   ` a���� 0 y  U o      ���� 0 x  S XYX r   e jZ[Z ]   e h\]\ o   e f���� 0 x  ] o   f g���� 0 x  [ o      ���� 0 z  Y ^_^ r   k �`a` ^   k �bcb ]   k xded ]   k nfgf o   k l���� 0 x  g o   l m���� 0 z  e l  n wh����h \   n wiji ]   n uklk l  n sm����m [   n snon ]   n qpqp m   n orr ��D=�l�q o   o p���� 0 z  o m   q rss @0b�s{���  ��  l o   s t���� 0 z  j m   u vtt @P	"*?��  ��  c l  x �u����u \   x �vwv ]   x �xyx l  x z����z [   x {|{ ]   x }}~} l  x {���� \   x {��� o   x y���� 0 z  � m   y z�� @A�C�l���  ��  ~ o   { |���� 0 z  | m   } ~�� @s��*�
��  ��  y o    ����� 0 z  w m   � ��� @���?;��  ��  a o      ���� 0 z  _ ��� r   � ���� o   � ����� 0 e  � o      ���� 0 y  � ���� r   � ���� [   � ���� [   � ���� \   � ���� o   � ����� 0 z  � ]   � ���� o   � ����� 0 y  � m   � ��� ?+�\a�� o   � ����� 0 x  � ]   � ���� o   � ����� 0 e  � m   � ��� ?�0     � o      ���� 0 z  ��  ��   k   �8�� ��� Z   � ������� A   � ���� o   � ����� 0 x  � m   � ��� ?栞fK�� l  � ����� k   � ��� ��� r   � ���� \   � ���� o   � ����� 0 e  � m   � ����� � o      ���� 0 e  � ���� r   � ���� \   � ���� ]   � ���� m   � ����� � o   � ����� 0 x  � m   � ����� � o      ���� 0 x  ��  �   (2 ^ 0.5) / 2   � ���    ( 2   ^   0 . 5 )   /   2��  � r   � ���� \   � ���� o   � ����� 0 x  � m   � ����� � o      ���� 0 x  � ��� r   � ���� ]   � ���� o   � ����� 0 x  � o   � ����� 0 x  � o      ���� 0 z  � ��� r   ���� ^   ���� ]   � ���� ]   � ���� o   � ����� 0 x  � o   � ����� 0 z  � l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� m   � ��� ?���� o   � ����� 0 x  � m   � ��� ?���?Vd���  ��  � o   � ����� 0 x  � m   � ��� @Һ�i���  ��  � o   � ����� 0 x  � m   � ��� @,�r�>����  ��  � o   � ����� 0 x  � m   � ��� @1�֒K�R��  ��  � o   � ����� 0 x  � m   � ��� @�c}~ݝ��  ��  � l  ������� [   ���� ]   � ���� l  � ������ [   � ���� ]   � ���� l  � ����� [   � ���� ]   � ���� l  � ����� [   � ���� ]   � ���� l  � ����� [   � ���� o   � ��� 0 x  � m   � ��� @&� ����  �  � o   � ��� 0 x  � m   � ��� @F�,N��  �  � o   � ��� 0 x  � m   � ��� @T�3�&���  �  � o   � ��� 0 x  � m   � �   @Q���^���  �  � o   � ��� 0 x  � m   �  @7 
�&5��  ��  � o      �� 0 y  �  Z  �� >   o  �� 0 e   m  ��   r  	 \  

 o  �~�~ 0 y   ]   o  �}�} 0 e   m   ?+�\a�	 o      �|�| 0 y  �  �    r   \   o  �{�{ 0 y   l �z�y ^   o  �x�x 0 z   m  �w�w �z  �y   o      �v�v 0 y    r  $ [  " o   �u�u 0 x   o   !�t�t 0 y   o      �s�s 0 z   �r Z %8 �q�p >  %(!"! o  %&�o�o 0 e  " m  &'�n�n    r  +4#$# [  +2%&% o  +,�m�m 0 z  & ]  ,1'(' o  ,-�l�l 0 e  ( m  -0)) ?�0     $ o      �k�k 0 z  �q  �p  �r   *�j* L  9;++ o  9:�i�i 0 z  �j  � ,-, l     �h�g�f�h  �g  �f  - ./. l     �e�d�c�e  �d  �c  / 010 l     �b�a�`�b  �a  �`  1 232 i  � �454 I     �_6�^
�_ .Mth:Lognnull���     doub6 o      �]�] 0 x  �^  5 Q     7897 L    :: I    �\;�[�\ 	0 _logn  ; <�Z< c    =>= o    �Y�Y 0 x  > m    �X
�X 
nmbr�Z  �[  8 R      �W?@
�W .ascrerr ****      � ****? o      �V�V 0 etext eText@ �UAB
�U 
errnA o      �T�T 0 enumber eNumberB �SCD
�S 
erobC o      �R�R 0 efrom eFromD �QE�P
�Q 
errtE o      �O�O 
0 eto eTo�P  9 I    �NF�M�N 
0 _error  F GHG m    II �JJ  l o g nH KLK o    �L�L 0 etext eTextL MNM o    �K�K 0 enumber eNumberN OPO o    �J�J 0 efrom eFromP Q�IQ o    �H�H 
0 eto eTo�I  �M  3 RSR l     �G�F�E�G  �F  �E  S TUT l     �D�C�B�D  �C  �B  U VWV i  � �XYX I     �AZ�@
�A .Mth:Lo10null���     doubZ o      �?�? 0 x  �@  Y Q     $[\][ l   ^_`^ L    aa ^    bcb ]    ded l   f�>�=f ^    ghg I    �<i�;�< 	0 _logn  i j�:j c    klk o    �9�9 0 x  l m    �8
�8 
nmbr�:  �;  h m    mm @k���T��>  �=  e m    nn @r�     c m    oo @r�    j_   correct for minor drift   ` �pp 0   c o r r e c t   f o r   m i n o r   d r i f t\ R      �7qr
�7 .ascrerr ****      � ****q o      �6�6 0 etext eTextr �5st
�5 
errns o      �4�4 0 enumber eNumbert �3uv
�3 
erobu o      �2�2 0 efrom eFromv �1w�0
�1 
errtw o      �/�/ 
0 eto eTo�0  ] I    $�.x�-�. 
0 _error  x yzy m    {{ �|| 
 l o g 1 0z }~} o    �,�, 0 etext eText~ � o    �+�+ 0 enumber eNumber� ��� o    �*�* 0 efrom eFrom� ��)� o     �(�( 
0 eto eTo�)  �-  W ��� l     �'�&�%�'  �&  �%  � ��� l     �$�#�"�$  �#  �"  � ��� i  � ���� I     �!��
�! .Mth:Logbnull���     doub� o      � �  0 x  � ���
� 
Base� o      �� 0 b  �  � Q     '���� L    �� ^    ��� I    ���� 	0 _logn  � ��� c    ��� o    �� 0 x  � m    �
� 
nmbr�  �  � l   ���� I    ���� 	0 _logn  � ��� c    ��� o    �� 0 b  � m    �
� 
nmbr�  �  �  �  � R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� �
��	
�
 
errt� o      �� 
0 eto eTo�	  � I    '���� 
0 _error  � ��� m    �� ���  l o g b� ��� o     �� 0 etext eText� ��� o     !�� 0 enumber eNumber� ��� o   ! "�� 0 efrom eFrom� ��� o   " #�� 
0 eto eTo�  �  � ��� l     � �����   ��  ��  � ���� l     ��������  ��  ��  ��       (������ h r ~ ����������������������������������  � &����������������������������������������������������������������������������
�� 
pimr�� 0 _support  �� 
0 _error  �� 	0 __e__  �� 0 _isequaldelta _isEqualDelta�� $0 _mindecimalrange _minDecimalRange�� $0 _maxdecimalrange _maxDecimalRange�� (0 _asintegerproperty _asIntegerProperty�� ,0 _makenumberformatter _makeNumberFormatter�� "0 _setbasicformat _setBasicFormat��  0 _nameforformat _nameForFormat
�� .Mth:FNumnull���     nmbr
�� .Mth:PNumnull���     ctxt
�� .Mth:NuHenull���     ****
�� .Mth:HeNunull���     ctxt
�� .Mth:DeRanull���     doub
�� .Mth:RaDenull���     doub
�� .Mth:Abs_null���     nmbr
�� .Mth:CmpNnull���     ****
�� .Mth:MinNnull���     ****
�� .Mth:MaxNnull���     ****
�� .Mth:RouNnull���     nmbr�� 0 _sin  
�� .Mth:Sin_null���     doub
�� .Mth:Cos_null���     doub
�� .Mth:Tan_null���     doub�� 	0 _asin  
�� .Mth:Sinanull���     doub
�� .Mth:Cosanull���     doub
�� .Mth:Tananull���     doub
�� .Mth:Sinhnull���     doub
�� .Mth:Coshnull���     doub
�� .Mth:Tanhnull���     doub�� 
0 _frexp  �� 	0 _logn  
�� .Mth:Lognnull���     doub
�� .Mth:Lo10null���     doub
�� .Mth:Logbnull���     doub� ����� �  ��� �����
�� 
cobj� ��   �� 
�� 
frmk��  � �����
�� 
cobj� ��   ��
�� 
osax��  � ��   �� /
�� 
scpt� �� 7���������� 
0 _error  �� ����� �  ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo��  � �������� 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�  G��� � &0 throwcommanderror throwCommandError�� b  ࠡ����+ � � ������� (0 _asintegerproperty _asIntegerProperty� ��� �  ���� 0 thevalue theValue� 0 propertyname propertyName� 0 minvalue minValue�  � ����� 0 thevalue theValue� 0 propertyname propertyName� 0 minvalue minValue� 0 n  � 	������� � �
� 
long
� 
doub
� 
bool
� 
errn��Y�  � ���
� 
errn��Y�  � 9 (��&E�O���&
 ���& )��lhY hO�W X  )��l�%�%� � ������� ,0 _makenumberformatter _makeNumberFormatter� ��� �  ���� 0 formatstyle formatStyle� 0 
localecode 
localeCode� 0 	thenumber 	theNumber�  � �������� 0 formatstyle formatStyle� 0 
localecode 
localeCode� 0 	thenumber 	theNumber� 0 asocformatter asocFormatter� 0 formatrecord formatRecord� 0 s  � 0 etext eText� G����������������������=��~�}�|d��{�z��y�x�w�v�u�t�s���r�q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b~���a��`�_�^��]�\
� misccura� &0 nsnumberformatter NSNumberFormatter� 	0 alloc  � 0 init  
� 
kocl
� 
reco
� .corecnte****       ****
� 
pcls
� 
MthR
� 
MthA� 0 requiredvalue RequiredValue
� 
MthB
� 
msng
� 
MthC
� 
MthD
� 
MthE
� 
MthF
� 
MthG
� 
MthH� � 60 asoptionalrecordparameter asOptionalRecordParameter� "0 _setbasicformat _setBasicFormat� (0 _asintegerproperty _asIntegerProperty�~ 60 setminimumfractiondigits_ setMinimumFractionDigits_�}��| 60 setmaximumfractiondigits_ setMaximumFractionDigits_�{ <0 setminimumsignificantdigits_ setMinimumSignificantDigits_�z 60 setusessignificantdigits_ setUsesSignificantDigits_�y <0 setmaximumsignificantdigits_ setMaximumSignificantDigits_
�x 
ctxt
�w 
leng
�v 
errn�u�Y�t ,0 setdecimalseparator_ setDecimalSeparator_�s  � �[�Z�Y
�[ 
errn�Z�\�Y  �r 60 setusesgroupingseparator_ setUsesGroupingSeparator_�q .0 setgroupingseparator_ setGroupingSeparator_
�p MRndRNhE�o @0 nsnumberformatterroundhalfeven NSNumberFormatterRoundHalfEven�n $0 setroundingmode_ setRoundingMode_
�m MRndRNhT�l @0 nsnumberformatterroundhalfdown NSNumberFormatterRoundHalfDown
�k MRndRNhF�j <0 nsnumberformatterroundhalfup NSNumberFormatterRoundHalfUp
�i MRndRN_T�h 80 nsnumberformatterrounddown NSNumberFormatterRoundDown
�g MRndRN_F�f 40 nsnumberformatterroundup NSNumberFormatterRoundUp
�e MRndRN_U�d >0 nsnumberformatterroundceiling NSNumberFormatterRoundCeiling
�c MRndRN_D�b :0 nsnumberformatterroundfloor NSNumberFormatterRoundFloor� �X�W�V
�X 
errn�W�Y�V  �a 0 etext eText
�` 
enum�_ �^ .0 throwinvalidparameter throwInvalidParameter�] *0 asnslocaleparameter asNSLocaleParameter�\ 0 
setlocale_ 
setLocale_����,j+ j+ E�Ok�kv��l k Ab  ����b  �,��������a �a �a �a a m+ E�O*���,�m+ O��,� !�*��,a jm+ k+ O�a k+ OPY hO��,� �*��,a jm+ k+ OPY hO��,� �*��,a jm+ k+ O�ek+ Y hO��,� �*��,a  jm+ k+ !O�ek+ Y hO�a ,� G 0�a ,a "&E�O�a #,j  )a $a %lhY hO��k+ &W X ' ()a $a %la )Y hO�a ,� H 1�a ,a "&E�O�a #,j  �fk+ *Y �ek+ *O��k+ +W X ' ()a $a %la ,Y hO�a ,� ��a ,a -  ��a .,k+ /Y ��a ,a 0  ��a 1,k+ /Y ��a ,a 2  ��a 3,k+ /Y r�a ,a 4  ��a 5,k+ /Y Y�a ,a 6  ��a 7,k+ /Y @�a ,a 8  ��a 9,k+ /Y '�a ,a :  ��a ;,k+ /Y )a $a %la <Y hY  *���m+ W X ' =)ja >W X ? =b  �a @�a Alv�a B+ CO�b  �a Dl+ Ek+ FO�� �U��T�S���R�U "0 _setbasicformat _setBasicFormat�T �Q��Q �  �P�O�N�P 0 asocformatter asocFormatter�O 0 
formatname 
formatName�N 0 	thenumber 	theNumber�S  � �M�L�K�M 0 asocformatter asocFormatter�L 0 
formatname 
formatName�K 0 	thenumber 	theNumber� "�J�I�H�G�F�E�D�C�B�A�@�?�>�=�<�;�:�9�8�7�6�5�4�3�2�1�0�/�.�-�,�+�*�
�J MthZMth0
�I 
msng
�H misccura�G D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle�F "0 setnumberstyle_ setNumberStyle_
�E 
pcls
�D 
long�C 40 nsnumberformatternostyle NSNumberFormatterNoStyle
�B 
bool�A >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle�@ 60 setminimumfractiondigits_ setMinimumFractionDigits_�?��> 60 setmaximumfractiondigits_ setMaximumFractionDigits_�= 60 setusesgroupingseparator_ setUsesGroupingSeparator_
�< MthZMth3
�; MthZMth1
�: MthZMth2
�9 MthZMth5�8 @0 nsnumberformattercurrencystyle NSNumberFormatterCurrencyStyle
�7 MthZMth4�6 >0 nsnumberformatterpercentstyle NSNumberFormatterPercentStyle
�5 MthZMth6�4 @0 nsnumberformatterspelloutstyle NSNumberFormatterSpellOutStyle
�3 
kocl
�2 
ctxt
�1 .corecnte****       ****�0 0 
setformat_ 
setFormat_
�/ 
errn�.�Y
�- 
erob
�, 
errt
�+ 
enum�* �RG��  ���  ���,k+ Y ���,�  ���,k+ Y tb  '�	 �b  '�&
 b  �	 �b  �&�&
 �j �& $���,k+ O�kk+ 
O��k+ O�fk+ OPY ���,k+ O�kk+ 
O��k+ OPY ���  ���,k+ Y ���  ���,k+ Y ��a   ���,k+ Y t�a   ��a ,k+ Y _�a   ��a ,k+ Y J�a   ��a ,k+ Y 5�kva a l j ��k+ Y )a a a �a a a  a !� �)��(�'���&�)  0 _nameforformat _nameForFormat�( �%��% �  �$�$ 0 formatstyle formatStyle�'  � �#�# 0 formatstyle formatStyle� �"��!�� ���&(
�" MthZMth1
�! MthZMth2
�  MthZMth5
� MthZMth4
� MthZMth3
� MthZMth6�& I��  �Y ?��  �Y 4��  �Y )��  �Y ��  �Y ��  �Y �%�%� �9�����
� .Mth:FNumnull���     nmbr� 0 	thenumber 	theNumber� ���
� 
Usin� {���� 0 formatstyle formatStyle�  
� MthZMth0� ���
� 
Loca� {��E� 0 
localecode 
localeCode�  �  � 	�������
�	�� 0 	thenumber 	theNumber� 0 formatstyle formatStyle� 0 
localecode 
localeCode� 0 asocformatter asocFormatter� 0 
asocstring 
asocString� 0 etext eText�
 0 enumber eNumber�	 0 efrom eFrom� 
0 eto eTo� ���af����� �����������������
� 
kocl
� 
nmbr
� .corecnte****       ****� � 60 throwinvalidparametertype throwInvalidParameterType� ,0 _makenumberformatter _makeNumberFormatter� &0 stringfromnumber_ stringFromNumber_
�  
msng
�� 
errn���Y
�� 
erob
�� 
ctxt�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � e P�kv��l j  b  �����+ Y hO*���m+ E�O��k+ E�O��  )�����Y hO��&W X  *a ����a + � �����������
�� .Mth:PNumnull���     ctxt�� 0 thetext theText�� ����
�� 
Usin� {�������� 0 formatstyle formatStyle��  
�� MthZMth0� �����
�� 
Loca� {������� 0 
localecode 
localeCode��  ��  � 
���������������������� 0 thetext theText�� 0 formatstyle formatStyle�� 0 
localecode 
localeCode�� 0 asocformatter asocFormatter�� 0 
asocnumber 
asocNumber�� $0 localeidentifier localeIdentifier�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ������������������������������$��(*�����=����
�� 
kocl
�� 
ctxt
�� .corecnte****       ****�� �� 60 throwinvalidparametertype throwInvalidParameterType
�� 
msng�� ,0 _makenumberformatter _makeNumberFormatter�� &0 numberfromstring_ numberFromString_�� 
0 locale  �� $0 localeidentifier localeIdentifier
�� 
leng
�� 
errn���Y
�� 
erob��  0 _nameforformat _nameForFormat
�� 
****�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� ���� 
�� 
erob�� 0 efrom eFrom  ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � ��kv��l j  b  �����+ Y hO*���m+ E�O��k+ 	E�O��  J�j+ 
j+ �&E�O��,j  �E�Y 	�%�%E�O)a a a ��a *�k+ %a %�%a %Y hO�a &W X  *a ����a + � ��Y����
�� .Mth:NuHenull���     ****�� 0 	thenumber 	theNumber� �
� 
Plac {���� 0 	chunksize 	chunkSize�  �   ��
� 
Pref {���� 0 	hasprefix 	hasPrefix�  
� boovfals�   ���������������� 0 	thenumber 	theNumber� 0 	chunksize 	chunkSize� 0 	hasprefix 	hasPrefix� 0 hextext hexText� 0 	hexprefix 	hexPrefix� 0 padtext padText� 0 maxsize maxSize� 0 
resultlist 
resultList� 0 i  � 0 
theinteger 
theInteger� 0 etext eText� 0 oldtids oldTIDs� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo As��������������������
2CEMV`v�������������� $4=S���z������ (0 asintegerparameter asIntegerParameter� (0 asbooleanparameter asBooleanParameter
� 
kocl
� 
list
� .corecnte****       ****� 00 aswholenumberparameter asWholeNumberParameter� 
� 
bool
� 
long� � .0 throwinvalidparameter throwInvalidParameter� 
� 
cobj
� 
leng� 0 
resultlist 
resultList �	��
�
� .ascrinit****      � ****	 k     	 ���  �  �  
 �� 
0 _list_   ��
� 
cobj� 
0 _list_  � 
b   �-E�� 
0 _list_  
� 
doub
� 
errn��\�   ���
� 
errn��\�  
� 
ctxt
� 
ascr
� 
txdl� 0 etext eText ��
� 
errn� 0 enumber eNumber �~�}
�~ 
erob�} 0 efrom eFrom �|�{�z
�| 
errt�{ 
0 eto eTo�z  � � 
0 _error  ��b  ��l+ E�Ob  ��l+ E�O�kv��l j <b  ��l+ E�O�j
 ���& b  �����+ Y hOa E�O�j Y�j	 �a �$'�& 7b  �a �a �%a %a �$'k"%a %a �$kk"%a %�+ Y hOa E�O�'E�Y Ra E�O�j	 �a �$k�& 7b  �a �a �%a %a �$'k"%a %a �$kk"%a %�+ Y hO� �a %E�Y hO &h�ja a  �a #k/�%E�O�a "E�[OY��O h�a !,�a "�%E�[OY��O��%Y��k
 ���& b  �a #�a $�+ Y hOa %a �$klvE[a  k/E�Z[a  l/E�ZO �kh�a &%E�[OY��Oa 'a (K )S�O �k�a *,a !,Ekh  @�a *,a  �/E�O��&E�O��a +&
 �j�&
 ���& )a ,a -lhY hW HX . /�� a 0�%a 1%a �$kk"%a 2%E�Y a 3E�Ob  �a *,a  �/a 4��+ Oa 5E�O &h�ja 6a  �a #k/�%E�O�a "E�[OY��O��%[a 7\[Z�'\Zi2�a *,a  �/F[OY�)O_ 8a 9,E�Oa :_ 8a 9,FO� a ;�a *,%E�Y �a *,a 7&E�O�_ 8a 9,FO�W X < =*a >����a ?+ @� �y��x�w�v
�y .Mth:HeNunull���     ctxt�x 0 hextext hexText�w �u
�u 
Plac {�t�s�r�t 0 	chunksize 	chunkSize�s  �r   �q�p
�q 
Prec {�o�n�m�o 0 	isprecise 	isPrecise�n  
�m boovfals�p   �l�k�j�i�h�g�f�e�d�c�b�a�l 0 hextext hexText�k 0 	chunksize 	chunkSize�j 0 	isprecise 	isPrecise�i 0 	thenumber 	theNumber�h 0 
isnegative 
isNegative�g 0 charref charRef�f 0 i  �e 0 
resultlist 
resultList�d 0 etext eText�c 0 enumber eNumber�b 0 efrom eFrom�a 
0 eto eTo 5����`��_�^�]��\��[�Z�Y�X0�W�V�U�T�S�R�QK�P�O�N�Min���L����K����		!�J�I	?�H�G�` "0 astextparameter asTextParameter�_ (0 asintegerparameter asIntegerParameter�^ 
�] 
bool
�\ 
long�[ �Z .0 throwinvalidparameter throwInvalidParameter�Y (0 asbooleanparameter asBooleanParameter
�X 
ctxt
�W 
kocl
�V 
cobj
�U .corecnte****       ****�T 
�S misccura
�R 
psof
�Q 
psin
�P .sysooffslong    ��� null
�O 
errn�N�@�M   �F�E�D
�F 
errn�E�@�D  
�L 
leng�K 0 
resultlist 
resultList �C�B�A�@
�C .ascrinit****      � **** k      ��?�?  �B  �A   �>�> 
0 _list_   �=�= 
0 _list_  �@ jv��J 
0 _list_  �I 0 etext eText �<�;
�< 
errn�; 0 enumber eNumber �:�9
�: 
erob�9 0 efrom eFrom �8�7�6
�8 
errt�7 
0 eto eTo�6  �H �G 
0 _error  �vaL��Db  ��l+ E�Ob  ��l+ E�O�j
 ���& b  �����+ Y hOb  ��l+ E�O�j  � �jE�O��E�O� �[a \[Zl\Zi2E�Y hO�a  �[a \[Zm\Zi2E�Y hO U�[a a l kh �a  E�Oa  *a �a a � UE�O�j  )a a lhY hO��kE�[OY��W X  b  �a a a  �+ O�	 	��k �& b  �a !a a "�+ Y hO� 	�'E�Y hO�Y�a #,�#j b  �a $a a %�%a &%�+ Y hOa 'a (K )S�O �k�a #,E�h jE�O n�[a \[Z�\Z��k2[a a l kh �a  E�Oa  *a �a a *� UE�O�j  b  �a +a a ,�+ Y hO��kE�[OY��O�	 	��k �& )b  �[a \[Z�\Z��k2a -a a .�+ Y hO��a /,6F[OY�GO�a /,EVW X 0 1*a 2����a 3+ 4� �5	[�4�3�2
�5 .Mth:DeRanull���     doub�4 0 x  �3   �1�0�/�.�-�1 0 x  �0 0 etext eText�/ 0 enumber eNumber�. 0 efrom eFrom�- 
0 eto eTo �,�+�*�)	s�(�'
�, 
doub
�+ 
pi  �* ��) 0 etext eText �&�% 
�& 
errn�% 0 enumber eNumber  �$�#!
�$ 
erob�# 0 efrom eFrom! �"�!� 
�" 
errt�! 
0 eto eTo�   �( �' 
0 _error  �2  ��&��! W X  *塢���+ � �	���"#�
� .Mth:RaDenull���     doub� 0 x  �  " ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo# ����$	���
� 
doub
� 
pi  � �� 0 etext eText$ ��%
� 
errn� 0 enumber eNumber% ��&
� 
erob� 0 efrom eFrom& ���

� 
errt� 
0 eto eTo�
  � � 
0 _error  �  ��&��!!W X  *塢���+ � �		���'(�
�	 .Mth:Abs_null���     nmbr� 0 x  �  ' ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo( � ��)	�����
�  
nmbr�� 0 etext eText) ����*
�� 
errn�� 0 enumber eNumber* ����+
�� 
erob�� 0 efrom eFrom+ ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � * ��&E�O�j �'Y �W X  *㡢���+ � ��	�����,-��
�� .Mth:CmpNnull���     ****�� ��.�� .  ������ 0 n1  �� 0 n2  ��  , 	�������������������� 0 n1  �� 0 n2  �� 0 dn  �� 0 dm  �� 0 d  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo- ��������������/
Q����
�� 
kocl
�� 
long
�� .corecnte****       ****
�� 
doub
�� 
cobj
�� 
bool�� 0 etext eText/ ����0
�� 
errn�� 0 enumber eNumber0 ����1
�� 
erob�� 0 efrom eFrom1 ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � ���lv��l l  ��  jY hY s��&��&lvE[�k/E�Z[�l/E�ZO�j  b  � E�Y b  � E�O�'E�O�� ��lvE[�k/E�Z[�l/E�ZY hO��E�O��	 ���& jY hO�� iY kW X  *襦���+ 
� ��
a����23��
�� .Mth:MinNnull���     ****�� 0 thelist theList��  2 	�������������������� 0 thelist theList�� 0 
listobject 
listObject�� 0 i  �� 0 	theresult 	theResult�� 0 n  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo3 ��
i4����
���
�����������5
�
�6
����� 0 
listobject 
listObject4 �7��89�
� .ascrinit****      � ****7 k     :: 
i��  �  �  8 �� 
0 _list_  9 ��� 0 aslist asList� 
0 _list_  � b  b   k+  ��� 
0 _list_  
�� 
leng
�� 
list�� �� .0 throwinvalidparameter throwInvalidParameter
�� 
cobj
�� 
nmbr�� 0 etext eText5 ���
� 
errn��\�  6 ��;
� 
errn� 0 enumber eNumber; ��<
� 
erob� 0 efrom eFrom< ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� � ���K S�O��,�,j  b  �����+ 	Y hOkE�O <��,�k/�&E�O +k��,�,Ekh ��,�/�&E�O�� �E�Y h[OY��W X  b  ��/���%�+ 	O�W X  *a ����a + � �
���=>�
� .Mth:MaxNnull���     ****� 0 thelist theList�  = 	���������� 0 thelist theList� 0 
listobject 
listObject� 0 i  � 0 	theresult 	theResult� 0 n  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo> �
�?��������@ZaAo��� 0 
listobject 
listObject? �B��CD�
� .ascrinit****      � ****B k     EE 
���  �  �  C �� 
0 _list_  D ��� 0 aslist asList� 
0 _list_  � b  b   k+  �� 
0 _list_  
� 
leng
� 
list� � .0 throwinvalidparameter throwInvalidParameter
� 
cobj
� 
nmbr� 0 etext eText@ ���
� 
errn��\�  A ��F
� 
errn� 0 enumber eNumberF ��G
� 
erob� 0 efrom eFromG ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � � ���K S�O��,�,j  b  �����+ 	Y hOkE�O <��,�k/�&E�O +k��,�,Ekh ��,�/�&E�O�� �E�Y h[OY��W X  b  ��/���%�+ 	O�W X  *a ����a + � ���HI�~
� .Mth:RouNnull���     nmbr� 0 num  � �}JK
�} 
PlacJ {�|�{�z�| 0 decimalplaces decimalPlaces�{  �z  K �yL�x
�y 
DireL {�w�v�u�w &0 roundingdirection roundingDirection�v  
�u MRndRNhE�x  H �t�s�r�q�p�o�n�m�t 0 num  �s 0 decimalplaces decimalPlaces�r &0 roundingdirection roundingDirection�q 0 themultiplier theMultiplier�p 0 etext eText�o 0 enumber eNumber�n 0 efrom eFrom�m 
0 eto eToI ��l��k�j�i����h�g�f�e�d�c�b��a�`M�_�^�l "0 asrealparameter asRealParameter�k (0 asintegerparameter asIntegerParameter�j 

�i MRndRNhE
�h MRndRNhT
�g MRndRNhF
�f MRndRN_T
�e MRndRN_F
�d MRndRN_U
�c 
bool
�b MRndRN_D�a >0 throwinvalidconstantparameter throwInvalidConstantParameter�` 0 etext eTextM �]�\N
�] 
errn�\ 0 enumber eNumberN �[�ZO
�[ 
erob�Z 0 efrom eFromO �Y�X�W
�Y 
errt�X 
0 eto eTo�W  �_ �^ 
0 _error  �~��b  ��l+ E�Ob  ��l+ E�O�j �$E�O�� � �!E�Y hO��  3��lv�l!k#kv 
�k"E�Y �j ��k"E�Y 	��k"E�Y��  1��lv�k#kv 
�k"E�Y �j ��k"E�Y 	��k"E�Y ��  C��lv�k#kv �j �k"kE�Y 	�k"kE�Y �j ��k"E�Y 	��k"E�Y ���  
�k"E�Y ���  ,�k#j  
�k"E�Y �j �k"kE�Y 	�k"kE�Y a��  $�j
 	�k#j �& 
�k"E�Y 	�k"kE�Y 9�a   $�j
 	�k#j �& 
�k"E�Y 	�k"kE�Y b  �a l+ O�j  	�k"Y �j 	��"Y ��!W X  *a ����a + � �V0�U�TPQ�S�V 0 _sin  �U �RR�R R  �Q�Q 0 x  �T  P �P�O�N�M�L�K�P 0 x  �O 0 isneg isNeg�N 0 y  �M 0 z  �L 0 z2  �K 0 zz  Q �J�I�H�Gj�F�E����D�������	
�Jh
�I 
pi  �H ��G �F �E 
�D 
bool�S ��#��! E�O�jE�O� 	�'E�Y hO���! k"E�O��� k"� E�O�l#k  �kE�O�kE�Y hO��#E�O�m �E�O��E�Y hO��� �� �� E�O�� E�O�k 
 �l �& *�l!�� � �� �� �� a � a  E�Y +��� a � a � a � a � a � a  E�O� 	�'E�Y hO�� �C!�B�AST�@
�C .Mth:Sin_null���     doub�B 0 x  �A  S �?�>�=�<�;�? 0 x  �> 0 etext eText�= 0 enumber eNumber�< 0 efrom eFrom�; 
0 eto eToT �:�9�8U5�7�6
�: 
nmbr�9 0 _sin  �8 0 etext eTextU �5�4V
�5 
errn�4 0 enumber eNumberV �3�2W
�3 
erob�2 0 efrom eFromW �1�0�/
�1 
errt�0 
0 eto eTo�/  �7 �6 
0 _error  �@  *��&k+ W X  *䡢���+ � �.E�-�,XY�+
�. .Mth:Cos_null���     doub�- 0 x  �,  X �*�)�(�'�&�* 0 x  �) 0 etext eText�( 0 enumber eNumber�' 0 efrom eFrom�& 
0 eto eToY �%�$�#�"Z\�!� 
�% 
nmbr�$ Z�# 0 _sin  �" 0 etext eTextZ ��[
� 
errn� 0 enumber eNumber[ ��\
� 
erob� 0 efrom eFrom\ ���
� 
errt� 
0 eto eTo�  �! �  
0 _error  �+ ! *��&�k+ W X  *塢���+ � �l��]^�
� .Mth:Tan_null���     doub� 0 x  �  ] 
����������� 0 x  � 0 isneg isNeg� 0 y  � 0 z  � 0 z2  � 0 zz  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo^ �
�	���������� ������+,-.����_R����
�
 
nmbr�	 Z�
� 
bool
� 
errn��s
� 
erob� �h
� 
pi  �  ��� �� �� 0 etext eText_ ����`
�� 
errn�� 0 enumber eNumber` ����a
�� 
erob�� 0 efrom eFroma ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � ��&E�O�� 
 �� �& )�����Y hO��#��! E�O�jE�O� 	�'E�Y hO���!!k"E�O��� k"� E�O�l#k  �kE�O�kE�Y hO��� �� �a  E�O�� E�O�a  4��� a � a � a  �a � a � a � a !E�Y �E�O�l 
 	�a  �& 
i�!E�Y hO� 	�'E�Y hO�W X  *a ����a + � ��n����bc���� 	0 _asin  �� ��d�� d  ���� 0 x  ��  b ������������ 0 x  �� 0 isneg isNeg�� 0 zz  �� 0 p  �� 0 z  c ������������������������,-./01IJKLM��
�� 
errn���Y
�� 
erob�� 
�� 
pi  �� ��� ��jE�O� 	�'E�Y hO�k )�����Y hO�� Xk�E�O�� �� �� �� � ��� �� �� �!E�O���$E�O_ �!�E�O�� a E�O��_ �!E�Y ]�a  �E�Y O�� E�O�a � a � a � a � a � a  �a � a � a � a � a !� �E�O� 	�'E�Y hO�_ a !!� ��e����ef��
�� .Mth:Sinanull���     doub�� 0 x  ��  e ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTof ������gy����
�� 
nmbr�� 	0 _asin  �� 0 etext eTextg ����h
�� 
errn�� 0 enumber eNumberh ����i
�� 
erob�� 0 efrom eFromi ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ��  *��&k+ W X  *䡢���+ � �������jk��
�� .Mth:Cosanull���     doub�� 0 x  ��  j ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTok ��������l������ Z
�� 
nmbr�� 	0 _asin  �� 0 etext eTextl ��m
� 
errn� 0 enumber eNumberm ��n
� 
erob� 0 efrom eFromn ���
� 
errt� 
0 eto eTo�  �� � 
0 _error  �� ! �*��&k+ W X  *塢���+ � ����op�
� .Mth:Tananull���     doub� 0 x  �  o ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTop ����q���
� 
nmbr� 	0 _asin  � 0 etext eTextq ��r
� 
errn� 0 enumber eNumberr ��s
� 
erob� 0 efrom eFroms ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � + ��&E�O*��� k�$!k+ W X  *塢���+ � ����tu�
� .Mth:Sinhnull���     doub� 0 x  �  t ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTou ��v��
� 
nmbr� 0 etext eTextv ��w
� 
errn� 0 enumber eNumberw ��x
� 
erob� 0 efrom eFromx ����
� 
errt� 
0 eto eTo��  � � 
0 _error  � / ��&E�O�b  �$b  �'$ W X  *䡢���+ � ��$����yz��
�� .Mth:Coshnull���     doub�� 0 x  ��  y ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToz ��4��{G����
�� 
nmbr�� 0 etext eText{ ����|
�� 
errn�� 0 enumber eNumber| ��~}
� 
erob�~ 0 efrom eFrom} �}�|�{
�} 
errt�| 
0 eto eTo�{  �� �� 
0 _error  �� / ��&E�O�b  �$b  �'$ W X  *䡢���+ � �zW�y�x~�w
�z .Mth:Tanhnull���     doub�y 0 x  �x  ~ �v�u�t�s�r�v 0 x  �u 0 etext eText�t 0 enumber eNumber�s 0 efrom eFrom�r 
0 eto eTo �q�p���o�n
�q 
nmbr�p 0 etext eText� �m�l�
�m 
errn�l 0 enumber eNumber� �k�j�
�k 
erob�j 0 efrom eFrom� �i�h�g
�i 
errt�h 
0 eto eTo�g  �o �n 
0 _error  �w > -��&E�Ob  �$b  �'$b  �$b  �'$!W X  *㡢���+ � �f��e�d���c�f 
0 _frexp  �e �b��b �  �a�a 0 m  �d  � �`�_�^�` 0 m  �_ 0 isneg isNeg�^ 0 e  � ���]
�] 
bool�c o�j  
�jlvY hO�jE�O� 	�'E�Y hOjE�O 3h��	 �k�&�k �l!E�O�kE�Y �l E�O�kE�[OY��O� 	�'E�Y hO��lv� �\��[�Z���Y�\ 	0 _logn  �[ �X��X �  �W�W 0 x  �Z  � �V�U�T�S�V 0 x  �U 0 e  �T 0 z  �S 0 y  � �R�Q�P�O�N�M&7rst�������������� 
�R 
errn�Q�Y�P 
0 _frexp  
�O 
cobj�N��
�M 
bool�Y<�j )��l�Y hO*�k+ E[�k/E�Z[�l/E�ZO��
 �l�& j�� �kE�O��E�O� �E�Y �kE�O� �E�O��!E�O�� E�O�� � �� � ��� �� �!E�O�E�O��� ��a  E�Y ��� �kE�Ol� kE�Y �kE�O�� E�O�� a � a � a � a � a � a  �a � a � a � a � a !E�O�j ��� E�Y hO��l!E�O��E�O�j ��a  E�Y hO�� �L5�K�J���I
�L .Mth:Lognnull���     doub�K 0 x  �J  � �H�G�F�E�D�H 0 x  �G 0 etext eText�F 0 enumber eNumber�E 0 efrom eFrom�D 
0 eto eTo� �C�B�A�I�@�?
�C 
nmbr�B 	0 _logn  �A 0 etext eText� �>�=�
�> 
errn�= 0 enumber eNumber� �<�;�
�< 
erob�; 0 efrom eFrom� �:�9�8
�: 
errt�9 
0 eto eTo�8  �@ �? 
0 _error  �I  *��&k+ W X  *䡢���+ � �7Y�6�5���4
�7 .Mth:Lo10null���     doub�6 0 x  �5  � �3�2�1�0�/�3 0 x  �2 0 etext eText�1 0 enumber eNumber�0 0 efrom eFrom�/ 
0 eto eTo� 
�.�-mno�,�{�+�*
�. 
nmbr�- 	0 _logn  �, 0 etext eText� �)�(�
�) 
errn�( 0 enumber eNumber� �'�&�
�' 
erob�& 0 efrom eFrom� �%�$�#
�% 
errt�$ 
0 eto eTo�#  �+ �* 
0 _error  �4 % *��&k+ �!� �!W X  *硢���+ 	� �"��!� ���
�" .Mth:Logbnull���     doub�! 0 x  �  ���
� 
Base� 0 b  �  � ������� 0 x  � 0 b  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� �������
� 
nmbr� 	0 _logn  � 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���

� 
errt� 
0 eto eTo�
  � � 
0 _error  � ( *��&k+ *��&k+ !W X  *䢣���+ ascr  ��ޭ