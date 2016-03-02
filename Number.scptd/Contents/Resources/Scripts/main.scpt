FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ]W Number -- manipulate numeric values and perform common math functions

Notes:

- The Trigonometry and Logarithm handlers are slightly modified versions of handlers found in ESG MathLib <http://www.esglabs.com/>, which in turn are conversions of functions in the Cephes Mathematical Library by Stephen L. Moshier <http://netlib.org/cephes/>.


TO DO: 

- debug, finalize `parse/format number` behaviors

- should `tan` return `infinity` symbol instead of erroring?

- use identifiers rather than properties in number format record? (other libraries already do this to mimimize namespace pollution)

     � 	 	�   N u m b e r   - -   m a n i p u l a t e   n u m e r i c   v a l u e s   a n d   p e r f o r m   c o m m o n   m a t h   f u n c t i o n s 
 
 N o t e s : 
 
 -   T h e   T r i g o n o m e t r y   a n d   L o g a r i t h m   h a n d l e r s   a r e   s l i g h t l y   m o d i f i e d   v e r s i o n s   o f   h a n d l e r s   f o u n d   i n   E S G   M a t h L i b   < h t t p : / / w w w . e s g l a b s . c o m / > ,   w h i c h   i n   t u r n   a r e   c o n v e r s i o n s   o f   f u n c t i o n s   i n   t h e   C e p h e s   M a t h e m a t i c a l   L i b r a r y   b y   S t e p h e n   L .   M o s h i e r   < h t t p : / / n e t l i b . o r g / c e p h e s / > . 
 
 
 T O   D O :   
 
 -   d e b u g ,   f i n a l i z e   ` p a r s e / f o r m a t   n u m b e r `   b e h a v i o r s 
 
 -   s h o u l d   ` t a n `   r e t u r n   ` i n f i n i t y `   s y m b o l   i n s t e a d   o f   e r r o r i n g ? 
 
 -   u s e   i d e n t i f i e r s   r a t h e r   t h a n   p r o p e r t i e s   i n   n u m b e r   f o r m a t   r e c o r d ?   ( o t h e r   l i b r a r i e s   a l r e a d y   d o   t h i s   t o   m i m i m i z e   n a m e s p a c e   p o l l u t i o n ) 
 
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
�_� e ; 5 the mathematical constant e (natural logarithm base)    f � i i j   t h e   m a t h e m a t i c a l   c o n s t a n t   e   ( n a t u r a l   l o g a r i t h m   b a s e ) c  j k j l     ��������  ��  ��   k  l m l l      n o p n j   % '�� q�� 0 _isequaldelta _isEqualDelta q m   % & r r =q���-� o i c multiplier used by `cmp` to allow for slight differences due to floating point's limited precision    p � s s �   m u l t i p l i e r   u s e d   b y   ` c m p `   t o   a l l o w   f o r   s l i g h t   d i f f e r e n c e s   d u e   t o   f l o a t i n g   p o i n t ' s   l i m i t e d   p r e c i s i o n m  t u t l     ��������  ��  ��   u  v w v l     ��������  ��  ��   w  x y x l     �� z {��   z J D--------------------------------------------------------------------    { � | | � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - y  } ~ } l     ��  ���      parse and format    � � � � "   p a r s e   a n d   f o r m a t ~  � � � l     ��������  ��  ��   �  � � � i  ( + � � � I      �� ����� (0 _asintegerproperty _asIntegerProperty �  � � � o      ���� 0 thevalue theValue �  � � � o      ���� 0 propertyname propertyName �  ��� � o      ���� 0 minvalue minValue��  ��   � l    8 � � � � Q     8 � � � � k    & � �  � � � r     � � � c     � � � o    ���� 0 thevalue theValue � m    ��
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
�� .ascrerr ****      � **** � b   2 7 � � � b   2 5 � � � m   2 3 � � � � � J  n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    � o   3 4���� 0 propertyname propertyName � m   5 6 � � � � � P    p r o p e r t y   i s   n o t   a   n o n - n e g a t i v e   i n t e g e r � �� ���
�� 
errn � m   0 1�����Y��   � . ( TO DO: what about sensible upper bound?    � � � � P   T O   D O :   w h a t   a b o u t   s e n s i b l e   u p p e r   b o u n d ? �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  , / � � � I      �� ����� ,0 _makenumberformatter _makeNumberFormatter �  � � � o      ���� 0 formatstyle formatStyle �  � � � o      ���� 0 
localecode 
localeCode �  ��� � o      ���� 0 defaultstyle defaultStyle��  ��   � l   � � � � � k    � � �  � � � l     � � � � r      � � � n     � � � I    �������� 0 init  ��  ��   � n     � � � I    �������� 	0 alloc  ��  ��   � n     � � � o    ���� &0 nsnumberformatter NSNumberFormatter � m     ��
�� misccura � o      ���� 0 asocformatter asocFormatter �	 (note that while NSFormatter provides a global +setDefaultFormatterBehavior: option to change all NSNumberFormatters to use pre-10.4 behavior, we don't bother to call setFormatterBehavior: as it's very unlikely nowadays that a host process would change this)    � � � �   ( n o t e   t h a t   w h i l e   N S F o r m a t t e r   p r o v i d e s   a   g l o b a l   + s e t D e f a u l t F o r m a t t e r B e h a v i o r :   o p t i o n   t o   c h a n g e   a l l   N S N u m b e r F o r m a t t e r s   t o   u s e   p r e - 1 0 . 4   b e h a v i o r ,   w e   d o n ' t   b o t h e r   t o   c a l l   s e t F o r m a t t e r B e h a v i o r :   a s   i t ' s   v e r y   u n l i k e l y   n o w a d a y s   t h a t   a   h o s t   p r o c e s s   w o u l d   c h a n g e   t h i s ) �  � � � Q   � � � � � Z   j � �� � � =     � � � l    ��~�} � I   �| � �
�| .corecnte****       **** � J     � �  ��{ � o    �z�z 0 formatstyle formatStyle�{   � �y ��x
�y 
kocl � m    �w
�w 
reco�x  �~  �}   � m    �v�v  � k   N � �  � � � r    P � � � n   N � � � I   $ N�u ��t�u 60 asoptionalrecordparameter asOptionalRecordParameter �  � � � o   $ %�s�s 0 formatstyle formatStyle �  � � � K   % G � � �r � �
�r 
pcls � l  & ' ��q�p � m   & '�o
�o 
MthR�q  �p   � �n � �
�n 
MthA � n  ( / � � � o   - /�m�m 0 requiredvalue RequiredValue � o   ( -�l�l 0 _support   � �k � �
�k 
MthB � m   0 1�j
�j 
msng � �i 
�i 
MthC  m   2 3�h
�h 
msng �g
�g 
MthD m   4 5�f
�f 
msng �e
�e 
MthE m   6 7�d
�d 
msng �c
�c 
MthF m   : ;�b
�b 
msng �a	
�a 
MthG m   > ?�`
�` 
msng	 �_
�^
�_ 
MthH
 m   B C�]
�] 
msng�^   � �\ m   G J � 
 u s i n g�\  �t   � o    $�[�[ 0 _support   � o      �Z�Z 0 formatrecord formatRecord �  I   Q [�Y�X�Y "0 _setbasicformat _setBasicFormat  o   R S�W�W 0 asocformatter asocFormatter  n  S V 1   T V�V
�V 
MthA o   S T�U�U 0 formatrecord formatRecord �T o   V W�S�S 0 defaultstyle defaultStyle�T  �X    Z   \ y�R�Q >  \ a n  \ _ 1   ] _�P
�P 
MthB o   \ ]�O�O 0 formatrecord formatRecord m   _ `�N
�N 
msng n  d u !  I   e u�M"�L�M 60 setminimumfractiondigits_ setMinimumFractionDigits_" #�K# I   e q�J$�I�J (0 _asintegerproperty _asIntegerProperty$ %&% n  f i'(' 1   g i�H
�H 
MthB( o   f g�G�G 0 formatrecord formatRecord& )*) m   i l++ �,, , m i n i m u m   d e c i m a l   p l a c e s* -�F- m   l m�E�E  �F  �I  �K  �L  ! o   d e�D�D 0 asocformatter asocFormatter�R  �Q   ./. Z   z �01�C�B0 >  z 232 n  z }454 1   { }�A
�A 
MthC5 o   z {�@�@ 0 formatrecord formatRecord3 m   } ~�?
�? 
msng1 n  � �676 I   � ��>8�=�> 60 setmaximumfractiondigits_ setMaximumFractionDigits_8 9�<9 I   � ��;:�:�; (0 _asintegerproperty _asIntegerProperty: ;<; n  � �=>= 1   � ��9
�9 
MthC> o   � ��8�8 0 formatrecord formatRecord< ?@? m   � �AA �BB , m a x i m u m   d e c i m a l   p l a c e s@ C�7C m   � ��6�6  �7  �:  �<  �=  7 o   � ��5�5 0 asocformatter asocFormatter�C  �B  / DED Z   � �FG�4�3F >  � �HIH n  � �JKJ 1   � ��2
�2 
MthDK o   � ��1�1 0 formatrecord formatRecordI m   � ��0
�0 
msngG k   � �LL MNM n  � �OPO I   � ��/Q�.�/ <0 setminimumsignificantdigits_ setMinimumSignificantDigits_Q R�-R I   � ��,S�+�, (0 _asintegerproperty _asIntegerPropertyS TUT n  � �VWV 1   � ��*
�* 
MthDW o   � ��)�) 0 formatrecord formatRecordU XYX m   � �ZZ �[[ 4 m i n i m u m   s i g n i f i c a n t   d i g i t sY \�(\ m   � ��'�'  �(  �+  �-  �.  P o   � ��&�& 0 asocformatter asocFormatterN ]�%] n  � �^_^ I   � ��$`�#�$ 60 setusessignificantdigits_ setUsesSignificantDigits_` a�"a m   � ��!
�! boovtrue�"  �#  _ o   � �� �  0 asocformatter asocFormatter�%  �4  �3  E bcb Z   � �de��d >  � �fgf n  � �hih 1   � ��
� 
MthEi o   � ��� 0 formatrecord formatRecordg m   � ��
� 
msnge k   � �jj klk n  � �mnm I   � ��o�� <0 setmaximumsignificantdigits_ setMaximumSignificantDigits_o p�p I   � ��q�� (0 _asintegerproperty _asIntegerPropertyq rsr n  � �tut 1   � ��
� 
MthEu o   � ��� 0 formatrecord formatRecords vwv m   � �xx �yy 4 m a x i m u m   s i g n i f i c a n t   d i g i t sw z�z m   � ���  �  �  �  �  n o   � ��� 0 asocformatter asocFormatterl {�{ n  � �|}| I   � ��~�� 60 setusessignificantdigits_ setUsesSignificantDigits_~ � m   � ��
� boovtrue�  �  } o   � ��� 0 asocformatter asocFormatter�  �  �  c ��� Z   �2���
�	� >  � ���� n  � ���� 1   � ��
� 
MthF� o   � ��� 0 formatrecord formatRecord� m   � ��
� 
msng� Q   �.���� k   ��� ��� r   � ���� c   � ���� n  � ���� 1   � ��
� 
MthF� o   � ��� 0 formatrecord formatRecord� m   � ��
� 
ctxt� o      �� 0 s  � ��� Z  ����� � =   ���� n  � ��� 1   � ��
�� 
leng� o   � ����� 0 s  � m   ����  � R  �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� m  	�����Y��  �  �   � ���� n ��� I  ������� ,0 setdecimalseparator_ setDecimalSeparator_� ���� o  ���� 0 s  ��  ��  � o  ���� 0 asocformatter asocFormatter��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � R  ".����
�� .ascrerr ****      � ****� m  *-�� ��� �  n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    d e c i m a l   s e p a r a t o r    p r o p e r t y   i s   n o t   n o n - e m p t y   t e x t� �����
�� 
errn� m  &)�����Y��  �
  �	  � ��� Z  3�������� > 3:��� n 38��� 1  48��
�� 
MthG� o  34���� 0 formatrecord formatRecord� m  89��
�� 
msng� Q  =����� k  @l�� ��� r  @K��� c  @I��� n @E��� 1  AE��
�� 
MthG� o  @A���� 0 formatrecord formatRecord� m  EH��
�� 
ctxt� o      ���� 0 s  � ���� Z  Ll������ =  LS��� n LQ��� 1  MQ��
�� 
leng� o  LM���� 0 s  � m  QR����  � n V\��� I  W\������� 60 setusesgroupingseparator_ setUsesGroupingSeparator_� ���� m  WX��
�� boovfals��  ��  � o  VW���� 0 asocformatter asocFormatter��  � k  _l�� ��� n _e��� I  `e������� 60 setusesgroupingseparator_ setUsesGroupingSeparator_� ���� m  `a��
�� boovtrue��  ��  � o  _`���� 0 asocformatter asocFormatter� ���� n fl��� I  gl������� .0 setgroupingseparator_ setGroupingSeparator_� ���� o  gh���� 0 s  ��  ��  � o  fg���� 0 asocformatter asocFormatter��  ��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � R  t�����
�� .ascrerr ****      � ****� m  |�� ��� �  n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    g r o u p i n g   s e p a r a t o r    p r o p e r t y   i s   n o t   t e x t� �����
�� 
errn� m  x{�����Y��  ��  ��  � ���� Z  �N������� > ����� n ����� 1  ����
�� 
MthH� o  ������ 0 formatrecord formatRecord� m  ����
�� 
msng� Z  �J����� = ����� n ����� 1  ����
�� 
MthH� o  ������ 0 formatrecord formatRecord� l �������� m  ����
�� MRndRNhE��  ��  � n ����� I  ��������� $0 setroundingmode_ setRoundingMode_� ���� l �������� n ����� o  ������ @0 nsnumberformatterroundhalfeven NSNumberFormatterRoundHalfEven� m  ����
�� misccura��  ��  ��  ��  � o  ������ 0 asocformatter asocFormatter� ��� = ����� n ����� 1  ����
�� 
MthH� o  ������ 0 formatrecord formatRecord� l �������� m  ����
�� MRndRNhT��  ��  � ��� n ��� � I  �������� $0 setroundingmode_ setRoundingMode_ �� l ������ n �� o  ������ @0 nsnumberformatterroundhalfdown NSNumberFormatterRoundHalfDown m  ����
�� misccura��  ��  ��  ��    o  ������ 0 asocformatter asocFormatter�  = ��	 n ��

 1  ����
�� 
MthH o  ������ 0 formatrecord formatRecord	 l ������ m  ����
�� MRndRNhF��  ��    n �� I  �������� $0 setroundingmode_ setRoundingMode_ �� l ������ n �� o  ������ <0 nsnumberformatterroundhalfup NSNumberFormatterRoundHalfUp m  ����
�� misccura��  ��  ��  ��   o  ������ 0 asocformatter asocFormatter  = �� n �� 1  ����
�� 
MthH o  ������ 0 formatrecord formatRecord l ������ m  ����
�� MRndRN_T��  ��    n ��  I  ����!���� $0 setroundingmode_ setRoundingMode_! "��" l ��#����# n ��$%$ o  ������ 80 nsnumberformatterrounddown NSNumberFormatterRoundDown% m  ����
�� misccura��  ��  ��  ��    o  ������ 0 asocformatter asocFormatter &'& = ��()( n ��*+* 1  ����
�� 
MthH+ o  ������ 0 formatrecord formatRecord) l ��,����, m  ����
�� MRndRN_F��  ��  ' -.- n �	/0/ I   	��1���� $0 setroundingmode_ setRoundingMode_1 2��2 l  3��~3 n  454 o  �}�} 40 nsnumberformatterroundup NSNumberFormatterRoundUp5 m   �|
�| misccura�  �~  ��  ��  0 o  � �{�{ 0 asocformatter asocFormatter. 676 = 898 n :;: 1  �z
�z 
MthH; o  �y�y 0 formatrecord formatRecord9 l <�x�w< m  �v
�v MRndRN_U�x  �w  7 =>= n "?@? I  "�uA�t�u $0 setroundingmode_ setRoundingMode_A B�sB l C�r�qC n DED o  �p�p >0 nsnumberformatterroundceiling NSNumberFormatterRoundCeilingE m  �o
�o misccura�r  �q  �s  �t  @ o  �n�n 0 asocformatter asocFormatter> FGF = %.HIH n %*JKJ 1  &*�m
�m 
MthHK o  %&�l�l 0 formatrecord formatRecordI l *-L�k�jL m  *-�i
�i MRndRN_D�k  �j  G M�hM n 1;NON I  2;�gP�f�g $0 setroundingmode_ setRoundingMode_P Q�eQ l 27R�d�cR n 27STS o  37�b�b :0 nsnumberformatterroundfloor NSNumberFormatterRoundFloorT m  23�a
�a misccura�d  �c  �e  �f  O o  12�`�` 0 asocformatter asocFormatter�h  � R  >J�_UV
�_ .ascrerr ****      � ****U m  FIWW �XX �  n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d  s    r o u n d i n g   b e h a v i o r    i s   n o t   a n   a l l o w e d   c o n s t a n tV �^Y�]
�^ 
errnY m  BE�\�\�Y�]  ��  ��  ��  �   � Q  QjZ[\Z I  T\�[]�Z�[ "0 _setbasicformat _setBasicFormat] ^_^ o  UV�Y�Y 0 asocformatter asocFormatter_ `a` o  VW�X�X 0 formatstyle formatStylea b�Wb o  WX�V�V 0 defaultstyle defaultStyle�W  �Z  [ R      �U�Tc
�U .ascrerr ****      � ****�T  c �Sd�R
�S 
errnd d      ee m      �Q�Q��R  \ R  dj�Pf�O
�P .ascrerr ****      � ****f m  figg �hh | n o t   a    n u m b e r   f o r m a t   d e f i n i t i o n    r e c o r d   o r   a n   a l l o w e d   c o n s t a n t�O   � R      �Nij
�N .ascrerr ****      � ****i o      �M�M 0 etext eTextj �Lk�K
�L 
errnk d      ll m      �J�J��K   � n r�mnm I  w��Io�H�I .0 throwinvalidparameter throwInvalidParametero pqp o  wx�G�G 0 formatstyle formatStyleq rsr m  x{tt �uu 
 u s i n gs vwv J  {�xx yzy m  {|�F
�F 
recoz {�E{ m  |�D
�D 
enum�E  w |�C| o  ���B�B 0 etext eText�C  �H  n o  rw�A�A 0 _support   � }~} n ��� I  ���@��?�@ 0 
setlocale_ 
setLocale_� ��>� l ����=�<� n ����� I  ���;��:�; *0 asnslocaleparameter asNSLocaleParameter� ��� o  ���9�9 0 
localecode 
localeCode� ��8� m  ���� ���  f o r   l o c a l e�8  �:  � o  ���7�7 0 _support  �=  �<  �>  �?  � o  ���6�6 0 asocformatter asocFormatter~ ��5� L  ���� o  ���4�4 0 asocformatter asocFormatter�5   � o i note: this doesn't handle `default format` option as the appropriate default may vary according to usage    � ��� �   n o t e :   t h i s   d o e s n ' t   h a n d l e   ` d e f a u l t   f o r m a t `   o p t i o n   a s   t h e   a p p r o p r i a t e   d e f a u l t   m a y   v a r y   a c c o r d i n g   t o   u s a g e � ��� l     �3�2�1�3  �2  �1  � ��� l     �0�/�.�0  �/  �.  � ��� i  0 3��� I      �-��,�- "0 _setbasicformat _setBasicFormat� ��� o      �+�+ 0 asocformatter asocFormatter� ��� o      �*�* 0 
formatname 
formatName� ��)� o      �(�( 0 defaultstyle defaultStyle�)  �,  � Z     ������ =    ��� o     �'�' 0 
formatname 
formatName� m    �&
�& MthZMth0� n   ��� I    �%��$�% "0 setnumberstyle_ setNumberStyle_� ��#� o    �"�" 0 defaultstyle defaultStyle�#  �$  � o    �!�! 0 asocformatter asocFormatter� ��� =   ��� o    � �  0 
formatname 
formatName� m    �
� MthZMth3� ��� l   ���� n   ��� I    ���� "0 setnumberstyle_ setNumberStyle_� ��� l   ���� n   ��� o    �� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� m    �
� misccura�  �  �  �  � o    �� 0 asocformatter asocFormatter�   uses exponent notation   � ��� .   u s e s   e x p o n e n t   n o t a t i o n� ��� =    #��� o     !�� 0 
formatname 
formatName� m   ! "�
� MthZMth1� ��� l  & .���� n  & .��� I   ' .���� "0 setnumberstyle_ setNumberStyle_� ��� l  ' *���� n  ' *��� o   ( *�� 40 nsnumberformatternostyle NSNumberFormatterNoStyle� m   ' (�
� misccura�  �  �  �  � o   & '�� 0 asocformatter asocFormatter� "  uses plain integer notation   � ��� 8   u s e s   p l a i n   i n t e g e r   n o t a t i o n� ��� =  1 4��� o   1 2�� 0 
formatname 
formatName� m   2 3�
� MthZMth2� ��� l  7 ?���� n  7 ?��� I   8 ?�
��	�
 "0 setnumberstyle_ setNumberStyle_� ��� l  8 ;���� n  8 ;��� o   9 ;�� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle� m   8 9�
� misccura�  �  �  �	  � o   7 8�� 0 asocformatter asocFormatter� - ' uses thousands separators, no exponent   � ��� N   u s e s   t h o u s a n d s   s e p a r a t o r s ,   n o   e x p o n e n t� ��� =  B E��� o   B C�� 0 
formatname 
formatName� m   C D�
� MthZMth5� ��� l  H P���� n  H P��� I   I P� ����  "0 setnumberstyle_ setNumberStyle_� ���� l  I L������ n  I L��� o   J L���� @0 nsnumberformattercurrencystyle NSNumberFormatterCurrencyStyle� m   I J��
�� misccura��  ��  ��  ��  � o   H I���� 0 asocformatter asocFormatter�   adds currency symbol   � ��� *   a d d s   c u r r e n c y   s y m b o l� ��� =  S V��� o   S T���� 0 
formatname 
formatName� m   T U��
�� MthZMth4� ��� l  Y a���� n  Y a��� I   Z a������� "0 setnumberstyle_ setNumberStyle_� ���� l  Z ]������ n  Z ]��� o   [ ]���� >0 nsnumberformatterpercentstyle NSNumberFormatterPercentStyle� m   Z [��
�� misccura��  ��  ��  ��  � o   Y Z���� 0 asocformatter asocFormatter� ( " multiplies by 100 and appends '%'   � ��� D   m u l t i p l i e s   b y   1 0 0   a n d   a p p e n d s   ' % '� ��� =  d g��� o   d e���� 0 
formatname 
formatName� m   e f��
�� MthZMth6�    l  j r n  j r I   k r������ "0 setnumberstyle_ setNumberStyle_ �� l  k n	����	 n  k n

 o   l n���� @0 nsnumberformatterspelloutstyle NSNumberFormatterSpellOutStyle m   k l��
�� misccura��  ��  ��  ��   o   j k���� 0 asocformatter asocFormatter   uses words    �    u s e s   w o r d s  >   u � l  u ����� I  u ���
�� .corecnte****       **** J   u x �� o   u v���� 0 
formatname 
formatName��   ����
�� 
kocl m   y |��
�� 
ctxt��  ��  ��   m   � �����   �� n  � � I   � ������� 0 
setformat_ 
setFormat_ �� o   � ����� 0 
formatname 
formatName��  ��   o   � ����� 0 asocformatter asocFormatter��  � R   � ���
�� .ascrerr ****      � **** m   � � � p i n v a l i d    b a s i c   f o r m a t    p r o p e r t y :   n o t   a n   a l l o w e d   c o n s t a n t �� !
�� 
errn  m   � ������Y! ��"#
�� 
erob" o   � ����� 0 
formatname 
formatName# ��$��
�� 
errt$ m   � ���
�� 
enum��  � %&% l     ��������  ��  ��  & '(' l     ��������  ��  ��  ( )*) i  4 7+,+ I      ��-����  0 _nameforformat _nameForFormat- .��. o      ���� 0 formatstyle formatStyle��  ��  , l    H/01/ Z     H23452 =    676 o     ���� 0 formatstyle formatStyle7 m    ��
�� MthZMth13 L    88 m    99 �::  i n t e g e r4 ;<; =   =>= o    ���� 0 formatstyle formatStyle> m    ��
�� MthZMth2< ?@? L    AA m    BB �CC  d e c i m a l@ DED =   FGF o    ���� 0 formatstyle formatStyleG m    ��
�� MthZMth5E HIH L    JJ m    KK �LL  c u r r e n c yI MNM =  ! $OPO o   ! "���� 0 formatstyle formatStyleP m   " #��
�� MthZMth4N QRQ L   ' )SS m   ' (TT �UU  p e r c e n tR VWV =  , /XYX o   , -���� 0 formatstyle formatStyleY m   - .��
�� MthZMth3W Z[Z L   2 4\\ m   2 3]] �^^  s c i e n t i f i c[ _`_ =  7 :aba o   7 8���� 0 formatstyle formatStyleb m   8 9��
�� MthZMth6` c��c L   = ?dd m   = >ee �ff  w o r d��  5 L   B Hgg b   B Ghih b   B Ejkj m   B Cll �mm  k o   C D���� 0 formatstyle formatStylei m   E Fnn �oo  0 G A used for error reporting; formatStyle is either constant or text   1 �pp �   u s e d   f o r   e r r o r   r e p o r t i n g ;   f o r m a t S t y l e   i s   e i t h e r   c o n s t a n t   o r   t e x t* qrq l     ��������  ��  ��  r sts l     ��������  ��  ��  t uvu l     ��wx��  w  -----   x �yy 
 - - - - -v z{z l     ��������  ��  ��  { |}| i  8 ;~~ I     ����
�� .Mth:FNumnull���     nmbr� o      ���� 0 	thenumber 	theNumber� ����
�� 
Usin� |����������  ��  � o      ���� 0 formatstyle formatStyle��  � l     ������ m      ��
�� MthZMth0��  ��  � �����
�� 
Loca� |����������  ��  � o      ���� 0 
localecode 
localeCode��  � l     ������ m      �� ���  n o n e��  ��  ��   Q     ����� k    ��� ��� l   "���� Z   "������� =    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ���� 0 	thenumber 	theNumber��  � �����
�� 
kocl� m    ��
�� 
nmbr��  ��  ��  � m    ����  � n   ��� I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 	thenumber 	theNumber� ��� m    �� ���  � ��� m    ��
�� 
nmbr� ���� m    �� ���  n u m b e r��  ��  � o    ���� 0 _support  ��  ��  � � � only accept integer or real types (i.e. allowing a text parameter to be coerced to number would defeat the purpose of these handlers, which is to avoid unintended localization behavior)   � ���t   o n l y   a c c e p t   i n t e g e r   o r   r e a l   t y p e s   ( i . e .   a l l o w i n g   a   t e x t   p a r a m e t e r   t o   b e   c o e r c e d   t o   n u m b e r   w o u l d   d e f e a t   t h e   p u r p o s e   o f   t h e s e   h a n d l e r s ,   w h i c h   i s   t o   a v o i d   u n i n t e n d e d   l o c a l i z a t i o n   b e h a v i o r )� ��� Z   # r������ =  # &��� o   # $���� 0 formatstyle formatStyle� m   $ %��
�� MthZMth0� l  ) j���� Z   ) j����� =  ) .��� n  ) ,��� m   * ,��
�� 
pcls� o   ) *���� 0 	thenumber 	theNumber� m   , -��
�� 
long� r   1 6��� n  1 4��� o   2 4���� 40 nsnumberformatternostyle NSNumberFormatterNoStyle� m   1 2��
�� misccura� o      ���� 0 defaultstyle defaultStyle� ��� G   9 V��� l  9 D���~� F   9 D��� A   9 <��� m   9 :�� ��j     � o   : ;�}�} 0 	thenumber 	theNumber� A   ? B��� o   ? @�|�| 0 	thenumber 	theNumber� m   @ A�� �6��C-�  �~  � l  G T��{�z� F   G T��� A   G J��� m   G H�� ?6��C-� o   H I�y�y 0 	thenumber 	theNumber� A   M R��� o   M N�x�x 0 	thenumber 	theNumber� m   N Q�� @�j     �{  �z  � ��w� r   Y `��� n  Y ^��� o   Z ^�v�v >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle� m   Y Z�u
�u misccura� o      �t�t 0 defaultstyle defaultStyle�w  � r   c j��� n  c h��� o   d h�s�s D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� m   c d�r
�r misccura� o      �q�q 0 defaultstyle defaultStyle� 4 . use AS-style formatting of integers and reals   � ��� \   u s e   A S - s t y l e   f o r m a t t i n g   o f   i n t e g e r s   a n d   r e a l s��  � r   m r��� m   m p�p
�p 
msng� o      �o�o 0 defaultstyle defaultStyle� ��� r   s }��� I   s {�n��m�n ,0 _makenumberformatter _makeNumberFormatter� ��� o   t u�l�l 0 formatstyle formatStyle� ��� o   u v�k�k 0 
localecode 
localeCode� ��j� o   v w�i�i 0 defaultstyle defaultStyle�j  �m  � o      �h�h 0 asocformatter asocFormatter� ��� r   ~ ���� n  ~ ���� I    ��g��f�g &0 stringfromnumber_ stringFromNumber_� ��e� o    ��d�d 0 	thenumber 	theNumber�e  �f  � o   ~ �c�c 0 asocformatter asocFormatter� o      �b�b 0 
asocstring 
asocString� ��� l  � ����� Z  � ����a�`� =  � �   o   � ��_�_ 0 
asocstring 
asocString m   � ��^
�^ 
msng� R   � ��]
�] .ascrerr ****      � **** m   � � � F I n v a l i d   n u m b e r   ( c o n v e r s i o n   f a i l e d ) . �\
�\ 
errn m   � ��[�[�Y �Z�Y
�Z 
erob o   � ��X�X 0 	thenumber 	theNumber�Y  �a  �`  � n h shouldn't fail, but -stringFromNumber:'s return type isn't declared as non-nullable so check to be sure   � �		 �   s h o u l d n ' t   f a i l ,   b u t   - s t r i n g F r o m N u m b e r : ' s   r e t u r n   t y p e   i s n ' t   d e c l a r e d   a s   n o n - n u l l a b l e   s o   c h e c k   t o   b e   s u r e� 
�W
 L   � � c   � � o   � ��V�V 0 
asocstring 
asocString m   � ��U
�U 
ctxt�W  � R      �T
�T .ascrerr ****      � **** o      �S�S 0 etext eText �R
�R 
errn o      �Q�Q 0 enumber eNumber �P
�P 
erob o      �O�O 0 efrom eFrom �N�M
�N 
errt o      �L�L 
0 eto eTo�M  � I   � ��K�J�K 
0 _error    m   � � �  f o r m a t   n u m b e r  o   � ��I�I 0 etext eText  o   � ��H�H 0 enumber eNumber  o   � ��G�G 0 efrom eFrom  �F  o   � ��E�E 
0 eto eTo�F  �J  } !"! l     �D�C�B�D  �C  �B  " #$# l     �A�@�?�A  �@  �?  $ %&% i  < ?'(' I     �>)*
�> .Mth:PNumnull���     ctxt) o      �=�= 0 thetext theText* �<+,
�< 
Usin+ |�;�:-�9.�;  �:  - o      �8�8 0 formatstyle formatStyle�9  . l     /�7�6/ m      �5
�5 MthZMth0�7  �6  , �40�3
�4 
Loca0 |�2�11�02�2  �1  1 o      �/�/ 0 
localecode 
localeCode�0  2 l     3�.�-3 m      44 �55  n o n e�.  �-  �3  ( Q     �6786 k    �99 :;: l   "<=>< Z   "?@�,�+? =    ABA l   C�*�)C I   �(DE
�( .corecnte****       ****D J    FF G�'G o    �&�& 0 thetext theText�'  E �%H�$
�% 
koclH m    �#
�# 
ctxt�$  �*  �)  B m    �"�"  @ n   IJI I    �!K� �! 60 throwinvalidparametertype throwInvalidParameterTypeK LML o    �� 0 thetext theTextM NON m    PP �QQ  O RSR m    �
� 
ctxtS T�T m    UU �VV  t e x t�  �   J o    �� 0 _support  �,  �+  = 1 + only accept text, for same reason as above   > �WW V   o n l y   a c c e p t   t e x t ,   f o r   s a m e   r e a s o n   a s   a b o v e; XYX r   # /Z[Z I   # -�\�� ,0 _makenumberformatter _makeNumberFormatter\ ]^] o   $ %�� 0 formatstyle formatStyle^ _`_ o   % &�� 0 
localecode 
localeCode` a�a n  & )bcb o   ' )�� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStylec m   & '�
� misccura�  �  [ o      �� 0 asocformatter asocFormatterY ded r   0 8fgf n  0 6hih I   1 6�j�� &0 numberfromstring_ numberFromString_j k�k o   1 2�� 0 thetext theText�  �  i o   0 1�� 0 asocformatter asocFormatterg o      �� 0 
asocnumber 
asocNumbere lml Z   9 �no��n =  9 <pqp o   9 :�� 0 
asocnumber 
asocNumberq m   : ;�

�
 
msngo k   ? �rr sts r   ? Luvu c   ? Jwxw n  ? Hyzy I   D H�	���	 $0 localeidentifier localeIdentifier�  �  z n  ? D{|{ I   @ D���� 
0 locale  �  �  | o   ? @�� 0 asocformatter asocFormatterx m   H I�
� 
ctxtv o      �� $0 localeidentifier localeIdentifiert }~} Z   M f�� � =   M R��� n  M P��� 1   N P��
�� 
leng� o   M N���� $0 localeidentifier localeIdentifier� m   P Q����  � l  U X���� r   U X��� m   U V�� ���  n o� o      ���� $0 localeidentifier localeIdentifier� #  empty string = system locale   � ��� :   e m p t y   s t r i n g   =   s y s t e m   l o c a l e�   � r   [ f��� b   [ d��� b   [ `��� m   [ ^�� ��� 
 t h e   � o   ^ _���� $0 localeidentifier localeIdentifier� m   ` c�� ���  � o      ���� $0 localeidentifier localeIdentifier~ ���� R   g �����
�� .ascrerr ****      � ****� l  s ������� b   s ���� b   s ���� b   s ���� b   s }��� m   s v�� ��� R I n v a l i d   t e x t   ( e x p e c t e d   n u m e r i c a l   t e x t   i n  � I   v |�������  0 _nameforformat _nameForFormat� ���� o   w x���� 0 formatstyle formatStyle��  ��  � m   } ��� ���    f o r m a t   f o r  � o   � ����� $0 localeidentifier localeIdentifier� m   � ��� ���    l o c a l e ) .��  ��  � ����
�� 
errn� m   k n�����Y� �����
�� 
erob� o   q r���� 0 thetext theText��  ��  �  �  m ���� L   � ��� c   � ���� o   � ����� 0 
asocnumber 
asocNumber� m   � ���
�� 
****��  7 R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  8 I   � �������� 
0 _error  � ��� m   � ��� ���  p a r s e   n u m b e r� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  & ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  � $  Hexadecimal number conversion   � ��� <   H e x a d e c i m a l   n u m b e r   c o n v e r s i o n� ��� l     ��������  ��  ��  � ��� i  @ C��� I     ����
�� .Mth:NuHenull���     ****� o      ���� 0 	thenumber 	theNumber� ����
�� 
Plac� |����������  ��  � o      ���� 0 	chunksize 	chunkSize��  � l     ������ m      ����  ��  ��  � �����
�� 
Pref� |����������  ��  � o      ���� 0 	hasprefix 	hasPrefix��  � l     ������ m      ��
�� boovfals��  ��  ��  � Q    ����� k   ��� ��� r    ��� n   ��� I    ������� (0 asintegerparameter asIntegerParameter� ��� o    	���� 0 	chunksize 	chunkSize� ���� m   	 
�� ��� 
 w i d t h��  ��  � o    ���� 0 _support  � o      ���� 0 	chunksize 	chunkSize� ��� l   ���� r    ��� n   ��� I    ������� (0 asbooleanparameter asBooleanParameter� � � o    ���� 0 	hasprefix 	hasPrefix  �� m     �  p r e f i x��  ��  � o    ���� 0 _support  � o      ���� 0 	hasprefix 	hasPrefix� � � (users shouldn't concatenate their own prefix as that would result in negative numbers appearing as "0x-N�" instead of "-0xN�")   � �    ( u s e r s   s h o u l d n ' t   c o n c a t e n a t e   t h e i r   o w n   p r e f i x   a s   t h a t   w o u l d   r e s u l t   i n   n e g a t i v e   n u m b e r s   a p p e a r i n g   a s   " 0 x - N & "   i n s t e a d   o f   " - 0 x N & " )� �� Z   ��� =    *	
	 l   (���� I   (��
�� .corecnte****       **** J    " �� o     ���� 0 	thenumber 	theNumber��   ����
�� 
kocl m   # $��
�� 
list��  ��  ��  
 m   ( )����   l  -E k   -E  l  - : r   - : n  - 8 I   2 8������ 00 aswholenumberparameter asWholeNumberParameter   o   2 3���� 0 	thenumber 	theNumber  !��! m   3 4"" �##  ��  ��   o   - 2���� 0 _support   o      ���� 0 	thenumber 	theNumber ^ X numbers greater than 2^30 (max integer size) are okay as long as they're non-fractional    �$$ �   n u m b e r s   g r e a t e r   t h a n   2 ^ 3 0   ( m a x   i n t e g e r   s i z e )   a r e   o k a y   a s   l o n g   a s   t h e y ' r e   n o n - f r a c t i o n a l %&% l  ; ;��'(��  ' � � note that the 1024 max chunk size is somewhat arbitrary (the largest representable number requires ~309 chars; anything more will always be left-hand padding), but prevents completely silly values   ( �))�   n o t e   t h a t   t h e   1 0 2 4   m a x   c h u n k   s i z e   i s   s o m e w h a t   a r b i t r a r y   ( t h e   l a r g e s t   r e p r e s e n t a b l e   n u m b e r   r e q u i r e s   ~ 3 0 9   c h a r s ;   a n y t h i n g   m o r e   w i l l   a l w a y s   b e   l e f t - h a n d   p a d d i n g ) ,   b u t   p r e v e n t s   c o m p l e t e l y   s i l l y   v a l u e s& *+* Z  ; Z,-����, G   ; F./. A   ; >010 o   ; <���� 0 	chunksize 	chunkSize1 m   < =����  / ?   A D232 o   A B���� 0 	chunksize 	chunkSize3 m   B C���� - n  I V454 I   N V��6���� .0 throwinvalidparameter throwInvalidParameter6 787 o   N O���� 0 	chunksize 	chunkSize8 9:9 m   O P;; �<< 
 w i d t h: =>= m   P Q��
�� 
long> ?��? m   Q R@@ �AA  m u s t   b e   0  1 0 2 4��  ��  5 o   I N���� 0 _support  ��  ��  + BCB r   [ `DED m   [ ^FF �GG  E o      ���� 0 hextext hexTextC HIH Z   a �JK��LJ A   a dMNM o   a b���� 0 	thenumber 	theNumberN m   b c����  K k   g �OO PQP Z  g �RS����R F   g vTUT ?   g jVWV o   g h���� 0 	chunksize 	chunkSizeW m   h i����  U l  m tX����X A   m tYZY o   m n���� 0 	thenumber 	theNumberZ a   n s[\[ m   n q������\ o   q r���� 0 	chunksize 	chunkSize��  ��  S n  y �]^] I   ~ ���_���� .0 throwinvalidparameter throwInvalidParameter_ `a` o   ~ ���� 0 	thenumber 	theNumbera bcb m    �dd �ee  c fgf m   � ���
�� 
longg h�h b   � �iji b   � �klk b   � �mnm m   � �oo �pp X s p e c i f i e d   w i d t h   o n l y   a l l o w s   n u m b e r s   b e t w e e n  n l  � �q�~�}q a   � �rsr m   � ��|�|��s o   � ��{�{ 0 	chunksize 	chunkSize�~  �}  l m   � �tt �uu 
   a n d  j l  � �v�z�yv \   � �wxw a   � �yzy m   � ��x�x z o   � ��w�w 0 	chunksize 	chunkSizex m   � ��v�v �z  �y  �  ��  ^ o   y ~�u�u 0 _support  ��  ��  Q {|{ r   � �}~} m   � � ���  -~ o      �t�t 0 	hexprefix 	hexPrefix| ��s� r   � ���� d   � ��� o   � ��r�r 0 	thenumber 	theNumber� o      �q�q 0 	thenumber 	theNumber�s  ��  L k   � ��� ��� r   � ���� m   � ��� ���  � o      �p�p 0 	hexprefix 	hexPrefix� ��o� Z  � ����n�m� F   � ���� ?   � ���� o   � ��l�l 0 	chunksize 	chunkSize� m   � ��k�k  � l  � ���j�i� ?   � ���� o   � ��h�h 0 	thenumber 	theNumber� \   � ���� a   � ���� m   � ��g�g � o   � ��f�f 0 	chunksize 	chunkSize� m   � ��e�e �j  �i  � n  � ���� I   � ��d��c�d .0 throwinvalidparameter throwInvalidParameter� ��� o   � ��b�b 0 	thenumber 	theNumber� ��� m   � ��� ���  � ��� m   � ��a
�a 
long� ��`� b   � ���� b   � ���� b   � ���� m   � ��� ��� X s p e c i f i e d   w i d t h   o n l y   a l l o w s   n u m b e r s   b e t w e e n  � l  � ���_�^� a   � ���� m   � ��]�]��� o   � ��\�\ 0 	chunksize 	chunkSize�_  �^  � m   � ��� ��� 
   a n d  � l  � ���[�Z� \   � ���� a   � ���� m   � ��Y�Y � o   � ��X�X 0 	chunksize 	chunkSize� m   � ��W�W �[  �Z  �`  �c  � o   � ��V�V 0 _support  �n  �m  �o  I ��� Z  � ����U�T� o   � ��S�S 0 	hasprefix 	hasPrefix� r   � ���� b   � ���� o   � ��R�R 0 	hexprefix 	hexPrefix� m   � ��� ���  0 x� o      �Q�Q 0 	hexprefix 	hexPrefix�U  �T  � ��� V   '��� k  "�� ��� r  ��� b  ��� l ��P�O� n  ��� 4  �N�
�N 
cobj� l ��M�L� [  ��� `  ��� o  �K�K 0 	thenumber 	theNumber� m  �J�J � m  �I�I �M  �L  � m  �� ���   0 1 2 3 4 5 6 7 8 9 A B C D E F�P  �O  � o  �H�H 0 hextext hexText� o      �G�G 0 hextext hexText� ��F� r  "��� _   ��� o  �E�E 0 	thenumber 	theNumber� m  �D�D � o      �C�C 0 	thenumber 	theNumber�F  � ?  ��� o  �B�B 0 	thenumber 	theNumber� m  �A�A  � ��� V  (@��� r  4;��� b  49��� m  47�� ���  0� o  78�@�@ 0 hextext hexText� o      �?�? 0 hextext hexText� A  ,3��� n  ,1��� 1  -1�>
�> 
leng� o  ,-�=�= 0 hextext hexText� o  12�<�< 0 	chunksize 	chunkSize� ��;� L  AE�� b  AD��� o  AB�:�: 0 	hexprefix 	hexPrefix� o  BC�9�9 0 hextext hexText�;     format single number    ��� *   f o r m a t   s i n g l e   n u m b e r��   l H����� k  H��� ��� l Hk���� Z Hk���8�7� G  HS��� A  HK� � o  HI�6�6 0 	chunksize 	chunkSize  m  IJ�5�5 � ?  NQ o  NO�4�4 0 	chunksize 	chunkSize m  OP�3�3 � n Vg I  [g�2�1�2 .0 throwinvalidparameter throwInvalidParameter  o  [\�0�0 0 	chunksize 	chunkSize 	 m  \_

 � 
 w i d t h	  m  _`�/
�/ 
long �. m  `c �  m u s t   b e   1  1 0 2 4�.  �1   o  V[�-�- 0 _support  �8  �7  �   chunksize must be given   � � 0   c h u n k s i z e   m u s t   b e   g i v e n�  r  l� J  lx  m  lo �   �, \  ov a  ot m  or�+�+  o  rs�*�* 0 	chunksize 	chunkSize m  tu�)�) �,   J         !"! o      �(�( 0 padtext padText" #�'# o      �&�& 0 maxsize maxSize�'   $%$ U  ��&'& r  ��()( b  ��*+* o  ���%�% 0 padtext padText+ m  ��,, �--  0) o      �$�$ 0 padtext padText' o  ���#�# 0 	chunksize 	chunkSize% ./. h  ���"0�" 0 
resultlist 
resultList0 j     	�!1�! 
0 _list_  1 n    232 2   � 
�  
cobj3 o     �� 0 	thenumber 	theNumber/ 454 X  ��6�76 k  �{88 9:9 Q  �6;<=; k  ��>> ?@? r  ��ABA c  ��CDC n ��EFE 1  ���
� 
pcntF o  ���� 0 aref aRefD m  ���
� 
longB o      �� 0 	thenumber 	theNumber@ G�G Z ��HI��H G  ��JKJ G  ��LML >  ��NON o  ���� 0 	thenumber 	theNumberO c  ��PQP n ��RSR 1  ���
� 
pcntS o  ���� 0 aref aRefQ m  ���
� 
doubM A  ��TUT o  ���� 0 	thenumber 	theNumberU m  ����  K ?  ��VWV o  ���� 0 	thenumber 	theNumberW o  ���� 0 maxsize maxSizeI R  ����X
� .ascrerr ****      � ****�  X �Y�
� 
errnY m  ���
�
�\�  �  �  �  < R      �	�Z
�	 .ascrerr ****      � ****�  Z �[�
� 
errn[ d      \\ m      ����  = Z  6]^�_] ?  `a` o  �� 0 	thenumber 	theNumbera o  �� 0 maxsize maxSize^ n 	"bcb I  "�d� � .0 throwinvalidparameter throwInvalidParameterd efe o  ���� 0 	thenumber 	theNumberf ghg m  ii �jj  h klk m  ��
�� 
longl m��m b  non m  pp �qq h s p e c i f i e d   w i d t h   o n l y   a l l o w s   n u m b e r s   b e t w e e n   0 . 0   a n d  o l r����r \  sts a  uvu m  ���� v o  ���� 0 	chunksize 	chunkSizet m  ���� ��  ��  ��  �   c o  	���� 0 _support  �  _ n %6wxw I  *6��y���� .0 throwinvalidparameter throwInvalidParametery z{z o  *+���� 0 aref aRef{ |}| m  +.~~ �  } ��� m  ./��
�� 
long� ���� m  /2�� ��� V e x p e c t e d   n o n - n e g a t i v e   n o n - f r a c t i o n a l   n u m b e r��  ��  x o  %*���� 0 _support  : ��� r  7<��� m  7:�� ���  � o      ���� 0 hextext hexText� ��� V  =d��� k  E_�� ��� r  EW��� b  EU��� l ES������ n  ES��� 4  HS���
�� 
cobj� l KR������ [  KR��� `  KP��� o  KL���� 0 	thenumber 	theNumber� m  LO���� � m  PQ���� ��  ��  � m  EH�� ���   0 1 2 3 4 5 6 7 8 9 A B C D E F��  ��  � o  ST���� 0 hextext hexText� o      ���� 0 hextext hexText� ���� r  X_��� _  X]��� o  XY���� 0 	thenumber 	theNumber� m  Y\���� � o      ���� 0 	thenumber 	theNumber��  � ?  AD��� o  AB���� 0 	thenumber 	theNumber� m  BC����  � ���� r  e{��� n eu��� 7 hu����
�� 
ctxt� d  nq�� o  op���� 0 	chunksize 	chunkSize� m  rt������� l eh������ b  eh��� o  ef���� 0 padtext padText� o  fg���� 0 hextext hexText��  ��  � n     ��� 1  vz��
�� 
pcnt� o  uv���� 0 aref aRef��  � 0 aref aRef7 n ����� o  ������ 
0 _list_  � o  ������ 0 
resultlist 
resultList5 ��� r  ����� n ����� 1  ����
�� 
txdl� 1  ����
�� 
ascr� o      ���� 0 oldtids oldTIDs� ��� r  ����� m  ���� ���  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ��� Z  �������� o  ������ 0 	hasprefix 	hasPrefix� r  ����� b  ����� m  ���� ���  0 x� n ����� o  ������ 
0 _list_  � o  ������ 0 
resultlist 
resultList� o      ���� 0 hextext hexText��  � r  ����� c  ����� n ����� o  ������ 
0 _list_  � o  ������ 0 
resultlist 
resultList� m  ����
�� 
ctxt� o      ���� 0 hextext hexText� ��� r  ����� o  ������ 0 oldtids oldTIDs� n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ���� L  ���� o  ������ 0 hextext hexText��  �   format list of number   � ��� ,   f o r m a t   l i s t   o f   n u m b e r��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I  ��������� 
0 _error  � ��� m  ���� ���  f o r m a t   h e x� ��� o  ������ 0 etext eText� ��� o  ������ 0 enumber eNumber� ��� o  ������ 0 efrom eFrom� ���� o  ������ 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  D G��� I     ����
�� .Mth:HeNunull���     ctxt� o      ���� 0 hextext hexText� ����
�� 
Plac� |���� ����  ��    o      ���� 0 	chunksize 	chunkSize��   l     ���� m      ����  ��  ��  � ����
�� 
Prec |��������  ��   o      ���� 0 	isprecise 	isPrecise��   l     ���� m      ��
�� boovtrue��  ��  ��  � Q    b	 P   L

 k   K  r     n    I    ������ "0 astextparameter asTextParameter  o    ���� 0 hextext hexText �� m     �  ��  ��   o    ���� 0 _support   o      ���� 0 hextext hexText  r    # n   ! I    !�� ���� (0 asintegerparameter asIntegerParameter  !"! o    ���� 0 	chunksize 	chunkSize" #��# m    $$ �%% 
 w i d t h��  ��   o    ���� 0 _support   o      ���� 0 	chunksize 	chunkSize &'& Z  $ C()����( G   $ /*+* A   $ ',-, o   $ %���� 0 	chunksize 	chunkSize- m   % &����  + ?   * -./. o   * +���� 0 	chunksize 	chunkSize/ m   + ,���� ) n  2 ?010 I   7 ?��2���� .0 throwinvalidparameter throwInvalidParameter2 343 o   7 8���� 0 	chunksize 	chunkSize4 565 m   8 977 �88 
 w i d t h6 9:9 m   9 :��
�� 
long: ;��; m   : ;<< �==  m u s t   b e   0  1 0 2 4��  ��  1 o   2 7���� 0 _support  ��  ��  ' >?> r   D R@A@ H   D PBB n  D OCDC I   I O�E�~� (0 asbooleanparameter asBooleanParameterE FGF o   I J�}�} 0 	isprecise 	isPreciseG H�|H m   J KII �JJ  p r e c i s i o n   l o s s�|  �~  D o   D I�{�{ 0 _support  A o      �z�z 0 	isprecise 	isPrecise? K�yK Z   SKLM�xNL =   S VOPO o   S T�w�w 0 	chunksize 	chunkSizeP m   T U�v�v  M l  Y;QRSQ k   Y;TT UVU Q   YWXYW k   \ �ZZ [\[ r   \ _]^] m   \ ]�u�u  ^ o      �t�t 0 	thenumber 	theNumber\ _`_ r   ` eaba C   ` ccdc o   ` a�s�s 0 hextext hexTextd m   a bee �ff  -b o      �r�r 0 
isnegative 
isNegative` ghg Z  f }ij�q�pi o   f g�o�o 0 
isnegative 
isNegativej r   j yklk n   j wmnm 7  k w�nop
�n 
ctxto m   q s�m�m p m   t v�l�l��n o   j k�k�k 0 hextext hexTextl o      �j�j 0 hextext hexText�q  �p  h qrq Z  ~ �st�i�hs C   ~ �uvu o   ~ �g�g 0 hextext hexTextv m    �ww �xx  0 xt r   � �yzy n   � �{|{ 7  � ��f}~
�f 
ctxt} m   � ��e�e ~ m   � ��d�d��| o   � ��c�c 0 hextext hexTextz o      �b�b 0 hextext hexText�i  �h  r �a X   � ���`�� k   � ��� ��� r   � ���� ]   � ���� o   � ��_�_ 0 	thenumber 	theNumber� m   � ��^�^ � o      �]�] 0 	thenumber 	theNumber� ��� r   � ���� I  � ���\�� z�[�Z
�[ .sysooffslong    ��� null
�Z misccura�\  � �Y��
�Y 
psof� o   � ��X�X 0 charref charRef� �W��V
�W 
psin� m   � ��� ���   0 1 2 3 4 5 6 7 8 9 A B C D E F�V  � o      �U�U 0 i  � ��� Z  � ����T�S� =   � ���� o   � ��R�R 0 i  � m   � ��Q�Q  � R   � ��P�O�
�P .ascrerr ****      � ****�O  � �N��M
�N 
errn� m   � ��L�L�@�M  �T  �S  � ��K� r   � ���� \   � ���� [   � ���� o   � ��J�J 0 	thenumber 	theNumber� o   � ��I�I 0 i  � m   � ��H�H � o      �G�G 0 	thenumber 	theNumber�K  �` 0 charref charRef� o   � ��F�F 0 hextext hexText�a  X R      �E�D�
�E .ascrerr ****      � ****�D  � �C��B
�C 
errn� d      �� m      �A�A��B  Y l  ����� R   ��@��
�@ .ascrerr ****      � ****� m  �� ��� > N o t   a   v a l i d   h e x a d e c i m a l   n u m b e r .� �?��
�? 
errn� m   � ��>�>�Y� �=��<
�= 
erob� o  �;�; 0 hextext hexText�<  � E ? catch errors if hexText is too short or contains non-hex chars   � ��� ~   c a t c h   e r r o r s   i f   h e x T e x t   i s   t o o   s h o r t   o r   c o n t a i n s   n o n - h e x   c h a r sV ��� Z 	+���:�9� F  	��� o  	
�8�8 0 	isprecise 	isPrecise� l ��7�6� =  ��� o  �5�5 0 	thenumber 	theNumber� [  ��� o  �4�4 0 	thenumber 	theNumber� m  �3�3 �7  �6  � R  '�2��
�2 .ascrerr ****      � ****� m  #&�� ��� � H e x a d e c i m a l   t e x t   i s   t o o   l a r g e   t o   c o n v e r t   t o   n u m b e r   w i t h o u t   l o s i n g   p r e c i s i o n .� �1��
�1 
errn� m  �0�0�Y� �/��.
�/ 
erob� o  !"�-�- 0 hextext hexText�.  �:  �9  � ��� Z ,8���,�+� o  ,-�*�* 0 
isnegative 
isNegative� r  04��� d  02�� o  01�)�) 0 	thenumber 	theNumber� o      �(�( 0 	thenumber 	theNumber�,  �+  � ��'� L  9;�� o  9:�&�& 0 	thenumber 	theNumber�'  R   read as single number   S ��� ,   r e a d   a s   s i n g l e   n u m b e r�x  N l >K���� k  >K�� ��� Z >d���%�$� >  >G��� `  >E��� l >C��#�"� n >C��� 1  ?C�!
�! 
leng� o  >?� �  0 hextext hexText�#  �"  � o  CD�� 0 	chunksize 	chunkSize� m  EF��  � R  J`���
� .ascrerr ****      � ****� b  V_��� b  V[��� m  VY�� ��� T C a n ' t   s p l i t   h e x a d e c i m a l   t e x t   e x a c t l y   i n t o  � o  YZ�� 0 	chunksize 	chunkSize� m  [^�� ���  - d i g i t   c h u n k s .� ���
� 
errn� m  NQ���Y� ���
� 
erob� o  TU�� 0 hextext hexText�  �%  �$  � ��� h  ep��� 0 
resultlist 
resultList� j     ��� 
0 _list_  � J     ��  � ��� Y  qC������ k  �>�� ��� r  ����� m  ����  � o      �� 0 	thenumber 	theNumber� ��� X  ����� k  ���� ��� r  ��� � ]  �� o  ���� 0 	thenumber 	theNumber m  ����   o      �� 0 	thenumber 	theNumber�  r  �� I ��� z��

� .sysooffslong    ��� null
�
 misccura�   �		

�	 
psof	 o  ���� 0 charref charRef
 ��
� 
psin m  �� �   0 1 2 3 4 5 6 7 8 9 A B C D E F�   o      �� 0 i    Z ���� =  �� o  ���� 0 i   m  ����   R  ��� 
�  .ascrerr ****      � **** m  �� � > N o t   a   v a l i d   h e x a d e c i m a l   n u m b e r . ��
�� 
errn m  �������Y ����
�� 
erob l ������ N  �� n  �� 7 ���� 
�� 
ctxt o  ������ 0 i    l ��!����! \  ��"#" [  ��$%$ o  ������ 0 i  % o  ������ 0 	chunksize 	chunkSize# m  ������ ��  ��   o  ������ 0 hextext hexText��  ��  ��  �  �   &��& r  ��'(' \  ��)*) [  ��+,+ o  ������ 0 	thenumber 	theNumber, o  ������ 0 i  * m  ������ ( o      ���� 0 	thenumber 	theNumber��  � 0 charref charRef� n ��-.- 7 ����/0
�� 
ctxt/ o  ������ 0 i  0 l ��1����1 \  ��232 [  ��454 o  ������ 0 i  5 o  ������ 0 	chunksize 	chunkSize3 m  ������ ��  ��  . o  ������ 0 hextext hexText� 676 Z 589����8 F  :;: o  ���� 0 	isprecise 	isPrecise; l <����< =  =>= o  ���� 0 	thenumber 	theNumber> [  
?@? o  ���� 0 	thenumber 	theNumber@ m  	���� ��  ��  9 R  1��AB
�� .ascrerr ****      � ****A m  -0CC �DD � H e x a d e c i m a l   t e x t   i s   t o o   l a r g e   t o   c o n v e r t   t o   n u m b e r   w i t h o u t   l o s i n g   p r e c i s i o n .B ��EF
�� 
errnE m  �����YF ��G��
�� 
erobG l ,H����H N  ,II n  +JKJ 7 +��LM
�� 
ctxtL o  !#���� 0 i  M l $*N����N \  $*OPO [  %(QRQ o  %&���� 0 i  R o  &'���� 0 	chunksize 	chunkSizeP m  ()���� ��  ��  K o  ���� 0 hextext hexText��  ��  ��  ��  ��  7 S��S r  6>TUT o  67���� 0 	thenumber 	theNumberU n      VWV  ;  <=W n 7<XYX o  8<���� 
0 _list_  Y o  78���� 0 
resultlist 
resultList��  � 0 i  � m  tu���� � n u{Z[Z 1  vz��
�� 
leng[ o  uv���� 0 hextext hexText� o  {|���� 0 	chunksize 	chunkSize� \��\ L  DK]] n DJ^_^ o  EI���� 
0 _list_  _ o  DE���� 0 
resultlist 
resultList��  �   read as list of numbers   � �`` 0   r e a d   a s   l i s t   o f   n u m b e r s�y   ��a
�� consdiaca ��b
�� conshyphb ��c
�� conspuncc ����
�� conswhit��   ��d
�� conscased ����
�� consnume��   R      ��ef
�� .ascrerr ****      � ****e o      ���� 0 etext eTextf ��gh
�� 
errng o      ���� 0 enumber eNumberh ��ij
�� 
erobi o      ���� 0 efrom eFromj ��k��
�� 
errtk o      ���� 
0 eto eTo��  	 I  Tb��l���� 
0 _error  l mnm m  UXoo �pp  p a r s e   h e xn qrq o  XY���� 0 etext eTextr sts o  YZ���� 0 enumber eNumbert uvu o  Z[���� 0 efrom eFromv w��w o  [\���� 
0 eto eTo��  ��  � xyx l     ��������  ��  ��  y z{z l     ��������  ��  ��  { |}| l     ��~��  ~ J D--------------------------------------------------------------------    ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -} ��� l     ������  � !  General numeric operations   � ��� 6   G e n e r a l   n u m e r i c   o p e r a t i o n s� ��� l     ��������  ��  ��  � ��� i  H K��� I     �����
�� .Mth:DeRanull���     doub� o      ���� 0 x  ��  � Q     ���� L    �� ]    
��� l   ������ c    ��� o    ���� 0 x  � m    ��
�� 
doub��  ��  � l   	������ ^    	��� 1    ��
�� 
pi  � m    ���� ���  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I    ������� 
0 _error  � ��� m    �� ���  r a d i a n s� ��� o    ���� 0 etext eText� ��� o    ���� 0 enumber eNumber� ��� o    ���� 0 efrom eFrom� ���� o    ���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     �������  ��  �  � ��� i  L O��� I     �~��}
�~ .Mth:RaDenull���     doub� o      �|�| 0 x  �}  � Q     ���� L    �� ^    
��� l   ��{�z� c    ��� o    �y�y 0 x  � m    �x
�x 
doub�{  �z  � l   	��w�v� ^    	��� 1    �u
�u 
pi  � m    �t�t ��w  �v  � R      �s��
�s .ascrerr ****      � ****� o      �r�r 0 etext eText� �q��
�q 
errn� o      �p�p 0 enumber eNumber� �o��
�o 
erob� o      �n�n 0 efrom eFrom� �m��l
�m 
errt� o      �k�k 
0 eto eTo�l  � I    �j��i�j 
0 _error  � ��� m    �� ���  d e g r e e s� ��� o    �h�h 0 etext eText� ��� o    �g�g 0 enumber eNumber� ��� o    �f�f 0 efrom eFrom� ��e� o    �d�d 
0 eto eTo�e  �i  � ��� l     �c�b�a�c  �b  �a  � ��� l     �`�_�^�`  �_  �^  � ��� l     �]�\�[�]  �\  �[  � ��� i  P S��� I     �Z��Y
�Z .Mth:Abs_null���     nmbr� o      �X�X 0 x  �Y  � Q     )���� k    �� ��� r    ��� c    ��� o    �W�W 0 x  � m    �V
�V 
nmbr� o      �U�U 0 x  � ��T� Z   	 ���S�� A   	 ��� o   	 
�R�R 0 x  � m   
 �Q�Q  � L    �� d    �� o    �P�P 0 x  �S  � L    �� o    �O�O 0 x  �T  � R      �N��
�N .ascrerr ****      � ****� o      �M�M 0 etext eText� �L��
�L 
errn� o      �K�K 0 enumber eNumber� �J��
�J 
erob� o      �I�I 0 efrom eFrom� �H��G
�H 
errt� o      �F�F 
0 eto eTo�G  � I    )�E��D�E 
0 _error  � ��� m     !�� ���  a b s� ��� o   ! "�C�C 0 etext eText� 	 		  o   " #�B�B 0 enumber eNumber	 			 o   # $�A�A 0 efrom eFrom	 	�@	 o   $ %�?�? 
0 eto eTo�@  �D  � 			 l     �>�=�<�>  �=  �<  	 			 l     �;�:�9�;  �:  �9  	 			
		 i  T W			 I     �8	�7
�8 .Mth:CmpNnull���     ****	 J      		 			 o      �6�6 0 n1  	 	�5	 o      �4�4 0 n2  �5  �7  	 Q     �				 k    �		 			 Z    �		�3		 =    			 l   	�2�1	 I   �0		
�0 .corecnte****       ****	 J    	 	  	!	"	! o    �/�/ 0 n1  	" 	#�.	# o    �-�- 0 n2  �.  	 �,	$�+
�, 
kocl	$ m    	�*
�* 
long�+  �2  �1  	 m    �)�) 	 Z   	%	&�(�'	% =    	'	(	' o    �&�& 0 n1  	( o    �%�% 0 n2  	& L    	)	) m    �$�$  �(  �'  �3  	 k   ! �	*	* 	+	,	+ r   ! 8	-	.	- J   ! )	/	/ 	0	1	0 c   ! $	2	3	2 o   ! "�#�# 0 n1  	3 m   " #�"
�" 
doub	1 	4�!	4 c   $ '	5	6	5 o   $ %� �  0 n2  	6 m   % &�
� 
doub�!  	. J      	7	7 	8	9	8 o      �� 0 n1  	9 	:�	: o      �� 0 n2  �  	, 	;	<	; Z   9 T	=	>�	?	= =   9 <	@	A	@ o   9 :�� 0 n1  	A m   : ;��  	> r   ? H	B	C	B ]   ? F	D	E	D o   ? D�� 0 _isequaldelta _isEqualDelta	E o   D E�� 0 n2  	C o      �� 0 dn  �  	? r   K T	F	G	F ]   K R	H	I	H o   K P�� 0 _isequaldelta _isEqualDelta	I o   P Q�� 0 n1  	G o      �� 0 dn  	< 	J	K	J r   U Y	L	M	L d   U W	N	N o   U V�� 0 dn  	M o      �� 0 dm  	K 	O	P	O Z  Z w	Q	R��	Q ?   Z ]	S	T	S o   Z [�� 0 dm  	T o   [ \�� 0 dn  	R r   ` s	U	V	U J   ` d	W	W 	X	Y	X o   ` a�� 0 dm  	Y 	Z�	Z o   a b�
�
 0 dn  �  	V J      	[	[ 	\	]	\ o      �	�	 0 dn  	] 	^�	^ o      �� 0 dm  �  �  �  	P 	_	`	_ r   x }	a	b	a \   x {	c	d	c o   x y�� 0 n2  	d o   y z�� 0 n1  	b o      �� 0 d  	` 	e�	e Z  ~ �	f	g��	f F   ~ �	h	i	h ?   ~ �	j	k	j o   ~ � �  0 d  	k o    ����� 0 dm  	i A   � �	l	m	l o   � ����� 0 d  	m o   � ����� 0 dn  	g L   � �	n	n m   � �����  �  �  �  	 	o��	o Z   � �	p	q��	r	p A   � �	s	t	s o   � ����� 0 n1  	t o   � ����� 0 n2  	q L   � �	u	u m   � ���������  	r L   � �	v	v m   � ����� ��  	 R      ��	w	x
�� .ascrerr ****      � ****	w o      ���� 0 etext eText	x ��	y	z
�� 
errn	y o      ���� 0 enumber eNumber	z ��	{	|
�� 
erob	{ o      ���� 0 efrom eFrom	| ��	}��
�� 
errt	} o      ���� 
0 eto eTo��  	 I   � ���	~���� 
0 _error  	~ 		�	 m   � �	�	� �	�	�  c m p	� 	�	�	� o   � ����� 0 etext eText	� 	�	�	� o   � ����� 0 enumber eNumber	� 	�	�	� o   � ����� 0 efrom eFrom	� 	���	� o   � ����� 
0 eto eTo��  ��  	
 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� i  X [	�	�	� I     ��	���
�� .Mth:MinNnull���     ****	� o      ���� 0 thelist theList��  	� Q     W	�	�	�	� k    E	�	� 	�	�	� h    
��	��� 0 
listobject 
listObject	� j     ��	��� 
0 _list_  	� n    	�	�	� I    ��	����� "0 aslistparameter asListParameter	� 	���	� o    
���� 0 thelist theList��  ��  	� o     ���� 0 _support  	� 	�	�	� r    	�	�	� c    	�	�	� l   	�����	� n    	�	�	� 4   ��	�
�� 
cobj	� m    ���� 	� n   	�	�	� o    ���� 
0 _list_  	� o    ���� 0 
listobject 
listObject��  ��  	� m    ��
�� 
nmbr	� o      ���� 0 	theresult 	theResult	� 	�	�	� X    B	���	�	� k   ( =	�	� 	�	�	� r   ( /	�	�	� c   ( -	�	�	� n  ( +	�	�	� 1   ) +��
�� 
pcnt	� o   ( )���� 0 aref aRef	� m   + ,��
�� 
nmbr	� o      ���� 0 x  	� 	���	� Z  0 =	�	�����	� A   0 3	�	�	� o   0 1���� 0 x  	� o   1 2���� 0 	theresult 	theResult	� r   6 9	�	�	� o   6 7���� 0 x  	� o      ���� 0 	theresult 	theResult��  ��  ��  �� 0 aref aRef	� n   	�	�	� o    ���� 
0 _list_  	� o    ���� 0 
listobject 
listObject	� 	���	� L   C E	�	� o   C D���� 0 	theresult 	theResult��  	� R      ��	�	�
�� .ascrerr ****      � ****	� o      ���� 0 etext eText	� ��	�	�
�� 
errn	� o      ���� 0 enumber eNumber	� ��	�	�
�� 
erob	� o      ���� 0 efrom eFrom	� ��	���
�� 
errt	� o      ���� 
0 eto eTo��  	� I   M W��	����� 
0 _error  	� 	�	�	� m   N O	�	� �	�	�  m i n	� 	�	�	� o   O P���� 0 etext eText	� 	�	�	� o   P Q���� 0 enumber eNumber	� 	�	�	� o   Q R���� 0 efrom eFrom	� 	���	� o   R S���� 
0 eto eTo��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� i  \ _	�	�	� I     ��	���
�� .Mth:MaxNnull���     ****	� o      ���� 0 thelist theList��  	� Q     W	�	�	�	� k    E	�	� 	�	�	� h    
��	��� 0 
listobject 
listObject	� j     ��	��� 
0 _list_  	� n    	�	�	� I    ��	����� "0 aslistparameter asListParameter	� 	���	� o    
���� 0 thelist theList��  ��  	� o     ���� 0 _support  	� 	�	�	� r    	�	�	� c    	�	�	� l   	�����	� n    	�	�	� 4   ��	�
�� 
cobj	� m    ���� 	� n   	�	�	� o    ���� 
0 _list_  	� o    ���� 0 
listobject 
listObject��  ��  	� m    ��
�� 
nmbr	� o      ���� 0 	theresult 	theResult	� 	�	�	� X    B	���	�	� k   ( =	�	� 	�	�	� r   ( /	�	�	� c   ( -
 

  n  ( +


 1   ) +��
�� 
pcnt
 o   ( )���� 0 aref aRef
 m   + ,��
�� 
nmbr	� o      ���� 0 x  	� 
��
 Z  0 =

����
 ?   0 3


 o   0 1���� 0 x  
 o   1 2���� 0 	theresult 	theResult
 r   6 9
	


	 o   6 7���� 0 x  

 o      ���� 0 	theresult 	theResult��  ��  ��  �� 0 aref aRef	� n   


 o    ���� 
0 _list_  
 o    ���� 0 
listobject 
listObject	� 
��
 L   C E

 o   C D���� 0 	theresult 	theResult��  	� R      ��


�� .ascrerr ****      � ****
 o      ���� 0 etext eText
 ��


�� 
errn
 o      ���� 0 enumber eNumber
 ��


�� 
erob
 o      ���� 0 efrom eFrom
 �
�~
� 
errt
 o      �}�} 
0 eto eTo�~  	� I   M W�|
�{�| 
0 _error  
 


 m   N O

 �

  m a x
 


 o   O P�z�z 0 etext eText
 


 o   P Q�y�y 0 enumber eNumber
 

 
 o   Q R�x�x 0 efrom eFrom
  
!�w
! o   R S�v�v 
0 eto eTo�w  �{  	� 
"
#
" l     �u�t�s�u  �t  �s  
# 
$
%
$ l     �r�q�p�r  �q  �p  
% 
&
'
& i  ` c
(
)
( I     �o
*
+
�o .Mth:RouNnull���     nmbr
* o      �n�n 0 num  
+ �m
,
-
�m 
Plac
, |�l�k
.�j
/�l  �k  
. o      �i�i 0 decimalplaces decimalPlaces�j  
/ l     
0�h�g
0 m      �f�f  �h  �g  
- �e
1�d
�e 
Dire
1 |�c�b
2�a
3�c  �b  
2 o      �`�` &0 roundingdirection roundingDirection�a  
3 l     
4�_�^
4 m      �]
�] MRndRNhE�_  �^  �d  
) Q    �
5
6
7
5 k   �
8
8 
9
:
9 r    
;
<
; n   
=
>
= I    �\
?�[�\ "0 asrealparameter asRealParameter
? 
@
A
@ o    	�Z�Z 0 num  
A 
B�Y
B m   	 

C
C �
D
D  �Y  �[  
> o    �X�X 0 _support  
< o      �W�W 0 num  
: 
E
F
E r    
G
H
G n   
I
J
I I    �V
K�U�V (0 asintegerparameter asIntegerParameter
K 
L
M
L o    �T�T 0 decimalplaces decimalPlaces
M 
N�S
N m    
O
O �
P
P  t o   p l a c e s�S  �U  
J o    �R�R 0 _support  
H o      �Q�Q 0 decimalplaces decimalPlaces
F 
Q
R
Q Z    8
S
T�P�O
S >    "
U
V
U o     �N�N 0 decimalplaces decimalPlaces
V m     !�M�M  
T k   % 4
W
W 
X
Y
X r   % *
Z
[
Z a   % (
\
]
\ m   % &�L�L 

] o   & '�K�K 0 decimalplaces decimalPlaces
[ o      �J�J 0 themultiplier theMultiplier
Y 
^�I
^ l  + 4
_
`
a
_ r   + 4
b
c
b ^   + 2
d
e
d ]   + 0
f
g
f ]   + .
h
i
h o   + ,�H�H 0 num  
i m   , -�G�G 

g o   . /�F�F 0 themultiplier theMultiplier
e m   0 1�E�E 

c o      �D�D 0 num  
`�� multiplying and dividing by 10 before and after applying the multiplier helps avoid poor rounding results for some numbers due to inevitable loss of precision in floating-point math (e.g. `324.21 * 100 div 1 / 100` returns 324.2 but needs to be 324.21), though this hasn't been tested on all possible values for obvious reasons -- TO DO: shouldn't /10 be done after rounding is applied (in which case following calculations should use mod 10, etc)?   
a �
j
j�   m u l t i p l y i n g   a n d   d i v i d i n g   b y   1 0   b e f o r e   a n d   a f t e r   a p p l y i n g   t h e   m u l t i p l i e r   h e l p s   a v o i d   p o o r   r o u n d i n g   r e s u l t s   f o r   s o m e   n u m b e r s   d u e   t o   i n e v i t a b l e   l o s s   o f   p r e c i s i o n   i n   f l o a t i n g - p o i n t   m a t h   ( e . g .   ` 3 2 4 . 2 1   *   1 0 0   d i v   1   /   1 0 0 `   r e t u r n s   3 2 4 . 2   b u t   n e e d s   t o   b e   3 2 4 . 2 1 ) ,   t h o u g h   t h i s   h a s n ' t   b e e n   t e s t e d   o n   a l l   p o s s i b l e   v a l u e s   f o r   o b v i o u s   r e a s o n s   - -   T O   D O :   s h o u l d n ' t   / 1 0   b e   d o n e   a f t e r   r o u n d i n g   i s   a p p l i e d   ( i n   w h i c h   c a s e   f o l l o w i n g   c a l c u l a t i o n s   s h o u l d   u s e   m o d   1 0 ,   e t c ) ?�I  �P  �O  
R 
k
l
k Z   9�
m
n
o
p
m =  9 <
q
r
q o   9 :�C�C &0 roundingdirection roundingDirection
r l  : ;
s�B�A
s m   : ;�@
�@ MRndRNhE�B  �A  
n Z   ? m
t
u
v
w
t E  ? K
x
y
x J   ? C
z
z 
{
|
{ m   ? @
}
} ��      
| 
~�?
~ m   @ A

 ?�      �?  
y J   C J
�
� 
��>
� `   C H
�
�
� l  C F
��=�<
� ^   C F
�
�
� o   C D�;�; 0 num  
� m   D E�:�: �=  �<  
� m   F G�9�9 �>  
u l  N S
�
�
�
� r   N S
�
�
� _   N Q
�
�
� o   N O�8�8 0 num  
� m   O P�7�7 
� o      �6�6 0 num  
� T N if num ends in .5 and its div is even then round toward zero so it stays even   
� �
�
� �   i f   n u m   e n d s   i n   . 5   a n d   i t s   d i v   i s   e v e n   t h e n   r o u n d   t o w a r d   z e r o   s o   i t   s t a y s   e v e n
v 
�
�
� ?   V Y
�
�
� o   V W�5�5 0 num  
� m   W X�4�4  
� 
��3
� l  \ c
�
�
�
� r   \ c
�
�
� _   \ a
�
�
� l  \ _
��2�1
� [   \ _
�
�
� o   \ ]�0�0 0 num  
� m   ] ^
�
� ?�      �2  �1  
� m   _ `�/�/ 
� o      �.�. 0 num  
� H B else round to nearest whole digit (.5 will round up if positive�)   
� �
�
� �   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t   ( . 5   w i l l   r o u n d   u p   i f   p o s i t i v e & )�3  
w l  f m
�
�
�
� r   f m
�
�
� _   f k
�
�
� l  f i
��-�,
� \   f i
�
�
� o   f g�+�+ 0 num  
� m   g h
�
� ?�      �-  �,  
� m   i j�*�* 
� o      �)�) 0 num  
� 4 . (�or down if negative to give an even result)   
� �
�
� \   ( & o r   d o w n   i f   n e g a t i v e   t o   g i v e   a n   e v e n   r e s u l t )
o 
�
�
� =  p s
�
�
� o   p q�(�( &0 roundingdirection roundingDirection
� l  q r
��'�&
� m   q r�%
�% MRndRNhT�'  �&  
� 
�
�
� Z   v �
�
�
�
�
� E  v �
�
�
� J   v z
�
� 
�
�
� m   v w
�
� ��      
� 
��$
� m   w x
�
� ?�      �$  
� J   z 
�
� 
��#
� `   z }
�
�
� o   z {�"�" 0 num  
� m   { |�!�! �#  
� l  � �
�
�
�
� r   � �
�
�
� _   � �
�
�
� o   � �� �  0 num  
� m   � ��� 
� o      �� 0 num  
� 0 * if num ends in .5 then round towards zero   
� �
�
� T   i f   n u m   e n d s   i n   . 5   t h e n   r o u n d   t o w a r d s   z e r o
� 
�
�
� ?   � �
�
�
� o   � ��� 0 num  
� m   � ���  
� 
��
� l  � �
�
�
�
� r   � �
�
�
� _   � �
�
�
� l  � �
���
� [   � �
�
�
� o   � ��� 0 num  
� m   � �
�
� ?�      �  �  
� m   � ��� 
� o      �� 0 num  
� ( " else round to nearest whole digit   
� �
�
� D   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t�  
� r   � �
�
�
� _   � �
�
�
� l  � �
���
� \   � �
�
�
� o   � ��� 0 num  
� m   � �
�
� ?�      �  �  
� m   � ��� 
� o      �� 0 num  
� 
�
�
� =  � �
�
�
� o   � ��� &0 roundingdirection roundingDirection
� l  � �
���
� m   � ��
� MRndRNhF�  �  
� 
�
�
� Z   � �
�
�
�
�
� E  � �
�
�
� J   � �
�
� 
�
�
� m   � �
�
� ��      
� 
��
� m   � �
�
� ?�      �  
� J   � �
�
� 
��
� `   � �
�
�
� o   � ��
�
 0 num  
� m   � ��	�	 �  
� l  � �
�
�
�
� Z   � �
�
�� 
� ?   � � o   � ��� 0 num   m   � ���  
� r   � � [   � � _   � � o   � ��� 0 num   m   � ���  m   � ���  o      �� 0 num  �    r   � �	
	 \   � � _   � � o   � ��� 0 num   m   � �� �   m   � ����� 
 o      ���� 0 num  
� 0 * if num ends in .5 then round towards zero   
� � T   i f   n u m   e n d s   i n   . 5   t h e n   r o u n d   t o w a r d s   z e r o
�  ?   � � o   � ����� 0 num   m   � �����   �� l  � � r   � � _   � � l  � ����� [   � � o   � ����� 0 num   m   � � ?�      ��  ��   m   � �����  o      ���� 0 num   ( " else round to nearest whole digit    �   D   e l s e   r o u n d   t o   n e a r e s t   w h o l e   d i g i t��  
� r   � �!"! _   � �#$# l  � �%����% \   � �&'& o   � ����� 0 num  ' m   � �(( ?�      ��  ��  $ m   � ����� " o      ���� 0 num  
� )*) =  � �+,+ o   � ����� &0 roundingdirection roundingDirection, l  � �-����- m   � ���
�� MRndRN_T��  ��  * ./. r   � �010 _   � �232 o   � ����� 0 num  3 m   � ����� 1 o      ���� 0 num  / 454 =  � �676 o   � ����� &0 roundingdirection roundingDirection7 l  � �8����8 m   � ���
�� MRndRN_F��  ��  5 9:9 Z   ';<=>; =   ?@? `   ABA o   ���� 0 num  B m  ���� @ m  ����  < r  CDC _  EFE o  	���� 0 num  F m  	
���� D o      ���� 0 num  = GHG ?  IJI o  ���� 0 num  J m  ����  H K��K r  LML [  NON _  PQP o  ���� 0 num  Q m  ���� O m  ���� M o      ���� 0 num  ��  > r   'RSR \   %TUT _   #VWV o   !���� 0 num  W m  !"���� U m  #$���� S o      ���� 0 num  : XYX = *-Z[Z o  *+���� &0 roundingdirection roundingDirection[ l +,\����\ m  +,��
�� MRndRN_U��  ��  Y ]^] l 0O_`a_ Z  0Obc��db G  0=efe A  03ghg o  01���� 0 num  h m  12����  f =  6;iji `  69klk o  67���� 0 num  l m  78���� j m  9:����  c r  @Emnm _  @Copo o  @A���� 0 num  p m  AB���� n o      ���� 0 num  ��  d r  HOqrq [  HMsts _  HKuvu o  HI���� 0 num  v m  IJ���� t m  KL���� r o      ���� 0 num  `   ceil()   a �ww    c e i l ( )^ xyx = RWz{z o  RS���� &0 roundingdirection roundingDirection{ l SV|����| m  SV��
�� MRndRN_D��  ��  y }��} l Zy~�~ Z  Zy������ G  Zg��� ?  Z]��� o  Z[���� 0 num  � m  [\����  � =  `e��� `  `c��� o  `a���� 0 num  � m  ab���� � m  cd����  � r  jo��� _  jm��� o  jk���� 0 num  � m  kl���� � o      ���� 0 num  ��  � r  ry��� \  rw��� _  ru��� o  rs���� 0 num  � m  st���� � m  uv���� � o      ���� 0 num     floor()   � ���    f l o o r ( )��  
p n |���� I  ��������� >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o  ������ &0 roundingdirection roundingDirection� ���� m  ���� ���  b y��  ��  � o  |����� 0 _support  
l ���� Z  ������� =  ����� o  ������ 0 decimalplaces decimalPlaces� m  ������  � L  ���� _  ����� o  ������ 0 num  � m  ������ � ��� A  ����� o  ������ 0 decimalplaces decimalPlaces� m  ������  � ���� L  ���� _  ����� o  ������ 0 num  � o  ������ 0 themultiplier theMultiplier��  � L  ���� ^  ����� o  ������ 0 num  � o  ������ 0 themultiplier theMultiplier��  
6 R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  
7 I  ��������� 
0 _error  � ��� m  ���� ���  r o u n d   n u m b e r� ��� o  ������ 0 etext eText� ��� o  ������ 0 enumber eNumber� ��� o  ������ 0 efrom eFrom� ���� o  ������ 
0 eto eTo��  ��  
' ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   Trigonometry   � ���    T r i g o n o m e t r y� ��� l     ��������  ��  ��  � ��� i  d g��� I      ������� 0 _sin  � ���� o      ���� 0 x  ��  ��  � k     ��� ��� l    	���� r     	��� ]     ��� l    ������ `     ��� o     �� 0 x  � m    �~�~h��  ��  � l   ��}�|� ^    ��� 1    �{
�{ 
pi  � m    �z�z ��}  �|  � o      �y�y 0 x  � &   convert from degrees to radians   � ��� @   c o n v e r t   f r o m   d e g r e e s   t o   r a d i a n s� ��� r   
 ��� A   
 ��� o   
 �x�x 0 x  � m    �w�w  � o      �v�v 0 isneg isNeg� ��� Z   ���u�t� o    �s�s 0 isneg isNeg� r    ��� d    �� o    �r�r 0 x  � o      �q�q 0 x  �u  �t  � ��� r    &��� _    $� � l   "�p�o ]    " o    �n�n 0 x   l   !�m�l ^    ! m    �k�k  1     �j
�j 
pi  �m  �l  �p  �o    m   " #�i�i � o      �h�h 0 y  �  r   ' 2	
	 \   ' 0 o   ' (�g�g 0 y   ]   ( / l  ( -�f�e _   ( - ]   ( + o   ( )�d�d 0 y   m   ) * ?�       m   + ,�c�c �f  �e   m   - .�b�b 
 o      �a�a 0 z    Z   3 J�`�_ =  3 8 `   3 6 o   3 4�^�^ 0 z   m   4 5�]�]  m   6 7�\�\  k   ; F  r   ; @ !  [   ; >"#" o   ; <�[�[ 0 z  # m   < =�Z�Z ! o      �Y�Y 0 z   $�X$ r   A F%&% [   A D'(' o   A B�W�W 0 y  ( m   B C�V�V & o      �U�U 0 y  �X  �`  �_   )*) r   K P+,+ `   K N-.- o   K L�T�T 0 z  . m   L M�S�S , o      �R�R 0 z  * /0/ Z   Q e12�Q�P1 ?   Q T343 o   Q R�O�O 0 z  4 m   R S�N�N 2 k   W a55 676 r   W [898 H   W Y:: o   W X�M�M 0 isneg isNeg9 o      �L�L 0 isneg isNeg7 ;�K; r   \ a<=< \   \ _>?> o   \ ]�J�J 0 z  ? m   ] ^�I�I = o      �H�H 0 z  �K  �Q  �P  0 @A@ r   f uBCB \   f sDED l  f oF�G�FF \   f oGHG l  f kI�E�DI \   f kJKJ o   f g�C�C 0 x  K ]   g jLML o   g h�B�B 0 y  M m   h iNN ?�!�?��v�E  �D  H ]   k nOPO o   k l�A�A 0 y  P m   l mQQ >dD,���J�G  �F  E ]   o rRSR o   o p�@�@ 0 y  S m   p qTT <�F���P�C o      �?�? 0 z2  A UVU r   v {WXW ]   v yYZY o   v w�>�> 0 z2  Z o   w x�=�= 0 z2  X o      �<�< 0 zz  V [\[ Z   | �]^�;_] G   | �`a` =  | bcb o   | }�:�: 0 z  c m   } ~�9�9 a =  � �ded o   � ��8�8 0 z  e m   � ��7�7 ^ r   � �fgf [   � �hih \   � �jkj m   � �ll ?�      k ^   � �mnm o   � ��6�6 0 zz  n m   � ��5�5 i ]   � �opo ]   � �qrq o   � ��4�4 0 zz  r o   � ��3�3 0 zz  p l  � �s�2�1s [   � �tut ]   � �vwv l  � �x�0�/x \   � �yzy ]   � �{|{ l  � �}�.�-} [   � �~~ ]   � ���� l  � ���,�+� \   � ���� ]   � ���� l  � ���*�)� [   � ���� ]   � ���� m   � ��� ���I���� o   � ��(�( 0 zz  � m   � ��� >!�{N>��*  �)  � o   � ��'�' 0 zz  � m   � ��� >�~O~�K��,  �+  � o   � ��&�& 0 zz   m   � ��� >���D��.  �-  | o   � ��%�% 0 zz  z m   � ��� ?V�l�=��0  �/  w o   � ��$�$ 0 zz  u m   � ��� ?�UUUV��2  �1  g o      �#�# 0 y  �;  _ r   � ���� [   � ���� o   � ��"�" 0 z2  � ]   � ���� ]   � ���� o   � ��!�! 0 z2  � o   � �� �  0 zz  � l  � ����� \   � ���� ]   � ���� l  � ����� [   � ���� ]   � ���� l  � ����� \   � ���� ]   � ���� l  � ����� [   � ���� ]   � ���� l  � ����� \   � ���� ]   � ���� m   � ��� =���ќ�� o   � ��� 0 zz  � m   � ��� >Z��)[�  �  � o   � ��� 0 zz  � m   � ��� >��V}H��  �  � o   � ��� 0 zz  � m   � ��� ?*�����  �  � o   � ��� 0 zz  � m   � ��� ?�"w�  �  � o   � ��� 0 zz  � m   � ��� ?�UUUU�?�  �  � o      �� 0 y  \ ��� Z  � ������ o   � ��� 0 isneg isNeg� r   � ���� d   � ��� o   � ��� 0 y  � o      �� 0 y  �  �  � ��
� L   � ��� o   � ��	�	 0 y  �
  � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ��� �  �  �   � ��� i  h k��� I     �����
�� .Mth:Sin_null���     doub� o      ���� 0 x  ��  � Q     ���� L    �� I    ������� 0 _sin  � ���� c    ��� o    ���� 0 x  � m    ��
�� 
nmbr��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I    ������� 
0 _error  � ��� m    �� ���  s i n� ��� o    ���� 0 etext eText� ��� o    ���� 0 enumber eNumber� ��� o    ���� 0 efrom eFrom� ���� o    ���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  l o��� I     �����
�� .Mth:Cos_null���     doub� o      ���� 0 x  ��  � Q      ���� L    �� I    ������� 0 _sin  � ���� [    	��� l   ������ c    ��� o    ���� 0 x  � m    ��
�� 
nmbr��  ��  � m    ���� Z��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� �� 
�� 
erob  o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  � I     ������ 
0 _error    m     �  c o s 	 o    ���� 0 etext eText	 

 o    ���� 0 enumber eNumber  o    ���� 0 efrom eFrom �� o    ���� 
0 eto eTo��  ��  �  l     ��������  ��  ��    l     ��������  ��  ��    i  p s I     ����
�� .Mth:Tan_null���     doub o      ���� 0 x  ��   k      l     ����   a [ note: this starts to lose accuracy between 89.9999999 and 90�, but should be 'good enough'    � �   n o t e :   t h i s   s t a r t s   t o   l o s e   a c c u r a c y   b e t w e e n   8 9 . 9 9 9 9 9 9 9   a n d   9 0 � ,   b u t   s h o u l d   b e   ' g o o d   e n o u g h ' �� Q     ! k    �"" #$# r    %&% c    '(' o    ���� 0 x  ( m    ��
�� 
nmbr& o      ���� 0 x  $ )*) l  	 #+,-+ Z  	 #./����. G   	 010 =  	 232 o   	 
���� 0 x  3 m   
 ���� Z1 =   454 o    ���� 0 x  5 m    ����/ R    ��67
�� .ascrerr ****      � ****6 m    88 �99 F I n v a l i d   n u m b e r   ( r e s u l t   w o u l d   b e  " ) .7 ��:;
�� 
errn: m    �����s; ��<��
�� 
erob< o    ���� 0 x  ��  ��  ��  , 4 . -2701 normally indicates divide-by-zero error   - �== \   - 2 7 0 1   n o r m a l l y   i n d i c a t e s   d i v i d e - b y - z e r o   e r r o r* >?> l  $ -@AB@ r   $ -CDC ]   $ +EFE l  $ 'G����G `   $ 'HIH o   $ %���� 0 x  I m   % &����h��  ��  F l  ' *J����J ^   ' *KLK 1   ' (��
�� 
pi  L m   ( )���� ���  ��  D o      ���� 0 x  A &   convert from degrees to radians   B �MM @   c o n v e r t   f r o m   d e g r e e s   t o   r a d i a n s? NON r   . 3PQP A   . 1RSR o   . /���� 0 x  S m   / 0����  Q o      ���� 0 isneg isNegO TUT Z  4 @VW����V o   4 5���� 0 isneg isNegW r   8 <XYX d   8 :ZZ o   8 9���� 0 x  Y o      ���� 0 x  ��  ��  U [\[ r   A J]^] _   A H_`_ l  A Fa����a ^   A Fbcb o   A B���� 0 x  c l  B Ed����d ^   B Eefe 1   B C��
�� 
pi  f m   C D���� ��  ��  ��  ��  ` m   F G���� ^ o      ���� 0 y  \ ghg r   K Viji \   K Tklk o   K L���� 0 y  l ]   L Smnm l  L Qo����o _   L Qpqp ]   L Orsr o   L M���� 0 y  s m   M Ntt ?�      q m   O P���� ��  ��  n m   Q R���� j o      ���� 0 z  h uvu Z   W nwx����w =  W \yzy `   W Z{|{ o   W X���� 0 z  | m   X Y���� z m   Z [���� x k   _ j}} ~~ r   _ d��� [   _ b��� o   _ `���� 0 z  � m   ` a���� � o      ���� 0 z   ���� r   e j��� [   e h��� o   e f���� 0 y  � m   f g���� � o      ���� 0 y  ��  ��  ��  v ��� r   o ���� \   o ~��� l  o x���~� \   o x��� l  o t��}�|� \   o t��� o   o p�{�{ 0 x  � ]   p s��� o   p q�z�z 0 y  � m   q r�� ?�!�P M�}  �|  � ]   t w��� o   t u�y�y 0 y  � m   u v�� >A�`  �  �~  � ]   x }��� o   x y�x�x 0 y  � m   y |�� <��&3\� o      �w�w 0 z2  � ��� r   � ���� ]   � ���� o   � ��v�v 0 z2  � o   � ��u�u 0 z2  � o      �t�t 0 zz  � ��� Z   � ����s�� ?   � ���� o   � ��r�r 0 zz  � m   � ��� =����+�� r   � ���� [   � ���� o   � ��q�q 0 z2  � ^   � ���� ]   � ���� ]   � ���� o   � ��p�p 0 z2  � o   � ��o�o 0 zz  � l  � ���n�m� \   � ���� ]   � ���� l  � ���l�k� [   � ���� ]   � ���� m   � ��� �ɒ��O?D� o   � ��j�j 0 zz  � m   � ��� A1������l  �k  � o   � ��i�i 0 zz  � m   � ��� Aq��)�y�n  �m  � l  � ���h�g� \   � ���� ]   � ���� l  � ���f�e� [   � ���� ]   � ���� l  � ���d�c� \   � ���� ]   � ���� l  � ���b�a� [   � ���� o   � ��`�` 0 zz  � m   � ��� @ʸ��et�b  �a  � o   � ��_�_ 0 zz  � m   � ��� A4'�X*���d  �c  � o   � ��^�^ 0 zz  � m   � ��� Awُ�����f  �e  � o   � ��]�] 0 zz  � m   � ��� A���<�Z6�h  �g  � o      �\�\ 0 y  �s  � r   � ���� o   � ��[�[ 0 z2  � o      �Z�Z 0 y  � ��� Z  � ����Y�X� G   � ���� =  � ���� o   � ��W�W 0 z  � m   � ��V�V � =  � ���� o   � ��U�U 0 z  � m   � ��T�T � r   � ���� ^   � ���� m   � ��S�S��� o   � ��R�R 0 y  � o      �Q�Q 0 y  �Y  �X  � ��� Z  � ����P�O� o   � ��N�N 0 isneg isNeg� r   � ���� d   � ��� o   � ��M�M 0 y  � o      �L�L 0 y  �P  �O  � ��K� L   � ��� o   � ��J�J 0 y  �K    R      �I��
�I .ascrerr ****      � ****� o      �H�H 0 etext eText� �G��
�G 
errn� o      �F�F 0 enumber eNumber� �E��
�E 
erob� o      �D�D 0 efrom eFrom� �C��B
�C 
errt� o      �A�A 
0 eto eTo�B  ! I   ��@��?�@ 
0 _error  � ��� m   � ��� ���  t a n� ��� o   � ��>�> 0 etext eText�    o   � ��=�= 0 enumber eNumber  o   � ��<�< 0 efrom eFrom �; o   � ��:�: 
0 eto eTo�;  �?  ��    l     �9�8�7�9  �8  �7    l     �6�5�4�6  �5  �4   	
	 l     �3�3    -----    � 
 - - - - -
  l     �2�2     inverse    �    i n v e r s e  l     �1�0�/�1  �0  �/    i  t w I      �.�-�. 	0 _asin   �, o      �+�+ 0 x  �,  �-   k     �  r      A      !  o     �*�* 0 x  ! m    �)�)   o      �(�( 0 isneg isNeg "#" Z   $%�'�&$ o    �%�% 0 isneg isNeg% r   
 &'& d   
 (( o   
 �$�$ 0 x  ' o      �#�# 0 x  �'  �&  # )*) Z   %+,�"�!+ ?    -.- o    � �  0 x  . m    �� , R    !�/0
� .ascrerr ****      � ****/ m     11 �22 T I n v a l i d   n u m b e r   ( n o t   b e t w e e n   - 1 . 0   a n d   1 . 0 ) .0 �34
� 
errn3 m    ���Y4 �5�
� 
erob5 o    �� 0 x  �  �"  �!  * 676 Z   & �89:;8 ?   & )<=< o   & '�� 0 x  = m   ' (>> ?�      9 k   , ?? @A@ r   , 1BCB \   , /DED m   , -�� E o   - .�� 0 x  C o      �� 0 zz  A FGF r   2 WHIH ^   2 UJKJ ]   2 ELML o   2 3�� 0 zz  M l  3 DN��N [   3 DOPO ]   3 BQRQ l  3 @S��S \   3 @TUT ]   3 >VWV l  3 <X��X [   3 <YZY ]   3 :[\[ l  3 8]��] \   3 8^_^ ]   3 6`a` m   3 4bb ?hOØ��a o   4 5�� 0 zz  _ m   6 7cc ?��Y�,��  �  \ o   8 9�
�
 0 zz  Z m   : ;dd @����?��  �  W o   < =�	�	 0 zz  U m   > ?ee @9����"�  �  R o   @ A�� 0 zz  P m   B Cff @<�b@���  �  K l  E Tg��g [   E Thih ]   E Rjkj l  E Pl��l \   E Pmnm ]   E Nopo l  E Lq��q [   E Lrsr ]   E Jtut l  E Hv�� v \   E Hwxw o   E F���� 0 zz  x m   F Gyy @5򢶿]R�  �   u o   H I���� 0 zz  s m   J Kzz @bb�j1�  �  p o   L M���� 0 zz  n m   N O{{ @w���c��  �  k o   P Q���� 0 zz  i m   R S|| @ug	��D��  �  I o      ���� 0 p  G }~} r   X _� a   X ]��� l  X [������ [   X [��� o   X Y���� 0 zz  � o   Y Z���� 0 zz  ��  ��  � m   [ \�� ?�      � o      ���� 0 zz  ~ ��� r   ` i��� \   ` g��� l  ` e������ ^   ` e��� 1   ` c��
�� 
pi  � m   c d���� ��  ��  � o   e f���� 0 zz  � o      ���� 0 z  � ��� r   j s��� \   j q��� ]   j m��� o   j k���� 0 zz  � o   k l���� 0 p  � m   m p�� <��&3\
� o      ���� 0 zz  � ���� r   t ��� [   t }��� \   t w��� o   t u���� 0 z  � o   u v���� 0 zz  � l  w |������ ^   w |��� 1   w z��
�� 
pi  � m   z {���� ��  ��  � o      ���� 0 z  ��  : ��� A   � ���� o   � ����� 0 x  � m   � ��� >Ey��0�:� ���� r   � ���� o   � ����� 0 x  � o      ���� 0 z  ��  ; k   � ��� ��� r   � ���� ]   � ���� o   � ����� 0 x  � o   � ����� 0 x  � o      ���� 0 zz  � ���� r   � ���� [   � ���� ]   � ���� ^   � ���� ]   � ���� o   � ����� 0 zz  � l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� m   � ��� ?qk��v�� o   � ����� 0 zz  � m   � ��� ?�CA3>M���  ��  � o   � ����� 0 zz  � m   � ��� @�K�/��  ��  � o   � ����� 0 zz  � m   � ��� @0C1�'����  ��  � o   � ����� 0 zz  � m   � ��� @3��w����  ��  � o   � ����� 0 zz  � m   � ��� @ elΰ8��  ��  � l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� ]   � ���� l  � ������� [   � ���� ]   � ���� l  � ������� \   � ���� o   � ����� 0 zz  � m   � ��� @-{Y^���  ��  � o   � ����� 0 zz  � m   � ��� @Q��%��6��  ��  � o   � ����� 0 zz  � m   � ��� @be�m5v���  ��  � o   � ����� 0 zz  � m   � ��� @apV������  ��  � o   � ����� 0 zz  � m   � ��� @H�"
6���  ��  � o   � ����� 0 x  � o   � ����� 0 x  � o      ���� 0 z  ��  7 ��� Z  � �������� o   � ����� 0 isneg isNeg� r   � ���� d   � ��� o   � ����� 0 z  � o      ���� 0 z  ��  ��  � ���� L   � �   ^   � � o   � ����� 0 z   l  � ����� ^   � � 1   � ���
�� 
pi   m   � ����� ���  ��  ��    l     ��������  ��  ��   	 l     ��������  ��  ��  	 

 l     ��������  ��  ��    i  x { I     ����
�� .Mth:Sinanull���     doub o      ���� 0 x  ��   Q      L     I    ������ 	0 _asin   �� c     o    ���� 0 x   m    ��
�� 
nmbr��  ��   R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��   I    �� ���� 
0 _error    !"! m    ## �$$  a s i n" %&% o    ���� 0 etext eText& '(' o    ���� 0 enumber eNumber( )*) o    ���� 0 efrom eFrom* +��+ o    ���� 
0 eto eTo��  ��   ,-, l     ��������  ��  ��  - ./. l     ��������  ��  ��  / 010 i  | 232 I     ��4��
�� .Mth:Cosanull���     doub4 o      ���� 0 x  ��  3 Q      5675 L    88 \    9:9 m    ���� Z: l   ;����; I    ��<���� 	0 _asin  < =��= c    >?> o    �� 0 x  ? m    �~
�~ 
nmbr��  ��  ��  ��  6 R      �}@A
�} .ascrerr ****      � ****@ o      �|�| 0 etext eTextA �{BC
�{ 
errnB o      �z�z 0 enumber eNumberC �yDE
�y 
erobD o      �x�x 0 efrom eFromE �wF�v
�w 
errtF o      �u�u 
0 eto eTo�v  7 I     �tG�s�t 
0 _error  G HIH m    JJ �KK  a c o sI LML o    �r�r 0 etext eTextM NON o    �q�q 0 enumber eNumberO PQP o    �p�p 0 efrom eFromQ R�oR o    �n�n 
0 eto eTo�o  �s  1 STS l     �m�l�k�m  �l  �k  T UVU l     �j�i�h�j  �i  �h  V WXW i  � �YZY I     �g[�f
�g .Mth:Tananull���     doub[ o      �e�e 0 x  �f  Z Q     *\]^\ k    __ `a` r    bcb c    ded o    �d�d 0 x  e m    �c
�c 
nmbrc o      �b�b 0 x  a f�af L   	 gg I   	 �`h�_�` 	0 _asin  h i�^i ^   
 jkj o   
 �]�] 0 x  k l   l�\�[l a    mnm l   o�Z�Yo [    pqp ]    rsr o    �X�X 0 x  s o    �W�W 0 x  q m    �V�V �Z  �Y  n m    tt ?�      �\  �[  �^  �_  �a  ] R      �Uuv
�U .ascrerr ****      � ****u o      �T�T 0 etext eTextv �Swx
�S 
errnw o      �R�R 0 enumber eNumberx �Qyz
�Q 
eroby o      �P�P 0 efrom eFromz �O{�N
�O 
errt{ o      �M�M 
0 eto eTo�N  ^ I     *�L|�K�L 
0 _error  | }~} m   ! " ���  a t a n~ ��� o   " #�J�J 0 etext eText� ��� o   # $�I�I 0 enumber eNumber� ��� o   $ %�H�H 0 efrom eFrom� ��G� o   % &�F�F 
0 eto eTo�G  �K  X ��� l     �E�D�C�E  �D  �C  � ��� l     �B�A�@�B  �A  �@  � ��� l     �?���?  �  -----   � ��� 
 - - - - -� ��� l     �>���>  �   hyperbolic   � ���    h y p e r b o l i c� ��� l     �=�<�;�=  �<  �;  � ��� i  � ���� I     �:��9
�: .Mth:Sinhnull���     doub� o      �8�8 0 x  �9  � Q     .���� k    �� ��� r    ��� c    ��� o    �7�7 0 x  � m    �6
�6 
nmbr� o      �5�5 0 x  � ��4� L   	 �� ]   	 ��� m   	 
�� ?�      � l  
 ��3�2� \   
 ��� a   
 ��� o   
 �1�1 	0 __e__  � o    �0�0 0 x  � a    ��� o    �/�/ 	0 __e__  � d    �� o    �.�. 0 x  �3  �2  �4  � R      �-��
�- .ascrerr ****      � ****� o      �,�, 0 etext eText� �+��
�+ 
errn� o      �*�* 0 enumber eNumber� �)��
�) 
erob� o      �(�( 0 efrom eFrom� �'��&
�' 
errt� o      �%�% 
0 eto eTo�&  � I   $ .�$��#�$ 
0 _error  � ��� m   % &�� ��� 
 a s i n h� ��� o   & '�"�" 0 etext eText� ��� o   ' (�!�! 0 enumber eNumber� ��� o   ( )� �  0 efrom eFrom� ��� o   ) *�� 
0 eto eTo�  �#  � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  � ���� I     ���
� .Mth:Coshnull���     doub� o      �� 0 x  �  � Q     .���� k    �� ��� r    ��� c    ��� o    �� 0 x  � m    �
� 
nmbr� o      �� 0 x  � ��� L   	 �� ]   	 ��� m   	 
�� ?�      � l  
 ���� [   
 ��� a   
 ��� o   
 �� 	0 __e__  � o    �� 0 x  � a    ��� o    �� 	0 __e__  � d    �� o    �� 0 x  �  �  �  � R      �
��
�
 .ascrerr ****      � ****� o      �	�	 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � I   $ .��� � 
0 _error  � ��� m   % &�� ��� 
 a c o s h� ��� o   & '���� 0 etext eText� ��� o   ' (���� 0 enumber eNumber� ��� o   ( )���� 0 efrom eFrom� ���� o   ) *���� 
0 eto eTo��  �   � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � �   I     ����
�� .Mth:Tanhnull���     doub o      ���� 0 x  ��   Q     = k    +  r    	
	 c     o    ���� 0 x   m    ��
�� 
nmbr
 o      ���� 0 x   �� L   	 + ^   	 * l  	 ���� \   	  a   	  o   	 ���� 	0 __e__   o    ���� 0 x   a     o    ���� 	0 __e__   d     o    ���� 0 x  ��  ��   l   )���� [    ) a      o    ���� 	0 __e__   o    ���� 0 x   a     ( o     %���� 	0 __e__   d   % '   o   % &���� 0 x  ��  ��  ��   R      ��!"
�� .ascrerr ****      � ****! o      ���� 0 etext eText" ��#$
�� 
errn# o      ���� 0 enumber eNumber$ ��%&
�� 
erob% o      ���� 0 efrom eFrom& ��'��
�� 
errt' o      ���� 
0 eto eTo��   I   3 =��(���� 
0 _error  ( )*) m   4 5++ �,, 
 a t a n h* -.- o   5 6���� 0 etext eText. /0/ o   6 7���� 0 enumber eNumber0 121 o   7 8���� 0 efrom eFrom2 3��3 o   8 9���� 
0 eto eTo��  ��  � 454 l     ��������  ��  ��  5 676 l     ��������  ��  ��  7 898 l     ��:;��  : J D--------------------------------------------------------------------   ; �<< � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -9 =>= l     ��?@��  ?   Logarithms   @ �AA    L o g a r i t h m s> BCB l     ��������  ��  ��  C DED i  � �FGF I      ��H���� 
0 _frexp  H I��I o      ���� 0 m  ��  ��  G k     nJJ KLK Z    MN����M =    OPO o     ���� 0 m  P m    ����  N L    QQ J    
RR STS m    UU         T V��V m    ����  ��  ��  ��  L WXW r    YZY A    [\[ o    ���� 0 m  \ m    ����  Z o      ���� 0 isneg isNegX ]^] Z   "_`����_ o    ���� 0 isneg isNeg` r    aba d    cc o    ���� 0 m  b o      ���� 0 m  ��  ��  ^ ded r   # &fgf m   # $����  g o      ���� 0 e  e hih W   ' [jkj Z   7 Vlm��nl @   7 :opo o   7 8���� 0 m  p m   8 9���� m k   = Hqq rsr r   = Btut ^   = @vwv o   = >���� 0 m  w m   > ?���� u o      ���� 0 m  s x��x r   C Hyzy [   C F{|{ o   C D���� 0 e  | m   D E���� z o      ���� 0 e  ��  ��  n k   K V}} ~~ r   K P��� ]   K N��� o   K L���� 0 m  � m   L M���� � o      ���� 0 m   ���� r   Q V��� \   Q T��� o   Q R���� 0 e  � m   R S���� � o      ���� 0 e  ��  k F   + 6��� @   + .��� o   + ,���� 0 m  � m   , -�� ?�      � A   1 4��� o   1 2���� 0 m  � m   2 3���� i ��� Z  \ h������� o   \ ]���� 0 isneg isNeg� r   ` d��� d   ` b�� o   ` a���� 0 m  � o      ���� 0 m  ��  ��  � ���� L   i n�� J   i m�� ��� o   i j���� 0 m  � ���� o   j k���� 0 e  ��  ��  E ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I      ������� 	0 _logn  � ���� o      ���� 0 x  ��  ��  � k    ;�� ��� Z    ������� B     ��� o     ���� 0 x  � m    ����  � R    ����
�� .ascrerr ****      � ****� m   
 �� ��� 8 I n v a l i d   n u m b e r   ( m u s t   b e   > 0 ) .� �����
�� 
errn� m    	�����Y��  ��  ��  � ��� r    &��� I      ������� 
0 _frexp  � ���� o    ���� 0 x  ��  ��  � J      �� ��� o      �� 0 x  � ��~� o      �}�} 0 e  �~  � ��� Z   '8���|�� G   ' 2��� A   ' *��� o   ' (�{�{ 0 e  � m   ( )�z�z��� ?   - 0��� o   - .�y�y 0 e  � m   . /�x�x � k   5 ��� ��� Z   5 ^���w�� A   5 8��� o   5 6�v�v 0 x  � m   6 7�� ?栞fK�� l  ; N���� k   ; N�� ��� r   ; @��� \   ; >��� o   ; <�u�u 0 e  � m   < =�t�t � o      �s�s 0 e  � ��� r   A F��� \   A D��� o   A B�r�r 0 x  � m   B C�� ?�      � o      �q�q 0 z  � ��p� r   G N��� [   G L��� ]   G J��� m   G H�� ?�      � o   H I�o�o 0 z  � m   J K�� ?�      � o      �n�n 0 y  �p  �   (2 ^ 0.5) / 2   � ���    ( 2   ^   0 . 5 )   /   2�w  � k   Q ^�� ��� r   Q V��� \   Q T��� o   Q R�m�m 0 x  � m   R S�l�l � o      �k�k 0 z  � ��j� r   W ^��� [   W \��� ]   W Z��� m   W X�� ?�      � o   X Y�i�i 0 x  � m   Z [�� ?�      � o      �h�h 0 y  �j  � ��� r   _ d��� ^   _ b   o   _ `�g�g 0 z   o   ` a�f�f 0 y  � o      �e�e 0 x  �  r   e j ]   e h o   e f�d�d 0 x   o   f g�c�c 0 x   o      �b�b 0 z   	 r   k �

 ^   k � ]   k x ]   k n o   k l�a�a 0 x   o   l m�`�` 0 z   l  n w�_�^ \   n w ]   n u l  n s�]�\ [   n s ]   n q m   n o ��D=�l� o   o p�[�[ 0 z   m   q r @0b�s{��]  �\   o   s t�Z�Z 0 z   m   u v @P	"*?�_  �^   l  x ��Y�X \   x � !  ]   x �"#" l  x $�W�V$ [   x %&% ]   x }'(' l  x {)�U�T) \   x {*+* o   x y�S�S 0 z  + m   y z,, @A�C�l��U  �T  ( o   { |�R�R 0 z  & m   } ~-- @s��*�
�W  �V  # o    ��Q�Q 0 z  ! m   � �.. @���?;�Y  �X   o      �P�P 0 z  	 /0/ r   � �121 o   � ��O�O 0 e  2 o      �N�N 0 y  0 3�M3 r   � �454 [   � �676 [   � �898 \   � �:;: o   � ��L�L 0 z  ; ]   � �<=< o   � ��K�K 0 y  = m   � �>> ?+�\a�9 o   � ��J�J 0 x  7 ]   � �?@? o   � ��I�I 0 e  @ m   � �AA ?�0     5 o      �H�H 0 z  �M  �|  � k   �8BB CDC Z   � �EF�GGE A   � �HIH o   � ��F�F 0 x  I m   � �JJ ?栞fK�F l  � �KLMK k   � �NN OPO r   � �QRQ \   � �STS o   � ��E�E 0 e  T m   � ��D�D R o      �C�C 0 e  P U�BU r   � �VWV \   � �XYX ]   � �Z[Z m   � ��A�A [ o   � ��@�@ 0 x  Y m   � ��?�? W o      �>�> 0 x  �B  L   (2 ^ 0.5) / 2   M �\\    ( 2   ^   0 . 5 )   /   2�G  G r   � �]^] \   � �_`_ o   � ��=�= 0 x  ` m   � ��<�< ^ o      �;�; 0 x  D aba r   � �cdc ]   � �efe o   � ��:�: 0 x  f o   � ��9�9 0 x  d o      �8�8 0 z  b ghg r   �iji ^   �klk ]   � �mnm ]   � �opo o   � ��7�7 0 x  p o   � ��6�6 0 z  n l  � �q�5�4q [   � �rsr ]   � �tut l  � �v�3�2v [   � �wxw ]   � �yzy l  � �{�1�0{ [   � �|}| ]   � �~~ l  � ���/�.� [   � ���� ]   � ���� l  � ���-�,� [   � ���� ]   � ���� m   � ��� ?���� o   � ��+�+ 0 x  � m   � ��� ?���?Vd��-  �,  � o   � ��*�* 0 x  � m   � ��� @Һ�i��/  �.   o   � ��)�) 0 x  } m   � ��� @,�r�>���1  �0  z o   � ��(�( 0 x  x m   � ��� @1�֒K�R�3  �2  u o   � ��'�' 0 x  s m   � ��� @�c}~ݝ�5  �4  l l  ���&�%� [   ���� ]   � ���� l  � ���$�#� [   � ���� ]   � ���� l  � ���"�!� [   � ���� ]   � ���� l  � ��� �� [   � ���� ]   � ���� l  � ����� [   � ���� o   � ��� 0 x  � m   � ��� @&� ����  �  � o   � ��� 0 x  � m   � ��� @F�,N��   �  � o   � ��� 0 x  � m   � ��� @T�3�&���"  �!  � o   � ��� 0 x  � m   � ��� @Q���^��$  �#  � o   � ��� 0 x  � m   � �� @7 
�&5�&  �%  j o      �� 0 y  h ��� Z  ����� >  ��� o  �� 0 e  � m  ��  � r  ��� \  ��� o  �� 0 y  � ]  ��� o  �� 0 e  � m  �� ?+�\a�� o      �� 0 y  �  �  � ��� r  ��� \  ��� o  �� 0 y  � l ���� ^  ��� o  �� 0 z  � m  �� �  �  � o      �
�
 0 y  � ��� r  $��� [  "��� o   �	�	 0 x  � o   !�� 0 y  � o      �� 0 z  � ��� Z %8����� >  %(��� o  %&�� 0 e  � m  &'��  � r  +4��� [  +2��� o  +,�� 0 z  � ]  ,1��� o  ,-� �  0 e  � m  -0�� ?�0     � o      ���� 0 z  �  �  �  � ���� L  9;�� o  9:���� 0 z  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Mth:Lognnull���     doub� o      ���� 0 x  ��  � Q     ���� L    �� I    ������� 	0 _logn  � ���� c    ��� o    ���� 0 x  � m    ��
�� 
nmbr��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I    ������� 
0 _error  � ��� m    �� ���  l o g n� ��� o    ���� 0 etext eText� ��� o    ���� 0 enumber eNumber� ��� o    ���� 0 efrom eFrom� ���� o    ���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  �    i  � � I     ����
�� .Mth:Lo10null���     doub o      ���� 0 x  ��   Q     $ l   	
 L     ^     ]     l   ���� ^     I    ������ 	0 _logn   �� c     o    ���� 0 x   m    ��
�� 
nmbr��  ��   m     @k���T���  ��   m     @r�      m     @r�    j	   correct for minor drift   
 � 0   c o r r e c t   f o r   m i n o r   d r i f t R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber �� 
�� 
erob o      ���� 0 efrom eFrom  ��!��
�� 
errt! o      ���� 
0 eto eTo��   I    $��"���� 
0 _error  " #$# m    %% �&& 
 l o g 1 0$ '(' o    ���� 0 etext eText( )*) o    ���� 0 enumber eNumber* +,+ o    ���� 0 efrom eFrom, -��- o     ���� 
0 eto eTo��  ��   ./. l     ��������  ��  ��  / 010 l     ��������  ��  ��  1 232 i  � �454 I     ��67
�� .Mth:Logbnull���     doub6 o      ���� 0 x  7 ��8��
�� 
Base8 o      ���� 0 b  ��  5 Q     '9:;9 L    << ^    =>= I    ��?���� 	0 _logn  ? @��@ c    ABA o    ���� 0 x  B m    ��
�� 
nmbr��  ��  > l   C����C I    ��D���� 	0 _logn  D E��E c    FGF o    ���� 0 b  G m    ��
�� 
nmbr��  ��  ��  ��  : R      ��HI
�� .ascrerr ****      � ****H o      ���� 0 etext eTextI ��JK
�� 
errnJ o      ���� 0 enumber eNumberK ��LM
�� 
erobL o      ���� 0 efrom eFromM ��N��
�� 
errtN o      ���� 
0 eto eTo��  ; I    '��O���� 
0 _error  O PQP m    RR �SS  l o g bQ TUT o     ���� 0 etext eTextU VWV o     !���� 0 enumber eNumberW XYX o   ! "���� 0 efrom eFromY Z��Z o   " #���� 
0 eto eTo��  ��  3 [\[ l     ��������  ��  ��  \ ]��] l     ������  �  �  ��       &�^_`a h rbcdefghijklmnopqrstuvwxyz{|}~��  ^ $���������������~�}�|�{�z�y�x�w�v�u�t�s�r�q�p�o�n�m�l�k�j�i
� 
pimr� 0 _support  � 
0 _error  � 	0 __e__  � 0 _isequaldelta _isEqualDelta� (0 _asintegerproperty _asIntegerProperty� ,0 _makenumberformatter _makeNumberFormatter� "0 _setbasicformat _setBasicFormat�  0 _nameforformat _nameForFormat
� .Mth:FNumnull���     nmbr
� .Mth:PNumnull���     ctxt
� .Mth:NuHenull���     ****
� .Mth:HeNunull���     ctxt
� .Mth:DeRanull���     doub
�~ .Mth:RaDenull���     doub
�} .Mth:Abs_null���     nmbr
�| .Mth:CmpNnull���     ****
�{ .Mth:MinNnull���     ****
�z .Mth:MaxNnull���     ****
�y .Mth:RouNnull���     nmbr�x 0 _sin  
�w .Mth:Sin_null���     doub
�v .Mth:Cos_null���     doub
�u .Mth:Tan_null���     doub�t 	0 _asin  
�s .Mth:Sinanull���     doub
�r .Mth:Cosanull���     doub
�q .Mth:Tananull���     doub
�p .Mth:Sinhnull���     doub
�o .Mth:Coshnull���     doub
�n .Mth:Tanhnull���     doub�m 
0 _frexp  �l 	0 _logn  
�k .Mth:Lognnull���     doub
�j .Mth:Lo10null���     doub
�i .Mth:Logbnull���     doub_ �h��h �  ��� �g��f
�g 
cobj� ��   �e 
�e 
frmk�f  � �d��c
�d 
cobj� ��   �b
�b 
osax�c  ` ��   �a /
�a 
scpta �` 7�_�^���]�` 
0 _error  �_ �\��\ �  �[�Z�Y�X�W�[ 0 handlername handlerName�Z 0 etext eText�Y 0 enumber eNumber�X 0 efrom eFrom�W 
0 eto eTo�^  � �V�U�T�S�R�V 0 handlername handlerName�U 0 etext eText�T 0 enumber eNumber�S 0 efrom eFrom�R 
0 eto eTo�  G�Q�P�Q �P &0 throwcommanderror throwCommandError�] b  ࠡ����+ b �O ��N�M���L�O (0 _asintegerproperty _asIntegerProperty�N �K��K �  �J�I�H�J 0 thevalue theValue�I 0 propertyname propertyName�H 0 minvalue minValue�M  � �G�F�E�D�G 0 thevalue theValue�F 0 propertyname propertyName�E 0 minvalue minValue�D 0 n  � 	�C�B�A�@�?�>� � �
�C 
long
�B 
doub
�A 
bool
�@ 
errn�?�Y�>  � �=�<�;
�= 
errn�<�Y�;  �L 9 (��&E�O���&
 ���& )��lhY hO�W X  )��l�%�%c �: ��9�8���7�: ,0 _makenumberformatter _makeNumberFormatter�9 �6��6 �  �5�4�3�5 0 formatstyle formatStyle�4 0 
localecode 
localeCode�3 0 defaultstyle defaultStyle�8  � �2�1�0�/�.�-�,�2 0 formatstyle formatStyle�1 0 
localecode 
localeCode�0 0 defaultstyle defaultStyle�/ 0 asocformatter asocFormatter�. 0 formatrecord formatRecord�- 0 s  �, 0 etext eText� F�+�*�)�(�'�&�%�$�#�"�!� ����������+��A�Z��x�������
���	���������� ��������������W�g��t�����������
�+ misccura�* &0 nsnumberformatter NSNumberFormatter�) 	0 alloc  �( 0 init  
�' 
kocl
�& 
reco
�% .corecnte****       ****
�$ 
pcls
�# 
MthR
�" 
MthA�! 0 requiredvalue RequiredValue
�  
MthB
� 
msng
� 
MthC
� 
MthD
� 
MthE
� 
MthF
� 
MthG
� 
MthH� � 60 asoptionalrecordparameter asOptionalRecordParameter� "0 _setbasicformat _setBasicFormat� (0 _asintegerproperty _asIntegerProperty� 60 setminimumfractiondigits_ setMinimumFractionDigits_� 60 setmaximumfractiondigits_ setMaximumFractionDigits_� <0 setminimumsignificantdigits_ setMinimumSignificantDigits_� 60 setusessignificantdigits_ setUsesSignificantDigits_� <0 setmaximumsignificantdigits_ setMaximumSignificantDigits_
� 
ctxt
� 
leng
� 
errn��Y� ,0 setdecimalseparator_ setDecimalSeparator_�
  � ������
�� 
errn���\��  �	 60 setusesgroupingseparator_ setUsesGroupingSeparator_� .0 setgroupingseparator_ setGroupingSeparator_
� MRndRNhE� @0 nsnumberformatterroundhalfeven NSNumberFormatterRoundHalfEven� $0 setroundingmode_ setRoundingMode_
� MRndRNhT� @0 nsnumberformatterroundhalfdown NSNumberFormatterRoundHalfDown
� MRndRNhF� <0 nsnumberformatterroundhalfup NSNumberFormatterRoundHalfUp
�  MRndRN_T�� 80 nsnumberformatterrounddown NSNumberFormatterRoundDown
�� MRndRN_F�� 40 nsnumberformatterroundup NSNumberFormatterRoundUp
�� MRndRN_U�� >0 nsnumberformatterroundceiling NSNumberFormatterRoundCeiling
�� MRndRN_D�� :0 nsnumberformatterroundfloor NSNumberFormatterRoundFloor� ������
�� 
errn���Y��  �� 0 etext eText
�� 
enum�� �� .0 throwinvalidparameter throwInvalidParameter�� *0 asnslocaleparameter asNSLocaleParameter�� 0 
setlocale_ 
setLocale_�7���,j+ j+ E�O^�kv��l k 4b  ����b  �,��������a �a �a �a a m+ E�O*���,�m+ O��,� �*��,a jm+ k+ Y hO��,� �*��,a jm+ k+ Y hO��,� �*��,a jm+ k+ O�ek+ Y hO��,� �*��,a jm+ k+  O�ek+ Y hO�a ,� G 0�a ,a !&E�O�a ",j  )a #a $lhY hO��k+ %W X & ')a #a $la (Y hO�a ,� H 1�a ,a !&E�O�a ",j  �fk+ )Y �ek+ )O��k+ *W X & ')a #a $la +Y hO�a ,� ��a ,a ,  ��a -,k+ .Y ��a ,a /  ��a 0,k+ .Y ��a ,a 1  ��a 2,k+ .Y r�a ,a 3  ��a 4,k+ .Y Y�a ,a 5  ��a 6,k+ .Y @�a ,a 7  ��a 8,k+ .Y '�a ,a 9  ��a :,k+ .Y )a #a $la ;Y hY  *���m+ W X & <)ja =W X > <b  �a ?�a @lv�a A+ BO�b  �a Cl+ Dk+ EO�d ������������� "0 _setbasicformat _setBasicFormat�� ����� �  �������� 0 asocformatter asocFormatter�� 0 
formatname 
formatName�� 0 defaultstyle defaultStyle��  � �������� 0 asocformatter asocFormatter�� 0 
formatname 
formatName�� 0 defaultstyle defaultStyle� ��������������������������������������������������
�� MthZMth0�� "0 setnumberstyle_ setNumberStyle_
�� MthZMth3
�� misccura�� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle
�� MthZMth1�� 40 nsnumberformatternostyle NSNumberFormatterNoStyle
�� MthZMth2�� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle
�� MthZMth5�� @0 nsnumberformattercurrencystyle NSNumberFormatterCurrencyStyle
�� MthZMth4�� >0 nsnumberformatterpercentstyle NSNumberFormatterPercentStyle
�� MthZMth6�� @0 nsnumberformatterspelloutstyle NSNumberFormatterSpellOutStyle
�� 
kocl
�� 
ctxt
�� .corecnte****       ****�� 0 
setformat_ 
setFormat_
�� 
errn���Y
�� 
erob
�� 
errt
�� 
enum�� �� ���  ��k+ Y ���  ���,k+ Y ���  ���,k+ Y w��  ���,k+ Y f��  ���,k+ Y U��  ���,k+ Y D��  ���,k+ Y 3�kv�a l j ��k+ Y )a a a �a a a a e ��,����������  0 _nameforformat _nameForFormat�� ����� �  ���� 0 formatstyle formatStyle��  � ���� 0 formatstyle formatStyle� ��9��B�K�T�]�eln
�� MthZMth1
�� MthZMth2
� MthZMth5
� MthZMth4
� MthZMth3
� MthZMth6�� I��  �Y ?��  �Y 4��  �Y )��  �Y ��  �Y ��  �Y �%�%f ������
� .Mth:FNumnull���     nmbr� 0 	thenumber 	theNumber� ���
� 
Usin� {���� 0 formatstyle formatStyle�  
� MthZMth0� ���
� 
Loca� {���� 0 
localecode 
localeCode�  �  � 
����������� 0 	thenumber 	theNumber� 0 formatstyle formatStyle� 0 
localecode 
localeCode� 0 defaultstyle defaultStyle� 0 asocformatter asocFormatter� 0 
asocstring 
asocString� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�  ������������������������������
� 
kocl
� 
nmbr
� .corecnte****       ****� � 60 throwinvalidparametertype throwInvalidParameterType
� MthZMth0
� 
pcls
� 
long
� misccura� 40 nsnumberformatternostyle NSNumberFormatterNoStyle
� 
bool� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle
� 
msng� ,0 _makenumberformatter _makeNumberFormatter� &0 stringfromnumber_ stringFromNumber_
� 
errn��Y
� 
erob
� 
ctxt� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � � ��kv��l j  b  �����+ Y hO��  F��,�  
��,E�Y 3�	 ���&
 �	 	�a �&�& �a ,E�Y 	�a ,E�Y a E�O*���m+ E�O��k+ E�O�a   )a a a ��a Y hO�a &W X  *a ����a + g �(�����
� .Mth:PNumnull���     ctxt� 0 thetext theText� ���
� 
Usin� {���� 0 formatstyle formatStyle�  
� MthZMth0� ���~
� 
Loca� {�}�|4�} 0 
localecode 
localeCode�|  �~  � 
�{�z�y�x�w�v�u�t�s�r�{ 0 thetext theText�z 0 formatstyle formatStyle�y 0 
localecode 
localeCode�x 0 asocformatter asocFormatter�w 0 
asocnumber 
asocNumber�v $0 localeidentifier localeIdentifier�u 0 etext eText�t 0 enumber eNumber�s 0 efrom eFrom�r 
0 eto eTo� �q�p�oPU�n�m�l�k�j�i�h�g�f�e����d�c�b��a���`�_���^�]
�q 
kocl
�p 
ctxt
�o .corecnte****       ****�n �m 60 throwinvalidparametertype throwInvalidParameterType
�l misccura�k D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle�j ,0 _makenumberformatter _makeNumberFormatter�i &0 numberfromstring_ numberFromString_
�h 
msng�g 
0 locale  �f $0 localeidentifier localeIdentifier
�e 
leng
�d 
errn�c�Y
�b 
erob�a  0 _nameforformat _nameForFormat
�` 
****�_ 0 etext eText� �\�[�
�\ 
errn�[ 0 enumber eNumber� �Z�Y�
�Z 
erob�Y 0 efrom eFrom� �X�W�V
�X 
errt�W 
0 eto eTo�V  �^ �] 
0 _error  � � ��kv��l j  b  �����+ Y hO*����,m+ 	E�O��k+ 
E�O��  N�j+ j+ �&E�O��,j  �E�Y a �%a %E�O)a a a ��a *�k+ %a %�%a %Y hO�a &W X  *a ����a + h �U��T�S���R
�U .Mth:NuHenull���     ****�T 0 	thenumber 	theNumber�S �Q��
�Q 
Plac� {�P�O�N�P 0 	chunksize 	chunkSize�O  �N  � �M��L
�M 
Pref� {�K�J�I�K 0 	hasprefix 	hasPrefix�J  
�I boovfals�L  � �H�G�F�E�D�C�B�A�@�?�>�=�<�;�H 0 	thenumber 	theNumber�G 0 	chunksize 	chunkSize�F 0 	hasprefix 	hasPrefix�E 0 hextext hexText�D 0 	hexprefix 	hexPrefix�C 0 padtext padText�B 0 maxsize maxSize�A 0 
resultlist 
resultList�@ 0 aref aRef�? 0 oldtids oldTIDs�> 0 etext eText�= 0 enumber eNumber�< 0 efrom eFrom�; 
0 eto eTo� >��:�9�8�7�6"�5�4�3;�2@�1�0F�/dot�.�������-�,�
,�+0��*�)�(�'�&�%�ip~����$�#�"���!��� ��: (0 asintegerparameter asIntegerParameter�9 (0 asbooleanparameter asBooleanParameter
�8 
kocl
�7 
list
�6 .corecnte****       ****�5 00 aswholenumberparameter asWholeNumberParameter�4 
�3 
bool
�2 
long�1 �0 .0 throwinvalidparameter throwInvalidParameter�/���. 
�- 
cobj
�, 
leng�+ 0 
resultlist 
resultList� �������
� .ascrinit****      � ****� k     	�� 0��  �  �  � �� 
0 _list_  � ��
� 
cobj� 
0 _list_  � 
b   �-E��* 
0 _list_  
�) 
pcnt
�( 
doub
�' 
errn�&�\�%  � ���
� 
errn��\�  
�$ 
ctxt
�# 
ascr
�" 
txdl�! 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  �  � 
0 _error  �R��b  ��l+ E�Ob  ��l+ E�O�kv��l j b  ��l+ E�O�j
 ���& b  �����+ Y hOa E�O�j I�j	 �a �$�& (b  �a �a a �$%a %a �$k%�+ Y hOa E�O�'E�Y Ca E�O�j	 �a �$k�& (b  �a �a a �$%a %a �$k%�+ Y hO� �a %E�Y hO &h�ja a �a #k/�%E�O�a "E�[OY��O h�a ,�a �%E�[OY��O��%Y{�k
 ���& b  �a  �a !�+ Y hOa "a �$klvE[a k/E�Z[a l/E�ZO �kh�a #%E�[OY��Oa $a %K &S�O ӧa ',[�a l kh  ;�a (,�&E�O��a (,a )&
 �j�&
 ���& )a *a +lhY hW :X , -�� b  �a .�a /a �$k%�+ Y b  �a 0�a 1�+ Oa 2E�O &h�ja 3a �a #k/�%E�O�a "E�[OY��O��%[a 4\[Z�'\Zi2�a (,F[OY�AO_ 5a 6,E�Oa 7_ 5a 6,FO� a 8�a ',%E�Y �a ',a 4&E�O�_ 5a 6,FO�W X 9 :*a ;����a <+ =i ����
���	
� .Mth:HeNunull���     ctxt� 0 hextext hexText�
 ���
� 
Plac� {���� 0 	chunksize 	chunkSize�  �  � ���
� 
Prec� {��� � 0 	isprecise 	isPrecise�  
�  boovtrue�  � �������������������������� 0 hextext hexText�� 0 	chunksize 	chunkSize�� 0 	isprecise 	isPrecise�� 0 	thenumber 	theNumber�� 0 
isnegative 
isNegative�� 0 charref charRef�� 0 i  �� 0 
resultlist 
resultList�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� 2��$������7��<����I��e��w��������������������������������������C�����o������ "0 astextparameter asTextParameter�� (0 asintegerparameter asIntegerParameter�� 
�� 
bool
�� 
long�� �� .0 throwinvalidparameter throwInvalidParameter�� (0 asbooleanparameter asBooleanParameter
�� 
ctxt
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� 
�� misccura
�� 
psof
�� 
psin
�� .sysooffslong    ��� null
�� 
errn���@��  � ������
�� 
errn���@��  ���Y
�� 
erob
�� 
leng�� 0 
resultlist 
resultList� �����������
�� .ascrinit****      � ****� k     �� �����  ��  ��  � ���� 
0 _list_  � ���� 
0 _list_  �� jv��� 
0 _list_  �� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �	cN��Fb  ��l+ E�Ob  ��l+ E�O�j
 ���& b  �����+ Y hOb  ��l+ E�O�j  � �jE�O��E�O� �[a \[Zl\Zi2E�Y hO�a  �[a \[Zm\Zi2E�Y hO U�[a a l kh �a  E�Oa  *a �a a � UE�O�j  )a a lhY hO��kE�[OY��W X  )a a a  ��a !O�	 	��k �& )a a a  ��a "Y hO� 	�'E�Y hO�Y�a #,�#j )a a a  ��a $�%a %%Y hOa &a 'K (S�O �k�a #,E�h jE�O |�[a \[Z�\Z��k2[a a l kh �a  E�Oa  *a �a a )� UE�O�j  &)a a a  �[a \[Z�\Z��k2�a *Y hO��kE�[OY��O�	 	��k �& &)a a a  �[a \[Z�\Z��k2�a +Y hO��a ,,6F[OY�<O�a ,,EVW X - .*a /����a 0+ 1j �����������
�� .Mth:DeRanull���     doub�� 0 x  ��  � ���������� 0 x  �� 0 etext eText�� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� ��������
� 
doub
� 
pi  � �� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  ��  ��&��! W X  *塢���+ k �������
� .Mth:RaDenull���     doub� 0 x  �  � ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� ��������
� 
doub
� 
pi  � �� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �  ��&��!!W X  *塢���+ l �������
� .Mth:Abs_null���     nmbr� 0 x  �  � ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� ������
� 
nmbr� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � * ��&E�O�j �'Y �W X  *㡢���+ m �	�����
� .Mth:CmpNnull���     ****� ��� �  ��� 0 n1  � 0 n2  �  � 	��~�}�|�{�z�y�x�w� 0 n1  �~ 0 n2  �} 0 dn  �| 0 dm  �{ 0 d  �z 0 etext eText�y 0 enumber eNumber�x 0 efrom eFrom�w 
0 eto eTo� �v�u�t�s�r�q�p�	��o�n
�v 
kocl
�u 
long
�t .corecnte****       ****
�s 
doub
�r 
cobj
�q 
bool�p 0 etext eText� �m�l�
�m 
errn�l 0 enumber eNumber� �k�j�
�k 
erob�j 0 efrom eFrom� �i�h�g
�i 
errt�h 
0 eto eTo�g  �o �n 
0 _error  � � ���lv��l l  ��  jY hY s��&��&lvE[�k/E�Z[�l/E�ZO�j  b  � E�Y b  � E�O�'E�O�� ��lvE[�k/E�Z[�l/E�ZY hO��E�O��	 ���& jY hO�� iY kW X  *襦���+ 
n �f	��e�d���c
�f .Mth:MinNnull���     ****�e 0 thelist theList�d  � 	�b�a�`�_�^�]�\�[�Z�b 0 thelist theList�a 0 
listobject 
listObject�` 0 	theresult 	theResult�_ 0 aref aRef�^ 0 x  �] 0 etext eText�\ 0 enumber eNumber�[ 0 efrom eFrom�Z 
0 eto eTo� �Y	���X�W�V�U�T�S�R�	��Q�P�Y 0 
listobject 
listObject� �O��N�M���L
�O .ascrinit****      � ****� k     �� 	��K�K  �N  �M  � �J�J 
0 _list_  � �I�H�I "0 aslistparameter asListParameter�H 
0 _list_  �L b  b   k+  ��X 
0 _list_  
�W 
cobj
�V 
nmbr
�U 
kocl
�T .corecnte****       ****
�S 
pcnt�R 0 etext eText� �G�F�
�G 
errn�F 0 enumber eNumber� �E�D�
�E 
erob�D 0 efrom eFrom� �C�B�A
�C 
errt�B 
0 eto eTo�A  �Q �P 
0 _error  �c X G��K S�O��,�k/�&E�O +��,[��l kh ��,�&E�O�� �E�Y h[OY��O�W X 	 
*륦���+ o �@	��?�>���=
�@ .Mth:MaxNnull���     ****�? 0 thelist theList�>  � 	�<�;�:�9�8�7�6�5�4�< 0 thelist theList�; 0 
listobject 
listObject�: 0 	theresult 	theResult�9 0 aref aRef�8 0 x  �7 0 etext eText�6 0 enumber eNumber�5 0 efrom eFrom�4 
0 eto eTo� �3	���2�1�0�/�.�-�,�
�+�*�3 0 
listobject 
listObject� �)��(�'���&
�) .ascrinit****      � ****� k     �� 	��%�%  �(  �'  � �$�$ 
0 _list_  � �#�"�# "0 aslistparameter asListParameter�" 
0 _list_  �& b  b   k+  ��2 
0 _list_  
�1 
cobj
�0 
nmbr
�/ 
kocl
�. .corecnte****       ****
�- 
pcnt�, 0 etext eText� �!� �
�! 
errn�  0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  �+ �* 
0 _error  �= X G��K S�O��,�k/�&E�O +��,[��l kh ��,�&E�O�� �E�Y h[OY��O�W X 	 
*륦���+ p �
)�����
� .Mth:RouNnull���     nmbr� 0 num  � ���
� 
Plac� {���� 0 decimalplaces decimalPlaces�  �  � ���
� 
Dire� {���� &0 roundingdirection roundingDirection�  
� MRndRNhE�  � ����
�	���� 0 num  � 0 decimalplaces decimalPlaces� &0 roundingdirection roundingDirection�
 0 themultiplier theMultiplier�	 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� 
C�
O���
}

��
�� ���������������������� "0 asrealparameter asRealParameter� (0 asintegerparameter asIntegerParameter� 

� MRndRNhE
� MRndRNhT
�  MRndRNhF
�� MRndRN_T
�� MRndRN_F
�� MRndRN_U
�� 
bool
�� MRndRN_D�� >0 throwinvalidconstantparameter throwInvalidConstantParameter�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ���b  ��l+ E�Ob  ��l+ E�O�j �$E�O�� � �!E�Y hO��  3��lv�l!k#kv 
�k"E�Y �j ��k"E�Y 	��k"E�Y��  1��lv�k#kv 
�k"E�Y �j ��k"E�Y 	��k"E�Y ��  C��lv�k#kv �j �k"kE�Y 	�k"kE�Y �j ��k"E�Y 	��k"E�Y ���  
�k"E�Y ���  ,�k#j  
�k"E�Y �j �k"kE�Y 	�k"kE�Y a��  $�j
 	�k#j �& 
�k"E�Y 	�k"kE�Y 9�a   $�j
 	�k#j �& 
�k"E�Y 	�k"kE�Y b  �a l+ O�j  	�k"Y �j 	��"Y ��!W X  *a ����a + q ������������� 0 _sin  �� ����� �  ���� 0 x  ��  � �������������� 0 x  �� 0 isneg isNeg�� 0 y  �� 0 z  �� 0 z2  �� 0 zz  � ������������NQT��l��������������h
�� 
pi  �� ��� �� �� 
�� 
bool�� ��#��! E�O�jE�O� 	�'E�Y hO���! k"E�O��� k"� E�O�l#k  �kE�O�kE�Y hO��#E�O�m �E�O��E�Y hO��� �� �� E�O�� E�O�k 
 �l �& *�l!�� � �� �� �� a � a  E�Y +��� a � a � a � a � a � a  E�O� 	�'E�Y hO�r �����������
�� .Mth:Sin_null���     doub�� 0 x  ��  � ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ������������
�� 
nmbr�� 0 _sin  �� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ��  *��&k+ W X  *䡢���+ s ������� ��
�� .Mth:Cos_null���     doub�� 0 x  ��    ����������� 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom� 
0 eto eTo ������
� 
nmbr� Z� 0 _sin  � 0 etext eText ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� ! *��&�k+ W X  *塢���+ t ����
� .Mth:Tan_null���     doub� 0 x  �   
����������� 0 x  � 0 isneg isNeg� 0 y  � 0 z  � 0 z2  � 0 zz  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo ��������8���t�����������������
� 
nmbr� Z�
� 
bool
� 
errn��s
� 
erob� �h
� 
pi  � �� � � 0 etext eText ��
� 
errn� 0 enumber eNumber ��	
� 
erob� 0 efrom eFrom	 ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � ��&E�O�� 
 �� �& )�����Y hO��#��! E�O�jE�O� 	�'E�Y hO���!!k"E�O��� k"� E�O�l#k  �kE�O�kE�Y hO��� �� �a  E�O�� E�O�a  4��� a � a � a  �a � a � a � a !E�Y �E�O�l 
 	�a  �& 
i�!E�Y hO� 	�'E�Y hO�W X  *a ����a + u ���
�� 	0 _asin  � ��   �� 0 x  �  
 ������ 0 x  � 0 isneg isNeg� 0 zz  � 0 p  � 0 z   ����~1>bcdefyz{|��}��������������|
� 
errn��Y
� 
erob�~ 
�} 
pi  �| �� ��jE�O� 	�'E�Y hO�k )�����Y hO�� Xk�E�O�� �� �� �� � ��� �� �� �!E�O���$E�O_ �!�E�O�� a E�O��_ �!E�Y ]�a  �E�Y O�� E�O�a � a � a � a � a � a  �a � a � a � a � a !� �E�O� 	�'E�Y hO�_ a !!v �{�z�y�x
�{ .Mth:Sinanull���     doub�z 0 x  �y   �w�v�u�t�s�w 0 x  �v 0 etext eText�u 0 enumber eNumber�t 0 efrom eFrom�s 
0 eto eTo �r�q�p#�o�n
�r 
nmbr�q 	0 _asin  �p 0 etext eText �m�l
�m 
errn�l 0 enumber eNumber �k�j
�k 
erob�j 0 efrom eFrom �i�h�g
�i 
errt�h 
0 eto eTo�g  �o �n 
0 _error  �x  *��&k+ W X  *䡢���+ w �f3�e�d�c
�f .Mth:Cosanull���     doub�e 0 x  �d   �b�a�`�_�^�b 0 x  �a 0 etext eText�` 0 enumber eNumber�_ 0 efrom eFrom�^ 
0 eto eTo �]�\�[�ZJ�Y�X�] Z
�\ 
nmbr�[ 	0 _asin  �Z 0 etext eText �W�V
�W 
errn�V 0 enumber eNumber �U�T
�U 
erob�T 0 efrom eFrom �S�R�Q
�S 
errt�R 
0 eto eTo�Q  �Y �X 
0 _error  �c ! �*��&k+ W X  *塢���+ x �PZ�O�N�M
�P .Mth:Tananull���     doub�O 0 x  �N   �L�K�J�I�H�L 0 x  �K 0 etext eText�J 0 enumber eNumber�I 0 efrom eFrom�H 
0 eto eTo �Gt�F�E�D�C
�G 
nmbr�F 	0 _asin  �E 0 etext eText �B�A
�B 
errn�A 0 enumber eNumber �@�?
�@ 
erob�? 0 efrom eFrom �>�=�<
�> 
errt�= 
0 eto eTo�<  �D �C 
0 _error  �M + ��&E�O*��� k�$!k+ W X  *塢���+ y �;��:�9�8
�; .Mth:Sinhnull���     doub�: 0 x  �9   �7�6�5�4�3�7 0 x  �6 0 etext eText�5 0 enumber eNumber�4 0 efrom eFrom�3 
0 eto eTo �2��1��0�/
�2 
nmbr�1 0 etext eText �.�-
�. 
errn�- 0 enumber eNumber �,�+ 
�, 
erob�+ 0 efrom eFrom  �*�)�(
�* 
errt�) 
0 eto eTo�(  �0 �/ 
0 _error  �8 / ��&E�O�b  �$b  �'$ W X  *䡢���+ z �'��&�%!"�$
�' .Mth:Coshnull���     doub�& 0 x  �%  ! �#�"�!� ��# 0 x  �" 0 etext eText�! 0 enumber eNumber�  0 efrom eFrom� 
0 eto eTo" ���#���
� 
nmbr� 0 etext eText# ��$
� 
errn� 0 enumber eNumber$ ��%
� 
erob� 0 efrom eFrom% ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �$ / ��&E�O�b  �$b  �'$ W X  *䡢���+ { ���&'�
� .Mth:Tanhnull���     doub� 0 x  �  & ������ 0 x  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo' �
�	(+��
�
 
nmbr�	 0 etext eText( ��)
� 
errn� 0 enumber eNumber) ��*
� 
erob� 0 efrom eFrom* ��� 
� 
errt� 
0 eto eTo�   � � 
0 _error  � > -��&E�Ob  �$b  �'$b  �$b  �'$!W X  *㡢���+ | ��G����+,���� 
0 _frexp  �� ��-�� -  ���� 0 m  ��  + �������� 0 m  �� 0 isneg isNeg�� 0 e  , U���
�� 
bool�� o�j  
�jlvY hO�jE�O� 	�'E�Y hOjE�O 3h��	 �k�&�k �l!E�O�kE�Y �l E�O�kE�[OY��O� 	�'E�Y hO��lv} �������./���� 	0 _logn  �� ��0�� 0  ���� 0 x  ��  . ���������� 0 x  �� 0 e  �� 0 z  �� 0 y  / ���������������,-.>A�����������
�� 
errn���Y�� 
0 _frexp  
�� 
cobj����
�� 
bool��<�j )��l�Y hO*�k+ E[�k/E�Z[�l/E�ZO��
 �l�& j�� �kE�O��E�O� �E�Y �kE�O� �E�O��!E�O�� E�O�� � �� � ��� �� �!E�O�E�O��� ��a  E�Y ��� �kE�Ol� kE�Y �kE�O�� E�O�� a � a � a � a � a � a  �a � a � a � a � a !E�O�j ��� E�Y hO��l!E�O��E�O�j ��a  E�Y hO�~ �������12��
�� .Mth:Lognnull���     doub�� 0 x  ��  1 ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo2 ������3�����
�� 
nmbr�� 	0 _logn  �� 0 etext eText3 ����4
�� 
errn�� 0 enumber eNumber4 ����5
�� 
erob�� 0 efrom eFrom5 ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ��  *��&k+ W X  *䡢���+  ������67��
�� .Mth:Lo10null���     doub�� 0 x  ��  6 ������������ 0 x  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo7 
������8%����
�� 
nmbr�� 	0 _logn  �� 0 etext eText8 ����9
�� 
errn�� 0 enumber eNumber9 ���:
�� 
erob� 0 efrom eFrom: ���
� 
errt� 
0 eto eTo�  �� �� 
0 _error  �� % *��&k+ �!� �!W X  *硢���+ 	� �5��;<�
� .Mth:Logbnull���     doub� 0 x  � ���
� 
Base� 0 b  �  ; ������� 0 x  � 0 b  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo< ���=R��
� 
nmbr� 	0 _logn  � 0 etext eText= ��>
� 
errn� 0 enumber eNumber> ��?
� 
erob� 0 efrom eFrom? ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � ( *��&k+ *��&k+ !W X  *䢣���+  ascr  ��ޭ