FasdUAS 1.101.10   ��   ��    k             l      ��  ��    File -- common file system and path string operations

Notes:

- Path manipulation commands all operate on POSIX paths, as those are reliable whereas HFS paths (which are already deprecated everywhere else in OS X) are not.


TO DO:

- Should (and can?) ALL ObjC class, method, enum, etc names always be enclosed in pipes? e.g. This library was accidentally recompiled and resaved after AS converted 'NSURL' identifiers to 'nsurl', causing handlers that used it to break as ASOC, unlike AS, is case-sensitive. (Normalizing identifier case in not just current script but all imported scripts too is a fundamental AS flaw that will continue to break users' ASOC code until fixed at source, but these libraries need to be as robust as possible, even if that means crudding up the ASOC parts with pipes. The big annoyance is that unless identical names but with different case are also defined without pipes, AS will remove the pipes from names that do have them on compilation, whereupon the library code is right back where it started, at risk of breaking in future use.)


- add support for enumeration type in `parse command line arguments`, where valueType is a list of allowed text values

- might be an idea to move path expansion to TypeSupport; see also asPOSIXPath[Parameter] TODOs there

     � 	 	
    F i l e   - -   c o m m o n   f i l e   s y s t e m   a n d   p a t h   s t r i n g   o p e r a t i o n s 
 
 N o t e s : 
 
 -   P a t h   m a n i p u l a t i o n   c o m m a n d s   a l l   o p e r a t e   o n   P O S I X   p a t h s ,   a s   t h o s e   a r e   r e l i a b l e   w h e r e a s   H F S   p a t h s   ( w h i c h   a r e   a l r e a d y   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X )   a r e   n o t . 
 
 
 T O   D O : 
 
 -   S h o u l d   ( a n d   c a n ? )   A L L   O b j C   c l a s s ,   m e t h o d ,   e n u m ,   e t c   n a m e s   a l w a y s   b e   e n c l o s e d   i n   p i p e s ?   e . g .   T h i s   l i b r a r y   w a s   a c c i d e n t a l l y   r e c o m p i l e d   a n d   r e s a v e d   a f t e r   A S   c o n v e r t e d   ' N S U R L '   i d e n t i f i e r s   t o   ' n s u r l ' ,   c a u s i n g   h a n d l e r s   t h a t   u s e d   i t   t o   b r e a k   a s   A S O C ,   u n l i k e   A S ,   i s   c a s e - s e n s i t i v e .   ( N o r m a l i z i n g   i d e n t i f i e r   c a s e   i n   n o t   j u s t   c u r r e n t   s c r i p t   b u t   a l l   i m p o r t e d   s c r i p t s   t o o   i s   a   f u n d a m e n t a l   A S   f l a w   t h a t   w i l l   c o n t i n u e   t o   b r e a k   u s e r s '   A S O C   c o d e   u n t i l   f i x e d   a t   s o u r c e ,   b u t   t h e s e   l i b r a r i e s   n e e d   t o   b e   a s   r o b u s t   a s   p o s s i b l e ,   e v e n   i f   t h a t   m e a n s   c r u d d i n g   u p   t h e   A S O C   p a r t s   w i t h   p i p e s .   T h e   b i g   a n n o y a n c e   i s   t h a t   u n l e s s   i d e n t i c a l   n a m e s   b u t   w i t h   d i f f e r e n t   c a s e   a r e   a l s o   d e f i n e d   w i t h o u t   p i p e s ,   A S   w i l l   r e m o v e   t h e   p i p e s   f r o m   n a m e s   t h a t   d o   h a v e   t h e m   o n   c o m p i l a t i o n ,   w h e r e u p o n   t h e   l i b r a r y   c o d e   i s   r i g h t   b a c k   w h e r e   i t   s t a r t e d ,   a t   r i s k   o f   b r e a k i n g   i n   f u t u r e   u s e . ) 
 
 
 -   a d d   s u p p o r t   f o r   e n u m e r a t i o n   t y p e   i n   ` p a r s e   c o m m a n d   l i n e   a r g u m e n t s ` ,   w h e r e   v a l u e T y p e   i s   a   l i s t   o f   a l l o w e d   t e x t   v a l u e s 
 
 -   m i g h t   b e   a n   i d e a   t o   m o v e   p a t h   e x p a n s i o n   t o   T y p e S u p p o r t ;   s e e   a l s o   a s P O S I X P a t h [ P a r a m e t e r ]   T O D O s   t h e r e 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �        s u p p o r t   ! " ! l     ��������  ��  ��   "  # $ # l      % & ' % j    �� (�� 0 _support   ( N     ) ) 4    �� *
�� 
scpt * m     + + � , ,  T y p e S u p p o r t & "  used for parameter checking    ' � - - 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g $  . / . l     ��������  ��  ��   /  0 1 0 l     ��������  ��  ��   1  2 3 2 i   ! 4 5 4 I      �� 6���� 
0 _error   6  7 8 7 o      ���� 0 handlername handlerName 8  9 : 9 o      ���� 0 etext eText :  ; < ; o      ���� 0 enumber eNumber <  = > = o      ���� 0 efrom eFrom >  ?�� ? o      ���� 
0 eto eTo��  ��   5 n     @ A @ I    �� B���� &0 throwcommanderror throwCommandError B  C D C m     E E � F F  F i l e D  G H G o    ���� 0 handlername handlerName H  I J I o    ���� 0 etext eText J  K L K o    	���� 0 enumber eNumber L  M N M o   	 
���� 0 efrom eFrom N  O�� O o   
 ���� 
0 eto eTo��  ��   A o     ���� 0 _support   3  P Q P l     ��������  ��  ��   Q  R S R l     ��������  ��  ��   S  T U T l     �� V W��   V J D--------------------------------------------------------------------    W � X X � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - U  Y Z Y l     �� [ \��   [  File Read/Write; these are atomic alternatives to StandardAdditions' File Read/Write suite, with better support for text encodings (incremental read/write is almost entirely useless in practice as AS doesn't have the capabilities or smarts to do it right)    \ � ] ]    F i l e   R e a d / W r i t e ;   t h e s e   a r e   a t o m i c   a l t e r n a t i v e s   t o   S t a n d a r d A d d i t i o n s '   F i l e   R e a d / W r i t e   s u i t e ,   w i t h   b e t t e r   s u p p o r t   f o r   t e x t   e n c o d i n g s   ( i n c r e m e n t a l   r e a d / w r i t e   i s   a l m o s t   e n t i r e l y   u s e l e s s   i n   p r a c t i c e   a s   A S   d o e s n ' t   h a v e   t h e   c a p a b i l i t i e s   o r   s m a r t s   t o   d o   i t   r i g h t ) Z  ^ _ ^ l     ��������  ��  ��   _  ` a ` h   " )�� b�� (0 _nsstringencodings _NSStringEncodings b k       c c  d e d l     �� f g��   f � � note: AS can't natively represent integers larger than 2^30, but as long as they're not larger than 2^50 (1e15) then AS's real (Double) representation will reliably coerce back to integer when passed to ASOC    g � h h�   n o t e :   A S   c a n ' t   n a t i v e l y   r e p r e s e n t   i n t e g e r s   l a r g e r   t h a n   2 ^ 3 0 ,   b u t   a s   l o n g   a s   t h e y ' r e   n o t   l a r g e r   t h a n   2 ^ 5 0   ( 1 e 1 5 )   t h e n   A S ' s   r e a l   ( D o u b l e )   r e p r e s e n t a t i o n   w i l l   r e l i a b l y   c o e r c e   b a c k   t o   i n t e g e r   w h e n   p a s s e d   t o   A S O C e  i j i l     ��������  ��  ��   j  k l k l     �� m n��   m $  NS...StringEncoding constants    n � o o <   N S . . . S t r i n g E n c o d i n g   c o n s t a n t s l  p q p j     ��� r�� 
0 _list_   r J     � s s  t u t l 	    v���� v J      w w  x y x m     ��
�� FEncFE01 y  z�� z m    ���� ��  ��  ��   u  { | { l 	   }���� } J     ~ ~   �  m    ��
�� FEncFE02 �  ��� � m    ���� 
��  ��  ��   |  � � � l 	   ����� � J     � �  � � � m    	��
�� FEncFE03 �  ��� � m   	 
 � � A�      ��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE04 �  ��� � m     � � A�     ��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE05 �  ��� � m     � � A�     ��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE06 �  ��� � m     � � A�      ��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE07 �  ��� � m     � � A�     ��  ��  ��   �  � � � l 	    ����� � J      � �  � � � m    ��
�� FEncFE11 �  ��� � m    ���� ��  ��  ��   �  � � � l 	   & ����� � J     & � �  � � � m     !��
�� FEncFE12 �  ��� � m   ! $���� ��  ��  ��   �  � � � l 	 & . ����� � J   & . � �  � � � m   & )��
�� FEncFE13 �  ��� � m   ) ,���� ��  ��  ��   �  � � � l 	 . 6 ����� � J   . 6 � �  � � � m   . 1��
�� FEncFE14 �  ��� � m   1 4���� 	��  ��  ��   �  � � � l 	 6 < ����� � J   6 < � �  � � � m   6 9��
�� FEncFE15 �  ��� � m   9 :���� ��  ��  ��   �  � � � l 	 < D ����� � J   < D � �  � � � m   < ?��
�� FEncFE16 �  ��� � m   ? B���� ��  ��  ��   �  � � � l 	 D L ����� � J   D L � �  � � � m   D G��
�� FEncFE17 �  ��� � m   G J���� ��  ��  ��   �  � � � l 	 L T ���� � J   L T � �  � � � m   L O�~
�~ FEncFE18 �  ��} � m   O R�|�| �}  ��  �   �  � � � l 	 T \ ��{�z � J   T \ � �  � � � m   T W�y
�y FEncFE19 �  ��x � m   W Z�w�w �x  �{  �z   �  � � � l 	 \ d ��v�u � J   \ d � �  � � � m   \ _�t
�t FEncFE50 �  ��s � m   _ b�r�r �s  �v  �u   �  � � � l 	 d l ��q�p � J   d l � �  � � � m   d g�o
�o FEncFE51 �  ��n � m   g j�m�m �n  �q  �p   �  � � � l 	 l t ��l�k � J   l t � �  � � � m   l o�j
�j FEncFE52 �  ��i � m   o r�h�h �i  �l  �k   �  � � � l 	 t | �g�f  J   t |  m   t w�e
�e FEncFE53 �d m   w z�c�c �d  �g  �f   � �b l 	 | ��a�` J   | � 	 m   | �_
�_ FEncFE54	 
�^
 m    ��]�] �^  �a  �`  �b   q  l     �\�[�Z�\  �[  �Z   �Y i  � � I      �X�W�X 0 getencoding getEncoding �V o      �U�U 0 textencoding textEncoding�V  �W   k     W  Q     K k    3  r     c     o    �T�T 0 textencoding textEncoding m    �S
�S 
enum o      �R�R 0 textencoding textEncoding �Q X   	 3 �P!  Z   ."#�O�N" =   !$%$ n   &'& 4    �M(
�M 
cobj( m    �L�L ' o    �K�K 0 aref aRef% o     �J�J 0 textencoding textEncoding# L   $ *)) n  $ )*+* 4   % (�I,
�I 
cobj, m   & '�H�H + o   $ %�G�G 0 aref aRef�O  �N  �P 0 aref aRef! n   -.- o    �F�F 
0 _list_  .  f    �Q   R      �E�D/
�E .ascrerr ****      � ****�D  / �C0�B
�C 
errn0 d      11 m      �A�A��B   l  ; K2342 Q   ; K5675 L   > B88 c   > A9:9 o   > ?�@�@ 0 textencoding textEncoding: m   ? @�?
�? 
long6 R      �>�=;
�> .ascrerr ****      � ****�=  ; �<<�;
�< 
errn< d      == m      �:�:��;  7 l  J J�9>?�9  >   fall through   ? �@@    f a l l   t h r o u g h3 ] W not a predefined constant, but hedge bets as it might be a raw NSStringEncoding number   4 �AA �   n o t   a   p r e d e f i n e d   c o n s t a n t ,   b u t   h e d g e   b e t s   a s   i t   m i g h t   b e   a   r a w   N S S t r i n g E n c o d i n g   n u m b e r B�8B n  L WCDC I   Q W�7E�6�7 >0 throwinvalidconstantparameter throwInvalidConstantParameterE FGF o   Q R�5�5 0 textencoding textEncodingG H�4H m   R SII �JJ 
 u s i n g�4  �6  D o   L Q�3�3 0 _support  �8  �Y   a KLK l     �2�1�0�2  �1  �0  L MNM l     �/�.�-�/  �.  �-  N OPO l     �,QR�,  Q  -----   R �SS 
 - - - - -P TUT l     �+�*�)�+  �*  �)  U VWV i  * -XYX I     �(Z[
�( .Fil:Readnull���     fileZ o      �'�' 0 thefile theFile[ �&\]
�& 
Type\ |�%�$^�#_�%  �$  ^ o      �"�" 0 datatype dataType�#  _ l     `�!� ` m      �
� 
ctxt�!  �   ] �a�
� 
Encoa |��b�c�  �  b o      �� 0 textencoding textEncoding�  c l     d��d m      �
� FEncFE01�  �  �  Y Q     �efge k    �hh iji r    klk n   mnm I    �o�� ,0 asposixpathparameter asPOSIXPathParametero pqp o    	�� 0 thefile theFileq r�r m   	 
ss �tt  �  �  n o    �� 0 _support  l o      �� 0 	posixpath 	posixPathj uvu r    wxw n   yzy I    �{�� "0 astypeparameter asTypeParameter{ |}| o    �� 0 datatype dataType} ~�~ m     ���  a s�  �  z o    �� 0 _support  x o      �
�
 0 datatype dataTypev ��	� Z    ������ F    *��� =   "��� o     �� 0 datatype dataType� m     !�
� 
ctxt� >  % (��� o   % &�� 0 textencoding textEncoding� m   & '�
� FEncFEPE� l  - }���� k   - }�� ��� r   - 9��� n  - 7��� I   2 7���� 0 getencoding getEncoding� ��� o   2 3� �  0 textencoding textEncoding�  �  � o   - 2���� (0 _nsstringencodings _NSStringEncodings� o      ���� 0 textencoding textEncoding� ��� r   : S��� n  : D��� I   = D������� T0 (stringwithcontentsoffile_encoding_error_ (stringWithContentsOfFile_encoding_error_� ��� o   = >���� 0 	posixpath 	posixPath� ��� o   > ?���� 0 textencoding textEncoding� ���� l  ? @������ m   ? @��
�� 
obj ��  ��  ��  ��  � n  : =��� o   ; =���� 0 nsstring NSString� m   : ;��
�� misccura� J      �� ��� o      ���� 0 
asocstring 
asocString� ���� o      ���� 0 theerror theError��  � ��� Z  T x������� =  T W��� o   T U���� 0 
asocstring 
asocString� m   U V��
�� 
msng� R   Z t����
�� .ascrerr ****      � ****� l  l s������ c   l s��� n  l q��� I   m q�������� ,0 localizeddescription localizedDescription��  ��  � o   l m���� 0 theerror theError� m   q r��
�� 
ctxt��  ��  � ����
�� 
errn� n  \ a��� I   ] a�������� 0 code  ��  ��  � o   \ ]���� 0 theerror theError� ����
�� 
erob� o   d e���� 0 thefile theFile� �����
�� 
errt� o   h i���� 0 datatype dataType��  ��  ��  � ���� L   y }�� c   y |��� o   y z���� 0 
asocstring 
asocString� m   z {��
�� 
ctxt��  �'! note: AS treats `text`, `string`, and `Unicode text` as synonyms when comparing for equality, which is a little bit problematic as StdAdds' `read` command treats `string` as 'primary encoding' and `Unicode text` as UTF16; passing `primary encoding` for `using` parameter provides an 'out'   � ���B   n o t e :   A S   t r e a t s   ` t e x t ` ,   ` s t r i n g ` ,   a n d   ` U n i c o d e   t e x t `   a s   s y n o n y m s   w h e n   c o m p a r i n g   f o r   e q u a l i t y ,   w h i c h   i s   a   l i t t l e   b i t   p r o b l e m a t i c   a s   S t d A d d s '   ` r e a d `   c o m m a n d   t r e a t s   ` s t r i n g `   a s   ' p r i m a r y   e n c o d i n g '   a n d   ` U n i c o d e   t e x t `   a s   U T F 1 6 ;   p a s s i n g   ` p r i m a r y   e n c o d i n g `   f o r   ` u s i n g `   p a r a m e t e r   p r o v i d e s   a n   ' o u t '�  � k   � ��� ��� r   � ���� I  � ������
�� .rdwropenshor       file� l  � ������� c   � ���� o   � ����� 0 	posixpath 	posixPath� m   � ���
�� 
psxf��  ��  ��  � o      ���� 0 fh  � ���� Q   � ����� k   � ��� ��� r   � ���� I  � �����
�� .rdwrread****        ****� o   � ����� 0 fh  � �����
�� 
as  � o   � ����� 0 datatype dataType��  � o      ���� 0 	theresult 	theResult� ��� I  � ������
�� .rdwrclosnull���     ****� o   � ����� 0 fh  ��  � ���� L   � ��� o   � ����� 0 	theresult 	theResult��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � k   � ��� ��� Q   � ������ I  � ������
�� .rdwrclosnull���     ****� o   � ����� 0 fh  ��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  � ���� R   � �����
�� .ascrerr ****      � ****� o   � ����� 0 etext eText� ����
�� 
errn� o   � ����� 0 enumber eNumber� ����
�� 
erob� o   � ����� 0 efrom eFrom� �����
�� 
errt� o   � ����� 
0 eto eTo��  ��  ��  �	  f R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  g I   � �������� 
0 _error  � ��� m   � ��� ���  r e a d   f i l e� ��� o   � ����� 0 etext eText�    o   � ����� 0 enumber eNumber  o   � ����� 0 efrom eFrom �� o   � ����� 
0 eto eTo��  ��  W  l     ��������  ��  ��    l     ��������  ��  ��   	
	 i  . 1 I     ��
�� .Fil:Writnull���     file o      ���� 0 thefile theFile ��
�� 
Data o      ���� 0 thedata theData ��
�� 
Type |��������  ��   o      ���� 0 datatype dataType��   l     ���� m      ��
�� 
ctxt��  ��   ����
�� 
Enco |��������  ��   o      ���� 0 textencoding textEncoding��   l     ���� m      ��
�� FEncFE01��  ��  ��   Q    	 k    �  r     !  n   "#" I    �$�~� ,0 asposixpathparameter asPOSIXPathParameter$ %&% o    	�}�} 0 thefile theFile& '�|' m   	 
(( �))  �|  �~  # o    �{�{ 0 _support  ! o      �z�z 0 	posixpath 	posixPath *+* r    ,-, n   ./. I    �y0�x�y "0 astypeparameter asTypeParameter0 121 o    �w�w 0 datatype dataType2 3�v3 m    44 �55  a s�v  �x  / o    �u�u 0 _support  - o      �t�t 0 datatype dataType+ 6�s6 Z    �78�r97 F    *:;: =   "<=< o     �q�q 0 datatype dataType= m     !�p
�p 
ctxt; >  % (>?> o   % &�o�o 0 textencoding textEncoding? m   & '�n
�n FEncFEPE8 k   - �@@ ABA r   - ACDC n  - ?EFE I   0 ?�mG�l�m &0 stringwithstring_ stringWithString_G H�kH l  0 ;I�j�iI n  0 ;JKJ I   5 ;�hL�g�h "0 astextparameter asTextParameterL MNM o   5 6�f�f 0 thedata theDataN O�eO m   6 7PP �QQ  d a t a�e  �g  K o   0 5�d�d 0 _support  �j  �i  �k  �l  F n  - 0RSR o   . 0�c�c 0 nsstring NSStringS m   - .�b
�b misccuraD o      �a�a 0 
asocstring 
asocStringB TUT r   B NVWV n  B LXYX I   G L�`Z�_�` 0 getencoding getEncodingZ [�^[ o   G H�]�] 0 textencoding textEncoding�^  �_  Y o   B G�\�\ (0 _nsstringencodings _NSStringEncodingsW o      �[�[ 0 textencoding textEncodingU \]\ r   O k^_^ n  O X`a` I   P X�Zb�Y�Z P0 &writetofile_atomically_encoding_error_ &writeToFile_atomically_encoding_error_b cdc o   P Q�X�X 0 	posixpath 	posixPathd efe m   Q R�W
�W boovtruef ghg o   R S�V�V 0 textencoding textEncodingh i�Ui l  S Tj�T�Sj m   S T�R
�R 
obj �T  �S  �U  �Y  a o   O P�Q�Q 0 
asocstring 
asocString_ J      kk lml o      �P�P 0 
didsucceed 
didSucceedm n�On o      �N�N 0 theerror theError�O  ] o�Mo Z   l �pq�L�Kp H   l nrr o   l m�J�J 0 
didsucceed 
didSucceedq R   q ��Ist
�I .ascrerr ****      � ****s l  � �u�H�Gu c   � �vwv n  � �xyx I   � ��F�E�D�F ,0 localizeddescription localizedDescription�E  �D  y o   � ��C�C 0 theerror theErrorw m   � ��B
�B 
ctxt�H  �G  t �Az{
�A 
errnz n  u z|}| I   v z�@�?�>�@ 0 code  �?  �>  } o   u v�=�= 0 theerror theError{ �<~
�< 
erob~ o   } ~�;�; 0 thefile theFile �:��9
�: 
errt� o   � ��8�8 0 datatype dataType�9  �L  �K  �M  �r  9 k   � ��� ��� r   � ���� I  � ��7��
�7 .rdwropenshor       file� l  � ���6�5� c   � ���� o   � ��4�4 0 	posixpath 	posixPath� m   � ��3
�3 
psxf�6  �5  � �2��1
�2 
perm� m   � ��0
�0 boovtrue�1  � o      �/�/ 0 fh  � ��.� Q   � ����� k   � ��� ��� l  � ����� I  � ��-��
�- .rdwrseofnull���     ****� o   � ��,�, 0 fh  � �+��*
�+ 
set2� m   � ��)�)  �*  � e _ important: when overwriting an existing file, make sure its previous contents are erased first   � ��� �   i m p o r t a n t :   w h e n   o v e r w r i t i n g   a n   e x i s t i n g   f i l e ,   m a k e   s u r e   i t s   p r e v i o u s   c o n t e n t s   a r e   e r a s e d   f i r s t� ��� I  � ��(��
�( .rdwrwritnull���     ****� o   � ��'�' 0 thedata theData� �&��
�& 
refn� o   � ��%�% 0 fh  � �$��#
�$ 
as  � o   � ��"�" 0 datatype dataType�#  � ��� I  � ��!�� 
�! .rdwrclosnull���     ****� o   � ��� 0 fh  �   � ��� L   � ���  �  � R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � k   � ��� ��� Q   � ����� I  � ����
� .rdwrclosnull���     ****� o   � ��� 0 fh  �  � R      ���
� .ascrerr ****      � ****�  �  �  � ��� R   � ����
� .ascrerr ****      � ****� o   � ��
�
 0 etext eText� �	��
�	 
errn� o   � ��� 0 enumber eNumber� ���
� 
erob� o   � ��� 0 efrom eFrom� ���
� 
errt� o   � ��� 
0 eto eTo�  �  �.  �s   R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� � ��
�  
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��   I   �	������� 
0 _error  � ��� m   � ��� ���  w r i t e   f i l e� ��� o   � ���� 0 etext eText� ��� o   ���� 0 enumber eNumber� ��� o  ���� 0 efrom eFrom� ���� o  ���� 
0 eto eTo��  ��  
 ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   POSIX path manipulation   � ��� 0   P O S I X   p a t h   m a n i p u l a t i o n� ��� l     ��������  ��  ��  � ��� i  2 5��� I     ����
�� .Fil:ConPnull���     ****� o      ���� 0 filepath filePath� ����
�� 
From� |����������  ��  � o      ���� 0 
fromformat 
fromFormat��  � l     ������ m      ��
�� FLCTFLCP��  ��  � �����
�� 
To__� |����������  ��  � o      ���� 0 toformat toFormat��  � l     ������ m      ��
�� FLCTFLCP��  ��  ��  � l   b���� Q    b���� k   L�� ��� Z    ������� =    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ���� 0 filepath filePath��  � �����
�� 
kocl� m    ��
�� 
ctxt��  ��  ��  � m    ����  � l      r     n    I    ������ ,0 asposixpathparameter asPOSIXPathParameter 	 o    ���� 0 filepath filePath	 
��
 m     �  ��  ��   o    ���� 0 _support   o      ���� 0 	posixpath 	posixPath F @ assume it's a file identifier object (alias, �class furl�, etc)    � �   a s s u m e   i t ' s   a   f i l e   i d e n t i f i e r   o b j e c t   ( a l i a s ,   � c l a s s   f u r l � ,   e t c )��  � l  ! � Z   ! � =  ! $ o   ! "���� 0 
fromformat 
fromFormat m   " #��
�� FLCTFLCP r   ' * o   ' (���� 0 filepath filePath o      ���� 0 	posixpath 	posixPath  =  - 0 o   - .���� 0 
fromformat 
fromFormat m   . /��
�� FLCTFLCH  l  3 ; ! r   3 ;"#" n   3 9$%$ 1   7 9��
�� 
psxp% l  3 7&����& 4   3 7��'
�� 
file' o   5 6���� 0 filepath filePath��  ��  # o      ���� 0 	posixpath 	posixPath  � � caution: HFS path format is flawed and deprecated everywhere else in OS X (unlike POSIX path format, it can't distinguish between two volumes with the same name), but is still used by AS and a few older scriptable apps so must be supported   ! �((�   c a u t i o n :   H F S   p a t h   f o r m a t   i s   f l a w e d   a n d   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X   ( u n l i k e   P O S I X   p a t h   f o r m a t ,   i t   c a n ' t   d i s t i n g u i s h   b e t w e e n   t w o   v o l u m e s   w i t h   t h e   s a m e   n a m e ) ,   b u t   i s   s t i l l   u s e d   b y   A S   a n d   a   f e w   o l d e r   s c r i p t a b l e   a p p s   s o   m u s t   b e   s u p p o r t e d )*) =  > A+,+ o   > ?���� 0 
fromformat 
fromFormat, m   ? @��
�� FLCTFLCU* -��- k   D w.. /0/ r   D N121 n  D L343 I   G L��5����  0 urlwithstring_ URLWithString_5 6��6 o   G H���� 0 filepath filePath��  ��  4 n  D G787 o   E G���� 	0 NSURL  8 m   D E��
�� misccura2 o      ���� 0 asocurl asocURL0 9��9 Z  O w:;����: G   O ]<=< =  O R>?> o   O P���� 0 asocurl asocURL? m   P Q��
�� 
msng= H   U [@@ n  U ZABA I   V Z�������� 0 fileurl fileURL��  ��  B o   U V���� 0 asocurl asocURL; n  ` sCDC I   e s��E���� .0 throwinvalidparameter throwInvalidParameterE FGF o   e f���� 0 filepath filePathG HIH m   f iJJ �KK  I LML m   i j��
�� 
ctxtM N��N m   j mOO �PP  N o t   a   f i l e   U R L .��  ��  D o   ` e���� 0 _support  ��  ��  ��  ��   n  z �QRQ I    ���S���� >0 throwinvalidconstantparameter throwInvalidConstantParameterS TUT o    ����� 0 
fromformat 
fromFormatU V��V m   � �WW �XX  f r o m��  ��  R o   z ���� 0 _support   \ V it's a text path in the user-specified format, so convert it to a standard POSIX path    �YY �   i t ' s   a   t e x t   p a t h   i n   t h e   u s e r - s p e c i f i e d   f o r m a t ,   s o   c o n v e r t   i t   t o   a   s t a n d a r d   P O S I X   p a t h� Z[Z l  � ���\]��  \   sanity check   ] �^^    s a n i t y   c h e c k[ _`_ Z  � �ab����a =   � �cdc n  � �efe 1   � ���
�� 
lengf o   � ����� 0 	posixpath 	posixPathd m   � �����  b n  � �ghg I   � ���i���� .0 throwinvalidparameter throwInvalidParameteri jkj o   � ����� 0 filepath filePathk lml m   � �nn �oo  m pqp m   � ���
�� 
ctxtq r��r m   � �ss �tt ( P a t h   c a n  t   b e   e m p t y .��  ��  h o   � ����� 0 _support  ��  ��  ` uvu l  � ���wx��  w ; 5 convert POSIX path text to the requested format/type   x �yy j   c o n v e r t   P O S I X   p a t h   t e x t   t o   t h e   r e q u e s t e d   f o r m a t / t y p ev z��z Z   �L{|}~{ =  � �� o   � ����� 0 toformat toFormat� m   � ���
�� FLCTFLCP| L   � ��� o   � ����� 0 	posixpath 	posixPath} ��� =  � ���� o   � ����� 0 toformat toFormat� m   � ���
�� FLCTFLCA� ��� l  � ����� L   � ��� c   � ���� c   � ���� o   � ����� 0 	posixpath 	posixPath� m   � ���
�� 
psxf� m   � ���
�� 
alis� %  returns object of type `alias`   � ��� >   r e t u r n s   o b j e c t   o f   t y p e   ` a l i a s `� ��� =  � ���� o   � ����� 0 toformat toFormat� m   � ���
�� FLCTFLCX� ��� l  � ����� L   � ��� c   � ���� o   � ����� 0 	posixpath 	posixPath� m   � ���
�� 
psxf� , & returns object of type `�class furl�`   � ��� L   r e t u r n s   o b j e c t   o f   t y p e   ` � c l a s s   f u r l � `� ��� =  � ���� o   � ����� 0 toformat toFormat� m   � ��
� FLCTFLCS� ��� l  � ����� L   � ��� N   � ��� n   � ���� 4   � ��~�
�~ 
file� l  � ���}�|� c   � ���� c   � ���� o   � ��{�{ 0 	posixpath 	posixPath� m   � ��z
�z 
psxf� m   � ��y
�y 
ctxt�}  �|  � 1   � ��x
�x 
ascr�NH returns an _object specifier_ of type 'file'. Caution: unlike alias and �class furl� objects, this is not a true object but may be used by some applications; not to be confused with the deprecated `file specifier` type (�class fss�), although it uses the same `file TEXT` constructor. Furthermore, it uses an HFS path string so suffers the same problems as HFS paths. Also, being a specifier, requires disambiguation when used [e.g.] in an `open` command otherwise command will be dispatched to it instead of target app, e.g. `tell app "TextEdit" to open {fileSpecifierObject}`. Horribly nasty, brittle, and confusing mis-feature, in other words, but supported (though not encouraged) as an option here for sake of compatibility as there's usually some scriptable app or other API in AS that will absolutely refuse to accept anything else.   � ����   r e t u r n s   a n   _ o b j e c t   s p e c i f i e r _   o f   t y p e   ' f i l e ' .   C a u t i o n :   u n l i k e   a l i a s   a n d   � c l a s s   f u r l �   o b j e c t s ,   t h i s   i s   n o t   a   t r u e   o b j e c t   b u t   m a y   b e   u s e d   b y   s o m e   a p p l i c a t i o n s ;   n o t   t o   b e   c o n f u s e d   w i t h   t h e   d e p r e c a t e d   ` f i l e   s p e c i f i e r `   t y p e   ( � c l a s s   f s s � ) ,   a l t h o u g h   i t   u s e s   t h e   s a m e   ` f i l e   T E X T `   c o n s t r u c t o r .   F u r t h e r m o r e ,   i t   u s e s   a n   H F S   p a t h   s t r i n g   s o   s u f f e r s   t h e   s a m e   p r o b l e m s   a s   H F S   p a t h s .   A l s o ,   b e i n g   a   s p e c i f i e r ,   r e q u i r e s   d i s a m b i g u a t i o n   w h e n   u s e d   [ e . g . ]   i n   a n   ` o p e n `   c o m m a n d   o t h e r w i s e   c o m m a n d   w i l l   b e   d i s p a t c h e d   t o   i t   i n s t e a d   o f   t a r g e t   a p p ,   e . g .   ` t e l l   a p p   " T e x t E d i t "   t o   o p e n   { f i l e S p e c i f i e r O b j e c t } ` .   H o r r i b l y   n a s t y ,   b r i t t l e ,   a n d   c o n f u s i n g   m i s - f e a t u r e ,   i n   o t h e r   w o r d s ,   b u t   s u p p o r t e d   ( t h o u g h   n o t   e n c o u r a g e d )   a s   a n   o p t i o n   h e r e   f o r   s a k e   o f   c o m p a t i b i l i t y   a s   t h e r e ' s   u s u a l l y   s o m e   s c r i p t a b l e   a p p   o r   o t h e r   A P I   i n   A S   t h a t   w i l l   a b s o l u t e l y   r e f u s e   t o   a c c e p t   a n y t h i n g   e l s e .� ��� =  � ���� o   � ��w�w 0 toformat toFormat� m   � ��v
�v FLCTFLCH� ��� L   ��� c   ���� c   � ���� o   � ��u�u 0 	posixpath 	posixPath� m   � ��t
�t 
psxf� m   � �s
�s 
ctxt� ��� = ��� o  �r�r 0 toformat toFormat� m  �q
�q FLCTFLCU� ��p� k  <�� ��� r  ��� n ��� I  �o��n�o $0 fileurlwithpath_ fileURLWithPath_� ��m� o  �l�l 0 	posixpath 	posixPath�m  �n  � n ��� o  �k�k 	0 NSURL  � m  �j
�j misccura� o      �i�i 0 asocurl asocURL� ��� Z 3���h�g� = ��� o  �f�f 0 asocurl asocURL� m  �e
�e 
msng� n /��� I  !/�d��c�d .0 throwinvalidparameter throwInvalidParameter� ��� o  !"�b�b 0 filepath filePath� ��� m  "%�� ���  � ��a� 4  %+�`�
�` 
ctxt� m  '*�� ��� 4 C a n  t   c o n v e r t   t o   f i l e   U R L .�a  �c  � o  !�_�_ 0 _support  �h  �g  � ��^� L  4<�� c  4;��� l 49��]�\� n 49��� I  59�[�Z�Y�[  0 absolutestring absoluteString�Z  �Y  � o  45�X�X 0 asocurl asocURL�]  �\  � m  9:�W
�W 
ctxt�^  �p  ~ n ?L��� I  DL�V��U�V >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o  DE�T�T 0 toformat toFormat� ��S� m  EH�� ���  t o�S  �U  � o  ?D�R�R 0 _support  ��  � R      �Q��
�Q .ascrerr ****      � ****� o      �P�P 0 etext eText� �O��
�O 
errn� o      �N�N 0 enumber eNumber� �M��
�M 
erob� o      �L�L 0 efrom eFrom� �K��J
�K 
errt� o      �I�I 
0 eto eTo�J  � I  Tb�H��G�H 
0 _error  � ��� m  UX�� ���  c o n v e r t   p a t h� ��� o  XY�F�F 0 etext eText� ��� o  YZ�E�E 0 enumber eNumber� � � o  Z[�D�D 0 efrom eFrom  �C o  [\�B�B 
0 eto eTo�C  �G  � x r brings a modicum of sanity to the horrible mess that is AppleScript's file path formats and file identifier types   � � �   b r i n g s   a   m o d i c u m   o f   s a n i t y   t o   t h e   h o r r i b l e   m e s s   t h a t   i s   A p p l e S c r i p t ' s   f i l e   p a t h   f o r m a t s   a n d   f i l e   i d e n t i f i e r   t y p e s�  l     �A�@�?�A  �@  �?    l     �>�=�<�>  �=  �<    i  6 9	
	 I     �;
�; .Fil:NorPnull���     ctxt o      �:�: 0 filepath filePath �9
�9 
ExpT |�8�7�6�8  �7   o      �5�5  0 expandingtilde expandingTilde�6   l 
    �4�3 l     �2�1 m      �0
�0 boovfals�2  �1  �4  �3   �/
�/ 
ExpR |�.�-�,�.  �-   o      �+�+ &0 expandingrelative expandingRelative�,   l     �*�) m      �(
�( boovfals�*  �)   �'�&
�' 
ExpA |�%�$�#�%  �$   o      �"�" $0 expandingsymlink expandingSymlink�#   l     �!�  m      �
� boovfals�!  �   �&  
 Q     � P    � ! k    �"" #$# r    %&% n   '(' I    �)�� ,0 asposixpathparameter asPOSIXPathParameter) *+* o    �� 0 filepath filePath+ ,�, m    -- �..  �  �  ( o    �� 0 _support  & o      �� 0 filepath filePath$ /0/ l   61231 Z   645��4 F    *676 H    "88 n   !9:9 l 
  !;��; I    !�<�� (0 asbooleanparameter asBooleanParameter< =>= o    ��  0 expandingtilde expandingTilde> ?�? m    @@ �AA  t i l d e   e x p a n s i o n�  �  �  �  : o    �� 0 _support  7 C   % (BCB o   % &�� 0 filepath filePathC m   & 'DD �EE  ~5 r   - 2FGF b   - 0HIH m   - .JJ �KK  . /I o   . /�� 0 filepath filePathG o      �� 0 filepath filePath�  �  2 � � Cocoa API *always* expands leading "~" character, which it really shouldn't as tilde expansion is a *nix shell-ism, not a POSIX path-ism, so prefix with "./" to prevent that   3 �LL\   C o c o a   A P I   * a l w a y s *   e x p a n d s   l e a d i n g   " ~ "   c h a r a c t e r ,   w h i c h   i t   r e a l l y   s h o u l d n ' t   a s   t i l d e   e x p a n s i o n   i s   a   * n i x   s h e l l - i s m ,   n o t   a   P O S I X   p a t h - i s m ,   s o   p r e f i x   w i t h   " . / "   t o   p r e v e n t   t h a t0 MNM Z  7 `OP��O F   7 KQRQ n  7 BSTS l 
 < BU�
�	U I   < B�V�� (0 asbooleanparameter asBooleanParameterV WXW o   < =�� &0 expandingrelative expandingRelativeX Y�Y m   = >ZZ �[[ $ a b s o l u t e   e x p a n s i o n�  �  �
  �	  T o   7 <�� 0 _support  R H   E I\\ C   E H]^] o   E F�� 0 filepath filePath^ m   F G__ �``  /P r   N \aba I  N Z�c�
� .Fil:JoiPnull���     ****c J   N Vdd efe I  N S� ����
�  .Fil:CurFnull��� ��� null��  ��  f g��g o   S T���� 0 filepath filePath��  �  b o      ���� 0 filepath filePath�  �  N h��h Z   a �ij��ki n  a llml I   f l��n���� (0 asbooleanparameter asBooleanParametern opo o   f g���� $0 expandingsymlink expandingSymlinkp q��q m   g hrr �ss  a l i a s   e x p a n s i o n��  ��  m o   a f���� 0 _support  j L   o �tt c   o uvu l  o {w����w n  o {xyx I   w {�������� B0 stringbyresolvingsymlinksinpath stringByResolvingSymlinksInPath��  ��  y l  o wz����z n  o w{|{ I   r w��}���� &0 stringwithstring_ stringWithString_} ~��~ o   r s���� 0 filepath filePath��  ��  | n  o r� o   p r���� 0 nsstring NSString� m   o p��
�� misccura��  ��  ��  ��  v m   { ~��
�� 
ctxt��  k L   � ��� c   � ���� l  � ������� n  � ���� I   � ��������� 60 stringbystandardizingpath stringByStandardizingPath��  ��  � l  � ������� n  � ���� I   � �������� &0 stringwithstring_ stringWithString_� ���� o   � ����� 0 filepath filePath��  ��  � n  � ���� o   � ����� 0 nsstring NSString� m   � ���
�� misccura��  ��  ��  ��  � m   � ���
�� 
ctxt��    ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  ! ����
�� consnume��   R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� �����
�� 
errt� o      ���� 
0 eto eTo��   I   � �������� 
0 _error  � ��� m   � ��� ���  n o r m a l i z e   p a t h� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 filepath filePath� ���� o   � ����� 
0 eto eTo��  ��   ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  : =��� I     ����
�� .Fil:JoiPnull���     ****� o      ����  0 pathcomponents pathComponents� �����
�� 
Exte� |����������  ��  � o      ���� 0 fileextension fileExtension��  � l     ������ m      �� ���  ��  ��  ��  � Q     ����� k    ��� ��� r    ��� n    ��� 2   ��
�� 
cobj� n   ��� I    ������� "0 aslistparameter asListParameter� ��� o    	����  0 pathcomponents pathComponents� ���� m   	 
�� ���  ��  ��  � o    ���� 0 _support  � o      ���� 0 subpaths subPaths� ��� Q    a���� k    L�� ��� Z   %������� =   ��� o    ���� 0 subpaths subPaths� J    ����  � R    !������
�� .ascrerr ****      � ****��  ��  ��  ��  � ���� X   & L����� r   6 G��� n  6 C��� I   ; C������� ,0 asposixpathparameter asPOSIXPathParameter� ��� n  ; >��� 1   < >��
�� 
pcnt� o   ; <���� 0 aref aRef� ���� m   > ?�� ���  ��  ��  � o   6 ;���� 0 _support  � n     ��� 1   D F��
�� 
pcnt� o   C D���� 0 aref aRef�� 0 aref aRef� o   ) *���� 0 subpaths subPaths��  � R      ������
�� .ascrerr ****      � ****��  ��  � n  T a��� I   Y a������� .0 throwinvalidparameter throwInvalidParameter� ��� o   Y Z����  0 pathcomponents pathComponents� ��� m   Z [�� ���  � ��� m   [ \��
�� 
list� ���� m   \ ]�� ��� X E x p e c t e d   o n e   o r   m o r e   t e x t   a n d / o r   f i l e   i t e m s .��  ��  � o   T Y���� 0 _support  � ��� r   b n��� l  b l������ n  b l��� I   g l������� *0 pathwithcomponents_ pathWithComponents_� ���� o   g h���� 0 subpaths subPaths��  ��  � n  b g��� o   c g���� 0 nsstring NSString� m   b c��
�� misccura��  ��  � o      ���� 0 asocpath asocPath� ��� r   o ~��� n  o |� � I   t |������ "0 astextparameter asTextParameter  o   t u���� 0 fileextension fileExtension �� m   u x � ( u s i n g   f i l e   e x t e n s i o n��  ��    o   o t���� 0 _support  � o      ���� 0 fileextension fileExtension�  Z    �	
���	 >    � n   � 1   � ��~
�~ 
leng o    ��}�} 0 fileextension fileExtension m   � ��|�|  
 k   � �  r   � � n  � � I   � ��{�z�{ B0 stringbyappendingpathextension_ stringByAppendingPathExtension_ �y o   � ��x�x 0 fileextension fileExtension�y  �z   o   � ��w�w 0 asocpath asocPath o      �v�v 0 asocpath asocPath �u Z  � ��t�s =  � � o   � ��r�r 0 asocpath asocPath m   � ��q
�q 
msng n  � � I   � ��p�o�p .0 throwinvalidparameter throwInvalidParameter  !  o   � ��n�n 0 fileextension fileExtension! "#" m   � �$$ �%% ( u s i n g   f i l e   e x t e n s i o n# &'& m   � ��m
�m 
ctxt' (�l( m   � �)) �** . I n v a l i d   f i l e   e x t e n s i o n .�l  �o   o   � ��k�k 0 _support  �t  �s  �u  ��  �   +�j+ L   � �,, c   � �-.- o   � ��i�i 0 asocpath asocPath. m   � ��h
�h 
ctxt�j  � R      �g/0
�g .ascrerr ****      � ****/ o      �f�f 0 etext eText0 �e12
�e 
errn1 o      �d�d 0 enumber eNumber2 �c34
�c 
erob3 o      �b�b 0 efrom eFrom4 �a5�`
�a 
errt5 o      �_�_ 
0 eto eTo�`  � I   � ��^6�]�^ 
0 _error  6 787 m   � �99 �::  j o i n   p a t h8 ;<; o   � ��\�\ 0 etext eText< =>= o   � ��[�[ 0 enumber eNumber> ?@? o   � ��Z�Z 0 efrom eFrom@ A�YA o   � ��X�X 
0 eto eTo�Y  �]  � BCB l     �W�V�U�W  �V  �U  C DED l     �T�S�R�T  �S  �R  E FGF i  > AHIH I     �QJK
�Q .Fil:SplPnull���     ctxtJ o      �P�P 0 filepath filePathK �OL�N
�O 
UponL |�M�LM�KN�M  �L  M o      �J�J 0 splitposition splitPosition�K  N l     O�I�HO m      �G
�G FLSPFLSL�I  �H  �N  I Q     ~PQRP k    hSS TUT r    VWV n   XYX I    �FZ�E�F &0 stringwithstring_ stringWithString_Z [�D[ l   \�C�B\ n   ]^] I    �A_�@�A ,0 asposixpathparameter asPOSIXPathParameter_ `a` o    �?�? 0 filepath filePatha b�>b m    cc �dd  �>  �@  ^ o    �=�= 0 _support  �C  �B  �D  �E  Y n   efe o    �<�< 0 nsstring NSStringf m    �;
�; misccuraW o      �:�: 0 asocpath asocPathU g�9g Z    hhijkh =   lml o    �8�8 0 splitposition splitPositionm m    �7
�7 FLSPFLSLi L    /nn J    .oo pqp c    %rsr l   #t�6�5t n   #uvu I    #�4�3�2�4 F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent�3  �2  v o    �1�1 0 asocpath asocPath�6  �5  s m   # $�0
�0 
ctxtq w�/w c   % ,xyx l  % *z�.�-z n  % *{|{ I   & *�,�+�*�, &0 lastpathcomponent lastPathComponent�+  �*  | o   % &�)�) 0 asocpath asocPath�.  �-  y m   * +�(
�( 
ctxt�/  j }~} =  2 5� o   2 3�'�' 0 splitposition splitPosition� m   3 4�&
�& FLSPFLSE~ ��� L   8 I�� J   8 H�� ��� c   8 ?��� l  8 =��%�$� n  8 =��� I   9 =�#�"�!�# >0 stringbydeletingpathextension stringByDeletingPathExtension�"  �!  � o   8 9� �  0 asocpath asocPath�%  �$  � m   = >�
� 
ctxt� ��� c   ? F��� l  ? D���� n  ? D��� I   @ D���� 0 pathextension pathExtension�  �  � o   ? @�� 0 asocpath asocPath�  �  � m   D E�
� 
ctxt�  � ��� =  L O��� o   L M�� 0 splitposition splitPosition� m   M N�
� FLSPFLSA� ��� L   R Z�� c   R Y��� l  R W���� n  R W��� I   S W����  0 pathcomponents pathComponents�  �  � o   R S�� 0 asocpath asocPath�  �  � m   W X�
� 
list�  k n  ] h��� I   b h���� >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   b c�
�
 0 matchformat matchFormat� ��	� m   c d�� ���  a t�	  �  � o   ] b�� 0 _support  �9  Q R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ��� 
� 
errt� o      ���� 
0 eto eTo�   R I   p ~������� 
0 _error  � ��� m   q t�� ���  s p l i t   p a t h� ��� o   t u���� 0 etext eText� ��� o   u v���� 0 enumber eNumber� ��� o   v w���� 0 efrom eFrom� ���� o   w x���� 
0 eto eTo��  ��  G ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  � S M Shell Script Support handlers for use in AppleScripts that run via osascript   � ��� �   S h e l l   S c r i p t   S u p p o r t   h a n d l e r s   f o r   u s e   i n   A p p l e S c r i p t s   t h a t   r u n   v i a   o s a s c r i p t� ��� l     ��������  ��  ��  � ��� l     ���� j   B F�����  0 _argvusererror _ArgvUserError� m   B E����'��� error code used to indicate the shell script's user supplied invalid command line options (errors due to bugs in invalid option/argument definitions supplied by shell script author use standard AS error codes); need to decide what's a sensible code to use and document it in SDEF (unfortunately, `on error number ...` blocks only accept literal integer (for pattern matching) or identifier (for assignment) and don't allow a command as parameter, so there's no way to supply library-defined error numbers as 'named constants' via library-defined commands, e.g. `on error number (command line user error)`, that return the appropriate number)   � ���   e r r o r   c o d e   u s e d   t o   i n d i c a t e   t h e   s h e l l   s c r i p t ' s   u s e r   s u p p l i e d   i n v a l i d   c o m m a n d   l i n e   o p t i o n s   ( e r r o r s   d u e   t o   b u g s   i n   i n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n s   s u p p l i e d   b y   s h e l l   s c r i p t   a u t h o r   u s e   s t a n d a r d   A S   e r r o r   c o d e s ) ;   n e e d   t o   d e c i d e   w h a t ' s   a   s e n s i b l e   c o d e   t o   u s e   a n d   d o c u m e n t   i t   i n   S D E F   ( u n f o r t u n a t e l y ,   ` o n   e r r o r   n u m b e r   . . . `   b l o c k s   o n l y   a c c e p t   l i t e r a l   i n t e g e r   ( f o r   p a t t e r n   m a t c h i n g )   o r   i d e n t i f i e r   ( f o r   a s s i g n m e n t )   a n d   d o n ' t   a l l o w   a   c o m m a n d   a s   p a r a m e t e r ,   s o   t h e r e ' s   n o   w a y   t o   s u p p l y   l i b r a r y - d e f i n e d   e r r o r   n u m b e r s   a s   ' n a m e d   c o n s t a n t s '   v i a   l i b r a r y - d e f i n e d   c o m m a n d s ,   e . g .   ` o n   e r r o r   n u m b e r   ( c o m m a n d   l i n e   u s e r   e r r o r ) ` ,   t h a t   r e t u r n   t h e   a p p r o p r i a t e   n u m b e r )� ��� l     ��������  ��  ��  � ��� h   G R����� 0 novalue NoValue� l     ������  � J D unique constant used to indicate no defaultValue property was given   � ��� �   u n i q u e   c o n s t a n t   u s e d   t o   i n d i c a t e   n o   d e f a u l t V a l u e   p r o p e r t y   w a s   g i v e n� ��� l     ��������  ��  ��  � ��� j   S [����� 
0 lf2 LF2� b   S Z��� 1   S V��
�� 
lnfd� 1   V Y��
�� 
lnfd� ��� j   \ `����� 0 indent1 Indent1� m   \ _�� ���     � ��� j   a e����� 0 indent2 Indent2� m   a d�� ���             � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  f i��� I      ������� 0 vt100 VT100� ���� o      ���� 0 
formatcode 
formatCode��  ��  � k     �� ��� l      ������  �F@ Returns a magic character sequence that will apply the specified formatting or other control operation in Terminal.app and other VT100 terminal emulators. Multiple codes may be given as semicolon-separated numeric text, e.g. "1;7". Commonly used style codes are:
	
		0 = reset/normal
		1 = bold
		2 = faint
		4 = underline
		5 = blink
		7 = negative
		8 = conceal
		30-37 = foreground colors (black, red, green, yellow, blue, magenta, cyan, white)
		38;5;N = xterm-256 foreground colors (N = 0-255)
		39 = default foreground color
		40-49 = background colors (as for 30-39)
	   � ����   R e t u r n s   a   m a g i c   c h a r a c t e r   s e q u e n c e   t h a t   w i l l   a p p l y   t h e   s p e c i f i e d   f o r m a t t i n g   o r   o t h e r   c o n t r o l   o p e r a t i o n   i n   T e r m i n a l . a p p   a n d   o t h e r   V T 1 0 0   t e r m i n a l   e m u l a t o r s .   M u l t i p l e   c o d e s   m a y   b e   g i v e n   a s   s e m i c o l o n - s e p a r a t e d   n u m e r i c   t e x t ,   e . g .   " 1 ; 7 " .   C o m m o n l y   u s e d   s t y l e   c o d e s   a r e : 
 	 
 	 	 0   =   r e s e t / n o r m a l 
 	 	 1   =   b o l d 
 	 	 2   =   f a i n t 
 	 	 4   =   u n d e r l i n e 
 	 	 5   =   b l i n k 
 	 	 7   =   n e g a t i v e 
 	 	 8   =   c o n c e a l 
 	 	 3 0 - 3 7   =   f o r e g r o u n d   c o l o r s   ( b l a c k ,   r e d ,   g r e e n ,   y e l l o w ,   b l u e ,   m a g e n t a ,   c y a n ,   w h i t e ) 
 	 	 3 8 ; 5 ; N   =   x t e r m - 2 5 6   f o r e g r o u n d   c o l o r s   ( N   =   0 - 2 5 5 ) 
 	 	 3 9   =   d e f a u l t   f o r e g r o u n d   c o l o r 
 	 	 4 0 - 4 9   =   b a c k g r o u n d   c o l o r s   ( a s   f o r   3 0 - 3 9 ) 
 	� ���� L     �� b     ��� b     	��� b        l    ���� 5     ����
�� 
cha  m    ���� 
�� kfrmID  ��  ��   m     �  [� o    ���� 0 
formatcode 
formatCode� m   	 
 �  m��  � 	 l     ��������  ��  ��  	 

 l     ����    -----    � 
 - - - - -  l     ����   - ' convert raw args to supported AS types    � N   c o n v e r t   r a w   a r g s   t o   s u p p o r t e d   A S   t y p e s  l     ��������  ��  ��    i  j m I      ������ 0 _unpackvalue _unpackValue  o      ���� 0 thevalue theValue �� o      ���� $0 definitionrecord definitionRecord��  ��   k    �   l     ��!"��  ! � � note that only ASOC-friendly AS types are supported here since NSDictionaries are used as temporary storage for parsed options and arguments   " �##   n o t e   t h a t   o n l y   A S O C - f r i e n d l y   A S   t y p e s   a r e   s u p p o r t e d   h e r e   s i n c e   N S D i c t i o n a r i e s   a r e   u s e d   a s   t e m p o r a r y   s t o r a g e   f o r   p a r s e d   o p t i o n s   a n d   a r g u m e n t s  $%$ r     &'& c     ()( n    *+* o    ���� 0 	valuetype 	valueType+ o     ���� $0 definitionrecord definitionRecord) m    ��
�� 
type' o      ���� 0 	valuetype 	valueType% ,-, Z   �./01. =   232 o    	���� 0 	valuetype 	valueType3 m   	 
��
�� 
ctxt/ r    454 o    ���� 0 thevalue theValue5 o      ���� 0 	theresult 	theResult0 676 E   898 J    :: ;<; m    ��
�� 
long< =>= m    ��
�� 
doub> ?��? m    ��
�� 
nmbr��  9 J    @@ A��A o    ���� 0 	valuetype 	valueType��  7 BCB l    �DEFD k     �GG HIH r     -JKJ n    +LML I   ' +�������� 0 init  ��  ��  M n    'NON I   # '�������� 	0 alloc  ��  ��  O n    #PQP o   ! #���� &0 nsnumberformatter NSNumberFormatterQ m     !��
�� misccuraK o      ���� 0 asocformatter asocFormatterI RSR n  . 6TUT I   / 6��V���� "0 setnumberstyle_ setNumberStyle_V W��W l  / 2X����X n  / 2YZY o   0 2���� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyleZ m   / 0��
�� misccura��  ��  ��  ��  U o   . /���� 0 asocformatter asocFormatterS [\[ n  7 C]^] I   8 C��_���� 0 
setlocale_ 
setLocale__ `��` l  8 ?a����a n  8 ?bcb I   ; ?�������� 0 systemlocale systemLocale��  ��  c n  8 ;ded o   9 ;���� 0 nslocale NSLocalee m   8 9��
�� misccura��  ��  ��  ��  ^ o   7 8���� 0 asocformatter asocFormatter\ fgf r   D Lhih n  D Jjkj I   E J��l���� &0 numberfromstring_ numberFromString_l m��m o   E F���� 0 thevalue theValue��  ��  k o   D E���� 0 asocformatter asocFormatteri o      ���� 0 
asocresult 
asocResultg non Z  M ipq����p =  M Rrsr o   M N���� 0 
asocresult 
asocResults m   N Q��
�� 
msngq R   U e��tu
�� .ascrerr ****      � ****t b   _ dvwv m   _ bxx �yy ( N o t   a   v a l i d   n u m b e r :  w o   b c���� 0 thevalue theValueu ��z��
�� 
errnz o   Y ^����  0 _argvusererror _ArgvUserError��  ��  ��  o {|{ r   j q}~} c   j o� o   j k���� 0 
asocresult 
asocResult� m   k n��
�� 
****~ o      �� 0 	theresult 	theResult| ��~� Z   r ����}�|� =  r u��� o   r s�{�{ 0 	valuetype 	valueType� m   s t�z
�z 
long� k   x ��� ��� Z  x ����y�x� >   x }��� `   x {��� o   x y�w�w 0 	theresult 	theResult� m   y z�v�v � m   { |�u�u  � R   � ��t��
�t .ascrerr ****      � ****� b   � ���� m   � ��� ��� * N o t   a   v a l i d   i n t e g e r :  � o   � ��s�s 0 thevalue theValue� �r��q
�r 
errn� o   � ��p�p  0 _argvusererror _ArgvUserError�q  �y  �x  � ��o� r   � ���� c   � ���� o   � ��n�n 0 	theresult 	theResult� m   � ��m
�m 
long� o      �l�l 0 	theresult 	theResult�o  �}  �|  �~  E 6 0 note: decimal numbers must be in canonical form   F ��� `   n o t e :   d e c i m a l   n u m b e r s   m u s t   b e   i n   c a n o n i c a l   f o r mC ��� E  � ���� J   � ��� ��� m   � ��k
�k 
furl� ��� m   � ��j
�j 
alis� ��� m   � ��i
�i 
file� ��h� m   � ��g
�g 
psxf�h  � J   � ��� ��f� o   � ��e�e 0 	valuetype 	valueType�f  � ��� l  �T���� k   �T�� ��� l  � ��d���d  �   expand/normalize path   � ��� ,   e x p a n d / n o r m a l i z e   p a t h� ��� Z   ����c�b� F   � ���� H   � ��� C   � ���� o   � ��a�a 0 thevalue theValue� m   � ��� ���  /� H   � ��� C   � ���� o   � ��`�` 0 thevalue theValue� m   � ��� ���  ~� k   �
�� ��� r   � ���� n  � ���� I   � ��_�^�]�_ ,0 currentdirectorypath currentDirectoryPath�^  �]  � n  � ���� I   � ��\�[�Z�\  0 defaultmanager defaultManager�[  �Z  � n  � ���� o   � ��Y�Y 0 nsfilemanager NSFileManager� m   � ��X
�X misccura� o      �W�W 0 basepath basePath� ��� Z  � ����V�U� =  � ���� o   � ��T�T 0 basepath basePath� m   � ��S
�S 
msng� R   � ��R��
�R .ascrerr ****      � ****� b   � ���� m   � ��� ��� � C a n ' t   e x p a n d   r e l a t i v e   f i l e   p a t h   ( c u r r e n t   w o r k i n g   d i r e c t o r y   i s   u n k n o w n ) :  � o   � ��Q�Q 0 thevalue theValue� �P��O
�P 
errn� o   � ��N�N  0 _argvusererror _ArgvUserError�O  �V  �U  � ��M� r   �
��� l  ���L�K� n  ���� I   �J��I�J *0 pathwithcomponents_ pathWithComponents_� ��H� J   �� ��� o   �G�G 0 basepath basePath� ��F� o  �E�E 0 thevalue theValue�F  �H  �I  � n  � ��� o   � �D�D 0 nsstring NSString� m   � ��C
�C misccura�L  �K  � o      �B�B 0 thevalue theValue�M  �c  �b  � ��� r  %��� c  #��� c  ��� l ��A�@� n ��� I  �?�>�=�? 60 stringbystandardizingpath stringByStandardizingPath�>  �=  � l ��<�;� n ��� I  �:��9�: &0 stringwithstring_ stringWithString_� ��8� o  �7�7 0 thevalue theValue�8  �9  � n ��� o  �6�6 0 nsstring NSString� m  �5
�5 misccura�<  �;  �A  �@  � m  �4
�4 
ctxt� m  "�3
�3 
psxf� o      �2�2 0 	theresult 	theResult� ��1� Q  &T�� � Z )<�0�/ = ). o  )*�.�. 0 	valuetype 	valueType m  *-�-
�- 
alis r  18 c  16 o  12�,�, 0 	theresult 	theResult m  25�+
�+ 
alis o      �*�* 0 	theresult 	theResult�0  �/  � R      �)�(	
�) .ascrerr ****      � ****�(  	 �'
�&
�' 
errn
 d       m      �%�% +�&    l DT R  DT�$
�$ .ascrerr ****      � **** b  NS m  NQ � 2 F i l e   p a t h   d o e s n  t   e x i s t :   o  QR�#�# 0 thevalue theValue �"�!
�" 
errn o  HM� �   0 _argvusererror _ArgvUserError�!     file not found    �    f i l e   n o t   f o u n d�1  � � � note: `file` is treated as synonym for `POSIX file` here, as actual 'file' object specifiers are both mostly pointless and much more problematic due to using HFS paths   � �P   n o t e :   ` f i l e `   i s   t r e a t e d   a s   s y n o n y m   f o r   ` P O S I X   f i l e `   h e r e ,   a s   a c t u a l   ' f i l e '   o b j e c t   s p e c i f i e r s   a r e   b o t h   m o s t l y   p o i n t l e s s   a n d   m u c h   m o r e   p r o b l e m a t i c   d u e   t o   u s i n g   H F S   p a t h s�  = W\ o  WX�� 0 	valuetype 	valueType m  X[�
� 
bool � l _� P  _� �!  Z  f�"#$%" E f}&'& J  fy(( )*) m  fi++ �,,  t r u e* -.- m  il// �00  y e s. 121 m  lo33 �44  t2 565 m  or77 �88  y6 9�9 m  ru:: �;;  1�  ' J  y|<< =�= o  yz�� 0 thevalue theValue�  # L  ��>> m  ���
� boovtrue$ ?@? E ��ABA J  ��CC DED m  ��FF �GG 
 f a l s eE HIH m  ��JJ �KK  n oI LML m  ��NN �OO  fM PQP m  ��RR �SS  nQ T�T m  ��UU �VV  0�  B J  ��WW X�X o  ���� 0 thevalue theValue�  @ Y�Y L  ��ZZ m  ���
� boovfals�  % R  ���[\
� .ascrerr ****      � ****[ b  ��]^] m  ��__ �`` 2 N o t    y e s    o r    n o    ( Y | N ) :  ^ o  ���� 0 thevalue theValue\ �a�
� 
errna o  ����  0 _argvusererror _ArgvUserError�  �  ! ��
� conscase�   W Q may be used by boolean argument definitions (boolean options don't take a value)    �bb �   m a y   b e   u s e d   b y   b o o l e a n   a r g u m e n t   d e f i n i t i o n s   ( b o o l e a n   o p t i o n s   d o n ' t   t a k e   a   v a l u e )�  1 R  ���cd
� .ascrerr ****      � ****c m  ��ee �ff r I n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n   ( n o t   a n   a l l o w e d   t y p e ) .d �
gh
�
 
errng m  ���	�	�Yh �ij
� 
erobi l ��k��k N  ��ll n  ��mnm o  ���� 0 	valuetype 	valueTypen o  ���� $0 definitionrecord definitionRecord�  �  j �o�
� 
errto m  ���
� 
type�  - p� p L  ��qq o  ������ 0 	theresult 	theResult�    rsr l     ��������  ��  ��  s tut l     ��������  ��  ��  u vwv i  n qxyx I      ��z���� 40 _defaultvalueplaceholder _defaultValuePlaceholderz {��{ o      ���� $0 definitionrecord definitionRecord��  ��  y l    g|}~| k     g ��� r     ��� c     ��� n    ��� o    ���� 0 	valuetype 	valueType� o     ���� $0 definitionrecord definitionRecord� m    ��
�� 
type� o      ���� 0 	valuetype 	valueType� ��� l   ������  � ^ X note: the following conditional block should implement same branches as in _unpackValue   � ��� �   n o t e :   t h e   f o l l o w i n g   c o n d i t i o n a l   b l o c k   s h o u l d   i m p l e m e n t   s a m e   b r a n c h e s   a s   i n   _ u n p a c k V a l u e� ���� Z    g����� =   ��� o    	���� 0 	valuetype 	valueType� m   	 
��
�� 
ctxt� L    �� m    �� ���  T E X T� ��� E   ��� J    �� ��� m    ��
�� 
long� ��� m    ��
�� 
doub� ���� m    ��
�� 
nmbr��  � J    �� ���� o    ���� 0 	valuetype 	valueType��  � ��� Z    ,������ =   "��� o     ���� 0 	valuetype 	valueType� m     !��
�� 
long� L   % '�� m   % &�� ���  I N T E G E R��  � L   * ,�� m   * +�� ���  N U M B E R� ��� E  / 9��� J   / 5�� ��� m   / 0��
�� 
furl� ��� m   0 1��
�� 
alis� ��� m   1 2��
�� 
file� ���� m   2 3��
�� 
psxf��  � J   5 8�� ���� o   5 6���� 0 	valuetype 	valueType��  � ��� L   < >�� m   < =�� ���  F I L E� ��� =  A D��� o   A B���� 0 	valuetype 	valueType� m   B C��
�� 
bool� ���� L   G K�� m   G J�� ���  Y | N��  � R   N g����
�� .ascrerr ****      � ****� m   c f�� ��� r I n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n   ( n o t   a n   a l l o w e d   t y p e ) .� ����
�� 
errn� m   R U�����Y� ����
�� 
erob� l  X \������ N   X \�� n   X [��� o   Y [���� 0 	valuetype 	valueType� o   X Y���� $0 definitionrecord definitionRecord��  ��  � �����
�� 
errt� m   _ `��
�� 
type��  ��  } z t given an option/argument definition record, returns the appropriate default placeholderValue according to valueType   ~ ��� �   g i v e n   a n   o p t i o n / a r g u m e n t   d e f i n i t i o n   r e c o r d ,   r e t u r n s   t h e   a p p r o p r i a t e   d e f a u l t   p l a c e h o l d e r V a l u e   a c c o r d i n g   t o   v a l u e T y p ew ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  r u��� I      ������� *0 _formatdefaultvalue _formatDefaultValue� ���� o      ���� $0 definitionrecord definitionRecord��  ��  � l    ����� k     ��� ��� r     ��� n     ��� o    ���� 0 defaultvalue defaultValue� o     ���� $0 definitionrecord definitionRecord� o      ���� 0 defaultvalue defaultValue� ��� Z   (������� F    ��� >    ��� l   ������ I   ����
�� .corecnte****       ****� J    	�� ���� o    ���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   
 ��
�� 
list��  ��  ��  � m    ����  � =    ��� n    ��� 1    ��
�� 
leng� o    ���� 0 defaultvalue defaultValue� m    ���� � r    $� � n    " 4    "��
�� 
cobj m     !����  o    ���� 0 defaultvalue defaultValue  o      ���� 0 defaultvalue defaultValue��  ��  �  Z   ) �	 >   ) 4

 l  ) 2���� I  ) 2��
�� .corecnte****       **** J   ) , �� o   ) *���� 0 defaultvalue defaultValue��   ����
�� 
kocl m   - .��
�� 
ctxt��  ��  ��   m   2 3����   r   7 : o   7 8���� 0 defaultvalue defaultValue o      ���� 0 defaulttext defaultText  G   = X >   = H l  = F���� I  = F��
�� .corecnte****       **** J   = @ �� o   = >���� 0 defaultvalue defaultValue��   ����
�� 
kocl m   A B��
�� 
long��  ��  ��   m   F G����   >   K V !  l  K T"����" I  K T��#$
�� .corecnte****       ****# J   K N%% &��& o   K L���� 0 defaultvalue defaultValue��  $ ��'��
�� 
kocl' m   O P��
�� 
doub��  ��  ��  ! m   T U����   ()( k   [ �** +,+ r   [ h-.- n  [ f/0/ I   b f�������� 0 init  ��  ��  0 n  [ b121 I   ^ b�������� 	0 alloc  ��  ��  2 n  [ ^343 o   \ ^���� &0 nsnumberformatter NSNumberFormatter4 m   [ \��
�� misccura. o      ���� 0 asocformatter asocFormatter, 565 n  i q787 I   j q��9���� "0 setnumberstyle_ setNumberStyle_9 :��: l  j m;����; n  j m<=< o   k m���� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle= m   j k��
�� misccura��  ��  ��  ��  8 o   i j���� 0 asocformatter asocFormatter6 >?> n  r �@A@ I   s ���B���� 0 
setlocale_ 
setLocale_B C�C l  s |D�~�}D n  s |EFE I   x |�|�{�z�| 0 systemlocale systemLocale�{  �z  F n  s xGHG o   t x�y�y 0 nslocale NSLocaleH m   s t�x
�x misccura�~  �}  �  ��  A o   r s�w�w 0 asocformatter asocFormatter? I�vI r   � �JKJ c   � �LML l  � �N�u�tN n  � �OPO I   � ��sQ�r�s &0 stringfromnumber_ stringFromNumber_Q R�qR o   � ��p�p 0 defaultvalue defaultValue�q  �r  P o   � ��o�o 0 asocformatter asocFormatter�u  �t  M m   � ��n
�n 
****K o      �m�m 0 defaulttext defaultText�v  ) STS G   � �UVU >   � �WXW l  � �Y�l�kY I  � ��jZ[
�j .corecnte****       ****Z J   � �\\ ]�i] o   � ��h�h 0 defaultvalue defaultValue�i  [ �g^�f
�g 
kocl^ m   � ��e
�e 
furl�f  �l  �k  X m   � ��d�d  V >   � �_`_ l  � �a�c�ba I  � ��abc
�a .corecnte****       ****b J   � �dd e�`e o   � ��_�_ 0 defaultvalue defaultValue�`  c �^f�]
�^ 
koclf m   � ��\
�\ 
alis�]  �c  �b  ` m   � ��[�[  T ghg r   � �iji n   � �klk 1   � ��Z
�Z 
psxpl o   � ��Y�Y 0 defaultvalue defaultValuej o      �X�X 0 defaulttext defaultTexth mnm =  � �opo o   � ��W�W 0 defaultvalue defaultValuep m   � ��V
�V boovtruen qrq r   � �sts m   � �uu �vv  Yt o      �U�U 0 defaulttext defaultTextr wxw =  � �yzy o   � ��T�T 0 defaultvalue defaultValuez m   � ��S
�S boovfalsx {�R{ r   � �|}| m   � �~~ �  N} o      �Q�Q 0 defaulttext defaultText�R  	 L   � ��� m   � ��� ���   ��P� L   � ��� b   � ���� b   � ���� m   � ��� ���  D e f a u l t :   � o   � ��O�O 0 defaulttext defaultText� m   � ��� ���    �P  � G A formats default value for inclusion in OPTIONS/ARGUMENTS section   � ��� �   f o r m a t s   d e f a u l t   v a l u e   f o r   i n c l u s i o n   i n   O P T I O N S / A R G U M E N T S   s e c t i o n� ��� l     �N�M�L�N  �M  �L  � ��� l     �K���K  �  -----   � ��� 
 - - - - -� ��� l     �J���J  �   parse ARGV   � ���    p a r s e   A R G V� ��� l     �I�H�G�I  �H  �G  � ��� i  v y��� I      �F��E�F (0 _buildoptionstable _buildOptionsTable� ��D� o      �C�C &0 optiondefinitions optionDefinitions�D  �E  � k    ��� ��� l     �B���B  � � � create a case-sensitive lookup table of all short and long option names (e.g. "-a", "-A", "-o", "--output-file", etc); used by _parseOptions() to retrieve the definition record for each option it encounters   � ����   c r e a t e   a   c a s e - s e n s i t i v e   l o o k u p   t a b l e   o f   a l l   s h o r t   a n d   l o n g   o p t i o n   n a m e s   ( e . g .   " - a " ,   " - A " ,   " - o " ,   " - - o u t p u t - f i l e " ,   e t c ) ;   u s e d   b y   _ p a r s e O p t i o n s ( )   t o   r e t r i e v e   t h e   d e f i n i t i o n   r e c o r d   f o r   e a c h   o p t i o n   i t   e n c o u n t e r s� ��� r     ��� J     �A�A  � o      �@�@ 0 
foundnames 
foundNames� ��� r    ��� n   ��� I    �?�>�=�? 0 
dictionary  �>  �=  � n   ��� o    �<�< *0 nsmutabledictionary NSMutableDictionary� m    �;
�; misccura� o      �:�: 20 optiondefinitionsbyname optionDefinitionsByName� ��� X   ���9�� k   ��� ��� l   ;���� r    ;��� b    9��� l   $��8�7� c    $��� n   "��� 1     "�6
�6 
pcnt� o     �5�5 0 	optionref 	optionRef� m   " #�4
�4 
reco�8  �7  � K   $ 8�� �3���3 0 	shortname 	shortName� m   % &�� ���  � �2���2 0 longname longName� m   ' (�� ���  � �1���1 0 propertyname propertyName� m   ) *�� ���  � �0���0 0 	valuetype 	valueType� m   + ,�/
�/ 
ctxt� �.���. 0 islist isList� m   / 0�-
�- boovfals� �,��+�, 0 defaultvalue defaultValue� m   3 4�*
�* boovfals�+  � o      �)�) $0 optiondefinition optionDefinition� 5 / this defaultValue is only used by boolean opts   � ��� ^   t h i s   d e f a u l t V a l u e   i s   o n l y   u s e d   b y   b o o l e a n   o p t s� ��� Q   < y���� k   ? _�� ��� r   ? F��� c   ? D��� n  ? B��� o   @ B�(�( 0 propertyname propertyName� o   ? @�'�' $0 optiondefinition optionDefinition� m   B C�&
�& 
ctxt� o      �%�% 0 propertyname propertyName� ��$� Z  G _���#�"� =  G N��� n  G J��� o   H J�!�! 0 propertyname propertyName� o   G H� �  $0 optiondefinition optionDefinition� m   J M�� ���  � R   Q [���
� .ascrerr ****      � ****�  � ���
� 
errn� m   U X���\�  �#  �"  �$  � R      ���
� .ascrerr ****      � ****�  � ���
� 
errn� d      �� m      ����  � R   g y���
� .ascrerr ****      � ****� m   u x�� ��� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( p r o p e r t y   n a m e   m u s t   b e   n o n - e m p t y   t e x t ) .� ���
� 
errn� m   k n���Y� ���
� 
erob� o   q r�� 0 	optionref 	optionRef�  � ��� r   z ��	 � n   z 			 1   { �
� 
leng	 o   z {�� 0 
foundnames 
foundNames	  o      �� 0 	namecount 	nameCount� 			 X   ��	�		 k   ��		 				 r   � �	
		
 o   � ��� 0 aref aRef	 J      		 			 o      �
�
 0 thename theName	 	�		 o      �� 0 
nameprefix 
namePrefix�	  		 			 Q   � �				 r   � �			 c   � �			 o   � ��� 0 thename theName	 m   � ��
� 
ctxt	 o      �� 0 thename theName	 R      ��	
� .ascrerr ****      � ****�  	 �	�
� 
errn	 d      		 m      � � ��  	 R   � ���		
�� .ascrerr ****      � ****	 m   � �		 �		 r I n v a l i d   o p t i o n   d e f i n i t i o n   ( s h o r t / l o n g   n a m e   m u s t   b e   t e x t ) .	 ��	 	!
�� 
errn	  m   � ������\	! ��	"��
�� 
erob	" o   � ����� 0 	optionref 	optionRef��  	 	#��	# Z   ��	$	%����	$ >  � �	&	'	& o   � ����� 0 thename theName	' m   � �	(	( �	)	)  	% k   ��	*	* 	+	,	+ Z  � �	-	.����	- E  � �	/	0	/ o   � ����� 0 
foundnames 
foundNames	0 J   � �	1	1 	2��	2 o   � ����� 0 thename theName��  	. R   � ���	3	4
�� .ascrerr ****      � ****	3 m   � �	5	5 �	6	6 x I n v a l i d   o p t i o n   d e f i n i t i o n   ( f o u n d   d u p l i c a t e   s h o r t / l o n g   n a m e ) .	4 ��	7	8
�� 
errn	7 m   � ������Y	8 ��	9��
�� 
erob	9 o   � ����� 0 	optionref 	optionRef��  ��  ��  	, 	:	;	: r   �	<	=	< o   � ����� 0 thename theName	= n      	>	?	>  ;   	? o   � ���� 0 
foundnames 
foundNames	; 	@	A	@ P  �	B��	C	B Z  
�	D	E��	F	D =  
	G	H	G n 
	I	J	I 1  ��
�� 
leng	J o  
���� 0 
nameprefix 
namePrefix	H m  ���� 	E l A	K	L	M	K Z A	N	O����	N l (	P����	P G  (	Q	R	Q >  	S	T	S n 	U	V	U 1  ��
�� 
leng	V o  ���� 0 thename theName	T m  ���� 	R H  $	W	W E #	X	Y	X m  !	Z	Z �	[	[ 4 a b c d e f g h i j k l m n o p q r s t u v w x y z	Y o  !"���� 0 thename theName��  ��  	O R  +=��	\	]
�� .ascrerr ****      � ****	\ m  9<	^	^ �	_	_ � I n v a l i d   o p t i o n   d e f i n i t i o n   ( s h o r t   n a m e   m u s t   b e   a   s i n g l e   A - Z   o r   a - z   c h a r a c t e r ) .	] ��	`	a
�� 
errn	` m  /2�����Y	a ��	b��
�� 
erob	b o  56���� 0 	optionref 	optionRef��  ��  ��  	L   validate short name   	M �	c	c (   v a l i d a t e   s h o r t   n a m e��  	F l D�	d	e	f	d k  D�	g	g 	h	i	h Z D�	j	k����	j G  Di	l	m	l G  D]	n	o	n =  DK	p	q	p n DI	r	s	r 1  EI��
�� 
leng	s o  DE���� 0 thename theName	q m  IJ����  	o H  NY	t	t E NX	u	v	u m  NQ	w	w �	x	x 4 a b c d e f g h i j k l m n o p q r s t u v w x y z	v n QW	y	z	y 4  RW��	{
�� 
cha 	{ m  UV���� 	z o  QR���� 0 thename theName	m D  `e	|	}	| o  `a���� 0 thename theName	} m  ad	~	~ �		  -	k R  l~��	�	�
�� .ascrerr ****      � ****	� m  z}	�	� �	�	� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( l o n g   n a m e   m u s t   s t a r t   w i t h   A - Z   o r   a - z   c h a r a c t e r ) .	� ��	�	�
�� 
errn	� m  ps�����Y	� ��	���
�� 
erob	� o  vw���� 0 	optionref 	optionRef��  ��  ��  	i 	���	� X  ��	���	�	� Z ��	�	�����	� H  ��	�	� E ��	�	�	� m  ��	�	� �	�	� J a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0 -	� n ��	�	�	� 1  ����
�� 
pcnt	� o  ������ 0 charref charRef	� R  ����	�	�
�� .ascrerr ****      � ****	� m  ��	�	� �	�	� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( l o n g   n a m e   c a n   o n l y   c o n t a i n   A - Z ,   a - z ,   0 - 9   o r   h y p h e n   c h a r a c t e r s ) .	� ��	�	�
�� 
errn	� m  �������Y	� ��	���
�� 
erob	� o  ������ 0 	optionref 	optionRef��  ��  ��  �� 0 charref charRef	� o  ������ 0 thename theName��  	e   validate long name   	f �	�	� &   v a l i d a t e   l o n g   n a m e��  	C ����
�� conscase��  	A 	���	� l ��	�����	� n ��	�	�	� I  ����	����� &0 setobject_forkey_ setObject_forKey_	� 	�	�	� o  ������ $0 optiondefinition optionDefinition	� 	���	� l ��	�����	� b  ��	�	�	� o  ������ 0 
nameprefix 
namePrefix	� o  ������ 0 thename theName��  ��  ��  ��  	� o  ������ 20 optiondefinitionsbyname optionDefinitionsByName��  ��  ��  ��  ��  ��  � 0 aref aRef	 J   � �	�	� 	�	�	� J   � �	�	� 	�	�	� n  � �	�	�	� o   � ����� 0 	shortname 	shortName	� o   � ����� $0 optiondefinition optionDefinition	� 	���	� m   � �	�	� �	�	�  -��  	� 	���	� J   � �	�	� 	�	�	� n  � �	�	�	� o   � ����� 0 longname longName	� o   � ����� $0 optiondefinition optionDefinition	� 	���	� m   � �	�	� �	�	�  - -��  ��  	 	���	� Z ��	�	�����	� =  ��	�	�	� n  ��	�	�	� 1  ����
�� 
leng	� o  ������ 0 
foundnames 
foundNames	� o  ������ 0 	namecount 	nameCount	� R  ����	�	�
�� .ascrerr ****      � ****	� m  ��	�	� �	�	� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   n o n - e m p t y    s h o r t N a m e    a n d / o r    l o n g N a m e    p r o p e r t y ) .	� ��	�	�
�� 
errn	� m  �������Y	� ��	���
�� 
erob	� o  ������ 0 	optionref 	optionRef��  ��  ��  ��  �9 0 	optionref 	optionRef� o    ���� &0 optiondefinitions optionDefinitions� 	���	� L  ��	�	� o  ������ 20 optiondefinitionsbyname optionDefinitionsByName��  � 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� i  z }	�	�	� I      ��	����� 0 _parseoptions _parseOptions	� 	�	�	� o      ���� 0 rawarguments rawArguments	� 	�	�	� o      ���� &0 optiondefinitions optionDefinitions	� 	���	� o      ���� &0 hasdefaultoptions hasDefaultOptions��  ��  	� k    n	�	� 	�	�	� l     ��	�	���  	�oi given a list of raw arguments passed to script's run handler, extract those items that are command option names and (where relevant) their corresponding values, converting those values to the required type and returning an NSMutableDictionary of option name-value pairs plus a list of any remaining (i.e. non-option) arguments to be passed to _parseArguments()   	� �	�	��   g i v e n   a   l i s t   o f   r a w   a r g u m e n t s   p a s s e d   t o   s c r i p t ' s   r u n   h a n d l e r ,   e x t r a c t   t h o s e   i t e m s   t h a t   a r e   c o m m a n d   o p t i o n   n a m e s   a n d   ( w h e r e   r e l e v a n t )   t h e i r   c o r r e s p o n d i n g   v a l u e s ,   c o n v e r t i n g   t h o s e   v a l u e s   t o   t h e   r e q u i r e d   t y p e   a n d   r e t u r n i n g   a n   N S M u t a b l e D i c t i o n a r y   o f   o p t i o n   n a m e - v a l u e   p a i r s   p l u s   a   l i s t   o f   a n y   r e m a i n i n g   ( i . e .   n o n - o p t i o n )   a r g u m e n t s   t o   b e   p a s s e d   t o   _ p a r s e A r g u m e n t s ( )	� 	�	�	� l     ��	�	���  	� 6 0 first build a lookup table of all known options   	� �	�	� `   f i r s t   b u i l d   a   l o o k u p   t a b l e   o f   a l l   k n o w n   o p t i o n s	� 	�	�	� r     	�	�	� I     ��	����� (0 _buildoptionstable _buildOptionsTable	� 	���	� o    ���� &0 optiondefinitions optionDefinitions��  ��  	� o      ���� 20 optiondefinitionsbyname optionDefinitionsByName	� 	�	�	� r   	 	�	�	� n  	 	�	�	� I    �������� 0 
dictionary  ��  ��  	� n  	 	�	�	� o   
 �� *0 nsmutabledictionary NSMutableDictionary	� m   	 
�~
�~ misccura	� o      �}�} (0 asocparametersdict asocParametersDict	� 	�	�	� l   	�	�	�	� r    	�	�	� m    	�	� �	�	�  =	� n     	�	�	� 1    �|
�| 
txdl	� 1    �{
�{ 
ascr	� P J note: a long option can use a space or '=' to separate its name and value   	� �	�	� �   n o t e :   a   l o n g   o p t i o n   c a n   u s e   a   s p a c e   o r   ' = '   t o   s e p a r a t e   i t s   n a m e   a n d   v a l u e	� 	�	�	� l   �z	�
 �z  	� R L consume raw arguments list until it is empty or a non-option is encountered   
  �

 �   c o n s u m e   r a w   a r g u m e n t s   l i s t   u n t i l   i t   i s   e m p t y   o r   a   n o n - o p t i o n   i s   e n c o u n t e r e d	� 


 W   h


 k   "c

 


 r   " (
	


	 n   " &


 4  # &�y

�y 
cobj
 m   $ %�x�x 
 o   " #�w�w 0 rawarguments rawArguments

 o      �v�v 0 thearg theArg
 


 Z   ) 




 C   ) ,


 o   ) *�u�u 0 thearg theArg
 m   * +

 �

  - -
 l  / m



 k   / m

 


 Z   / @

�t�s
 =  / 2
 
!
  o   / 0�r�r 0 thearg theArg
! m   0 1
"
" �
#
#  - -
 l  5 <
$
%
&
$ k   5 <
'
' 
(
)
( r   5 :
*
+
* n   5 8
,
-
, 1   6 8�q
�q 
rest
- o   5 6�p�p 0 rawarguments rawArguments
+ o      �o�o 0 rawarguments rawArguments
) 
.�n
.  S   ; <�n  
% i c double-hypens terminates the option list, so anything left in rawArguments is positional arguments   
& �
/
/ �   d o u b l e - h y p e n s   t e r m i n a t e s   t h e   o p t i o n   l i s t ,   s o   a n y t h i n g   l e f t   i n   r a w A r g u m e n t s   i s   p o s i t i o n a l   a r g u m e n t s�t  �s  
 
0
1
0 l  A G
2
3
4
2 r   A G
5
6
5 n   A E
7
8
7 4  B E�m
9
�m 
citm
9 m   C D�l�l 
8 o   A B�k�k 0 thearg theArg
6 o      �j�j 0 
optionname 
optionName
3   get "--NAME"   
4 �
:
:    g e t   " - - N A M E "
1 
;�i
; Z   H m
<
=�h
>
< ?   H Q
?
@
? l  H O
A�g�f
A I  H O�e
B
C
�e .corecnte****       ****
B o   H I�d�d 0 thearg theArg
C �c
D�b
�c 
kocl
D m   J K�a
�a 
citm�b  �g  �f  
@ m   O P�`�` 
= l  T e
E
F
G
E r   T e
H
I
H n   T `
J
K
J 7  U `�_
L
M
�_ 
ctxt
L l  Y \
N�^�]
N 4   Y \�\
O
�\ 
citm
O m   Z [�[�[ �^  �]  
M m   ] _�Z�Z��
K o   T U�Y�Y 0 thearg theArg
I n      
P
Q
P 4  a d�X
R
�X 
cobj
R m   b c�W�W 
Q o   ` a�V�V 0 rawarguments rawArguments
F * $ put "VALUE" back on stack for later   
G �
S
S H   p u t   " V A L U E "   b a c k   o n   s t a c k   f o r   l a t e r�h  
> l  h m
T
U
V
T r   h m
W
X
W n   h k
Y
Z
Y 1   i k�U
�U 
rest
Z o   h i�T�T 0 rawarguments rawArguments
X o      �S�S 0 rawarguments rawArguments
U ( " remove the option name from stack   
V �
[
[ D   r e m o v e   t h e   o p t i o n   n a m e   f r o m   s t a c k�i  
 < 6 found "--[NAME[=VALUE]]" (NAME is a long option name)   
 �
\
\ l   f o u n d   " - - [ N A M E [ = V A L U E ] ] "   ( N A M E   i s   a   l o n g   o p t i o n   n a m e )
 
]
^
] C   p s
_
`
_ o   p q�R�R 0 thearg theArg
` m   q r
a
a �
b
b  -
^ 
c�Q
c l  v �
d
e
f
d k   v �
g
g 
h
i
h l  v �
j
k
l
j Z  v �
m
n�P�O
m G   v �
o
p
o =  v {
q
r
q o   v w�N�N 0 thearg theArg
r m   w z
s
s �
t
t  -
p E  ~ �
u
v
u m   ~ �
w
w �
x
x  0 1 2 3 4 5 6 7 8 9 0
v n  � �
y
z
y 4   � ��M
{
�M 
cha 
{ m   � ��L�L 
z o   � ��K�K 0 thearg theArg
n  S   � ��P  �O  
k � { it's a lone hyphen or a negative number (i.e. not an option), so treat it and rest of rawArguments as positional arguments   
l �
|
| �   i t ' s   a   l o n e   h y p h e n   o r   a   n e g a t i v e   n u m b e r   ( i . e .   n o t   a n   o p t i o n ) ,   s o   t r e a t   i t   a n d   r e s t   o f   r a w A r g u m e n t s   a s   p o s i t i o n a l   a r g u m e n t s
i 
}
~
} l  � �

�
�
 r   � �
�
�
� n   � �
�
�
� 7  � ��J
�
�
�J 
ctxt
� m   � ��I�I 
� m   � ��H�H 
� o   � ��G�G 0 thearg theArg
� o      �F�F 0 
optionname 
optionName
�  	 get "-N"   
� �
�
�    g e t   " - N "
~ 
��E
� Z   � �
�
��D
�
� ?   � �
�
�
� n  � �
�
�
� 1   � ��C
�C 
leng
� o   � ��B�B 0 thearg theArg
� m   � ��A�A 
� l  � �
�
�
�
� k   � �
�
� 
�
�
� r   � �
�
�
� n   � �
�
�
� 7  � ��@
�
�
�@ 
ctxt
� m   � ��?�? 
� m   � ��>�>��
� o   � ��=�= 0 thearg theArg
� n      
�
�
� 4  � ��<
�
�< 
cobj
� m   � ��;�; 
� o   � ��:�: 0 rawarguments rawArguments
� 
�
�
� r   � �
�
�
� n  � �
�
�
� I   � ��9
��8�9 0 objectforkey_ objectForKey_
� 
��7
� o   � ��6�6 0 
optionname 
optionName�7  �8  
� o   � ��5�5 20 optiondefinitionsbyname optionDefinitionsByName
� o      �4�4 $0 optiondefinition optionDefinition
� 
��3
� Z   � �
�
��2�1
� F   � �
�
�
� >  � �
�
�
� o   � ��0�0 $0 optiondefinition optionDefinition
� m   � ��/
�/ 
msng
� =  � �
�
�
� n  � �
�
�
� o   � ��.�. 0 	valuetype 	valueType
� l  � �
��-�,
� c   � �
�
�
� o   � ��+�+ $0 optiondefinition optionDefinition
� m   � ��*
�* 
****�-  �,  
� m   � ��)
�) 
bool
� r   � �
�
�
� b   � �
�
�
� m   � �
�
� �
�
�  -
� n   � �
�
�
� 4  � ��(
�
�( 
cobj
� m   � ��'�' 
� o   � ��&�& 0 rawarguments rawArguments
� n      
�
�
� 4  � ��%
�
�% 
cobj
� m   � ��$�$ 
� o   � ��#�# 0 rawarguments rawArguments�2  �1  �3  
� / ) put "[-N�]VALUE" back on stack for later   
� �
�
� R   p u t   " [ - N & ] V A L U E "   b a c k   o n   s t a c k   f o r   l a t e r�D  
� l  � �
�
�
�
� r   � �
�
�
� n   � �
�
�
� 1   � ��"
�" 
rest
� o   � ��!�! 0 rawarguments rawArguments
� o      � �  0 rawarguments rawArguments
� ' !remove the option name from stack   
� �
�
� B r e m o v e   t h e   o p t i o n   n a m e   f r o m   s t a c k�E  
e H B found "-N[N�][VALUE]" (N is a single-character short option name)   
f �
�
� �   f o u n d   " - N [ N & ] [ V A L U E ] "   ( N   i s   a   s i n g l e - c h a r a c t e r   s h o r t   o p t i o n   n a m e )�Q  
 l  � 
�
�
�
�  S   � 
� S M not an option name, so anything left in rawArguments is positional arguments   
� �
�
� �   n o t   a n   o p t i o n   n a m e ,   s o   a n y t h i n g   l e f t   i n   r a w A r g u m e n t s   i s   p o s i t i o n a l   a r g u m e n t s
 
�
�
� l �
�
��  
� - ' look up the option's definition record   
� �
�
� N   l o o k   u p   t h e   o p t i o n ' s   d e f i n i t i o n   r e c o r d
� 
�
�
� r  	
�
�
� n 
�
�
� I  �
��� 0 objectforkey_ objectForKey_
� 
��
� o  �� 0 
optionname 
optionName�  �  
� o  �� 20 optiondefinitionsbyname optionDefinitionsByName
� o      �� $0 optiondefinition optionDefinition
� 
�
�
� Z  
�
�
���
� = 

�
�
� o  
�� $0 optiondefinition optionDefinition
� m  �
� 
msng
� l �
�
�
�
� k  �
�
� 
�
�
� Z  t
�
���
� o  �� &0 hasdefaultoptions hasDefaultOptions
� k  p
�
� 
�
�
� r  ?
�
�
� J  0
�
� 
�
�
� E "
�
�
� J  
�
� 
�
�
� m  
�
� �
�
�  - h
� 
��
� m  
�
� �
�
�  - - h e l p�  
� J  !
�
� 
��
� o  �� 0 
optionname 
optionName�  
� 
��
� E ".   J  "*  m  "% �  - v � m  %( �		  - - v e r s i o n�   J  *-

 � o  *+�� 0 
optionname 
optionName�  �  
� J        o      �
�
 0 ishelp isHelp �	 o      �� 0 	isversion 	isVersion�	  
� � Z  @p�� G  @I o  @A�� 0 ishelp isHelp o  DE�� 0 	isversion 	isVersion l Ll k  Ll  n LQ I  MQ��� � $0 removeallobjects removeAllObjects�  �    o  LM���� (0 asocparametersdict asocParametersDict  n R[  I  S[��!���� $0 setvalue_forkey_ setValue_forKey_! "#" o  ST���� 0 ishelp isHelp# $��$ m  TW%% �&&  h e l p��  ��    o  RS���� (0 asocparametersdict asocParametersDict '(' n \e)*) I  ]e��+���� $0 setvalue_forkey_ setValue_forKey_+ ,-, o  ]^���� 0 	isversion 	isVersion- .��. m  ^a// �00  v e r s i o n��  ��  * o  \]���� (0 asocparametersdict asocParametersDict( 121 r  fj343 J  fh����  4 o      ���� 0 rawarguments rawArguments2 5��5  S  kl��    � ignore everything else and return a minimal record containing only `help` and `version` properties, one or both of which are true, so must be dealt with accordingly by `run` handler (i.e. format+log help text and return and/or return version number)    �66�   i g n o r e   e v e r y t h i n g   e l s e   a n d   r e t u r n   a   m i n i m a l   r e c o r d   c o n t a i n i n g   o n l y   ` h e l p `   a n d   ` v e r s i o n `   p r o p e r t i e s ,   o n e   o r   b o t h   o f   w h i c h   a r e   t r u e ,   s o   m u s t   b e   d e a l t   w i t h   a c c o r d i n g l y   b y   ` r u n `   h a n d l e r   ( i . e .   f o r m a t + l o g   h e l p   t e x t   a n d   r e t u r n   a n d / o r   r e t u r n   v e r s i o n   n u m b e r )�  �  �  �  �  
� 7��7 R  u���89
�� .ascrerr ****      � ****8 b  �:;: m  �<< �==   U n k n o w n   o p t i o n :  ; o  ������ 0 
optionname 
optionName9 ��>��
�� 
errn> o  y~����  0 _argvusererror _ArgvUserError��  ��  
� A ; check for default options (help/version), else raise error   
� �?? v   c h e c k   f o r   d e f a u l t   o p t i o n s   ( h e l p / v e r s i o n ) ,   e l s e   r a i s e   e r r o r�  �  
� @A@ r  ��BCB c  ��DED o  ������ $0 optiondefinition optionDefinitionE m  ����
�� 
****C o      ���� $0 optiondefinition optionDefinitionA FGF r  ��HIH n ��JKJ o  ������ 0 propertyname propertyNameK o  ������ $0 optiondefinition optionDefinitionI o      ���� 0 propertyname propertyNameG LML l ����NO��  N #  now process the option value   O �PP :   n o w   p r o c e s s   t h e   o p t i o n   v a l u eM QRQ Z  �ST��US = ��VWV n ��XYX o  ������ 0 	valuetype 	valueTypeY o  ������ $0 optiondefinition optionDefinitionW m  ����
�� 
boolT Q  ��Z[\Z r  ��]^] H  ��__ n ��`a` o  ������ 0 defaultvalue defaultValuea o  ������ $0 optiondefinition optionDefinition^ o      ���� 0 thevalue theValue[ R      ������
�� .ascrerr ****      � ****��  ��  \ R  ����bc
�� .ascrerr ****      � ****b b  ��ded m  ��ff �gg J B a d   d e f a u l t V a l u e   f o r   b o o l e a n   o p t i o n :  e o  ������ 0 
optionname 
optionNamec ��hi
�� 
errnh m  �������\i ��j��
�� 
erobj l ��k����k N  ��ll n  ��mnm o  ������ 0 defaultvalue defaultValuen o  ������ $0 optiondefinition optionDefinition��  ��  ��  ��  U k  �oo pqp Z ��rs����r = ��tut o  ������ 0 rawarguments rawArgumentsu J  ������  s R  ����vw
�� .ascrerr ****      � ****v b  ��xyx m  ��zz �{{ 4 M i s s i n g   v a l u e   f o r   o p t i o n :  y o  ������ 0 
optionname 
optionNamew ��|��
�� 
errn| o  ������  0 _argvusererror _ArgvUserError��  ��  ��  q }~} r  ��� I  ��������� 0 _unpackvalue _unpackValue� ��� n  ����� 4 �����
�� 
cobj� m  ������ � o  ������ 0 rawarguments rawArguments� ���� o  ������ $0 optiondefinition optionDefinition��  ��  � o      ���� 0 thevalue theValue~ ���� r  ���� n  ���� 1  ���
�� 
rest� o  ������ 0 rawarguments rawArguments� o      ���� 0 rawarguments rawArguments��  R ��� Z  [������ n 
��� o  	���� 0 islist isList� o  ���� $0 optiondefinition optionDefinition� l 7���� k  7�� ��� r  ��� n ��� I  ������� 0 objectforkey_ objectForKey_� ���� o  ���� 0 propertyname propertyName��  ��  � o  ���� (0 asocparametersdict asocParametersDict� o      ���� 0 thelist theList� ���� Z  7������ = ��� o  ���� 0 thelist theList� m  ��
�� 
msng� r  *��� n (��� I  #(������� $0 arraywithobject_ arrayWithObject_� ���� o  #$���� 0 thevalue theValue��  ��  � n #��� o  #����  0 nsmutablearray NSMutableArray� m  ��
�� misccura� o      ���� 0 thevalue theValue��  � k  -7�� ��� n -3��� I  .3������� 0 
addobject_ 
addObject_� ���� o  ./���� 0 thevalue theValue��  ��  � o  -.���� 0 thelist theList� ���� r  47��� o  45���� 0 thelist theList� o      ���� 0 thevalue theValue��  ��  � = 7 option can appear multiple times, so collect in a list   � ��� n   o p t i o n   c a n   a p p e a r   m u l t i p l e   t i m e s ,   s o   c o l l e c t   i n   a   l i s t� ��� > :D��� l :@������ n :@��� I  ;@������� 0 objectforkey_ objectForKey_� ���� o  ;<���� 0 propertyname propertyName��  ��  � o  :;���� (0 asocparametersdict asocParametersDict��  ��  � m  @C��
�� 
msng� ���� R  GW����
�� .ascrerr ****      � ****� b  QV��� m  QT�� ��� $ D u p l i c a t e   o p t i o n :  � o  TU���� 0 
optionname 
optionName� �����
�� 
errn� o  KP����  0 _argvusererror _ArgvUserError��  ��  ��  � ���� n \c��� I  ]c������� &0 setobject_forkey_ setObject_forKey_� ��� o  ]^���� 0 thevalue theValue� ���� o  ^_���� 0 propertyname propertyName��  ��  � o  \]���� (0 asocparametersdict asocParametersDict��  
 =   !��� o    ���� 0 rawarguments rawArguments� J     ����  
 ���� L  in�� J  im�� ��� o  ij���� (0 asocparametersdict asocParametersDict� ���� o  jk���� 0 rawarguments rawArguments��  ��  	� ��� l     ��������  ��  ��  � ��� l     �������  ��  �  � ��� i  ~ ���� I      �~��}�~ (0 _adddefaultoptions _addDefaultOptions� ��� o      �|�| (0 asocparametersdict asocParametersDict� ��{� o      �z�z &0 optiondefinitions optionDefinitions�{  �}  � k     ��� ��� X     ���y�� k    ��� ��� r    "��� b     ��� l   ��x�w� c    ��� o    �v�v 0 recref recRef� m    �u
�u 
reco�x  �w  � K    �� �t���t 0 propertyname propertyName� m    �� ���  � �s���s 0 longname longName� m    �� ���  � �r��q�r 0 defaultvalue defaultValue� o    �p�p 0 novalue NoValue�q  � o      �o�o 0 rec  � ��� r   # (   n  # & o   $ &�n�n 0 propertyname propertyName o   # $�m�m 0 rec   o      �l�l 0 propertyname propertyName�  Z  ) 8�k�j =  ) ,	 o   ) *�i�i 0 propertyname propertyName	 m   * +

 �   r   / 4 n  / 2 o   0 2�h�h 0 longname longName o   / 0�g�g 0 rec   o      �f�f 0 propertyname propertyName�k  �j   �e Z   9 ��d�c =  9 A l  9 ?�b�a n  9 ? I   : ?�`�_�` 0 objectforkey_ objectForKey_ �^ o   : ;�]�] 0 propertyname propertyName�^  �_   o   9 :�\�\ (0 asocparametersdict asocParametersDict�b  �a   m   ? @�[
�[ 
msng k   D �  r   D I n  D G  o   E G�Z�Z 0 defaultvalue defaultValue  o   D E�Y�Y 0 rec   o      �X�X 0 thevalue theValue !"! Z   J �#$�W�V# =  J Q%&% o   J K�U�U 0 thevalue theValue& o   K P�T�T 0 novalue NoValue$ l  T �'()' k   T �** +,+ r   T [-.- b   T Y/0/ m   T U11 �22  - -0 n  U X343 o   V X�S�S 0 longname longName4 o   U V�R�R 0 rec  . o      �Q�Q 0 
optionname 
optionName, 565 Z  \ o78�P�O7 =  \ _9:9 o   \ ]�N�N 0 
optionname 
optionName: m   ] ^;; �<<  - -8 r   b k=>= b   b i?@? m   b cAA �BB  -@ n  c hCDC o   d h�M�M 0 	shortname 	shortNameD o   c d�L�L 0 rec  > o      �K�K 0 
optionname 
optionName�P  �O  6 E�JE R   p ��IFG
�I .ascrerr ****      � ****F b   z HIH m   z }JJ �KK 2 M i s s i n g   r e q u i r e d   o p t i o n :  I o   } ~�H�H 0 
optionname 
optionNameG �GL�F
�G 
errnL o   t y�E�E  0 _argvusererror _ArgvUserError�F  �J  ( 2 , record doesn't have a defaultValue property   ) �MM X   r e c o r d   d o e s n ' t   h a v e   a   d e f a u l t V a l u e   p r o p e r t y�W  �V  " NON Z  � �PQ�D�CP =  � �RSR o   � ��B�B 0 thevalue theValueS m   � ��A
�A 
msngQ r   � �TUT n  � �VWV I   � ��@�?�>�@ 0 null  �?  �>  W n  � �XYX o   � ��=�= 0 nsnull NSNullY m   � ��<
�< misccuraU o      �;�; 0 thevalue theValue�D  �C  O Z�:Z l  � �[�9�8[ n  � �\]\ I   � ��7^�6�7 &0 setobject_forkey_ setObject_forKey_^ _`_ o   � ��5�5 0 thevalue theValue` a�4a o   � ��3�3 0 propertyname propertyName�4  �6  ] o   � ��2�2 (0 asocparametersdict asocParametersDict�9  �8  �:  �d  �c  �e  �y 0 recref recRef� o    �1�1 &0 optiondefinitions optionDefinitions� bcb l  � ��0de�0  d k e add default 'help', 'version' properties to parameters dict (record) if not already supplied by user   e �ff �   a d d   d e f a u l t   ' h e l p ' ,   ' v e r s i o n '   p r o p e r t i e s   t o   p a r a m e t e r s   d i c t   ( r e c o r d )   i f   n o t   a l r e a d y   s u p p l i e d   b y   u s e rc g�/g X   � �h�.ih Z  � �jk�-�,j =  � �lml l  � �n�+�*n n  � �opo I   � ��)q�(�) 0 objectforkey_ objectForKey_q r�'r l  � �s�&�%s n  � �tut 1   � ��$
�$ 
pcntu o   � ��#�# "0 propertynameref propertyNameRef�&  �%  �'  �(  p o   � ��"�" (0 asocparametersdict asocParametersDict�+  �*  m m   � ��!
�! 
msngk l  � �v� �v n  � �wxw I   � ��y�� &0 setobject_forkey_ setObject_forKey_y z{z m   � ��
� boovfals{ |�| l  � �}��} n  � �~~ 1   � ��
� 
pcnt o   � ��� "0 propertynameref propertyNameRef�  �  �  �  x o   � ��� (0 asocparametersdict asocParametersDict�   �  �-  �,  �. "0 propertynameref propertyNameRefi J   � ��� ��� m   � ��� ���  h e l p� ��� m   � ��� ���  v e r s i o n�  �/  � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ��
�	�  �
  �	  � ��� i  � ���� I      ����  0 _ordinalnumber _ordinalNumber� ��� o      �� 0 n  �  �  � Z     7����� F     ��� E    ��� J     �� ��� m     �� � ��� m    �� � ��� m    � �  �  � J    
�� ���� `    ��� o    ���� 0 n  � m    ���� 
��  � H    �� E   ��� J    �� ��� m    ���� � ��� m    ���� � ���� m    ���� ��  � J    �� ���� `    ��� o    ���� 0 n  � m    ���� d��  � L    .�� b    -��� l   "������ c    "��� o     ���� 0 n  � m     !��
�� 
ctxt��  ��  � n   " ,��� 4   ' ,���
�� 
cobj� l  ( +������ `   ( +��� o   ( )���� 0 n  � m   ) *���� 
��  ��  � J   " '�� ��� m   " #�� ���  s t� ��� m   # $�� ���  n d� ���� m   $ %�� ���  r d��  �  � L   1 7�� b   1 6��� l  1 4������ c   1 4��� o   1 2���� 0 n  � m   2 3��
�� 
ctxt��  ��  � m   4 5�� ���  t h� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I      ������� "0 _parsearguments _parseArguments� ��� o      ���� 0 argumentslist argumentsList� ��� o      ���� *0 argumentdefinitions argumentDefinitions� ���� o      ���� (0 asocparametersdict asocParametersDict��  ��  � k    ��� ��� l     ������  � q k parse the remaining raw arguments, converting to the required type and adding to the parameters dictionary   � ��� �   p a r s e   t h e   r e m a i n i n g   r a w   a r g u m e n t s ,   c o n v e r t i n g   t o   t h e   r e q u i r e d   t y p e   a n d   a d d i n g   t o   t h e   p a r a m e t e r s   d i c t i o n a r y� ��� r     ��� m     ����  � o      ���� 0 i  � ��� r    	��� n   ��� 1    ��
�� 
leng� o    ���� 0 argumentslist argumentsList� o      ���� 0 argcount argCount� ��� l  
 ���� r   
 ��� m   
 ��
�� boovfals� o      ����  0 mustbeoptional mustBeOptional� � � repeat loop will throw invalid argument definition error if an optional argument definition is followed by a required argument definition   � ���   r e p e a t   l o o p   w i l l   t h r o w   i n v a l i d   a r g u m e n t   d e f i n i t i o n   e r r o r   i f   a n   o p t i o n a l   a r g u m e n t   d e f i n i t i o n   i s   f o l l o w e d   b y   a   r e q u i r e d   a r g u m e n t   d e f i n i t i o n� ��� X   k����� k   f�� � � r    # [    ! o    ���� 0 i   m     ����  o      ���� 0 i     r   $ < b   $ :	
	 l  $ )���� c   $ ) n  $ ' 1   % '��
�� 
pcnt o   $ %���� 0 argref argRef m   ' (��
�� 
reco��  ��  
 K   ) 9 ���� 0 propertyname propertyName m   * + �   ���� 0 	valuetype 	valueType m   , -��
�� 
ctxt ���� 0 islist isList m   . /��
�� boovfals ���� 0 defaultvalue defaultValue o   0 5���� 0 novalue NoValue ������ $0 valueplaceholder valuePlaceholder m   6 7 �  ��   o      ���� (0 argumentdefinition argumentDefinition  Z   = w !"��  >  = F#$# n  = @%&% o   > @���� 0 defaultvalue defaultValue& o   = >���� (0 argumentdefinition argumentDefinition$ o   @ E���� 0 novalue NoValue! r   I L'(' m   I J��
�� boovtrue( o      ����  0 mustbeoptional mustBeOptional" )*) F   O ^+,+ o   O P����  0 mustbeoptional mustBeOptional, =  S \-.- n  S V/0/ o   T V���� 0 defaultvalue defaultValue0 o   S T���� (0 argumentdefinition argumentDefinition. o   V [���� 0 novalue NoValue* 1��1 R   a s��23
�� .ascrerr ****      � ****2 m   o r44 �55 � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( a   n o n - o p t i o n a l   a r g u m e n t   c a n n o t   f o l l o w   a n   o p t i o n a l   a r g u m e n t ) .3 ��67
�� 
errn6 m   e h�����Y7 ��8��
�� 
erob8 o   k l���� 0 argref argRef��  ��  ��   9:9 Z  x �;<����; =  x =>= n  x {?@? o   y {���� 0 propertyname propertyName@ o   x y���� (0 argumentdefinition argumentDefinition> m   { ~AA �BB  < R   � ���CD
�� .ascrerr ****      � ****C m   � �EE �FF � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   n o n - e m p t y   p r o p e r t y N a m e   p r o p e r t y ) .D ��GH
�� 
errnG m   � ������YH ��I��
�� 
erobI o   � ����� 0 argref argRef��  ��  ��  : JKJ Z   �LM��NL =   � �OPO o   � ����� 0 argumentslist argumentsListP J   � �����  M k   � �QQ RSR r   � �TUT n  � �VWV o   � ����� 0 defaultvalue defaultValueW o   � ����� (0 argumentdefinition argumentDefinitionU o      ���� 0 thevalue theValueS X��X Z   � �YZ����Y =  � �[\[ o   � ����� 0 thevalue theValue\ o   � ����� 0 novalue NoValueZ l  � �]^_] k   � �`` aba r   � �cdc n  � �efe o   � ����� $0 valueplaceholder valuePlaceholderf o   � ����� (0 argumentdefinition argumentDefinitiond o      ���� "0 placeholdertext placeholderTextb ghg Z  � �ij����i =   � �klk n  � �mnm 1   � ���
�� 
lengn o   � ����� "0 placeholdertext placeholderTextl m   � �����  j r   � �opo I   � ���q���� 40 _defaultvalueplaceholder _defaultValuePlaceholderq r��r o   � ����� (0 argumentdefinition argumentDefinition��  ��  p o      ���� "0 placeholdertext placeholderText��  ��  h s��s R   � ���tu
�� .ascrerr ****      � ****t b   � �vwv b   � �xyx b   � �z{z b   � �|}| m   � �~~ �  M i s s i n g  } I   � ��������  0 _ordinalnumber _ordinalNumber� ���� o   � ����� 0 i  ��  ��  { m   � ��� ��� :   r e q u i r e d   a r g u m e n t   ( e x p e c t e d  y o   � ����� "0 placeholdertext placeholderTextw m   � ��� ���  ) .u �����
�� 
errn� o   � �����  0 _argvusererror _ArgvUserError��  ��  ^ W Q record doesn't have a defaultValue property, so user should've supplied argument   _ ��� �   r e c o r d   d o e s n ' t   h a v e   a   d e f a u l t V a l u e   p r o p e r t y ,   s o   u s e r   s h o u l d ' v e   s u p p l i e d   a r g u m e n t��  ��  ��  ��  N k   ��� ��� r   � ���� I   � �������� 0 _unpackvalue _unpackValue� ��� n   � ���� 4  � ����
�� 
cobj� m   � ����� � o   � ��� 0 argumentslist argumentsList� ��~� o   � ��}�} (0 argumentdefinition argumentDefinition�~  ��  � o      �|�| 0 thevalue theValue� ��{� r   ���� n   ���� 1   ��z
�z 
rest� o   � ��y�y 0 argumentslist argumentsList� o      �x�x 0 argumentslist argumentsList�{  K ��� Z  \���w�v� n 
��� o  	�u�u 0 islist isList� o  �t�t (0 argumentdefinition argumentDefinition� k  X�� ��� Z +���s�r� A  ��� o  �q�q 0 i  � n  ��� 1  �p
�p 
leng� o  �o�o *0 argumentdefinitions argumentDefinitions� R  '�n��
�n .ascrerr ****      � ****� m  #&�� ��� � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( o n l y   t h e   l a s t   a r g u m e n t   d e f i n i t i o n   m a y   c o n t a i n   a n    i s L i s t : t r u e    p r o p e r t y ) .� �m��
�m 
errn� m  �l�l�Y� �k��j
�k 
erob� o   �i�i 0 argref argRef�j  �s  �r  � ��� r  ,1��� J  ,/�� ��h� o  ,-�g�g 0 thevalue theValue�h  � o      �f�f 0 thevalue theValue� ��� X  2S��e�� r  BN��� I  BK�d��c�d 0 _unpackvalue _unpackValue� ��� n CF��� 1  DF�b
�b 
pcnt� o  CD�a�a 0 aref aRef� ��`� o  FG�_�_ (0 argumentdefinition argumentDefinition�`  �c  � n      ���  ;  LM� o  KL�^�^ 0 thevalue theValue�e 0 aref aRef� o  56�]�] 0 argumentslist argumentsList� ��\� r  TX��� J  TV�[�[  � o      �Z�Z 0 argumentslist argumentsList�\  �w  �v  � ��Y� l ]f��X�W� n ]f��� I  ^f�V��U�V &0 setobject_forkey_ setObject_forKey_� ��� o  ^_�T�T 0 thevalue theValue� ��S� l _b��R�Q� n _b��� o  `b�P�P 0 propertyname propertyName� o  _`�O�O (0 argumentdefinition argumentDefinition�R  �Q  �S  �U  � o  ]^�N�N (0 asocparametersdict asocParametersDict�X  �W  �Y  �� 0 argref argRef� o    �M�M *0 argumentdefinitions argumentDefinitions� ��L� Z l����K�J� > lp��� o  lm�I�I 0 argumentslist argumentsList� J  mo�H�H  � R  s��G��
�G .ascrerr ****      � ****� b  }���� b  }���� b  }���� b  }���� m  }��� ��� : T o o   m a n y   a r g u m e n t s   ( e x p e c t e d  � n  ����� 1  ���F
�F 
leng� o  ���E�E *0 argumentdefinitions argumentDefinitions� m  ���� ���    b u t   r e c e i v e d  � o  ���D�D 0 argcount argCount� m  ���� ���  ) .� �C��B
�C 
errn� o  w|�A�A  0 _argvusererror _ArgvUserError�B  �K  �J  �L  � ��� l     �@�?�>�@  �?  �>  � ��� l     �=�<�;�=  �<  �;  � ��� l     �:���:  �  -----   � ��� 
 - - - - -� ��� l     �9���9  � ) # format built-in help documentation   � ��� F   f o r m a t   b u i l t - i n   h e l p   d o c u m e n t a t i o n� ��� l     �8�7�6�8  �7  �6  � ��� i  � ���� I      �5��4�5  0 _formatoptions _formatOptions� ��� o      �3�3 &0 optiondefinitions optionDefinitions�    o      �2�2 0 vtstyle vtStyle �1 o      �0�0 &0 hasdefaultoptions hasDefaultOptions�1  �4  � k      l     �/�/   ] W generates OPTIONS section, along with options synopsis for inclusion in autogenerated     � �   g e n e r a t e s   O P T I O N S   s e c t i o n ,   a l o n g   w i t h   o p t i o n s   s y n o p s i s   f o r   i n c l u s i o n   i n   a u t o g e n e r a t e d   	
	 Z    �.�- F      =     o     �,�, &0 optiondefinitions optionDefinitions J    �+�+   H    	 o    �*�* &0 hasdefaultoptions hasDefaultOptions L     J      m     �   �) m     �  �)  �.  �-  
  r    3 J      !  m    "" �##  ! $%$ m    && �''  % (�(( m    )) �**  �(   J      ++ ,-, o      �'�'  0 defaultoptions defaultOptions- ./. o      �&�&  0 booleanoptions booleanOptions/ 0�%0 o      �$�$ 0 otheroptions otherOptions�%   121 r   4 ?343 b   4 =565 b   4 9787 n  4 79:9 o   5 7�#�# 0 b  : o   4 5�"�" 0 vtstyle vtStyle8 m   7 8;; �<<  O P T I O N S6 n  9 <=>= o   : <�!�! 0 n  > o   9 :� �  0 vtstyle vtStyle4 o      ��  0 optionssection optionsSection2 ?@? X   @*A�BA k   P%CC DED r   P ~FGF b   P |HIH l  P SJ��J c   P SKLK o   P Q�� 0 	optionref 	optionRefL m   Q R�
� 
reco�  �  I K   S {MM �NO� 0 	shortname 	shortNameN m   T UPP �QQ  O �RS� 0 longname longNameR m   V YTT �UU  S �VW� 0 	valuetype 	valueTypeV m   \ _�
� 
ctxtW �XY� 0 islist isListX m   b c�
� boovfalsY �Z[� 0 defaultvalue defaultValueZ o   f k�� 0 novalue NoValue[ �\]� $0 valueplaceholder valuePlaceholder\ m   n q^^ �__  ] �`�� $0 valuedescription valueDescription` m   t waa �bb  �  G o      �� $0 optiondefinition optionDefinitionE cdc Q    �efge k   � �hh iji r   � �klk c   � �mnm n  � �opo o   � ��� 0 	shortname 	shortNamep o   � ��� $0 optiondefinition optionDefinitionn m   � ��
� 
ctxtl o      �
�
 0 	shortname 	shortNamej qrq r   � �sts c   � �uvu n  � �wxw o   � ��	�	 0 longname longNamex o   � ��� $0 optiondefinition optionDefinitionv m   � ��
� 
ctxtt o      �� 0 longname longNamer yzy r   � �{|{ c   � �}~} n  � �� o   � ��� 0 	valuetype 	valueType� o   � ��� $0 optiondefinition optionDefinition~ m   � ��
� 
type| o      �� 0 	valuetype 	valueTypez ��� r   � ���� c   � ���� n  � ���� o   � ��� 0 islist isList� o   � �� �  $0 optiondefinition optionDefinition� m   � ���
�� 
bool� o      ���� 0 islist isList� ��� r   � ���� c   � ���� n  � ���� o   � ����� $0 valueplaceholder valuePlaceholder� o   � ����� $0 optiondefinition optionDefinition� m   � ���
�� 
ctxt� o      ���� $0 valueplaceholder valuePlaceholder� ���� r   � ���� c   � ���� n  � ���� o   � ����� $0 valuedescription valueDescription� o   � ����� $0 optiondefinition optionDefinition� m   � ���
�� 
ctxt� o      ���� $0 valuedescription valueDescription��  f R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  g n  � ���� I   � �������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o   � ����� &0 optiondefinitions optionDefinitions� ��� m   � ��� ���  o p t i o n s� ��� m   � ���
�� 
reco� ���� m   � ��� ��� ` l i s t   o f    c o m m a n d   l i n e   o p t i o n   d e f i n i t i o n    r e c o r d s��  ��  � o   � ����� 0 _support  d ��� r   � ���� b   � ���� b   � ���� o   � �����  0 optionssection optionsSection� o   � ����� 
0 lf2 LF2� o   � ����� 0 indent1 Indent1� o      ����  0 optionssection optionsSection� ��� Z   �I������ =  � ���� o   � ����� 0 	shortname 	shortName� m   � ��� ���  � k   �#�� ��� Z  �������� =  � ���� o   � ����� 0 longname longName� m   � ��� ���  � R   �����
�� .ascrerr ****      � ****� m  �� ��� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a    s h o r t N a m e    a n d / o r    l o n g N a m e    p r o p e r t y ) .� ����
�� 
errn� m  �����Y� �����
�� 
erob� o  	
���� 0 	optionref 	optionRef��  ��  ��  � ��� r  ��� o  ���� 0 longname longName� o      ���� 0 
optionname 
optionName� ���� r  #��� b  !��� b  ��� o  ����  0 optionssection optionsSection� m  �� ���  - -� o   ���� 0 longname longName� o      ����  0 optionssection optionsSection��  ��  � k  &I�� ��� r  &)��� o  &'���� 0 	shortname 	shortName� o      ���� 0 
optionname 
optionName� ��� r  *3��� b  *1��� b  */��� o  *+����  0 optionssection optionsSection� m  +.�� ���  -� o  /0���� 0 	shortname 	shortName� o      ����  0 optionssection optionsSection� ���� Z 4I������� > 49��� o  45���� 0 longname longName� m  58�� ���  � r  <E��� b  <C��� b  <A��� o  <=����  0 optionssection optionsSection� m  =@�� ���  ,   - -� o  AB���� 0 longname longName� o      ����  0 optionssection optionsSection��  ��  ��  � ��� Z  J������ = JM��� o  JK���� 0 	valuetype 	valueType� m  KL��
�� 
bool� l PU���� r  PU� � b  PS o  PQ����  0 booleanoptions booleanOptions o  QR���� 0 
optionname 
optionName  o      ����  0 booleanoptions booleanOptions� ) # group all boolean flags as "[-N�]"   � � F   g r o u p   a l l   b o o l e a n   f l a g s   a s   " [ - N & ] "��  � k  X  r  Xg > Xc	
	 n X] o  Y]���� 0 defaultvalue defaultValue o  XY���� $0 optiondefinition optionDefinition
 o  ]b���� 0 novalue NoValue o      ���� 0 
isoptional 
isOptional  r  ho b  hm o  hi���� 0 otheroptions otherOptions 1  il��
�� 
spac o      ���� 0 otheroptions otherOptions  Z p����� o  ps���� 0 
isoptional 
isOptional r  v} b  v{ o  vw���� 0 otheroptions otherOptions m  wz �  [ o      ���� 0 otheroptions otherOptions��  ��    r  ��  b  ��!"! b  ��#$# o  ������ 0 otheroptions otherOptions$ m  ��%% �&&  -" o  ������ 0 
optionname 
optionName  o      ���� 0 otheroptions otherOptions '(' r  ��)*) o  ������ $0 valueplaceholder valuePlaceholder* o      ���� $0 valueplaceholder valuePlaceholder( +,+ Z ��-.����- = ��/0/ o  ������ $0 valueplaceholder valuePlaceholder0 m  ��11 �22  . r  ��343 I  ����5���� 40 _defaultvalueplaceholder _defaultValuePlaceholder5 6��6 o  ������ $0 optiondefinition optionDefinition��  ��  4 o      ���� $0 valueplaceholder valuePlaceholder��  ��  , 787 r  ��9:9 b  ��;<; b  ��=>= n ��?@? o  ������ 0 u  @ o  ������ 0 vtstyle vtStyle> o  ������ $0 valueplaceholder valuePlaceholder< n ��ABA o  ������ 0 n  B o  ������ 0 vtstyle vtStyle: o      ���� $0 valueplaceholder valuePlaceholder8 CDC r  ��EFE b  ��GHG b  ��IJI o  ������ 0 otheroptions otherOptionsJ 1  ����
�� 
spacH o  ������ $0 valueplaceholder valuePlaceholderF o      ���� 0 otheroptions otherOptionsD KLK Z ��MN����M o  ������ 0 
isoptional 
isOptionalN r  ��OPO b  ��QRQ o  ������ 0 otheroptions otherOptionsR m  ��SS �TT  ]P o      ���� 0 otheroptions otherOptions��  ��  L UVU r  ��WXW b  ��YZY b  ��[\[ o  ������  0 optionssection optionsSection\ 1  ����
�� 
spacZ o  ������ $0 valueplaceholder valuePlaceholderX o      ����  0 optionssection optionsSectionV ]^] Z ��_`����_ > ��aba n ��cdc o  ������ 0 defaultvalue defaultValued o  ������ $0 optiondefinition optionDefinitionb o  ������ 0 novalue NoValue` r  ��efe b  ��ghg o  ������ $0 valuedescription valueDescriptionh I  ����i���� *0 _formatdefaultvalue _formatDefaultValuei j��j o  ������ $0 optiondefinition optionDefinition��  ��  f o      ���� $0 valuedescription valueDescription��  ��  ^ k��k Z �lm����l o  ������ 0 islist isListm r  �non b  ��pqp o  ������ $0 valuedescription valueDescriptionq m  ��rr �ss N T h i s   o p t i o n   c a n   b e   u s e d   m u l t i p l e   t i m e s .o o      ���� $0 valuedescription valueDescription��  ��  ��  � t��t Z %uv����u > wxw o  ���� $0 valuedescription valueDescriptionx m  
yy �zz  v r  !{|{ b  }~} b  � b  ��� b  ��� o  ����  0 optionssection optionsSection� 1  ��
�� 
lnfd� o  �� 0 indent2 Indent2� o  �~�~ $0 valuedescription valueDescription~ 1  �}
�} 
spac| o      �|�|  0 optionssection optionsSection��  ��  ��  � 0 	optionref 	optionRefB o   C D�{�{ &0 optiondefinitions optionDefinitions@ ��� l ++�z���z  � � document default -h and -v options as needed (these will appear at bottom of OPTIONS section, which isn't aesthetically ideal but is simplest to implement and avoids messing with the order of the option definitions specified by the shell script's author)   � ����   d o c u m e n t   d e f a u l t   - h   a n d   - v   o p t i o n s   a s   n e e d e d   ( t h e s e   w i l l   a p p e a r   a t   b o t t o m   o f   O P T I O N S   s e c t i o n ,   w h i c h   i s n ' t   a e s t h e t i c a l l y   i d e a l   b u t   i s   s i m p l e s t   t o   i m p l e m e n t   a n d   a v o i d s   m e s s i n g   w i t h   t h e   o r d e r   o f   t h e   o p t i o n   d e f i n i t i o n s   s p e c i f i e d   b y   t h e   s h e l l   s c r i p t ' s   a u t h o r )� ��� Z  +����y�x� o  +,�w�w &0 hasdefaultoptions hasDefaultOptions� k  /��� ��� Z  /e���v�u� H  /5�� E  /4��� o  /0�t�t  0 booleanoptions booleanOptions� m  03�� ���  h� k  8a�� ��� r  8?��� b  8=��� m  8;�� ���  h� o  ;<�s�s  0 defaultoptions defaultOptions� o      �r�r  0 defaultoptions defaultOptions� ��q� r  @a��� b  @_��� b  @[��� b  @U��� b  @Q��� b  @M��� b  @G��� o  @A�p�p  0 optionssection optionsSection� o  AF�o�o 
0 lf2 LF2� o  GL�n�n 0 indent1 Indent1� m  MP�� ���  - h ,   - - h e l p� 1  QT�m
�m 
lnfd� o  UZ�l�l 0 indent2 Indent2� m  [^�� ��� 2 P r i n t   t h i s   h e l p   a n d   e x i t .� o      �k�k  0 optionssection optionsSection�q  �v  �u  � ��j� Z  f����i�h� H  fl�� E  fk��� o  fg�g�g  0 booleanoptions booleanOptions� m  gj�� ���  v� k  o��� ��� r  ov��� b  ot��� o  op�f�f  0 defaultoptions defaultOptions� m  ps�� ���  v� o      �e�e  0 defaultoptions defaultOptions� ��d� r  w���� b  w���� b  w���� b  w���� b  w���� b  w���� b  w~��� o  wx�c�c  0 optionssection optionsSection� o  x}�b�b 
0 lf2 LF2� o  ~��a�a 0 indent1 Indent1� m  ���� ���  - v ,   - - v e r s i o n� 1  ���`
�` 
lnfd� o  ���_�_ 0 indent2 Indent2� m  ���� ��� < P r i n t   v e r s i o n   n u m b e r   a n d   e x i t .� o      �^�^  0 optionssection optionsSection�d  �i  �h  �j  �y  �x  � ��� r  ����� m  ���� ���  � o      �]�] "0 optionssynopsis optionsSynopsis� ��� Z �����\�[� > ����� o  ���Z�Z  0 defaultoptions defaultOptions� m  ���� ���  � r  ����� b  ����� b  ����� b  ����� o  ���Y�Y "0 optionssynopsis optionsSynopsis� m  ���� ���    [ -� o  ���X�X  0 defaultoptions defaultOptions� m  ���� ���  ]� o      �W�W "0 optionssynopsis optionsSynopsis�\  �[  � ��� Z �����V�U� > ����� o  ���T�T  0 booleanoptions booleanOptions� m  ���� ���  � r  ����� b  ����� b  ����� b  ��   o  ���S�S "0 optionssynopsis optionsSynopsis m  �� �    [ -� o  ���R�R  0 booleanoptions booleanOptions� m  �� �  ]� o      �Q�Q "0 optionssynopsis optionsSynopsis�V  �U  �  Z ��	�P�O > ��

 o  ���N�N 0 otheroptions otherOptions m  �� �  	 r  �� b  �� o  ���M�M "0 optionssynopsis optionsSynopsis o  ���L�L 0 otheroptions otherOptions o      �K�K "0 optionssynopsis optionsSynopsis�P  �O   �J L  � J  �  o  ���I�I "0 optionssynopsis optionsSynopsis �H o  ���G�G  0 optionssection optionsSection�H  �J  �  l     �F�E�D�F  �E  �D    l     �C�B�A�C  �B  �A    i  � � I      �@ �?�@ $0 _formatarguments _formatArguments  !"! o      �>�> *0 argumentdefinitions argumentDefinitions" #�=# o      �<�< 0 vtstyle vtStyle�=  �?   k    >$$ %&% Z    '(�;�:' =    )*) o     �9�9 *0 argumentdefinitions argumentDefinitions* J    �8�8  ( L    ++ J    ,, -.- m    // �00  . 1�71 m    	22 �33  �7  �;  �:  & 454 r    676 m    88 �99  7 o      �6�6 &0 argumentssynopsis argumentsSynopsis5 :;: r     <=< b    >?> b    @A@ n   BCB o    �5�5 0 b  C o    �4�4 0 vtstyle vtStyleA m    DD �EE  A R G U M E N T S? n   FGF o    �3�3 0 n  G o    �2�2 0 vtstyle vtStyle= o      �1�1 $0 argumentssection argumentsSection; HIH X   !4J�0KJ k   1/LL MNM r   1 MOPO b   1 KQRQ l  1 4S�/�.S c   1 4TUT o   1 2�-�- 0 argumentref argumentRefU m   2 3�,
�, 
reco�/  �.  R K   4 JVV �+WX�+ 0 	valuetype 	valueTypeW m   5 6�*
�* 
ctxtX �)YZ�) 0 islist isListY m   7 8�(
�( boovfalsZ �'[\�' 0 defaultvalue defaultValue[ o   9 >�&�& 0 novalue NoValue\ �%]^�% $0 valueplaceholder valuePlaceholder] m   ? @__ �``  ^ �$a�#�$ $0 valuedescription valueDescriptiona m   C Fbb �cc  �#  P o      �"�" (0 argumentdefinition argumentDefinitionN ded Q   N �fghf k   Q vii jkj r   Q Zlml c   Q Xnon n  Q Tpqp o   R T�!�! 0 	valuetype 	valueTypeq o   Q R� �  (0 argumentdefinition argumentDefinitiono m   T W�
� 
typem o      �� 0 	valuetype 	valueTypek rsr r   [ dtut c   [ bvwv n  [ ^xyx o   \ ^�� 0 islist isListy o   [ \�� (0 argumentdefinition argumentDefinitionw m   ^ a�
� 
boolu o      �� 0 islist isLists z{z r   e l|}| c   e j~~ n  e h��� o   f h�� $0 valueplaceholder valuePlaceholder� o   e f�� (0 argumentdefinition argumentDefinition m   h i�
� 
ctxt} o      �� $0 valueplaceholder valuePlaceholder{ ��� r   m v��� c   m t��� n  m r��� o   n r�� $0 valuedescription valueDescription� o   m n�� (0 argumentdefinition argumentDefinition� m   r s�
� 
ctxt� o      �� $0 valuedescription valueDescription�  g R      ���
� .ascrerr ****      � ****�  � ���
� 
errn� d      �� m      ����  h n  ~ ���� I   � ����
� 60 throwinvalidparametertype throwInvalidParameterType� ��� o   � ��	�	 *0 argumentdefinitions argumentDefinitions� ��� m   � ��� ���  a r g u m e n t s� ��� m   � ��
� 
reco� ��� m   � ��� ��� d l i s t   o f    c o m m a n d   l i n e   a r g u m e n t   d e f i n i t i o n    r e c o r d s�  �
  � o   ~ ��� 0 _support  e ��� Z  � ������ =  � ���� o   � ��� $0 valueplaceholder valuePlaceholder� m   � ��� ���  � r   � ���� I   � ����� 40 _defaultvalueplaceholder _defaultValuePlaceholder� �� � o   � ����� (0 argumentdefinition argumentDefinition�   �  � o      ���� $0 valueplaceholder valuePlaceholder�  �  � ��� Z  � �������� o   � ����� 0 islist isList� r   � ���� b   � ���� o   � ����� $0 valueplaceholder valuePlaceholder� m   � ��� ���    . . .� o      ���� $0 valueplaceholder valuePlaceholder��  ��  � ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� o   � ����� $0 argumentssection argumentsSection� o   � ����� 
0 lf2 LF2� o   � ����� 0 indent1 Indent1� n  � ���� o   � ����� 0 u  � o   � ����� 0 vtstyle vtStyle� o   � ����� $0 valueplaceholder valuePlaceholder� n  � ���� o   � ����� 0 n  � o   � ����� 0 vtstyle vtStyle� o      ���� $0 argumentssection argumentsSection� ��� Z  � �������� >  � ���� n  � ���� o   � ����� 0 defaultvalue defaultValue� o   � ����� (0 argumentdefinition argumentDefinition� o   � ����� 0 novalue NoValue� r   � ���� b   � ���� o   � ����� $0 valuedescription valueDescription� I   � �������� *0 _formatdefaultvalue _formatDefaultValue� ���� o   � ����� (0 argumentdefinition argumentDefinition��  ��  � o      ���� $0 valuedescription valueDescription��  ��  � ��� Z  �	������� >  � ���� o   � ����� $0 valuedescription valueDescription� m   � ��� ���  � r   ���� b   ���� b   ���� b   � ���� o   � ����� $0 argumentssection argumentsSection� 1   � ���
�� 
lnfd� o   � ���� 0 indent2 Indent2� o  ���� $0 valuedescription valueDescription� o      ���� $0 argumentssection argumentsSection��  ��  � ��� Z 
%������� > 
��� n 
��� o  ���� 0 defaultvalue defaultValue� o  
���� (0 argumentdefinition argumentDefinition� o  ���� 0 novalue NoValue� r  !��� b  ��� b  ��� m  �� ���  [� o  ���� $0 valueplaceholder valuePlaceholder� m  �� ���  ]� o      ���� $0 valueplaceholder valuePlaceholder��  ��  � ���� r  &/��� b  &-��� b  &+��� o  &'���� &0 argumentssynopsis argumentsSynopsis� 1  '*��
�� 
spac� o  +,���� $0 valueplaceholder valuePlaceholder� o      ���� &0 argumentssynopsis argumentsSynopsis��  �0 0 argumentref argumentRefK o   $ %���� *0 argumentdefinitions argumentDefinitionsI ���� L  5>�� J  5=�� ��� b  5:��� m  58   � 
   [ - - ]� o  89���� &0 argumentssynopsis argumentsSynopsis� �� o  :;���� $0 argumentssection argumentsSection��  ��    l     ��������  ��  ��    l     ����    -----    �		 
 - - - - - 

 l     ��������  ��  ��    i  � � I     ��
�� .Fil:Argvnull���     **** l 
    ���� o      ���� 0 argv  ��  ��   ��
�� 
OpsD |��������  ��   o      ���� &0 optiondefinitions optionDefinitions��   l 
    ���� J      ����  ��  ��   ��
�� 
OpsA |��������  ��   o      ���� *0 argumentdefinitions argumentDefinitions��   l 
    ���� J      ����  ��  ��   ����
�� 
DefO |��������  ��   o      ���� &0 hasdefaultoptions hasDefaultOptions��   l      ����  m      ��
�� boovtrue��  ��  ��   k     �!! "#" l     ��$%��  $�� note: while NSUserDefaults provides some argument parsing support (see its NSArgumentDomain), it uses an atypical syntax and reads directly from argv, making it difficult both to omit arguments provided to osascript itself and to extract any arguments remaining after options are parsed; thus, this handler implements its own argv parser that avoids NSUserDefaults' deficiencies while also providing a better optparse-style UI/UX to both shell script authors and users   % �&&�   n o t e :   w h i l e   N S U s e r D e f a u l t s   p r o v i d e s   s o m e   a r g u m e n t   p a r s i n g   s u p p o r t   ( s e e   i t s   N S A r g u m e n t D o m a i n ) ,   i t   u s e s   a n   a t y p i c a l   s y n t a x   a n d   r e a d s   d i r e c t l y   f r o m   a r g v ,   m a k i n g   i t   d i f f i c u l t   b o t h   t o   o m i t   a r g u m e n t s   p r o v i d e d   t o   o s a s c r i p t   i t s e l f   a n d   t o   e x t r a c t   a n y   a r g u m e n t s   r e m a i n i n g   a f t e r   o p t i o n s   a r e   p a r s e d ;   t h u s ,   t h i s   h a n d l e r   i m p l e m e n t s   i t s   o w n   a r g v   p a r s e r   t h a t   a v o i d s   N S U s e r D e f a u l t s '   d e f i c i e n c i e s   w h i l e   a l s o   p r o v i d i n g   a   b e t t e r   o p t p a r s e - s t y l e   U I / U X   t o   b o t h   s h e l l   s c r i p t   a u t h o r s   a n d   u s e r s# '��' P     �()*( k    �++ ,-, r    
./. n   010 1    ��
�� 
txdl1 1    ��
�� 
ascr/ o      ���� 0 oldtids oldTIDs- 2��2 Q    �3453 k    m66 787 l   ��9:��  9 ) # first, ensure parameters are lists   : �;; F   f i r s t ,   e n s u r e   p a r a m e t e r s   a r e   l i s t s8 <=< r    >?> n   @A@ I    ��B���� "0 aslistparameter asListParameterB CDC o    ���� 0 argv  D E��E m    FF �GG  ��  ��  A o    ���� 0 _support  ? o      ���� 0 argv  = HIH r    )JKJ n   'LML I   ! '��N���� "0 aslistparameter asListParameterN OPO o   ! "���� &0 optiondefinitions optionDefinitionsP Q��Q m   " #RR �SS  ��  ��  M o    !���� 0 _support  K o      ���� &0 optiondefinitions optionDefinitionsI TUT r   * 7VWV n  * 5XYX I   / 5��Z���� "0 aslistparameter asListParameterZ [\[ o   / 0���� *0 argumentdefinitions argumentDefinitions\ ]��] m   0 1^^ �__  ��  ��  Y o   * /���� 0 _support  W o      ���� *0 argumentdefinitions argumentDefinitionsU `a` l  8 8��bc��  b � � next iterate over the raw argument list, identifying option names and (if non-boolean) values, returning a NSMutableDictionary of parsed option values plus a list of any remaining (i.e. non-option) arguments   c �dd�   n e x t   i t e r a t e   o v e r   t h e   r a w   a r g u m e n t   l i s t ,   i d e n t i f y i n g   o p t i o n   n a m e s   a n d   ( i f   n o n - b o o l e a n )   v a l u e s ,   r e t u r n i n g   a   N S M u t a b l e D i c t i o n a r y   o f   p a r s e d   o p t i o n   v a l u e s   p l u s   a   l i s t   o f   a n y   r e m a i n i n g   ( i . e .   n o n - o p t i o n )   a r g u m e n t sa efe r   8 Qghg I      ��i���� 0 _parseoptions _parseOptionsi jkj n   9 <lml 2  : <��
�� 
cobjm o   9 :���� 0 argv  k non o   < =���� &0 optiondefinitions optionDefinitionso p��p o   = >���� &0 hasdefaultoptions hasDefaultOptions��  ��  h J      qq rsr o      ���� (0 asocparametersdict asocParametersDicts t��t o      ���� 0 argumentslist argumentsList��  f uvu l  R R��wx��  w v p add default values for any missing options to asocParametersDict, raising error if a required option is missing   x �yy �   a d d   d e f a u l t   v a l u e s   f o r   a n y   m i s s i n g   o p t i o n s   t o   a s o c P a r a m e t e r s D i c t ,   r a i s i n g   e r r o r   i f   a   r e q u i r e d   o p t i o n   i s   m i s s i n gv z{z I   R Y��|���� (0 _adddefaultoptions _addDefaultOptions| }~} o   S T���� (0 asocparametersdict asocParametersDict~ � o   T U�~�~ &0 optiondefinitions optionDefinitions�  ��  { ��� l  Z Z�}���}  � b \ parse the remaining arguments as named positional parameters, adding them to the dictionary   � ��� �   p a r s e   t h e   r e m a i n i n g   a r g u m e n t s   a s   n a m e d   p o s i t i o n a l   p a r a m e t e r s ,   a d d i n g   t h e m   t o   t h e   d i c t i o n a r y� ��� I   Z b�|��{�| "0 _parsearguments _parseArguments� ��� o   [ \�z�z 0 argumentslist argumentsList� ��� o   \ ]�y�y *0 argumentdefinitions argumentDefinitions� ��x� o   ] ^�w�w (0 asocparametersdict asocParametersDict�x  �{  � ��� r   c h��� o   c d�v�v 0 oldtids oldTIDs� n     ��� 1   e g�u
�u 
txdl� 1   d e�t
�t 
ascr� ��s� l  i m���� L   i m�� c   i l��� o   i j�r�r (0 asocparametersdict asocParametersDict� m   j k�q
�q 
****� : 4 coerce the dictionary to an AS record and return it   � ��� h   c o e r c e   t h e   d i c t i o n a r y   t o   a n   A S   r e c o r d   a n d   r e t u r n   i t�s  4 R      �p��
�p .ascrerr ****      � ****� o      �o�o 0 etext eText� �n��
�n 
errn� o      �m�m 0 enumber eNumber� �l��
�l 
erob� o      �k�k 0 efrom eFrom� �j��i
�j 
errt� o      �h�h 
0 eto eTo�i  5 k   u ��� ��� r   u z��� o   u v�g�g 0 oldtids oldTIDs� n     ��� 1   w y�f
�f 
txdl� 1   v w�e
�e 
ascr� ��d� Z   { ����c�� =   { ���� o   { |�b�b 0 enumber eNumber� o   | ��a�a  0 _argvusererror _ArgvUserError� R   � ��`��
�` .ascrerr ****      � ****� o   � ��_�_ 0 etext eText� �^��
�^ 
errn� o   � ��]�] 0 enumber eNumber� �\��
�\ 
erob� o   � ��[�[ 0 efrom eFrom� �Z��Y
�Z 
errt� o   � ��X�X 
0 eto eTo�Y  �c  � I   � ��W��V�W 
0 _error  � ��� m   � ��� ��� 8 p a r s e   c o m m a n d   l i n e   a r g u m e n t s� ��� o   � ��U�U 0 etext eText� ��� o   � ��T�T 0 enumber eNumber� ��� o   � ��S�S 0 efrom eFrom� ��R� o   � ��Q�Q 
0 eto eTo�R  �V  �d  ��  ) �P�
�P conscase� �O�
�O consdiac� �N�
�N conshyph� �M�
�M conspunc� �L�K
�L conswhit�K  * �J�I
�J consnume�I  ��   ��� l     �H�G�F�H  �G  �F  � ��� l     �E�D�C�E  �D  �C  � ��� i  � ���� I     �B�A�
�B .Fil:FHlpnull��� ��� null�A  � �@��
�@ 
Name� |�?�>��=��?  �>  � o      �<�< 0 commandname commandName�=  � l 
    ��;�:� l     ��9�8� m      �� ���  �9  �8  �;  �:  � �7��
�7 
Summ� |�6�5��4��6  �5  � o      �3�3 $0 shortdescription shortDescription�4  � l 
    ��2�1� l     ��0�/� m      �� ���  �0  �/  �2  �1  � �.��
�. 
Usag� |�-�,��+��-  �,  � o      �*�* "0 commandsynopses commandSynopses�+  � l 
    ��)�(� J      �'�'  �)  �(  � �&��
�& 
OpsD� |�%�$��#��%  �$  � o      �"�" &0 optiondefinitions optionDefinitions�#  � l 
    ��!� � J      ��  �!  �   � ���
� 
OpsA� |������  �  � o      �� *0 argumentdefinitions argumentDefinitions�  � l 
    ���� J      ��  �  �  � ���
� 
Docu� |������  �  � o      �� "0 longdescription longDescription�  � l 
    ���� l     ���� m      �� ���  �  �  �  �  � ���
� 
VFmt� |����
��  �  � o      �	�	 0 isstyled isStyled�
  � l 
    ���� l     ���� m      �
� boovtrue�  �  �  �  � ���
� 
DefO� |�� �����  �   � o      ���� &0 hasdefaultoptions hasDefaultOptions��  � l     ������ m      ��
�� boovtrue��  ��  �  � P    %   Q   $ k     r    	
	 n    I    ������ "0 astextparameter asTextParameter  o    ���� 0 commandname commandName �� m     �  n a m e��  ��   o    ���� 0 _support  
 o      ���� 0 commandname commandName  r    # n   ! I    !������ "0 aslistparameter asListParameter  o    ���� &0 optiondefinitions optionDefinitions �� m     �  ��  ��   o    ���� 0 _support   o      ���� &0 optiondefinitions optionDefinitions   r   $ 1!"! n  $ /#$# I   ) /��%���� "0 aslistparameter asListParameter% &'& o   ) *���� *0 argumentdefinitions argumentDefinitions' (��( m   * +)) �**  ��  ��  $ o   $ )���� 0 _support  " o      ���� *0 argumentdefinitions argumentDefinitions  +,+ r   2 ?-.- n  2 =/0/ I   7 =��1���� "0 aslistparameter asListParameter1 232 o   7 8���� "0 commandsynopses commandSynopses3 4��4 m   8 955 �66  ��  ��  0 o   2 7���� 0 _support  . o      ���� "0 commandsynopses commandSynopses, 787 r   @ M9:9 n  @ K;<; I   E K��=���� "0 astextparameter asTextParameter= >?> o   E F���� $0 shortdescription shortDescription? @��@ m   F GAA �BB  s u m m a r y��  ��  < o   @ E���� 0 _support  : o      ���� $0 shortdescription shortDescription8 CDC r   N [EFE n  N YGHG I   S Y��I���� "0 astextparameter asTextParameterI JKJ o   S T���� "0 longdescription longDescriptionK L��L m   T UMM �NN  d o c u m e n t a t i o n��  ��  H o   N S���� 0 _support  F o      ���� "0 longdescription longDescriptionD OPO Z   \ �QR��SQ n  \ gTUT I   a g��V���� (0 asbooleanparameter asBooleanParameterV WXW o   a b���� 0 isstyled isStyledX Y��Y m   b cZZ �[[  t e r m i n a l   s t y l e s��  ��  U o   \ a���� 0 _support  R l  j �\]^\ r   j �_`_ K   j �aa ��bc�� 0 n  b I   k q��d���� 0 vt100 VT100d e��e m   l m����  ��  ��  c ��fg�� 0 b  f I   r x��h���� 0 vt100 VT100h i��i m   s t���� ��  ��  g ��j���� 0 u  j I   y ���k���� 0 vt100 VT100k l��l m   z }���� ��  ��  ��  ` o      ���� 0 vtstyle vtStyle]   normal, bold, underline   ^ �mm 0   n o r m a l ,   b o l d ,   u n d e r l i n e��  S r   � �non K   � �pp ��qr�� 0 n  q m   � �ss �tt  r ��uv�� 0 b  u m   � �ww �xx  v ��y���� 0 u  y m   � �zz �{{  ��  o o      ���� 0 vtstyle vtStyleP |}| l  � ���~��  ~ %  construct NAME summary section    ��� >   c o n s t r u c t   N A M E   s u m m a r y   s e c t i o n} ��� Z   � �������� =  � ���� o   � ����� 0 commandname commandName� m   � ��� ���  � l  � ����� Q   � ����� r   � ���� l  � ������� I  � ������
�� .Fil:SplPnull���     ctxt� l  � ������� n   � ���� o   � ����� 0 _  � l  � ������� I  � �������
�� .Fil:EnVanull��� ��� null��  ��  ��  ��  ��  ��  ��  ��  ��  � o      ���� 0 commandname commandName� R      ������
�� .ascrerr ****      � ****��  ��  � l  � ����� r   � ���� m   � ��� ���  C O M M A N D� o      ���� 0 commandname commandName� T N fallback on the offchance the above should fail to get the script's file name   � ��� �   f a l l b a c k   o n   t h e   o f f c h a n c e   t h e   a b o v e   s h o u l d   f a i l   t o   g e t   t h e   s c r i p t ' s   f i l e   n a m e� B < use the AppleScript shell script's own file name by default   � ��� x   u s e   t h e   A p p l e S c r i p t   s h e l l   s c r i p t ' s   o w n   f i l e   n a m e   b y   d e f a u l t��  ��  � ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� n  � ���� o   � ����� 0 b  � o   � ����� 0 vtstyle vtStyle� m   � ��� ���  N A M E� n  � ���� o   � ����� 0 n  � o   � ����� 0 vtstyle vtStyle� o   � ����� 
0 lf2 LF2� o   � ����� 0 indent1 Indent1� o   � ����� 0 commandname commandName� o      ���� 0 helptext helpText� ��� Z   � �������� >  � ���� o   � ����� $0 shortdescription shortDescription� m   � ��� ���  � r   � ���� b   � ���� b   � ���� o   � ����� 0 helptext helpText� m   � ��� ���    - -  � o   � ����� $0 shortdescription shortDescription� o      ���� 0 helptext helpText��  ��  � ��� l  � �������  � B < construct default SYNOPSIS, OPTIONS, and ARGUMENTS sections   � ��� x   c o n s t r u c t   d e f a u l t   S Y N O P S I S ,   O P T I O N S ,   a n d   A R G U M E N T S   s e c t i o n s� ��� r   ���� I      �������  0 _formatoptions _formatOptions� ��� o   � ����� &0 optiondefinitions optionDefinitions� ��� o   � ����� 0 vtstyle vtStyle� ���� o   � ����� &0 hasdefaultoptions hasDefaultOptions��  ��  � J      �� ��� o      ���� 00 defaultoptionssynopsis defaultOptionsSynopsis� ��� o      ��  0 optionssection optionsSection�  � ��� r  1��� I      ���� $0 _formatarguments _formatArguments� ��� o  �� *0 argumentdefinitions argumentDefinitions� ��� o  �� 0 vtstyle vtStyle�  �  � J      �� ��� o      �� 40 defaultargumentssynopsis defaultArgumentsSynopsis� ��� o      �� $0 argumentssection argumentsSection�  � ��� r  2G��� b  2E��� b  2A��� b  2=��� b  29��� o  23�� 0 helptext helpText� o  38�� 
0 lf2 LF2� n 9<��� o  :<�� 0 b  � o  9:�� 0 vtstyle vtStyle� m  =@�� ���  S Y N O P S I S� n AD��� o  BD�� 0 n  � o  AB�� 0 vtstyle vtStyle� o      �� 0 helptext helpText� ��� Z  H\���~�}� = HL��� o  HI�|�| "0 commandsynopses commandSynopses� J  IK�{�{  � r  OX��� J  OV�� ��z� b  OT� � b  OR o  OP�y�y 0 commandname commandName o  PQ�x�x 00 defaultoptionssynopsis defaultOptionsSynopsis  o  RS�w�w 40 defaultargumentssynopsis defaultArgumentsSynopsis�z  � o      �v�v "0 commandsynopses commandSynopses�~  �}  �  Q  ]� X  `��u	 r  t�

 b  t� b  t� b  t{ o  tu�t�t 0 helptext helpText o  uz�s�s 
0 lf2 LF2 o  {��r�r 0 indent1 Indent1 o  ���q�q 0 textref textRef o      �p�p 0 helptext helpText�u 0 textref textRef	 o  cd�o�o "0 commandsynopses commandSynopses R      �n�m
�n .ascrerr ****      � ****�m   �l�k
�l 
errn d       m      �j�j��k   n �� I  ���i�h�i 60 throwinvalidparametertype throwInvalidParameterType  o  ���g�g "0 commandsynopses commandSynopses  m  �� �  s y n o p s i s  m  ���f
�f 
list  �e  m  ��!! �""  l i s t   o f   t e x t�e  �h   o  ���d�d 0 _support   #$# Z ��%&�c�b% > ��'(' o  ���a�a  0 optionssection optionsSection( m  ��)) �**  & r  ��+,+ b  ��-.- b  ��/0/ o  ���`�` 0 helptext helpText0 o  ���_�_ 
0 lf2 LF2. o  ���^�^  0 optionssection optionsSection, o      �]�] 0 helptext helpText�c  �b  $ 121 Z ��34�\�[3 > ��565 o  ���Z�Z $0 argumentssection argumentsSection6 m  ��77 �88  4 r  ��9:9 b  ��;<; b  ��=>= o  ���Y�Y 0 helptext helpText> o  ���X�X 
0 lf2 LF2< o  ���W�W $0 argumentssection argumentsSection: o      �V�V 0 helptext helpText�\  �[  2 ?@? l ���UAB�U  A - ' add long DESCRIPTION section, if given   B �CC N   a d d   l o n g   D E S C R I P T I O N   s e c t i o n ,   i f   g i v e n@ DED Z  �FG�T�SF > ��HIH o  ���R�R "0 longdescription longDescriptionI m  ��JJ �KK  G r  ��LML b  ��NON b  ��PQP b  ��RSR b  ��TUT b  ��VWV b  ��XYX o  ���Q�Q 0 helptext helpTextY o  ���P�P 
0 lf2 LF2W n ��Z[Z o  ���O�O 0 b  [ o  ���N�N 0 vtstyle vtStyleU m  ��\\ �]]  D E S C R I P T I O NS n ��^_^ o  ���M�M 0 n  _ o  ���L�L 0 vtstyle vtStyleQ o  ���K�K 
0 lf2 LF2O o  ���J�J "0 longdescription longDescriptionM o      �I�I 0 helptext helpText�T  �S  E `�H` L  aa b  bcb o  �G�G 0 helptext helpTextc 1  �F
�F 
lnfd�H   R      �Ede
�E .ascrerr ****      � ****d o      �D�D 0 etext eTexte �Cfg
�C 
errnf o      �B�B 0 enumber eNumberg �Ahi
�A 
erobh o      �@�@ 0 efrom eFromi �?j�>
�? 
errtj o      �=�= 
0 eto eTo�>   I  $�<k�;�< 
0 _error  k lml m  nn �oo 0 f o r m a t   c o m m a n d   l i n e   h e l pm pqp o  �:�: 0 etext eTextq rsr o  �9�9 0 enumber eNumbers tut o  �8�8 0 efrom eFromu v�7v o  �6�6 
0 eto eTo�7  �;   �5w
�5 conscasew �4x
�4 consdiacx �3y
�3 conshyphy �2z
�2 conspuncz �1�0
�1 conswhit�0   �/�.
�/ consnume�.  � {|{ l     �-�,�+�-  �,  �+  | }~} l     �*�)�(�*  �)  �(  ~ � l     �'�&�%�'  �&  �%  � ��� i  � ���� I     �$�#�"
�$ .Fil:CurFnull��� ��� null�#  �"  � Q     :���� k    (�� ��� r    ��� n   ��� I   
 �!� ��! ,0 currentdirectorypath currentDirectoryPath�   �  � n   
��� I    
����  0 defaultmanager defaultManager�  �  � n   ��� o    �� 0 nsfilemanager NSFileManager� m    �
� misccura� o      �� 0 asocpath asocPath� ��� Z   !����� =   ��� o    �� 0 asocpath asocPath� m    �
� 
msng� R    ���
� .ascrerr ****      � ****� m    �� ���  N o t   a v a i l a b l e .� ���
� 
errn� m    ���@�  �  �  � ��� L   " (�� c   " '��� c   " %��� o   " #�� 0 asocpath asocPath� m   # $�
� 
ctxt� m   % &�
� 
psxf�  � R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� �
��
�
 
errn� o      �	�	 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � I   0 :���� 
0 _error  � ��� m   1 2�� ��� 2 c u r r e n t   w o r k i n g   d i r e c t o r y� ��� o   2 3�� 0 etext eText� ��� o   3 4� �  0 enumber eNumber� ��� o   4 5���� 0 efrom eFrom� ���� o   5 6���� 
0 eto eTo��  �  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     ������
�� .Fil:EnVanull��� ��� null��  ��  � L     �� c     ��� l    ������ n    ��� I    �������� 0 environment  ��  ��  � n    ��� I    �������� 0 processinfo processInfo��  ��  � n    ��� o    ���� 0 nsprocessinfo NSProcessInfo� m     ��
�� misccura��  ��  � m    ��
�� 
****� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Fil:RSInnull��� ��� null��  � ����
�� 
Prmt� |����������  ��  � o      ���� 0 
prompttext 
promptText��  � l     ������ m      �� ���  > >  ��  ��  � �����
�� 
ReTo� |����������  ��  � o      ���� 0 isinteractive isInteractive��  � l     ������ m      ��
�� boovfals��  ��  ��  � Q     ����� k    ��� ��� r    ��� n   
��� I    
�������� :0 filehandlewithstandardinput fileHandleWithStandardInput��  ��  � n   ��� o    ���� 0 nsfilehandle NSFileHandle� m    ��
�� misccura� o      ���� 0 	asocstdin 	asocStdin� ��� Z    =������ o    ���� 0 isinteractive isInteractive� k    3�� ��� I   ����
�� .Fil:WSOunull���     ctxt� o    ���� 0 
prompttext 
promptText� ����
�� 
SLiB� m    ��
�� boovfals� �����
�� 
ALiE��  � ��� r    "��� n    ��� I     �������� 0 availabledata availableData��  ��  � o    �� 0 	asocstdin 	asocStdin� o      �� 0 asocdata asocData� ��� Z  # 3����� =   # *��� n  # (   I   $ (���� 
0 length  �  �   o   # $�� 0 asocdata asocData� m   ( )��  � L   - / m   - .�
� 
msng�  �  �  ��  � r   6 = n  6 ; I   7 ;���� *0 readdatatoendoffile readDataToEndOfFile�  �   o   6 7�� 0 	asocstdin 	asocStdin o      �� 0 asocdata asocData�  r   > O	
	 n  > M I   E M��� 00 initwithdata_encoding_ initWithData_encoding_  o   E F�� 0 asocdata asocData � l  F I�� n  F I o   G I�� ,0 nsutf8stringencoding NSUTF8StringEncoding m   F G�
� misccura�  �  �  �   n  > E I   A E���� 	0 alloc  �  �   n  > A o   ? A�� 0 nsstring NSString m   > ?�
� misccura
 o      �� 0 
asocstring 
asocString  Z  P d�� =  P S o   P Q�� 0 
asocstring 
asocString m   Q R�
� 
msng R   V `�
� .ascrerr ****      � **** m   \ _   �!! > I n p u t   i s   n o t   U T F 8 - e n c o d e d   t e x t . �"�
� 
errn" m   X [���\�  �  �   #$# Z  e �%&��% n  e m'(' I   f m�)�� 0 
hassuffix_ 
hasSuffix_) *�* 1   f i�
� 
lnfd�  �  ( o   e f�� 0 
asocstring 
asocString& r   p ~+,+ n  p |-.- I   q |�/�� &0 substringtoindex_ substringToIndex_/ 0�0 l  q x1��1 \   q x232 l  q v4��4 n  q v565 I   r v���� 
0 length  �  �  6 o   q r�� 0 
asocstring 
asocString�  �  3 m   v w�� �  �  �  �  . o   p q�� 0 
asocstring 
asocString, o      �� 0 
asocstring 
asocString�  �  $ 7�7 L   � �88 c   � �9:9 o   � ��� 0 
asocstring 
asocString: m   � ��
� 
ctxt�  � R      �;<
� .ascrerr ****      � ****; o      �� 0 etext eText< �=>
� 
errn= o      �~�~ 0 enumber eNumber> �}?@
�} 
erob? o      �|�| 0 efrom eFrom@ �{A�z
�{ 
errtA o      �y�y 
0 eto eTo�z  � I   � ��xB�w�x 
0 _error  B CDC m   � �EE �FF 0 r e a d   f r o m   s t a n d a r d   i n p u tD GHG o   � ��v�v 0 etext eTextH IJI o   � ��u�u 0 enumber eNumberJ KLK o   � ��t�t 0 efrom eFromL M�sM o   � ��r�r 
0 eto eTo�s  �w  � NON l     �q�p�o�q  �p  �o  O PQP l     �n�m�l�n  �m  �l  Q RSR i  � �TUT I     �kVW
�k .Fil:WSOunull���     ctxtV o      �j�j 0 thetext theTextW �iXY
�i 
SLiBX |�h�gZ�f[�h  �g  Z o      �e�e 0 uselinefeeds useLinefeeds�f  [ l     \�d�c\ m      �b
�b boovtrue�d  �c  Y �a]�`
�a 
ALiE] |�_�^^�]_�_  �^  ^ o      �\�\  0 withlineending withLineEnding�]  _ l     `�[�Z` m      �Y
�Y boovtrue�[  �Z  �`  U Q     �abca k    dd efe r    ghg n   iji I    �Xk�W�X &0 asnsmutablestring asNSMutableStringk l�Vl n   mnm I    �Uo�T�U "0 astextparameter asTextParametero pqp o    �S�S 0 thetext theTextq r�Rr m    ss �tt  �R  �T  n o    �Q�Q 0 _support  �V  �W  j o    �P�P 0 _support  h o      �O�O 0 
asocstring 
asocStringf uvu Z    Iwx�N�Mw o    �L�L 0 uselinefeeds useLinefeedsx k    Eyy z{z n   2|}| I    2�K~�J�K l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_~ � l 
  "��I�H� l   "��G�F� b    "��� o     �E
�E 
ret � 1     !�D
�D 
lnfd�G  �F  �I  �H  � ��� l  " #��C�B� 1   " #�A
�A 
lnfd�C  �B  � ��� m   # $�@�@  � ��?� K   $ .�� �>���> 0 location  � m   % &�=�=  � �<��;�< 
0 length  � n  ' ,��� I   ( ,�:�9�8�: 
0 length  �9  �8  � o   ' (�7�7 0 
asocstring 
asocString�;  �?  �J  } o    �6�6 0 
asocstring 
asocString{ ��5� n  3 E��� I   4 E�4��3�4 l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_� ��� l 
 4 5��2�1� l  4 5��0�/� o   4 5�.
�. 
ret �0  �/  �2  �1  � ��� l  5 6��-�,� 1   5 6�+
�+ 
lnfd�-  �,  � ��� m   6 7�*�*  � ��)� K   7 A�� �(���( 0 location  � m   8 9�'�'  � �&��%�& 
0 length  � n  : ?��� I   ; ?�$�#�"�$ 
0 length  �#  �"  � o   : ;�!�! 0 
asocstring 
asocString�%  �)  �3  � o   3 4� �  0 
asocstring 
asocString�5  �N  �M  v ��� Z  J d����� F   J W��� o   J K��  0 withlineending withLineEnding� H   N U�� l  N T���� n  N T��� I   O T���� 0 
hassuffix_ 
hasSuffix_� ��� 1   O P�
� 
lnfd�  �  � o   N O�� 0 
asocstring 
asocString�  �  � n  Z `��� I   [ `���� 0 appendstring_ appendString_� ��� 1   [ \�
� 
lnfd�  �  � o   Z [�� 0 
asocstring 
asocString�  �  � ��� r   e n��� n  e l��� I   h l���� <0 filehandlewithstandardoutput fileHandleWithStandardOutput�  �  � n  e h��� o   f h�� 0 nsfilehandle NSFileHandle� m   e f�
� misccura� o      �� 0 
asocstdout 
asocStdout� ��� n  o |��� I   p |�
��	�
 0 
writedata_ 
writeData_� ��� l  p x���� n  p x��� I   q x���� (0 datausingencoding_ dataUsingEncoding_� ��� l  q t���� n  q t��� o   r t� �  ,0 nsutf8stringencoding NSUTF8StringEncoding� m   q r��
�� misccura�  �  �  �  � o   p q���� 0 
asocstring 
asocString�  �  �  �	  � o   o p���� 0 
asocstdout 
asocStdout� ���� L   } ����  ��  b R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  c I   � �������� 
0 _error  � ��� m   � ��� ��� 0 w r i t e   t o   s t a n d a r d   o u t p u t� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  S ��� l     ��������  ��  ��  � ���� l     ��������  ��  ��  ��       "��������������������������������������  �  ����������������������������������������������������������������
�� 
pimr�� 0 _support  �� 
0 _error  �� (0 _nsstringencodings _NSStringEncodings
�� .Fil:Readnull���     file
�� .Fil:Writnull���     file
�� .Fil:ConPnull���     ****
�� .Fil:NorPnull���     ctxt
�� .Fil:JoiPnull���     ****
�� .Fil:SplPnull���     ctxt��  0 _argvusererror _ArgvUserError�� 0 novalue NoValue�� 
0 lf2 LF2�� 0 indent1 Indent1�� 0 indent2 Indent2�� 0 vt100 VT100�� 0 _unpackvalue _unpackValue�� 40 _defaultvalueplaceholder _defaultValuePlaceholder�� *0 _formatdefaultvalue _formatDefaultValue�� (0 _buildoptionstable _buildOptionsTable�� 0 _parseoptions _parseOptions�� (0 _adddefaultoptions _addDefaultOptions��  0 _ordinalnumber _ordinalNumber�� "0 _parsearguments _parseArguments��  0 _formatoptions _formatOptions�� $0 _formatarguments _formatArguments
�� .Fil:Argvnull���     ****
�� .Fil:FHlpnull��� ��� null
�� .Fil:CurFnull��� ��� null
�� .Fil:EnVanull��� ��� null
�� .Fil:RSInnull��� ��� null
�� .Fil:WSOunull���     ctxt� �� ��     ���
�� 
cobj    � 
� 
frmk�   ��
� 
cobj    �
� 
osax�  �    � +
� 
scpt� � 5��	�� 
0 _error  � �
� 
  ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�   ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo	  E��� � &0 throwcommanderror throwCommandError� b  ࠡ����+ � � b  � (0 _nsstringencodings _NSStringEncodings   ��� 
0 _list_  � 0 getencoding getEncoding ��    !"#$ �%� %  ��
� FEncFE01�  �&� &  ��
� FEncFE02� 
 �'� '  � �
� FEncFE03 �(� (  � �
� FEncFE04 �)� )  � �
� FEncFE05 �*� *  � �
� FEncFE06 �+� +  � �
� FEncFE07 �,� ,  ��
� FEncFE11�  �-� -  ��
� FEncFE12�  �.� .  ��
� FEncFE13�  �/� /  ��
� FEncFE14� 	 �0� 0  ��
� FEncFE15�  �1� 1  ��
� FEncFE16�  �2� 2  ��
� FEncFE17�  �3� 3  �~�}
�~ FEncFE18�}  �|4�| 4  �{�z
�{ FEncFE19�z   �y5�y 5  �x�w
�x FEncFE50�w ! �v6�v 6  �u�t
�u FEncFE51�t " �s7�s 7  �r�q
�r FEncFE52�q # �p8�p 8  �o�n
�o FEncFE53�n $ �m9�m 9  �l�k
�l FEncFE54�k  �j�i�h:;�g�j 0 getencoding getEncoding�i �f<�f <  �e�e 0 textencoding textEncoding�h  : �d�c�d 0 textencoding textEncoding�c 0 aref aRef; 
�b�a�`�_�^�]=�\I�[
�b 
enum�a 
0 _list_  
�` 
kocl
�_ 
cobj
�^ .corecnte****       ****�]  = �Z�Y�X
�Z 
errn�Y�\�X  
�\ 
long�[ >0 throwinvalidconstantparameter throwInvalidConstantParameter�g X 5��&E�O ))�,[��l kh ��k/�  ��l/EY h[OY��W X   	��&W X  hOb  ��l+ 	� �WY�V�U>?�T
�W .Fil:Readnull���     file�V 0 thefile theFile�U �S@A
�S 
Type@ {�R�Q�P�R 0 datatype dataType�Q  
�P 
ctxtA �OB�N
�O 
EncoB {�M�L�K�M 0 textencoding textEncoding�L  
�K FEncFE01�N  > �J�I�H�G�F�E�D�C�B�A�@�?�J 0 thefile theFile�I 0 datatype dataType�H 0 textencoding textEncoding�G 0 	posixpath 	posixPath�F 0 
asocstring 
asocString�E 0 theerror theError�D 0 fh  �C 0 	theresult 	theResult�B 0 etext eText�A 0 enumber eNumber�@ 0 efrom eFrom�? 
0 eto eTo?  s�>�=�<�;�:�9�8�7�6�5�4�3�2�1�0�/�.�-�,�+�*�)�(�'C�&�%��$�#�> ,0 asposixpathparameter asPOSIXPathParameter�= "0 astypeparameter asTypeParameter
�< 
ctxt
�; FEncFEPE
�: 
bool�9 0 getencoding getEncoding
�8 misccura�7 0 nsstring NSString
�6 
obj �5 T0 (stringwithcontentsoffile_encoding_error_ (stringWithContentsOfFile_encoding_error_
�4 
cobj
�3 
msng
�2 
errn�1 0 code  
�0 
erob
�/ 
errt�. �- ,0 localizeddescription localizedDescription
�, 
psxf
�+ .rdwropenshor       file
�* 
as  
�) .rdwrread****        ****
�( .rdwrclosnull���     ****�' 0 etext eTextC �"�!D
�" 
errn�! 0 enumber eNumberD � �E
�  
erob� 0 efrom eFromE ���
� 
errt� 
0 eto eTo�  �&  �%  �$ �# 
0 _error  �T � �b  ��l+ E�Ob  ��l+ E�O�� 	 ���& Ub  �k+ E�O��,���m+ E[�k/E�Z[�l/E�ZO��  )�j+ a �a �a �j+ �&Y hO��&Y O�a &j E�O �a �l E�O�j O�W )X   
�j W X  hO)�a �a �a �W X  *a ����a + � ���FG�
� .Fil:Writnull���     file� 0 thefile theFile� ��H
� 
Data� 0 thedata theDataH �IJ
� 
TypeI {���� 0 datatype dataType�  
� 
ctxtJ �K�
� 
EncoK {���� 0 textencoding textEncoding�  
� FEncFE01�  F ���
�	��������� � 0 thefile theFile� 0 thedata theData�
 0 datatype dataType�	 0 textencoding textEncoding� 0 	posixpath 	posixPath� 0 
asocstring 
asocString� 0 
didsucceed 
didSucceed� 0 theerror theError� 0 fh  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom�  
0 eto eToG '(��4������������P����������������������������������������������L����������� ,0 asposixpathparameter asPOSIXPathParameter�� "0 astypeparameter asTypeParameter
�� 
ctxt
�� FEncFEPE
�� 
bool
�� misccura�� 0 nsstring NSString�� "0 astextparameter asTextParameter�� &0 stringwithstring_ stringWithString_�� 0 getencoding getEncoding
�� 
obj �� �� P0 &writetofile_atomically_encoding_error_ &writeToFile_atomically_encoding_error_
�� 
cobj
�� 
errn�� 0 code  
�� 
erob
�� 
errt�� �� ,0 localizeddescription localizedDescription
�� 
psxf
�� 
perm
�� .rdwropenshor       file
�� 
set2
�� .rdwrseofnull���     ****
�� 
refn
�� 
as  
�� .rdwrwritnull���     ****
�� .rdwrclosnull���     ****�� 0 etext eTextL ����M
�� 
errn�� 0 enumber eNumberM ����N
�� 
erob�� 0 efrom eFromN ������
�� 
errt�� 
0 eto eTo��  ��  ��  �� �� 
0 _error  �
 �b  ��l+ E�Ob  ��l+ E�O�� 	 ���& i��,b  ��l+ 
k+ E�Ob  �k+ E�O��e���+ E[a k/E�Z[a l/E�ZO� !)a �j+ a �a �a �j+ �&Y hY a�a &a el E�O %�a jl O�a �a �� O�j OhW +X   ! 
�j W X " #hO)a �a �a �a �W X   !*a $����a %+ &� �������OP��
�� .Fil:ConPnull���     ****�� 0 filepath filePath�� ��QR
�� 
FromQ {�������� 0 
fromformat 
fromFormat��  
�� FLCTFLCPR ��S��
�� 
To__S {�������� 0 toformat toFormat��  
�� FLCTFLCP��  O 	�������������������� 0 filepath filePath�� 0 
fromformat 
fromFormat�� 0 toformat toFormat�� 0 	posixpath 	posixPath�� 0 asocurl asocURL�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToP )����������������JO��W��ns������������T���
�� 
kocl
� 
ctxt
� .corecnte****       ****� ,0 asposixpathparameter asPOSIXPathParameter
� FLCTFLCP
� FLCTFLCH
� 
file
� 
psxp
� FLCTFLCU
� misccura� 	0 NSURL  �  0 urlwithstring_ URLWithString_
� 
msng� 0 fileurl fileURL
� 
bool� � .0 throwinvalidparameter throwInvalidParameter� >0 throwinvalidconstantparameter throwInvalidConstantParameter
� 
leng
� FLCTFLCA
� 
psxf
� 
alis
� FLCTFLCX
� FLCTFLCS
� 
ascr� $0 fileurlwithpath_ fileURLWithPath_�  0 absolutestring absoluteString� 0 etext eTextT ��U
� 
errn� 0 enumber eNumberU ��V
� 
erob� 0 efrom eFromV ���
� 
errt� 
0 eto eTo�  � � 
0 _error  ��cN�kv��l j  b  ��l+ E�Y h��  �E�Y \��  *�/�,E�Y K��  8��,�k+ E�O�� 
 
�j+ �& b  �a �a a + Y hY b  �a l+ O�a ,j  b  �a �a a + Y hO��  �Y ��a   �a &a &Y ��a   �a &Y s�a   _ �a &�&/Y Z��  �a &�&Y I��  6��,�k+ E�O��  b  �a  *�a !/m+ Y hO�j+ "�&Y b  �a #l+ W X $ %*a &����a '+ (� �
��WX�
� .Fil:NorPnull���     ctxt� 0 filepath filePath� �YZ
� 
ExpTY {����  0 expandingtilde expandingTilde�  
� boovfalsZ �[\
� 
ExpR[ {���� &0 expandingrelative expandingRelative�  
� boovfals\ �]�
� 
ExpA] {���� $0 expandingsymlink expandingSymlink�  
� boovfals�  W �������� 0 filepath filePath�  0 expandingtilde expandingTilde� &0 expandingrelative expandingRelative� $0 expandingsymlink expandingSymlink� 0 etext eText� 0 enumber eNumber� 
0 eto eToX  !-�@�D�JZ_��r�~�}�|�{�z�y�x^��w�v� ,0 asposixpathparameter asPOSIXPathParameter� (0 asbooleanparameter asBooleanParameter
� 
bool
� .Fil:CurFnull��� ��� null
� .Fil:JoiPnull���     ****
�~ misccura�} 0 nsstring NSString�| &0 stringwithstring_ stringWithString_�{ B0 stringbyresolvingsymlinksinpath stringByResolvingSymlinksInPath
�z 
ctxt�y 60 stringbystandardizingpath stringByStandardizingPath�x 0 etext eText^ �u�t_
�u 
errn�t 0 enumber eNumber_ �s�r�q
�s 
errt�r 
0 eto eTo�q  �w �v 
0 _error  � � ��� �b  ��l+ E�Ob  ��l+ 	 ���& 
�%E�Y hOb  ��l+ 	 ���& *j �lvj E�Y hOb  ��l+  ��,�k+ j+ a &Y ��,�k+ j+ a &VW X  *a ����a + � �p��o�n`a�m
�p .Fil:JoiPnull���     ****�o  0 pathcomponents pathComponents�n �lb�k
�l 
Exteb {�j�i��j 0 fileextension fileExtension�i  �k  ` 	�h�g�f�e�d�c�b�a�`�h  0 pathcomponents pathComponents�g 0 fileextension fileExtension�f 0 subpaths subPaths�e 0 aref aRef�d 0 asocpath asocPath�c 0 etext eText�b 0 enumber eNumber�a 0 efrom eFrom�` 
0 eto eToa ��_�^�]�\�[��Z�Y�X��W��V�U�T�S�R�Q�P�O�N$�M)�Lc9�K�J�_ "0 aslistparameter asListParameter
�^ 
cobj
�] 
kocl
�\ .corecnte****       ****
�[ 
pcnt�Z ,0 asposixpathparameter asPOSIXPathParameter�Y  �X  
�W 
list�V �U .0 throwinvalidparameter throwInvalidParameter
�T misccura�S 0 nsstring NSString�R *0 pathwithcomponents_ pathWithComponents_�Q "0 astextparameter asTextParameter
�P 
leng�O B0 stringbyappendingpathextension_ stringByAppendingPathExtension_
�N 
msng
�M 
ctxt�L 0 etext eTextc �I�Hd
�I 
errn�H 0 enumber eNumberd �G�Fe
�G 
erob�F 0 efrom eFrome �E�D�C
�E 
errt�D 
0 eto eTo�C  �K �J 
0 _error  �m � �b  ��l+ �-E�O ;�jv  	)jhY hO %�[��l kh b  ��,�l+ ��,F[OY��W X  	b  �����+ O�a ,�k+ E�Ob  �a l+ E�O�a ,j -��k+ E�O�a   b  �a a a �+ Y hY hO�a &W X  *a ����a + � �BI�A�@fg�?
�B .Fil:SplPnull���     ctxt�A 0 filepath filePath�@ �>h�=
�> 
Uponh {�<�;�:�< 0 splitposition splitPosition�;  
�: FLSPFLSL�=  f �9�8�7�6�5�4�3�2�9 0 filepath filePath�8 0 splitposition splitPosition�7 0 asocpath asocPath�6 0 matchformat matchFormat�5 0 etext eText�4 0 enumber eNumber�3 0 efrom eFrom�2 
0 eto eTog �1�0c�/�.�-�,�+�*�)�(�'�&�%�$��#�"i��!� 
�1 misccura�0 0 nsstring NSString�/ ,0 asposixpathparameter asPOSIXPathParameter�. &0 stringwithstring_ stringWithString_
�- FLSPFLSL�, F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent
�+ 
ctxt�* &0 lastpathcomponent lastPathComponent
�) FLSPFLSE�( >0 stringbydeletingpathextension stringByDeletingPathExtension�' 0 pathextension pathExtension
�& FLSPFLSA�%  0 pathcomponents pathComponents
�$ 
list�# >0 throwinvalidconstantparameter throwInvalidConstantParameter�" 0 etext eTexti ��j
� 
errn� 0 enumber eNumberj ��k
� 
erob� 0 efrom eFromk ���
� 
errt� 
0 eto eTo�  �! �  
0 _error  �?  j��,b  ��l+ k+ E�O��  �j+ �&�j+ �&lvY 8��  �j+ 
�&�j+ �&lvY ��  �j+ �&Y b  ��l+ W X  *a ����a + ��'� ��  l� 0 novalue NoValuel  mm  � �nn  
 
� ����op�� 0 vt100 VT100� �q� q  �� 0 
formatcode 
formatCode�  o �� 0 
formatcode 
formatCodep ���
� 
cha � 
� kfrmID  � )���0�%�%�%� ���rs�
� 0 _unpackvalue _unpackValue� �	t�	 t  ��� 0 thevalue theValue� $0 definitionrecord definitionRecord�  r ������� � 0 thevalue theValue� $0 definitionrecord definitionRecord� 0 	valuetype 	valueType� 0 	theresult 	theResult� 0 asocformatter asocFormatter� 0 
asocresult 
asocResult�  0 basepath basePaths :������������������������������������x����������������������������������u!+/37:��FJNRU_��������e�� 0 	valuetype 	valueType
�� 
type
�� 
ctxt
�� 
long
�� 
doub
�� 
nmbr
�� misccura�� &0 nsnumberformatter NSNumberFormatter�� 	0 alloc  �� 0 init  �� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle�� "0 setnumberstyle_ setNumberStyle_�� 0 nslocale NSLocale�� 0 systemlocale systemLocale�� 0 
setlocale_ 
setLocale_�� &0 numberfromstring_ numberFromString_
�� 
msng
�� 
errn
�� 
****
�� 
furl
�� 
alis
�� 
file
�� 
psxf�� 
�� 
bool�� 0 nsfilemanager NSFileManager��  0 defaultmanager defaultManager�� ,0 currentdirectorypath currentDirectoryPath�� 0 nsstring NSString�� *0 pathwithcomponents_ pathWithComponents_�� &0 stringwithstring_ stringWithString_�� 60 stringbystandardizingpath stringByStandardizingPath��  u ������
�� 
errn������  �� ���Y
�� 
erob
�� 
errt�� �
ա�,�&E�O��  �E�Y����mv�kv ���,j+ j+ 	E�O���,k+ O���,j+ k+ O��k+ E�O�a   )a b  
la �%Y hO�a &E�O��  '�k#j )a b  
la �%Y hO��&E�Y hY2a a a a a v�kv ��a 	 �a a & A�a ,j+ j+ E�O�a   )a b  
la  �%Y hO�a !,��lvk+ "E�Y hO�a !,�k+ #j+ $�&a &E�O �a   �a &E�Y hW X % &)a b  
la '�%Y |�a   [ga ( Qa )a *a +a ,a -a .v�kv eY 1a /a 0a 1a 2a 3a .v�kv fY )a b  
la 4�%VY )a a 5a 6��,a 7�a 8a 9O�� ��y����vw���� 40 _defaultvalueplaceholder _defaultValuePlaceholder�� ��x�� x  ���� $0 definitionrecord definitionRecord��  v ������ $0 definitionrecord definitionRecord�� 0 	valuetype 	valueTypew ���������������������������������������� 0 	valuetype 	valueType
�� 
type
�� 
ctxt
�� 
long
�� 
doub
�� 
nmbr
�� 
furl
�� 
alis
�� 
file
�� 
psxf�� 
�� 
bool
�� 
errn���Y
�� 
erob
� 
errt� �� h��,�&E�O��  �Y V���mv�kv ��  �Y �Y :�����v�kv �Y (��  	a Y )a a a ��,a �a a � ����yz�� *0 _formatdefaultvalue _formatDefaultValue� �{� {  �� $0 definitionrecord definitionRecord�  y ����� $0 definitionrecord definitionRecord� 0 defaultvalue defaultValue� 0 defaulttext defaultText� 0 asocformatter asocFormatterz ������������������������u~���� 0 defaultvalue defaultValue
� 
kocl
� 
list
� .corecnte****       ****
� 
leng
� 
bool
� 
cobj
� 
ctxt
� 
long
� 
doub
� misccura� &0 nsnumberformatter NSNumberFormatter� 	0 alloc  � 0 init  � >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle� "0 setnumberstyle_ setNumberStyle_� 0 nslocale NSLocale� 0 systemlocale systemLocale� 0 
setlocale_ 
setLocale_� &0 stringfromnumber_ stringFromNumber_
� 
****
� 
furl
� 
alis
� 
psxp� ��,E�O�kv��l j	 	��,k �& ��k/E�Y hO�kv��l j �E�Y ��kv��l j
 �kv��l j�& 7��,j+ j+ E�O���,k+ O��a ,j+ k+ O��k+ a &E�Y N�kv�a l j
 �kv�a l j�& �a ,E�Y "�e  
a E�Y �f  
a E�Y a Oa �%a %� ����|}�� (0 _buildoptionstable _buildOptionsTable� �~� ~  �� &0 optiondefinitions optionDefinitions�  | ����������������� &0 optiondefinitions optionDefinitions� 0 
foundnames 
foundNames� 20 optiondefinitionsbyname optionDefinitionsByName� 0 	optionref 	optionRef� $0 optiondefinition optionDefinition� 0 propertyname propertyName�� 0 	namecount 	nameCount�� 0 aref aRef�� 0 thename theName�� 0 
nameprefix 
namePrefix�� 0 charref charRef} .���������������������������~�}�|�{��z�y�x�w�v�u��t	�	�		(	5	C	Z�s	^	w�r	~	�	�	��q	�
�� misccura�� *0 nsmutabledictionary NSMutableDictionary�� 0 
dictionary  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
reco�� 0 	shortname 	shortName�� 0 longname longName�� 0 propertyname propertyName� 0 	valuetype 	valueType
�~ 
ctxt�} 0 islist isList�| 0 defaultvalue defaultValue�{ 
�z 
errn�y�\�x   �p�o�n
�p 
errn�o�\�n  �w�Y
�v 
erob�u 
�t 
leng
�s 
bool
�r 
cha �q &0 setobject_forkey_ setObject_forKey_��jvE�O��,j+ E�O�[��l kh ��,�&��������a fa fa %E�O %��,�&E�O��,a   )a a lhY hW X  )a a a �a a O�a ,E�OJ��,a lv��,a lvlv[��l kh �E[�k/E�Z[�l/E�ZO 
��&E�W X  )a a a �a a O�a   ꡨkv )a a a �a a !Y hO��6FOga " ��a ,k  2�a ,k
 a #�a $& )a a a �a a %Y hY w�a ,j 
 a &�a 'k/a $&
 �a (a $& )a a a �a a )Y hO 5�[��l kh 
a *��, )a a a �a a +Y h[OY��VO����%l+ ,Y h[OY��O�a ,�  )a a a �a a -Y h[OY�+O�� �m	��l�k���j�m 0 _parseoptions _parseOptions�l �i��i �  �h�g�f�h 0 rawarguments rawArguments�g &0 optiondefinitions optionDefinitions�f &0 hasdefaultoptions hasDefaultOptions�k  � �e�d�c�b�a�`�_�^�]�\�[�Z�Y�e 0 rawarguments rawArguments�d &0 optiondefinitions optionDefinitions�c &0 hasdefaultoptions hasDefaultOptions�b 20 optiondefinitionsbyname optionDefinitionsByName�a (0 asocparametersdict asocParametersDict�` 0 thearg theArg�_ 0 
optionname 
optionName�^ $0 optiondefinition optionDefinition�] 0 ishelp isHelp�\ 0 	isversion 	isVersion�[ 0 propertyname propertyName�Z 0 thevalue theValue�Y 0 thelist theList� 4�X�W�V�U	��T�S�R

"�Q�P�O�N�M
a
s
w�L�K�J�I�H�G�F
�
�
��E%�D/�C<�B�A�@�?�>�=�<fz�;�:�9�8�7��6�X (0 _buildoptionstable _buildOptionsTable
�W misccura�V *0 nsmutabledictionary NSMutableDictionary�U 0 
dictionary  
�T 
ascr
�S 
txdl
�R 
cobj
�Q 
rest
�P 
citm
�O 
kocl
�N .corecnte****       ****
�M 
ctxt
�L 
cha 
�K 
bool
�J 
leng�I 0 objectforkey_ objectForKey_
�H 
msng
�G 
****�F 0 	valuetype 	valueType�E $0 removeallobjects removeAllObjects�D $0 setvalue_forkey_ setValue_forKey_
�C 
errn�B 0 propertyname propertyName�A 0 defaultvalue defaultValue�@  �?  �>�\
�= 
erob�< �; 0 _unpackvalue _unpackValue�: 0 islist isList�9  0 nsmutablearray NSMutableArray�8 $0 arraywithobject_ arrayWithObject_�7 0 
addobject_ 
addObject_�6 &0 setobject_forkey_ setObject_forKey_�jo*�k+  E�O��,j+ E�O���,FONh�jv ��k/E�O�� C��  ��,E�OY hO��k/E�O���l k �[�\[�l/\Zi2��k/FY ��,E�Y ��� ��a  
 a �a l/a & Y hO�[�\[Zk\Zl2E�O�a ,l L�[�\[Zm\Zi2��k/FO��k+ E�O�a 	 �a &a ,a  a & a ��k/%��k/FY hY ��,E�Y O��k+ E�O�a   x� _a a lv�kva a lv�kvlvE[�k/E�Z[�l/E�ZO�
 �a & %�j+ O��a l+  O��a !l+  OjvE�OY hY hO)a "b  
la #�%Y hO�a &E�O�a $,E�O�a ,a   1 �a %,E�W  X & ')a "a (a )�a %,a *a +�%Y 0�jv  )a "b  
la ,�%Y hO*��k/�l+ -E�O��,E�O�a .,E /��k+ E�O�a   �a /,�k+ 0E�Y ��k+ 1O�E�Y #��k+ a  )a "b  
la 2�%Y hO���l+ 3[OY��O��lv� �5��4�3���2�5 (0 _adddefaultoptions _addDefaultOptions�4 �1��1 �  �0�/�0 (0 asocparametersdict asocParametersDict�/ &0 optiondefinitions optionDefinitions�3  � �.�-�,�+�*�)�(�'�. (0 asocparametersdict asocParametersDict�- &0 optiondefinitions optionDefinitions�, 0 recref recRef�+ 0 rec  �* 0 propertyname propertyName�) 0 thevalue theValue�( 0 
optionname 
optionName�' "0 propertynameref propertyNameRef� �&�%�$�#�"��!�� �
��1;A��J�������
�& 
kocl
�% 
cobj
�$ .corecnte****       ****
�# 
reco�" 0 propertyname propertyName�! 0 longname longName�  0 defaultvalue defaultValue� � 0 objectforkey_ objectForKey_
� 
msng� 0 	shortname 	shortName
� 
errn
� misccura� 0 nsnull NSNull� 0 null  � &0 setobject_forkey_ setObject_forKey_
� 
pcnt�2 � ��[��l kh ��&�����b  �%E�O��,E�O��  
��,E�Y hO��k+ �  e��,E�O�b    1���,%E�O��  �a ,%E�Y hO)a b  
la �%Y hO��  a a ,j+ E�Y hO���l+ Y h[OY�bO 9a a lv[��l kh ��a ,k+ �  �f�a ,l+ Y h[OY��� ��������  0 _ordinalnumber _ordinalNumber� ��� �  �� 0 n  �  � �� 0 n  � �����
�	������� 
� � � �
 d
�	 
bool
� 
ctxt
� 
cobj� 8klmmv��#kv	 ���mv��#kv�& ��&���mv��#/%Y ��&�%� �������� "0 _parsearguments _parseArguments� ��� �  �� ��� 0 argumentslist argumentsList�  *0 argumentdefinitions argumentDefinitions�� (0 asocparametersdict asocParametersDict�  � ������������������������ 0 argumentslist argumentsList�� *0 argumentdefinitions argumentDefinitions�� (0 asocparametersdict asocParametersDict�� 0 i  �� 0 argcount argCount��  0 mustbeoptional mustBeOptional�� 0 argref argRef�� (0 argumentdefinition argumentDefinition�� 0 thevalue theValue�� "0 placeholdertext placeholderText�� 0 aref aRef� #������������������������������������4AE��~��������������
�� 
leng
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
reco�� 0 propertyname propertyName�� 0 	valuetype 	valueType
�� 
ctxt�� 0 islist isList�� 0 defaultvalue defaultValue�� $0 valueplaceholder valuePlaceholder�� 

�� 
bool
�� 
errn���Y
�� 
erob�� �� 40 _defaultvalueplaceholder _defaultValuePlaceholder��  0 _ordinalnumber _ordinalNumber�� 0 _unpackvalue _unpackValue
�� 
rest�� &0 setobject_forkey_ setObject_forKey_��jE�O��,E�OfE�O\�[��l kh �kE�O��,�&�����f�b  ���%E�O��,b   eE�Y *�	 ��,b   �& )a a a �a a Y hO��,a   )a a a �a a Y hO�jv  S��,E�O�b    ?��,E�O��,j  *�k+ E�Y hO)a b  
la *�k+ %a %�%a %Y hY *��k/�l+ E�O�a ,E�O��,E P���, )a a a �a a Y hO�kvE�O  �[��l kh 
*��,�l+ �6F[OY��OjvE�Y hO����,l+ [OY��O�jv !)a b  
la  ��,%a !%�%a "%Y h� �������������  0 _formatoptions _formatOptions�� ����� �  �������� &0 optiondefinitions optionDefinitions�� 0 vtstyle vtStyle�� &0 hasdefaultoptions hasDefaultOptions��  � �������������������������������������� &0 optiondefinitions optionDefinitions�� 0 vtstyle vtStyle�� &0 hasdefaultoptions hasDefaultOptions��  0 defaultoptions defaultOptions��  0 booleanoptions booleanOptions�� 0 otheroptions otherOptions��  0 optionssection optionsSection�� 0 	optionref 	optionRef�� $0 optiondefinition optionDefinition�� 0 	shortname 	shortName�� 0 longname longName�� 0 	valuetype 	valueType�� 0 islist isList�� $0 valueplaceholder valuePlaceholder�� $0 valuedescription valueDescription�� 0 
optionname 
optionName�� 0 
isoptional 
isOptional�� "0 optionssynopsis optionsSynopsis� F��"&)����;�����P�T�����^�a�������������������%1��S�ry��������������
�� 
bool
�� 
cobj�� 0 b  � 0 n  
� 
kocl
� .corecnte****       ****
� 
reco� 0 	shortname 	shortName� 0 longname longName� 0 	valuetype 	valueType
� 
ctxt� 0 islist isList� 0 defaultvalue defaultValue� $0 valueplaceholder valuePlaceholder� $0 valuedescription valueDescription� 
� 
type�  � ���
� 
errn��\�  � � 60 throwinvalidparametertype throwInvalidParameterType
� 
errn��Y
� 
erob
� 
spac� 40 _defaultvalueplaceholder _defaultValuePlaceholder� 0 u  � *0 _formatdefaultvalue _formatDefaultValue
� 
lnfd���jv 	 ��& 
��lvY hO���mvE[�k/E�Z[�l/E�Z[�m/E�ZO��,�%��,%E�O�[��l kh ��&���a a a a fa b  a a a a a %E�O F��,a &E�O��,a &E�O�a ,a &E�O�a ,�&E�O�a ,a &E�O�a ,a &E�W X  b  �a �a a +  O�b  %b  %E�O�a !  1�a "  )a #a $a %�a a &Y hO�E�O�a '%�%E�Y %�E�O�a (%�%E�O�a ) �a *%�%E�Y hO��  
��%E�Y ��a ,b  E^ O�_ +%E�O]  �a ,%E�Y hO�a -%�%E�O�E�O�a .  *�k+ /E�Y hO�a 0,�%��,%E�O�_ +%�%E�O]  �a 1%E�Y hO�_ +%�%E�O�a ,b   �*�k+ 2%E�Y hO� �a 3%E�Y hO�a 4 �_ 5%b  %�%_ +%E�Y h[OY�%O� r�a 6 .a 7�%E�O�b  %b  %a 8%_ 5%b  %a 9%E�Y hO�a : .�a ;%E�O�b  %b  %a <%_ 5%b  %a =%E�Y hY hOa >E^ O�a ? ] a @%�%a A%E^ Y hO�a B ] a C%�%a D%E^ Y hO�a E ] �%E^ Y hO] �lv� ������� $0 _formatarguments _formatArguments� ��� �  ��� *0 argumentdefinitions argumentDefinitions� 0 vtstyle vtStyle�  � 
����������� *0 argumentdefinitions argumentDefinitions� 0 vtstyle vtStyle� &0 argumentssynopsis argumentsSynopsis� $0 argumentssection argumentsSection� 0 argumentref argumentRef� (0 argumentdefinition argumentDefinition� 0 	valuetype 	valueType� 0 islist isList� $0 valueplaceholder valuePlaceholder� $0 valuedescription valueDescription� &/28�D����������_�b��������������~��}���| � 0 b  � 0 n  
� 
kocl
� 
cobj
� .corecnte****       ****
� 
reco� 0 	valuetype 	valueType
� 
ctxt� 0 islist isList� 0 defaultvalue defaultValue� $0 valueplaceholder valuePlaceholder� $0 valuedescription valueDescription� 

� 
type
� 
bool�  � �{�z�y
�{ 
errn�z�\�y  � � 60 throwinvalidparametertype throwInvalidParameterType� 40 _defaultvalueplaceholder _defaultValuePlaceholder� 0 u  �~ *0 _formatdefaultvalue _formatDefaultValue
�} 
lnfd
�| 
spac�?�jv  
��lvY hO�E�O��,�%��,%E�O�[��l kh ��&���f�b  ��a a a %E�O *��,a &E�O��,a &E�O��,�&E�O�a ,�&E�W X  b  �a �a a + O�a   *�k+ E�Y hO� �a %E�Y hO�b  %b  %�a ,%�%��,%E�O��,b   �*�k+ %E�Y hO�a   �_ !%b  %�%E�Y hO��,b   a "�%a #%E�Y hO�_ $%�%E�[OY��Oa %�%�lv� �x�w�v���u
�x .Fil:Argvnull���     ****�w 0 argv  �v �t��
�t 
OpsD� {�s�r�q�s &0 optiondefinitions optionDefinitions�r  �q  � �p��
�p 
OpsA� {�o�n�m�o *0 argumentdefinitions argumentDefinitions�n  �m  � �l��k
�l 
DefO� {�j�i�h�j &0 hasdefaultoptions hasDefaultOptions�i  
�h boovtrue�k  � �g�f�e�d�c�b�a�`�_�^�]�g 0 argv  �f &0 optiondefinitions optionDefinitions�e *0 argumentdefinitions argumentDefinitions�d &0 hasdefaultoptions hasDefaultOptions�c 0 oldtids oldTIDs�b (0 asocparametersdict asocParametersDict�a 0 argumentslist argumentsList�` 0 etext eText�_ 0 enumber eNumber�^ 0 efrom eFrom�] 
0 eto eTo� )*�\�[F�ZR^�Y�X�W�V�U�T��S�R�Q�P��O�N
�\ 
ascr
�[ 
txdl�Z "0 aslistparameter asListParameter
�Y 
cobj�X 0 _parseoptions _parseOptions�W (0 _adddefaultoptions _addDefaultOptions�V "0 _parsearguments _parseArguments
�U 
****�T 0 etext eText� �M�L�
�M 
errn�L 0 enumber eNumber� �K�J�
�K 
erob�J 0 efrom eFrom� �I�H�G
�I 
errt�H 
0 eto eTo�G  
�S 
errn
�R 
erob
�Q 
errt�P �O �N 
0 _error  �u ��� ���,E�O db  ��l+ E�Ob  ��l+ E�Ob  ��l+ E�O*��-��m+ 	E[�k/E�Z[�l/E�ZO*��l+ 
O*���m+ O���,FO��&W 8X  ���,FO�b  
  )�a �a �a �Y *a ����a + V� �F��E�D���C
�F .Fil:FHlpnull��� ��� null�E  �D �B��
�B 
Name� {�A�@��A 0 commandname commandName�@  � �?��
�? 
Summ� {�>�=��> $0 shortdescription shortDescription�=  � �<��
�< 
Usag� {�;�:�9�; "0 commandsynopses commandSynopses�:  �9  � �8��
�8 
OpsD� {�7�6�5�7 &0 optiondefinitions optionDefinitions�6  �5  � �4��
�4 
OpsA� {�3�2�1�3 *0 argumentdefinitions argumentDefinitions�2  �1  � �0��
�0 
Docu� {�/�.��/ "0 longdescription longDescription�.  � �-��
�- 
VFmt� {�,�+�*�, 0 isstyled isStyled�+  
�* boovtrue� �)��(
�) 
DefO� {�'�&�%�' &0 hasdefaultoptions hasDefaultOptions�&  
�% boovtrue�(  � �$�#�"�!� ���������������$ 0 commandname commandName�# $0 shortdescription shortDescription�" "0 commandsynopses commandSynopses�! &0 optiondefinitions optionDefinitions�  *0 argumentdefinitions argumentDefinitions� "0 longdescription longDescription� 0 isstyled isStyled� &0 hasdefaultoptions hasDefaultOptions� 0 vtstyle vtStyle� 0 helptext helpText� 00 defaultoptionssynopsis defaultOptionsSynopsis�  0 optionssection optionsSection� 40 defaultargumentssynopsis defaultArgumentsSynopsis� $0 argumentssection argumentsSection� 0 textref textRef� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� 4��)5AMZ������
�	swz��������������� �����!��)7J\�����n����� "0 astextparameter asTextParameter� "0 aslistparameter asListParameter� (0 asbooleanparameter asBooleanParameter� 0 n  � 0 vt100 VT100� 0 b  � 0 u  �
 �	 
� .Fil:EnVanull��� ��� null� 0 _  
� .Fil:SplPnull���     ctxt�  �  �  0 _formatoptions _formatOptions
� 
cobj� $0 _formatarguments _formatArguments
�  
kocl
�� .corecnte****       ****� ������
�� 
errn���\��  
�� 
list�� 60 throwinvalidparametertype throwInvalidParameterType
�� 
lnfd�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �C&��"b  ��l+ E�Ob  ��l+ E�Ob  ��l+ E�Ob  ��l+ E�Ob  ��l+ E�Ob  ��l+ E�Ob  ��l+  "�*jk+ �*kk+ �*a k+ a E�Y �a �a �a a E�O�a   $ *j a ,j E�W X  a E�Y hO��,a %��,%b  %b  %�%E�O�a  �a %�%E�Y hO*���m+ E[a  k/E�Z[a  l/E�ZO*��l+ !E[a  k/E�Z[a  l/E�ZO�b  %��,%a "%��,%E�O�jv  ��%�%kvE�Y hO / )�[a #a  l $kh �b  %b  %�%E�[OY��W X  %b  �a &a 'a (a + )O�a * �b  %�%E�Y hO�a + �b  %�%E�Y hO�a , "�b  %��,%a -%��,%b  %�%E�Y hO�_ .%W X / 0*a 1�] ] ] a 2+ 3V� �����������
�� .Fil:CurFnull��� ��� null��  ��  � ������������ 0 asocpath asocPath�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ���������������������������
�� misccura�� 0 nsfilemanager NSFileManager��  0 defaultmanager defaultManager�� ,0 currentdirectorypath currentDirectoryPath
�� 
msng
�� 
errn���@
�� 
ctxt
�� 
psxf�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� ; *��,j+ j+ E�O��  )��l�Y hO��&�&W X 
 *졢���+ � �����������
�� .Fil:EnVanull��� ��� null��  ��  �  � ����������
�� misccura�� 0 nsprocessinfo NSProcessInfo�� 0 processinfo processInfo�� 0 environment  
�� 
****�� ��,j+ j+ �&� �����������
�� .Fil:RSInnull��� ��� null��  �� ����
�� 
Prmt� {������� 0 
prompttext 
promptText��  � �����
�� 
ReTo� {������ 0 isinteractive isInteractive�  
� boovfals��  � 	���������� 0 
prompttext 
promptText� 0 isinteractive isInteractive� 0 	asocstdin 	asocStdin� 0 asocdata asocData� 0 
asocstring 
asocString� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� ����������������� ������E��
� misccura� 0 nsfilehandle NSFileHandle� :0 filehandlewithstandardinput fileHandleWithStandardInput
� 
SLiB
� 
ALiE� 
� .Fil:WSOunull���     ctxt� 0 availabledata availableData� 
0 length  
� 
msng� *0 readdatatoendoffile readDataToEndOfFile� 0 nsstring NSString� 	0 alloc  � ,0 nsutf8stringencoding NSUTF8StringEncoding� 00 initwithdata_encoding_ initWithData_encoding_
� 
errn��\
� 
lnfd� 0 
hassuffix_ 
hasSuffix_� &0 substringtoindex_ substringToIndex_
� 
ctxt� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� � ���,j+ E�O� '��f�f� O�j+ E�O�j+ j  �Y hY 	�j+ 
E�O��,j+ ���,l+ E�O��  )�a la Y hO�_ k+  ��j+ kk+ E�Y hO�a &W X  *a ����a + � �U�����
� .Fil:WSOunull���     ctxt� 0 thetext theText� ���
� 
SLiB� {���� 0 uselinefeeds useLinefeeds�  
� boovtrue� ���
� 
ALiE� {����  0 withlineending withLineEnding�  
� boovtrue�  � 	���������� 0 thetext theText� 0 uselinefeeds useLinefeeds�  0 withlineending withLineEnding� 0 
asocstring 
asocString� 0 
asocstdout 
asocStdout� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� s��~�}�|�{�z�y�x�w�v�u�t�s�r�q�p�o�n���m�l� "0 astextparameter asTextParameter�~ &0 asnsmutablestring asNSMutableString
�} 
ret 
�| 
lnfd�{ 0 location  �z 
0 length  �y �x l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_�w 0 
hassuffix_ 
hasSuffix_
�v 
bool�u 0 appendstring_ appendString_
�t misccura�s 0 nsfilehandle NSFileHandle�r <0 filehandlewithstandardoutput fileHandleWithStandardOutput�q ,0 nsutf8stringencoding NSUTF8StringEncoding�p (0 datausingencoding_ dataUsingEncoding_�o 0 
writedata_ 
writeData_�n 0 etext eText� �k�j�
�k 
errn�j 0 enumber eNumber� �i�h�
�i 
erob�h 0 efrom eFrom� �g�f�e
�g 
errt�f 
0 eto eTo�e  �m �l 
0 _error  � � �b  b  ��l+ k+ E�O� ,���%�j�j�j+ ��+ O���j�j�j+ ��+ Y hO�	 ��k+ 	�& ��k+ Y hO��,j+ E�O����,k+ k+ OhW X  *a ����a + ascr  ��ޭ