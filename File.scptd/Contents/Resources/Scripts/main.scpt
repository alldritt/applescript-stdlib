FasdUAS 1.101.10   ��   ��    k             l      ��  ��   `Z File -- common file system and path string operations

Notes:

- Path manipulation commands all operate on POSIX paths, as those are reliable whereas HFS paths (which are already deprecated everywhere else in OS X) are not.

- Standard Additions' `read` and `write` commands don't always provide good explanatory error messages (e.g. passing wrong `as` parameter just gives 'Parameter error.' -50); Cocoa error messages often aren't very helpful either.

TO DO:

- _buildOptionsTable needs to validate long option names

- check presentation of user error messages in `parse command line arguments` 

     � 	 	�   F i l e   - -   c o m m o n   f i l e   s y s t e m   a n d   p a t h   s t r i n g   o p e r a t i o n s 
 
 N o t e s : 
 
 -   P a t h   m a n i p u l a t i o n   c o m m a n d s   a l l   o p e r a t e   o n   P O S I X   p a t h s ,   a s   t h o s e   a r e   r e l i a b l e   w h e r e a s   H F S   p a t h s   ( w h i c h   a r e   a l r e a d y   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X )   a r e   n o t . 
 
 -   S t a n d a r d   A d d i t i o n s '   ` r e a d `   a n d   ` w r i t e `   c o m m a n d s   d o n ' t   a l w a y s   p r o v i d e   g o o d   e x p l a n a t o r y   e r r o r   m e s s a g e s   ( e . g .   p a s s i n g   w r o n g   ` a s `   p a r a m e t e r   j u s t   g i v e s   ' P a r a m e t e r   e r r o r . '   - 5 0 ) ;   C o c o a   e r r o r   m e s s a g e s   o f t e n   a r e n ' t   v e r y   h e l p f u l   e i t h e r . 
 
 T O   D O : 
 
 -   _ b u i l d O p t i o n s T a b l e   n e e d s   t o   v a l i d a t e   l o n g   o p t i o n   n a m e s 
 
 -   c h e c k   p r e s e n t a t i o n   o f   u s e r   e r r o r   m e s s a g e s   i n   ` p a r s e   c o m m a n d   l i n e   a r g u m e n t s `   
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
 m    ��]�] �^  �a  �`  �b   q  l     �\�[�Z�\  �[  �Z   �Y i  � � I      �X�W�X 0 getencoding getEncoding �V o      �U�U 0 textencoding textEncoding�V  �W   k     V  Q     K k    3  r     c     o    �T�T 0 textencoding textEncoding m    �S
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
errn< d      == m      �:�:��;  7 l  J J�9>?�9  >   fall through   ? �@@    f a l l   t h r o u g h3 ] W not a predefined constant, but hedge bets as it might be a raw NSStringEncoding number   4 �AA �   n o t   a   p r e d e f i n e d   c o n s t a n t ,   b u t   h e d g e   b e t s   a s   i t   m i g h t   b e   a   r a w   N S S t r i n g E n c o d i n g   n u m b e r B�8B R   L V�7CD
�7 .ascrerr ****      � ****C m   T UEE �FF h I n v a l i d    u s i n g    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .D �6GH
�6 
errnG m   N O�5�5�YH �4IJ
�4 
erobI o   P Q�3�3 0 textencoding textEncodingJ �2K�1
�2 
errtK m   R S�0
�0 
enum�1  �8  �Y   a LML l     �/�.�-�/  �.  �-  M NON l     �,�+�*�,  �+  �*  O PQP l     �)RS�)  R  -----   S �TT 
 - - - - -Q UVU l     �(�'�&�(  �'  �&  V WXW i  * -YZY I     �%[\
�% .Fil:Readnull���     file[ o      �$�$ 0 thefile theFile\ �#]^
�# 
Type] |�"�!_� `�"  �!  _ o      �� 0 datatype dataType�   ` l     a��a m      �
� 
ctxt�  �  ^ �b�
� 
Encob |��c�d�  �  c o      �� 0 textencoding textEncoding�  d l     e��e m      �
� FEncFE01�  �  �  Z Q     �fghf k    �ii jkj r    lml n   non I    �p�� ,0 asposixpathparameter asPOSIXPathParameterp qrq o    	�� 0 thefile theFiler s�s m   	 
tt �uu  �  �  o o    �� 0 _support  m o      �� 0 	posixpath 	posixPathk vwv r    xyx n   z{z I    �|�� "0 astypeparameter asTypeParameter| }~} o    �
�
 0 datatype dataType~ �	 m    �� ���  a s�	  �  { o    �� 0 _support  y o      �� 0 datatype dataTypew ��� Z    ������ F    *��� =   "��� o     �� 0 datatype dataType� m     !�
� 
ctxt� >  % (��� o   % &�� 0 textencoding textEncoding� m   & '�
� FEncFEPE� l  - }���� k   - }�� ��� r   - 9��� n  - 7��� I   2 7� ����  0 getencoding getEncoding� ���� o   2 3���� 0 textencoding textEncoding��  ��  � o   - 2���� (0 _nsstringencodings _NSStringEncodings� o      ���� 0 textencoding textEncoding� ��� r   : S��� n  : D��� I   = D������� T0 (stringwithcontentsoffile_encoding_error_ (stringWithContentsOfFile_encoding_error_� ��� o   = >���� 0 	posixpath 	posixPath� ��� o   > ?���� 0 textencoding textEncoding� ���� l  ? @������ m   ? @��
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
ctxt��  �'! note: AS treats `text`, `string`, and `Unicode text` as synonyms when comparing for equality, which is a little bit problematic as StdAdds' `read` command treats `string` as 'primary encoding' and `Unicode text` as UTF16; passing `primary encoding` for `using` parameter provides an 'out'   � ���B   n o t e :   A S   t r e a t s   ` t e x t ` ,   ` s t r i n g ` ,   a n d   ` U n i c o d e   t e x t `   a s   s y n o n y m s   w h e n   c o m p a r i n g   f o r   e q u a l i t y ,   w h i c h   i s   a   l i t t l e   b i t   p r o b l e m a t i c   a s   S t d A d d s '   ` r e a d `   c o m m a n d   t r e a t s   ` s t r i n g `   a s   ' p r i m a r y   e n c o d i n g '   a n d   ` U n i c o d e   t e x t `   a s   U T F 1 6 ;   p a s s i n g   ` p r i m a r y   e n c o d i n g `   f o r   ` u s i n g `   p a r a m e t e r   p r o v i d e s   a n   ' o u t '�  � k   � ��� ��� r   � ���� I  � ������
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
0 eto eTo��  ��  ��  �  g R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  h I   � �������� 
0 _error  � ��� m   � ��� ���  r e a d   f i l e� � � o   � ����� 0 etext eText   o   � ����� 0 enumber eNumber  o   � ����� 0 efrom eFrom �� o   � ����� 
0 eto eTo��  ��  X  l     ��������  ��  ��   	 l     ��������  ��  ��  	 

 i  . 1 I     ��
�� .Fil:Writnull���     file o      ���� 0 thefile theFile ��
�� 
Data o      ���� 0 thedata theData ��
�� 
Type |��������  ��   o      ���� 0 datatype dataType��   l     ���� m      ��
�� 
ctxt��  ��   ����
�� 
Enco |��������  ��   o      ���� 0 textencoding textEncoding��   l     ��~ m      �}
�} FEncFE01�  �~  ��   Q    	 k    �   r    !"! n   #$# I    �|%�{�| ,0 asposixpathparameter asPOSIXPathParameter% &'& o    	�z�z 0 thefile theFile' (�y( m   	 
)) �**  �y  �{  $ o    �x�x 0 _support  " o      �w�w 0 	posixpath 	posixPath  +,+ r    -.- n   /0/ I    �v1�u�v "0 astypeparameter asTypeParameter1 232 o    �t�t 0 datatype dataType3 4�s4 m    55 �66  a s�s  �u  0 o    �r�r 0 _support  . o      �q�q 0 datatype dataType, 7�p7 Z    �89�o:8 F    *;<; =   "=>= o     �n�n 0 datatype dataType> m     !�m
�m 
ctxt< >  % (?@? o   % &�l�l 0 textencoding textEncoding@ m   & '�k
�k FEncFEPE9 k   - �AA BCB r   - ADED n  - ?FGF I   0 ?�jH�i�j &0 stringwithstring_ stringWithString_H I�hI l  0 ;J�g�fJ n  0 ;KLK I   5 ;�eM�d�e "0 astextparameter asTextParameterM NON o   5 6�c�c 0 thedata theDataO P�bP m   6 7QQ �RR  d a t a�b  �d  L o   0 5�a�a 0 _support  �g  �f  �h  �i  G n  - 0STS o   . 0�`�` 0 nsstring NSStringT m   - .�_
�_ misccuraE o      �^�^ 0 
asocstring 
asocStringC UVU r   B NWXW n  B LYZY I   G L�][�\�] 0 getencoding getEncoding[ \�[\ o   G H�Z�Z 0 textencoding textEncoding�[  �\  Z o   B G�Y�Y (0 _nsstringencodings _NSStringEncodingsX o      �X�X 0 textencoding textEncodingV ]^] r   O k_`_ n  O Xaba I   P X�Wc�V�W P0 &writetofile_atomically_encoding_error_ &writeToFile_atomically_encoding_error_c ded o   P Q�U�U 0 	posixpath 	posixPathe fgf m   Q R�T
�T boovtrueg hih o   R S�S�S 0 textencoding textEncodingi j�Rj l  S Tk�Q�Pk m   S T�O
�O 
obj �Q  �P  �R  �V  b o   O P�N�N 0 
asocstring 
asocString` J      ll mnm o      �M�M 0 
didsucceed 
didSucceedn o�Lo o      �K�K 0 theerror theError�L  ^ p�Jp Z   l �qr�I�Hq H   l nss o   l m�G�G 0 
didsucceed 
didSucceedr R   q ��Ftu
�F .ascrerr ****      � ****t l  � �v�E�Dv c   � �wxw n  � �yzy I   � ��C�B�A�C ,0 localizeddescription localizedDescription�B  �A  z o   � ��@�@ 0 theerror theErrorx m   � ��?
�? 
ctxt�E  �D  u �>{|
�> 
errn{ n  u z}~} I   v z�=�<�;�= 0 code  �<  �;  ~ o   u v�:�: 0 theerror theError| �9�
�9 
erob o   } ~�8�8 0 thefile theFile� �7��6
�7 
errt� o   � ��5�5 0 datatype dataType�6  �I  �H  �J  �o  : k   � ��� ��� r   � ���� I  � ��4��
�4 .rdwropenshor       file� l  � ���3�2� c   � ���� o   � ��1�1 0 	posixpath 	posixPath� m   � ��0
�0 
psxf�3  �2  � �/��.
�/ 
perm� m   � ��-
�- boovtrue�.  � o      �,�, 0 fh  � ��+� Q   � ����� k   � ��� ��� l  � ����� I  � ��*��
�* .rdwrseofnull���     ****� o   � ��)�) 0 fh  � �(��'
�( 
set2� m   � ��&�&  �'  � e _ important: when overwriting an existing file, make sure its previous contents are erased first   � ��� �   i m p o r t a n t :   w h e n   o v e r w r i t i n g   a n   e x i s t i n g   f i l e ,   m a k e   s u r e   i t s   p r e v i o u s   c o n t e n t s   a r e   e r a s e d   f i r s t� ��� I  � ��%��
�% .rdwrwritnull���     ****� o   � ��$�$ 0 thedata theData� �#��
�# 
refn� o   � ��"�" 0 fh  � �!�� 
�! 
as  � o   � ��� 0 datatype dataType�   � ��� I  � ����
� .rdwrclosnull���     ****� o   � ��� 0 fh  �  � ��� L   � ���  �  � R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � k   � ��� ��� Q   � ����� I  � ����
� .rdwrclosnull���     ****� o   � ��� 0 fh  �  � R      ���

� .ascrerr ****      � ****�  �
  �  � ��	� R   � ����
� .ascrerr ****      � ****� o   � ��� 0 etext eText� ���
� 
errn� o   � ��� 0 enumber eNumber� ���
� 
erob� o   � ��� 0 efrom eFrom� ���
� 
errt� o   � �� �  
0 eto eTo�  �	  �+  �p   R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��   I   �	������� 
0 _error  � ��� m   � ��� ���  w r i t e   f i l e� ��� o   � ���� 0 etext eText� ��� o   ���� 0 enumber eNumber� ��� o  ���� 0 efrom eFrom� ���� o  ���� 
0 eto eTo��  ��   ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   POSIX path manipulation   � ��� 0   P O S I X   p a t h   m a n i p u l a t i o n� ��� l     ��������  ��  ��  � ��� i  2 5��� I     ����
�� .Fil:ConPnull���     ****� o      ���� 0 filepath filePath� ����
�� 
From� |����������  ��  � o      ���� 0 
fromformat 
fromFormat��  � l     ������ m      ��
�� FLCTFLCP��  ��  � �����
�� 
To__� |����������  ��  � o      ���� 0 toformat toFormat��  � l     ������ m      ��
�� FLCTFLCP��  ��  ��  � l   w���� Q    w���� k   a�� ��� Z    ������� =    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ���� 0 filepath filePath��  � �� ��
�� 
kocl  m    ��
�� 
ctxt��  ��  ��  � m    ����  � l    r     n    I    ������ ,0 asposixpathparameter asPOSIXPathParameter 	
	 o    ���� 0 filepath filePath
 �� m     �  ��  ��   o    ���� 0 _support   o      ���� 0 	posixpath 	posixPath F @ assume it's a file identifier object (alias, �class furl�, etc)    � �   a s s u m e   i t ' s   a   f i l e   i d e n t i f i e r   o b j e c t   ( a l i a s ,   � c l a s s   f u r l � ,   e t c )��  � l  ! � Z   ! � =  ! $ o   ! "���� 0 
fromformat 
fromFormat m   " #��
�� FLCTFLCP r   ' * o   ' (���� 0 filepath filePath o      ���� 0 	posixpath 	posixPath  =  - 0 o   - .���� 0 
fromformat 
fromFormat m   . /��
�� FLCTFLCH  l  3 ; !"  r   3 ;#$# n   3 9%&% 1   7 9��
�� 
psxp& l  3 7'����' 4   3 7��(
�� 
file( o   5 6���� 0 filepath filePath��  ��  $ o      ���� 0 	posixpath 	posixPath! � � caution: HFS path format is flawed and deprecated everywhere else in OS X (unlike POSIX path format, it can't distinguish between two volumes with the same name), but is still used by AS and a few older scriptable apps so must be supported   " �))�   c a u t i o n :   H F S   p a t h   f o r m a t   i s   f l a w e d   a n d   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X   ( u n l i k e   P O S I X   p a t h   f o r m a t ,   i t   c a n ' t   d i s t i n g u i s h   b e t w e e n   t w o   v o l u m e s   w i t h   t h e   s a m e   n a m e ) ,   b u t   i s   s t i l l   u s e d   b y   A S   a n d   a   f e w   o l d e r   s c r i p t a b l e   a p p s   s o   m u s t   b e   s u p p o r t e d *+* =  > A,-, o   > ?���� 0 
fromformat 
fromFormat- m   ? @��
�� FLCTFLCU+ .��. k   D v// 010 r   D N232 n  D L454 I   G L��6����  0 urlwithstring_ URLWithString_6 7��7 o   G H���� 0 filepath filePath��  ��  5 n  D G898 o   E G���� 0 nsurl NSURL9 m   D E��
�� misccura3 o      ���� 0 asocurl asocURL1 :��: Z  O v;<����; G   O ]=>= =  O R?@? o   O P���� 0 asocurl asocURL@ m   P Q��
�� 
msng> H   U [AA n  U ZBCB I   V Z�������� 0 fileurl fileURL��  ��  C o   U V���� 0 asocurl asocURL< R   ` r��DE
�� .ascrerr ****      � ****D m   n qFF �GG T I n v a l i d   d i r e c t   p a r a m e t e r   ( n o t   a   f i l e   U R L ) .E ��HI
�� 
errnH m   d g�����YI ��J��
�� 
erobJ o   j k���� 0 filepath filePath��  ��  ��  ��  ��   R   y ���KL
�� .ascrerr ****      � ****K m   � �MM �NN f I n v a l i d    f r o m    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .L ��OP
�� 
errnO m   } ������YP ��QR
�� 
erobQ o   � ����� 0 
fromformat 
fromFormatR ��S��
�� 
errtS m   � ���
�� 
enum��   \ V it's a text path in the user-specified format, so convert it to a standard POSIX path    �TT �   i t ' s   a   t e x t   p a t h   i n   t h e   u s e r - s p e c i f i e d   f o r m a t ,   s o   c o n v e r t   i t   t o   a   s t a n d a r d   P O S I X   p a t h� UVU l  � ���WX��  W   sanity check   X �YY    s a n i t y   c h e c kV Z[Z Z  � �\]����\ =   � �^_^ n  � �`a` 1   � ���
�� 
lenga o   � ����� 0 	posixpath 	posixPath_ m   � �����  ] R   � ���bc
�� .ascrerr ****      � ****b m   � �dd �ee L I n v a l i d   d i r e c t   p a r a m e t e r   ( e m p t y   p a t h ) .c ��fg
�� 
errnf m   � ������Yg ��h��
�� 
erobh o   � ����� 0 filepath filePath��  ��  ��  [ iji l  � ���kl��  k ; 5 convert POSIX path text to the requested format/type   l �mm j   c o n v e r t   P O S I X   p a t h   t e x t   t o   t h e   r e q u e s t e d   f o r m a t / t y p ej n��n Z   �aopqro =  � �sts o   � ����� 0 toformat toFormatt m   � ���
�� FLCTFLCPp L   � �uu o   � ����� 0 	posixpath 	posixPathq vwv =  � �xyx o   � ����� 0 toformat toFormaty m   � ���
�� FLCTFLCAw z{z l  � �|}~| L   � � c   � ���� c   � ���� o   � ����� 0 	posixpath 	posixPath� m   � ���
�� 
psxf� m   � ��
� 
alis} %  returns object of type `alias`   ~ ��� >   r e t u r n s   o b j e c t   o f   t y p e   ` a l i a s `{ ��� =  � ���� o   � ��~�~ 0 toformat toFormat� m   � ��}
�} FLCTFLCX� ��� l  � ����� L   � ��� c   � ���� o   � ��|�| 0 	posixpath 	posixPath� m   � ��{
�{ 
psxf� , & returns object of type `�class furl�`   � ��� L   r e t u r n s   o b j e c t   o f   t y p e   ` � c l a s s   f u r l � `� ��� =  � ���� o   � ��z�z 0 toformat toFormat� m   � ��y
�y FLCTFLCS� ��� l  � ����� L   � ��� N   � ��� n   � ���� 4   � ��x�
�x 
file� l  � ���w�v� c   � ���� c   � ���� o   � ��u�u 0 	posixpath 	posixPath� m   � ��t
�t 
psxf� m   � ��s
�s 
ctxt�w  �v  � 1   � ��r
�r 
ascr�NH returns an _object specifier_ of type 'file'. Caution: unlike alias and �class furl� objects, this is not a true object but may be used by some applications; not to be confused with the deprecated `file specifier` type (�class fss�), although it uses the same `file TEXT` constructor. Furthermore, it uses an HFS path string so suffers the same problems as HFS paths. Also, being a specifier, requires disambiguation when used [e.g.] in an `open` command otherwise command will be dispatched to it instead of target app, e.g. `tell app "TextEdit" to open {fileSpecifierObject}`. Horribly nasty, brittle, and confusing mis-feature, in other words, but supported (though not encouraged) as an option here for sake of compatibility as there's usually some scriptable app or other API in AS that will absolutely refuse to accept anything else.   � ����   r e t u r n s   a n   _ o b j e c t   s p e c i f i e r _   o f   t y p e   ' f i l e ' .   C a u t i o n :   u n l i k e   a l i a s   a n d   � c l a s s   f u r l �   o b j e c t s ,   t h i s   i s   n o t   a   t r u e   o b j e c t   b u t   m a y   b e   u s e d   b y   s o m e   a p p l i c a t i o n s ;   n o t   t o   b e   c o n f u s e d   w i t h   t h e   d e p r e c a t e d   ` f i l e   s p e c i f i e r `   t y p e   ( � c l a s s   f s s � ) ,   a l t h o u g h   i t   u s e s   t h e   s a m e   ` f i l e   T E X T `   c o n s t r u c t o r .   F u r t h e r m o r e ,   i t   u s e s   a n   H F S   p a t h   s t r i n g   s o   s u f f e r s   t h e   s a m e   p r o b l e m s   a s   H F S   p a t h s .   A l s o ,   b e i n g   a   s p e c i f i e r ,   r e q u i r e s   d i s a m b i g u a t i o n   w h e n   u s e d   [ e . g . ]   i n   a n   ` o p e n `   c o m m a n d   o t h e r w i s e   c o m m a n d   w i l l   b e   d i s p a t c h e d   t o   i t   i n s t e a d   o f   t a r g e t   a p p ,   e . g .   ` t e l l   a p p   " T e x t E d i t "   t o   o p e n   { f i l e S p e c i f i e r O b j e c t } ` .   H o r r i b l y   n a s t y ,   b r i t t l e ,   a n d   c o n f u s i n g   m i s - f e a t u r e ,   i n   o t h e r   w o r d s ,   b u t   s u p p o r t e d   ( t h o u g h   n o t   e n c o u r a g e d )   a s   a n   o p t i o n   h e r e   f o r   s a k e   o f   c o m p a t i b i l i t y   a s   t h e r e ' s   u s u a l l y   s o m e   s c r i p t a b l e   a p p   o r   o t h e r   A P I   i n   A S   t h a t   w i l l   a b s o l u t e l y   r e f u s e   t o   a c c e p t   a n y t h i n g   e l s e .� ��� =  � ��� o   � ��q�q 0 toformat toFormat� m   � ��p
�p FLCTFLCH� ��� L  �� c  
��� c  ��� o  �o�o 0 	posixpath 	posixPath� m  �n
�n 
psxf� m  	�m
�m 
ctxt� ��� = ��� o  �l�l 0 toformat toFormat� m  �k
�k FLCTFLCU� ��j� k  F�� ��� r  ��� n ��� I  �i��h�i $0 fileurlwithpath_ fileURLWithPath_� ��g� o  �f�f 0 	posixpath 	posixPath�g  �h  � n ��� o  �e�e 0 nsurl NSURL� m  �d
�d misccura� o      �c�c 0 asocurl asocURL� ��� Z  =���b�a� = "��� o   �`�` 0 asocurl asocURL� m   !�_
�_ 
msng� R  %9�^��
�^ .ascrerr ****      � ****� b  38��� m  36�� ��� f C o u l d n ' t   c o n v e r t   t h e   f o l l o w i n g   p a t h   t o   a   f i l e   U R L :  � o  67�]�] 0 	posixpath 	posixPath� �\��
�\ 
errn� m  ),�[�[�Y� �Z��Y
�Z 
erob� o  /0�X�X 0 filepath filePath�Y  �b  �a  � ��W� L  >F�� c  >E��� l >C��V�U� n >C��� I  ?C�T�S�R�T  0 absolutestring absoluteString�S  �R  � o  >?�Q�Q 0 asocurl asocURL�V  �U  � m  CD�P
�P 
ctxt�W  �j  r R  Ia�O��
�O .ascrerr ****      � ****� m  ]`�� ��� b I n v a l i d    t o    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .� �N��
�N 
errn� m  MP�M�M�Y� �L��
�L 
erob� o  ST�K�K 0 toformat toFormat� �J��I
�J 
errt� m  WZ�H
�H 
enum�I  ��  � R      �G��
�G .ascrerr ****      � ****� o      �F�F 0 etext eText� �E��
�E 
errn� o      �D�D 0 enumber eNumber� �C��
�C 
erob� o      �B�B 0 efrom eFrom� �A��@
�A 
errt� o      �?�? 
0 eto eTo�@  � I  iw�>��=�> 
0 _error  � ��� m  jm�� ���  c o n v e r t   p a t h� ��� o  mn�<�< 0 etext eText� ��� o  no�;�; 0 enumber eNumber� ��� o  op�:�: 0 efrom eFrom� ��9� o  pq�8�8 
0 eto eTo�9  �=  � x r brings a modicum of sanity to the horrible mess that is AppleScript's file path formats and file identifier types   � ��� �   b r i n g s   a   m o d i c u m   o f   s a n i t y   t o   t h e   h o r r i b l e   m e s s   t h a t   i s   A p p l e S c r i p t ' s   f i l e   p a t h   f o r m a t s   a n d   f i l e   i d e n t i f i e r   t y p e s� ��� l     �7�6�5�7  �6  �5  � ��� l     �4�3�2�4  �3  �2  � ��� i  6 9��� I     �1��
�1 .Fil:NorPnull���     ****� o      �0�0 0 filepath filePath� �/��.
�/ 
ExpR� |�-�,��+ �-  �,  � o      �*�* 0 isexpanding isExpanding�+    l     �)�( m      �'
�' boovfals�)  �(  �.  � Q     R k    @  r    	 n   

 I    �&�%�& ,0 asposixpathparameter asPOSIXPathParameter  o    	�$�$ 0 filepath filePath �# m   	 
 �  �#  �%   o    �"�" 0 _support  	 o      �!�! 0 filepath filePath  Z    0� � F     o    �� 0 isexpanding isExpanding H     C     o    �� 0 filepath filePath m     �  / r    , I   *��
� .Fil:JoiPnull���     **** J    &   !"! I   #���
� .Fil:CurFnull��� ��� null�  �  " #�# o   # $�� 0 filepath filePath�  �   o      �� 0 filepath filePath�   �   $�$ L   1 @%% c   1 ?&'& l  1 =(��( n  1 =)*) I   9 =���� 60 stringbystandardizingpath stringByStandardizingPath�  �  * l  1 9+��+ n  1 9,-, I   4 9�.�� &0 stringwithstring_ stringWithString_. /�
/ o   4 5�	�	 0 filepath filePath�
  �  - n  1 4010 o   2 4�� 0 nsstring NSString1 m   1 2�
� misccura�  �  �  �  ' m   = >�
� 
ctxt�   R      �23
� .ascrerr ****      � ****2 o      �� 0 etext eText3 �45
� 
errn4 o      �� 0 enumber eNumber5 �6� 
� 
errt6 o      ���� 
0 eto eTo�    I   H R��7���� 
0 _error  7 898 m   I J:: �;;  n o r m a l i z e   p a t h9 <=< o   J K���� 0 etext eText= >?> o   K L���� 0 enumber eNumber? @A@ o   L M���� 0 filepath filePathA B��B o   M N���� 
0 eto eTo��  ��  � CDC l     ��������  ��  ��  D EFE l     ��������  ��  ��  F GHG i  : =IJI I     ��KL
�� .Fil:JoiPnull���     ****K o      ����  0 pathcomponents pathComponentsL ��M��
�� 
ExteM |����N��O��  ��  N o      ���� 0 fileextension fileExtension��  O l     P����P m      QQ �RR  ��  ��  ��  J Q     �STUS k    �VV WXW r    YZY n    [\[ 2   ��
�� 
cobj\ n   ]^] I    ��_���� "0 aslistparameter asListParameter_ `a` o    	����  0 pathcomponents pathComponentsa b��b m   	 
cc �dd  ��  ��  ^ o    ���� 0 _support  Z o      ���� 0 subpaths subPathsX efe Q    \ghig k    Ljj klk Z   %mn����m =   opo o    ���� 0 subpaths subPathsp J    ����  n R    !������
�� .ascrerr ****      � ****��  ��  ��  ��  l q��q X   & Lr��sr r   6 Gtut n  6 Cvwv I   ; C��x���� ,0 asposixpathparameter asPOSIXPathParameterx yzy n  ; >{|{ 1   < >��
�� 
pcnt| o   ; <���� 0 aref aRefz }��} m   > ?~~ �  ��  ��  w o   6 ;���� 0 _support  u n     ��� 1   D F��
�� 
pcnt� o   C D���� 0 aref aRef�� 0 aref aRefs o   ) *���� 0 subpaths subPaths��  h R      ������
�� .ascrerr ****      � ****��  ��  i R   T \����
�� .ascrerr ****      � ****� m   Z [�� ��� � I n v a l i d   p a t h   c o m p o n e n t s   l i s t   ( e x p e c t e d   o n e   o r   m o r e   t e x t   a n d / o r   f i l e   i t e m s ) .� ����
�� 
errn� m   V W�����Y� �����
�� 
erob� o   X Y����  0 pathcomponents pathComponents��  f ��� r   ] i��� l  ] g������ n  ] g��� I   b g������� *0 pathwithcomponents_ pathWithComponents_� ���� o   b c���� 0 subpaths subPaths��  ��  � n  ] b��� o   ^ b���� 0 nsstring NSString� m   ] ^��
�� misccura��  ��  � o      ���� 0 asocpath asocPath� ��� r   j y��� n  j w��� I   o w������� "0 astextparameter asTextParameter� ��� o   o p���� 0 fileextension fileExtension� ���� m   p s�� ��� ( u s i n g   f i l e   e x t e n s i o n��  ��  � o   j o���� 0 _support  � o      ���� 0 fileextension fileExtension� ��� Z   z �������� >   z ���� n  z ��� 1   { ��
�� 
leng� o   z {���� 0 fileextension fileExtension� m    �����  � k   � ��� ��� r   � ���� n  � ���� I   � �������� B0 stringbyappendingpathextension_ stringByAppendingPathExtension_� ���� o   � ����� 0 fileextension fileExtension��  ��  � o   � ����� 0 asocpath asocPath� o      ���� 0 asocpath asocPath� ���� Z  � �������� =  � ���� o   � ����� 0 asocpath asocPath� m   � ���
�� 
msng� R   � �����
�� .ascrerr ****      � ****� m   � ��� ��� . I n v a l i d   f i l e   e x t e n s i o n .� ����
�� 
errn� m   � ������Y� �����
�� 
erob� o   � ����� 0 fileextension fileExtension��  ��  ��  ��  ��  ��  � ���� L   � ��� c   � ���� o   � ����� 0 asocpath asocPath� m   � ���
�� 
ctxt��  T R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  U I   � �������� 
0 _error  � ��� m   � ��� ���  j o i n   p a t h� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  H ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  > A��� I     ����
�� .Fil:SplPnull���     ctxt� o      ���� 0 filepath filePath� �����
�� 
Upon� |����������  ��  � o      ���� 0 splitposition splitPosition��  � l     ���~� m      �}
�} FLSPFLSL�  �~  ��  � Q     ����� k    s�� ��� r    ��� n   ��� I    �|��{�| &0 stringwithstring_ stringWithString_� ��z� l   ��y�x� n   ��� I    �w��v�w ,0 asposixpathparameter asPOSIXPathParameter� ��� o    �u�u 0 filepath filePath� ��t� m    �� ���  �t  �v  � o    �s�s 0 _support  �y  �x  �z  �{  � n   ��� o    �r�r 0 nsstring NSString� m    �q
�q misccura� o      �p�p 0 asocpath asocPath� ��o� Z    s����� =   ��� o    �n�n 0 splitposition splitPosition� m    �m
�m FLSPFLSL� L    /   J    .  c    % l   #�l�k n   # I    #�j�i�h�j F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent�i  �h   o    �g�g 0 asocpath asocPath�l  �k   m   # $�f
�f 
ctxt 	�e	 c   % ,

 l  % *�d�c n  % * I   & *�b�a�`�b &0 lastpathcomponent lastPathComponent�a  �`   o   % &�_�_ 0 asocpath asocPath�d  �c   m   * +�^
�^ 
ctxt�e  �  =  2 5 o   2 3�]�] 0 splitposition splitPosition m   3 4�\
�\ FLSPFLSE  L   8 I J   8 H  c   8 ? l  8 =�[�Z n  8 = I   9 =�Y�X�W�Y >0 stringbydeletingpathextension stringByDeletingPathExtension�X  �W   o   8 9�V�V 0 asocpath asocPath�[  �Z   m   = >�U
�U 
ctxt �T c   ? F  l  ? D!�S�R! n  ? D"#" I   @ D�Q�P�O�Q 0 pathextension pathExtension�P  �O  # o   ? @�N�N 0 asocpath asocPath�S  �R    m   D E�M
�M 
ctxt�T   $%$ =  L O&'& o   L M�L�L 0 splitposition splitPosition' m   M N�K
�K FLSPFLSA% (�J( L   R Z)) c   R Y*+* l  R W,�I�H, n  R W-.- I   S W�G�F�E�G  0 pathcomponents pathComponents�F  �E  . o   R S�D�D 0 asocpath asocPath�I  �H  + m   W X�C
�C 
list�J  � R   ] s�B/0
�B .ascrerr ****      � ****/ m   o r11 �22 b I n v a l i d    a t    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .0 �A34
�A 
errn3 m   _ b�@�@�Y4 �?56
�? 
erob5 o   e f�>�> 0 matchformat matchFormat6 �=7�<
�= 
errt7 m   i l�;
�; 
enum�<  �o  � R      �:89
�: .ascrerr ****      � ****8 o      �9�9 0 etext eText9 �8:;
�8 
errn: o      �7�7 0 enumber eNumber; �6<=
�6 
erob< o      �5�5 0 efrom eFrom= �4>�3
�4 
errt> o      �2�2 
0 eto eTo�3  � I   { ��1?�0�1 
0 _error  ? @A@ m   | BB �CC  s p l i t   p a t hA DED o    ��/�/ 0 etext eTextE FGF o   � ��.�. 0 enumber eNumberG HIH o   � ��-�- 0 efrom eFromI J�,J o   � ��+�+ 
0 eto eTo�,  �0  � KLK l     �*�)�(�*  �)  �(  L MNM l     �'�&�%�'  �&  �%  N OPO l     �$QR�$  Q J D--------------------------------------------------------------------   R �SS � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -P TUT l     �#VW�#  V S M Shell Script Support handlers for use in AppleScripts that run via osascript   W �XX �   S h e l l   S c r i p t   S u p p o r t   h a n d l e r s   f o r   u s e   i n   A p p l e S c r i p t s   t h a t   r u n   v i a   o s a s c r i p tU YZY l     �"�!� �"  �!  �   Z [\[ l     ]^_] j   B F�`�  0 _argvusererror _ArgvUserError` m   B E��'^�� error code used to indicate the shell script's user supplied invalid command line options (errors due to bugs in invalid option/argument definitions supplied by shell script author use standard AS error codes); need to decide what's a sensible code to use and document it in SDEF (unfortunately, `on error number ...` blocks only accept literal integer (for pattern matching) or identifier (for assignment) and don't allow a command as parameter, so there's no way to supply library-defined error numbers as 'named constants' via library-defined commands, e.g. `on error number (command line user error)`, that return the appropriate number)   _ �aa   e r r o r   c o d e   u s e d   t o   i n d i c a t e   t h e   s h e l l   s c r i p t ' s   u s e r   s u p p l i e d   i n v a l i d   c o m m a n d   l i n e   o p t i o n s   ( e r r o r s   d u e   t o   b u g s   i n   i n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n s   s u p p l i e d   b y   s h e l l   s c r i p t   a u t h o r   u s e   s t a n d a r d   A S   e r r o r   c o d e s ) ;   n e e d   t o   d e c i d e   w h a t ' s   a   s e n s i b l e   c o d e   t o   u s e   a n d   d o c u m e n t   i t   i n   S D E F   ( u n f o r t u n a t e l y ,   ` o n   e r r o r   n u m b e r   . . . `   b l o c k s   o n l y   a c c e p t   l i t e r a l   i n t e g e r   ( f o r   p a t t e r n   m a t c h i n g )   o r   i d e n t i f i e r   ( f o r   a s s i g n m e n t )   a n d   d o n ' t   a l l o w   a   c o m m a n d   a s   p a r a m e t e r ,   s o   t h e r e ' s   n o   w a y   t o   s u p p l y   l i b r a r y - d e f i n e d   e r r o r   n u m b e r s   a s   ' n a m e d   c o n s t a n t s '   v i a   l i b r a r y - d e f i n e d   c o m m a n d s ,   e . g .   ` o n   e r r o r   n u m b e r   ( c o m m a n d   l i n e   u s e r   e r r o r ) ` ,   t h a t   r e t u r n   t h e   a p p r o p r i a t e   n u m b e r )\ bcb l     ����  �  �  c ded h   G R�f� 0 novalue NoValuef l     �gh�  g J D unique constant used to indicate no defaultValue property was given   h �ii �   u n i q u e   c o n s t a n t   u s e d   t o   i n d i c a t e   n o   d e f a u l t V a l u e   p r o p e r t y   w a s   g i v e ne jkj l     ����  �  �  k lml j   S [�n� 
0 lf2 LF2n b   S Zopo 1   S V�
� 
lnfdp 1   V Y�
� 
lnfdm qrq j   \ `�s� 0 indent1 Indent1s m   \ _tt �uu     r vwv j   a e�x� 0 indent2 Indent2x m   a dyy �zz             w {|{ l     ����  �  �  | }~} l     ����  �  �  ~ � l     �
�	��
  �	  �  � ��� i  f i��� I      ���� 0 vt100 VT100� ��� o      �� 0 
formatcode 
formatCode�  �  � k     �� ��� l      ����  �F@ Returns a magic character sequence that will apply the specified formatting or other control operation in Terminal.app and other VT100 terminal emulators. Multiple codes may be given as semicolon-separated numeric text, e.g. "1;7". Commonly used style codes are:
	
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
 	� ��� L     �� b     ��� b     	��� b     ��� l    ��� � 5     �����
�� 
cha � m    ���� 
�� kfrmID  �  �   � m    �� ���  [� o    ���� 0 
formatcode 
formatCode� m   	 
�� ���  m�  � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ������  � - ' convert raw args to supported AS types   � ��� N   c o n v e r t   r a w   a r g s   t o   s u p p o r t e d   A S   t y p e s� ��� l     ��������  ��  ��  � ��� i  j m��� I      ������� 0 _unpackvalue _unpackValue� ��� o      ���� 0 thevalue theValue� ���� o      ���� $0 definitionrecord definitionRecord��  ��  � k    ��� ��� l     ������  � � � note that only ASOC-friendly AS types are supported here since NSDictionaries are used as temporary storage for parsed options and arguments   � ���   n o t e   t h a t   o n l y   A S O C - f r i e n d l y   A S   t y p e s   a r e   s u p p o r t e d   h e r e   s i n c e   N S D i c t i o n a r i e s   a r e   u s e d   a s   t e m p o r a r y   s t o r a g e   f o r   p a r s e d   o p t i o n s   a n d   a r g u m e n t s� ��� r     ��� c     ��� n    ��� o    ���� 0 	valuetype 	valueType� o     ���� $0 definitionrecord definitionRecord� m    ��
�� 
type� o      ���� 0 	valuetype 	valueType� ��� Z   ������ =   ��� o    	���� 0 	valuetype 	valueType� m   	 
��
�� 
ctxt� r    ��� o    ���� 0 thevalue theValue� o      ���� 0 	theresult 	theResult� ��� E   ��� J    �� ��� m    ��
�� 
long� ��� m    ��
�� 
doub� ���� m    ��
�� 
nmbr��  � J    �� ���� o    ���� 0 	valuetype 	valueType��  � ��� l    ����� k     ��� ��� r     -��� n    +��� I   ' +�������� 0 init  ��  ��  � n    '��� I   # '�������� 	0 alloc  ��  ��  � n    #��� o   ! #���� &0 nsnumberformatter NSNumberFormatter� m     !��
�� misccura� o      ���� 0 asocformatter asocFormatter� ��� n  . 6��� I   / 6������� "0 setnumberstyle_ setNumberStyle_� ���� l  / 2������ n  / 2��� o   0 2���� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� m   / 0��
�� misccura��  ��  ��  ��  � o   . /���� 0 asocformatter asocFormatter� ��� n  7 C��� I   8 C������� 0 
setlocale_ 
setLocale_� ���� l  8 ?������ n  8 ?��� I   ; ?�������� 0 systemlocale systemLocale��  ��  � n  8 ;��� o   9 ;���� 0 nslocale NSLocale� m   8 9��
�� misccura��  ��  ��  ��  � o   7 8���� 0 asocformatter asocFormatter� ��� r   D L��� n  D J��� I   E J������� &0 numberfromstring_ numberFromString_�  ��  o   E F���� 0 thevalue theValue��  ��  � o   D E���� 0 asocformatter asocFormatter� o      ���� 0 
asocresult 
asocResult�  Z  M i���� =  M R o   M N���� 0 
asocresult 
asocResult m   N Q��
�� 
msng R   U e��
�� .ascrerr ****      � **** b   _ d	
	 m   _ b � ( N o t   a   v a l i d   n u m b e r :  
 o   b c���� 0 thevalue theValue ����
�� 
errn o   Y ^����  0 _argvusererror _ArgvUserError��  ��  ��    r   j q c   j o o   j k���� 0 
asocresult 
asocResult m   k n��
�� 
**** o      ���� 0 	theresult 	theResult �� Z   r ����� =  r u o   r s���� 0 	valuetype 	valueType m   s t��
�� 
long k   x �  Z  x ����� >   x } `   x { !  o   x y���� 0 	theresult 	theResult! m   y z����  m   { |����   R   � ���"#
�� .ascrerr ****      � ****" b   � �$%$ m   � �&& �'' * N o t   a   v a l i d   i n t e g e r :  % o   � ����� 0 thevalue theValue# ��(��
�� 
errn( o   � �����  0 _argvusererror _ArgvUserError��  ��  ��   )��) r   � �*+* c   � �,-, o   � ����� 0 	theresult 	theResult- m   � ���
�� 
long+ o      ���� 0 	theresult 	theResult��  ��  ��  ��  � 6 0 note: decimal numbers must be in canonical form   � �.. `   n o t e :   d e c i m a l   n u m b e r s   m u s t   b e   i n   c a n o n i c a l   f o r m� /0/ E  � �121 J   � �33 454 m   � ���
�� 
furl5 676 m   � ���
�� 
alis7 898 m   � ���
�� 
file9 :��: m   � ���
�� 
psxf��  2 J   � �;; <��< o   � ����� 0 	valuetype 	valueType��  0 =>= l  �G?@A? k   �GBB CDC l  � ���EF��  E   expand/normalize path   F �GG ,   e x p a n d / n o r m a l i z e   p a t hD HIH Z   �JK����J H   � �LL C   � �MNM o   � ����� 0 thevalue theValueN m   � �OO �PP  /K k   � �QQ RSR r   � �TUT n  � �VWV I   � ��������� ,0 currentdirectorypath currentDirectoryPath��  ��  W n  � �XYX I   � ���������  0 defaultmanager defaultManager��  ��  Y n  � �Z[Z o   � ����� 0 nsfilemanager NSFileManager[ m   � ���
�� misccuraU o      ���� 0 basepath basePathS \]\ Z  � �^_����^ =  � �`a` o   � ����� 0 basepath basePatha m   � ���
�� 
msng_ R   � ���bc
�� .ascrerr ****      � ****b b   � �ded m   � �ff �gg � C a n ' t   e x p a n d   r e l a t i v e   f i l e   p a t h   ( c u r r e n t   w o r k i n g   d i r e c t o r y   i s   u n k n o w n ) :  e o   � ����� 0 thevalue theValuec ��h��
�� 
errnh o   � �����  0 _argvusererror _ArgvUserError��  ��  ��  ] i��i r   � �jkj l  � �l���l n  � �mnm I   � ��~o�}�~ *0 pathwithcomponents_ pathWithComponents_o p�|p J   � �qq rsr o   � ��{�{ 0 basepath basePaths t�zt o   � ��y�y 0 thevalue theValue�z  �|  �}  n n  � �uvu o   � ��x�x 0 nsstring NSStringv m   � ��w
�w misccura��  �  k o      �v�v 0 thevalue theValue��  ��  ��  I wxw r  yzy c  {|{ c  }~} l �u�t n ��� I  �s�r�q�s 60 stringbystandardizingpath stringByStandardizingPath�r  �q  � l ��p�o� n ��� I  �n��m�n &0 stringwithstring_ stringWithString_� ��l� o  �k�k 0 thevalue theValue�l  �m  � n ��� o  �j�j 0 nsstring NSString� m  �i
�i misccura�p  �o  �u  �t  ~ m  �h
�h 
ctxt| m  �g
�g 
psxfz o      �f�f 0 	theresult 	theResultx ��e� Q  G���� Z /���d�c� = !��� o  �b�b 0 	valuetype 	valueType� m   �a
�a 
alis� r  $+��� c  $)��� o  $%�`�` 0 	theresult 	theResult� m  %(�_
�_ 
alis� o      �^�^ 0 	theresult 	theResult�d  �c  � R      �]�\�
�] .ascrerr ****      � ****�\  � �[��Z
�[ 
errn� d      �� m      �Y�Y +�Z  � l 7G���� R  7G�X��
�X .ascrerr ****      � ****� b  AF��� m  AD�� ��� 2 F i l e   p a t h   d o e s n  t   e x i s t :  � o  DE�W�W 0 thevalue theValue� �V��U
�V 
errn� o  ;@�T�T  0 _argvusererror _ArgvUserError�U  �   file not found   � ���    f i l e   n o t   f o u n d�e  @ � � note: `file` is treated as synonym for `POSIX file` here, as actual 'file' object specifiers are both mostly pointless and much more problematic due to using HFS paths   A ���P   n o t e :   ` f i l e `   i s   t r e a t e d   a s   s y n o n y m   f o r   ` P O S I X   f i l e `   h e r e ,   a s   a c t u a l   ' f i l e '   o b j e c t   s p e c i f i e r s   a r e   b o t h   m o s t l y   p o i n t l e s s   a n d   m u c h   m o r e   p r o b l e m a t i c   d u e   t o   u s i n g   H F S   p a t h s> ��� = JO��� o  JK�S�S 0 	valuetype 	valueType� m  KN�R
�R 
bool� ��Q� l R����� P  R���P�� Z  Y������ E Yp��� J  Yl�� ��� m  Y\�� ���  t r u e� ��� m  \_�� ���  y e s� ��� m  _b�� ���  t� ��� m  be�� ���  y� ��O� m  eh�� ���  1�O  � J  lo�� ��N� o  lm�M�M 0 thevalue theValue�N  � L  su�� m  st�L
�L boovtrue� ��� E x���� J  x��� ��� m  x{�� ��� 
 f a l s e� ��� m  {~�� ���  n o� ��� m  ~��� ���  f� ��� m  ���� ���  n� ��K� m  ���� ���  0�K  � J  ���� ��J� o  ���I�I 0 thevalue theValue�J  � ��H� L  ���� m  ���G
�G boovfals�H  � R  ���F��
�F .ascrerr ****      � ****� b  ����� m  ���� ��� 2 N o t    y e s    o r    n o    ( Y | N ) :  � o  ���E�E 0 thevalue theValue� �D��C
�D 
errn� o  ���B�B  0 _argvusererror _ArgvUserError�C  �P  � �A�@
�A conscase�@  � W Q may be used by boolean argument definitions (boolean options don't take a value)   � ��� �   m a y   b e   u s e d   b y   b o o l e a n   a r g u m e n t   d e f i n i t i o n s   ( b o o l e a n   o p t i o n s   d o n ' t   t a k e   a   v a l u e )�Q  � R  ���?��
�? .ascrerr ****      � ****� m  ���� ��� r I n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n   ( n o t   a n   a l l o w e d   t y p e ) .� �>��
�> 
errn� m  ���=�=�Y� �<��
�< 
erob� l ����;�:� N  ���� n  ����� o  ���9�9 0 	valuetype 	valueType� o  ���8�8 $0 definitionrecord definitionRecord�;  �:  � �7��6
�7 
errt� m  ���5
�5 
type�6  � ��4� L  ���� o  ���3�3 0 	theresult 	theResult�4  � ��� l     �2�1�0�2  �1  �0  �    l     �/�.�-�/  �.  �-    i  n q I      �,�+�, 40 _defaultvalueplaceholder _defaultValuePlaceholder �* o      �)�) $0 definitionrecord definitionRecord�*  �+   l    g	
 k     g  r      c      n     o    �(�( 0 	valuetype 	valueType o     �'�' $0 definitionrecord definitionRecord m    �&
�& 
type o      �%�% 0 	valuetype 	valueType  l   �$�$   ^ X note: the following conditional block should implement same branches as in _unpackValue    � �   n o t e :   t h e   f o l l o w i n g   c o n d i t i o n a l   b l o c k   s h o u l d   i m p l e m e n t   s a m e   b r a n c h e s   a s   i n   _ u n p a c k V a l u e �# Z    g =    o    	�"�" 0 	valuetype 	valueType m   	 
�!
�! 
ctxt L       m    !! �""  T E X T #$# E   %&% J    '' ()( m    � 
�  
long) *+* m    �
� 
doub+ ,�, m    �
� 
nmbr�  & J    -- .�. o    �� 0 	valuetype 	valueType�  $ /0/ Z    ,12�31 =   "454 o     �� 0 	valuetype 	valueType5 m     !�
� 
long2 L   % '66 m   % &77 �88  I N T E G E R�  3 L   * ,99 m   * +:: �;;  N U M B E R0 <=< E  / 9>?> J   / 5@@ ABA m   / 0�
� 
furlB CDC m   0 1�
� 
alisD EFE m   1 2�
� 
fileF G�G m   2 3�
� 
psxf�  ? J   5 8HH I�I o   5 6�� 0 	valuetype 	valueType�  = JKJ L   < >LL m   < =MM �NN  F I L EK OPO =  A DQRQ o   A B�� 0 	valuetype 	valueTypeR m   B C�
� 
boolP S�S L   G KTT m   G JUU �VV  Y | N�   R   N g�WX
� .ascrerr ****      � ****W m   c fYY �ZZ r I n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n   ( n o t   a n   a l l o w e d   t y p e ) .X �[\
� 
errn[ m   R U���Y\ �
]^
�
 
erob] l  X \_�	�_ N   X \`` n   X [aba o   Y [�� 0 	valuetype 	valueTypeb o   X Y�� $0 definitionrecord definitionRecord�	  �  ^ �c�
� 
errtc m   _ `�
� 
type�  �#  	 J D returns appropriate default placeholderValue according to valueType   
 �dd �   r e t u r n s   a p p r o p r i a t e   d e f a u l t   p l a c e h o l d e r V a l u e   a c c o r d i n g   t o   v a l u e T y p e efe l     ��� �  �  �   f ghg l     ��������  ��  ��  h iji i  r uklk I      ��m���� *0 _formatdefaultvalue _formatDefaultValuem n��n o      ���� $0 definitionrecord definitionRecord��  ��  l l    �opqo k     �rr sts r     uvu n     wxw o    ���� 0 defaultvalue defaultValuex o     ���� $0 definitionrecord definitionRecordv o      ���� 0 defaultvalue defaultValuet yzy Z   ({|����{ F    }~} >    � l   ������ I   ����
�� .corecnte****       ****� J    	�� ���� o    ���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   
 ��
�� 
list��  ��  ��  � m    ����  ~ =    ��� n    ��� 1    ��
�� 
leng� o    ���� 0 defaultvalue defaultValue� m    ���� | r    $��� n    "��� 4    "���
�� 
cobj� m     !���� � o    ���� 0 defaultvalue defaultValue� o      ���� 0 defaultvalue defaultValue��  ��  z ��� Z   ) ������ >   ) 4��� l  ) 2������ I  ) 2����
�� .corecnte****       ****� J   ) ,�� ���� o   ) *���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   - .��
�� 
ctxt��  ��  ��  � m   2 3����  � r   7 :��� o   7 8���� 0 defaultvalue defaultValue� o      ���� 0 defaulttext defaultText� ��� G   = X��� >   = H��� l  = F������ I  = F����
�� .corecnte****       ****� J   = @�� ���� o   = >���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   A B��
�� 
long��  ��  ��  � m   F G����  � >   K V��� l  K T������ I  K T����
�� .corecnte****       ****� J   K N�� ���� o   K L���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   O P��
�� 
doub��  ��  ��  � m   T U����  � ��� k   [ ��� ��� r   [ h��� n  [ f��� I   b f�������� 0 init  ��  ��  � n  [ b��� I   ^ b�������� 	0 alloc  ��  ��  � n  [ ^��� o   \ ^���� &0 nsnumberformatter NSNumberFormatter� m   [ \��
�� misccura� o      ���� 0 asocformatter asocFormatter� ��� n  i q��� I   j q������� "0 setnumberstyle_ setNumberStyle_� ���� l  j m������ n  j m��� o   k m���� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle� m   j k��
�� misccura��  ��  ��  ��  � o   i j���� 0 asocformatter asocFormatter� ��� n  r ���� I   s �������� 0 
setlocale_ 
setLocale_� ���� l  s |������ n  s |��� I   x |�������� 0 systemlocale systemLocale��  ��  � n  s x��� o   t x���� 0 nslocale NSLocale� m   s t��
�� misccura��  ��  ��  ��  � o   r s���� 0 asocformatter asocFormatter� ���� r   � ���� c   � ���� l  � ������� n  � ���� I   � �������� &0 stringfromnumber_ stringFromNumber_� ���� o   � ����� 0 defaultvalue defaultValue��  ��  � o   � ����� 0 asocformatter asocFormatter��  ��  � m   � ���
�� 
****� o      ���� 0 defaulttext defaultText��  � ��� G   � ���� >   � ���� l  � ������� I  � �����
�� .corecnte****       ****� J   � ��� ���� o   � ����� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   � ���
�� 
furl��  ��  ��  � m   � �����  � >   � ���� l  � ������� I  � �����
�� .corecnte****       ****� J   � ��� ���� o   � ����� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   � ���
�� 
alis��  ��  ��  � m   � �����  � ��� r   � ���� n   � ���� 1   � ���
�� 
psxp� o   � ����� 0 defaultvalue defaultValue� o      ���� 0 defaulttext defaultText� ��� =  � ���� o   � ����� 0 defaultvalue defaultValue� m   � ���
�� boovtrue� ��� r   � �� � m   � � �  Y  o      ���� 0 defaulttext defaultText�  =  � � o   � ����� 0 defaultvalue defaultValue m   � ���
�� boovfals �� r   � �	 m   � �

 �  N	 o      ���� 0 defaulttext defaultText��  � L   � � m   � � �  � �� L   � � b   � � b   � � m   � � �  D e f a u l t :    o   � ����� 0 defaulttext defaultText m   � � �    ��  p G A formats default value for inclusion in OPTIONS/ARGUMENTS section   q � �   f o r m a t s   d e f a u l t   v a l u e   f o r   i n c l u s i o n   i n   O P T I O N S / A R G U M E N T S   s e c t i o nj  l     ��������  ��  ��    l     ��    -----    �   
 - - - - - !"! l     �~#$�~  #   parse ARGV   $ �%%    p a r s e   A R G V" &'& l     �}�|�{�}  �|  �{  ' ()( i  v y*+* I      �z,�y�z (0 _buildoptionstable _buildOptionsTable, -�x- o      �w�w &0 optiondefinitions optionDefinitions�x  �y  + k    �.. /0/ l     �v12�v  1 � � create a case-sensitive lookup table of all short and long option names (e.g. "-a", "-A", "-o", "--output-file", etc); used by _parseOptions() to retrieve the definition record for each option it encounters   2 �33�   c r e a t e   a   c a s e - s e n s i t i v e   l o o k u p   t a b l e   o f   a l l   s h o r t   a n d   l o n g   o p t i o n   n a m e s   ( e . g .   " - a " ,   " - A " ,   " - o " ,   " - - o u t p u t - f i l e " ,   e t c ) ;   u s e d   b y   _ p a r s e O p t i o n s ( )   t o   r e t r i e v e   t h e   d e f i n i t i o n   r e c o r d   f o r   e a c h   o p t i o n   i t   e n c o u n t e r s0 454 r     676 J     �u�u  7 o      �t�t 0 
foundnames 
foundNames5 898 r    :;: n   <=< I    �s�r�q�s 0 
dictionary  �r  �q  = n   >?> o    �p�p *0 nsmutabledictionary NSMutableDictionary? m    �o
�o misccura; o      �n�n 20 optiondefinitionsbyname optionDefinitionsByName9 @A@ X   B�mCB k   zDD EFE l   ;GHIG r    ;JKJ b    9LML l   $N�l�kN c    $OPO n   "QRQ 1     "�j
�j 
pcntR o     �i�i 0 	optionref 	optionRefP m   " #�h
�h 
reco�l  �k  M K   $ 8SS �gTU�g 0 	shortname 	shortNameT m   % &VV �WW  U �fXY�f 0 longname longNameX m   ' (ZZ �[[  Y �e\]�e 0 propertyname propertyName\ m   ) *^^ �__  ] �d`a�d 0 	valuetype 	valueType` m   + ,�c
�c 
ctxta �bbc�b 0 islist isListb m   / 0�a
�a boovfalsc �`d�_�` 0 defaultvalue defaultValued m   3 4�^
�^ boovfals�_  K o      �]�] $0 optiondefinition optionDefinitionH 5 / this defaultValue is only used by boolean opts   I �ee ^   t h i s   d e f a u l t V a l u e   i s   o n l y   u s e d   b y   b o o l e a n   o p t sF fgf Q   < yhijh k   ? _kk lml r   ? Fnon c   ? Dpqp n  ? Brsr o   @ B�\�\ 0 propertyname propertyNames o   ? @�[�[ $0 optiondefinition optionDefinitionq m   B C�Z
�Z 
ctxto o      �Y�Y 0 propertyname propertyNamem t�Xt Z  G _uv�W�Vu =  G Nwxw n  G Jyzy o   H J�U�U 0 propertyname propertyNamez o   G H�T�T $0 optiondefinition optionDefinitionx m   J M{{ �||  v R   Q [�S�R}
�S .ascrerr ****      � ****�R  } �Q~�P
�Q 
errn~ m   U X�O�O�\�P  �W  �V  �X  i R      �N�M
�N .ascrerr ****      � ****�M   �L��K
�L 
errn� d      �� m      �J�J��K  j R   g y�I��
�I .ascrerr ****      � ****� m   u x�� ��� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( p r o p e r t y   n a m e   m u s t   b e   n o n - e m p t y   t e x t ) .� �H��
�H 
errn� m   k n�G�G�Y� �F��E
�F 
erob� o   q r�D�D 0 	optionref 	optionRef�E  g ��� r   z ���� n   z ��� 1   { �C
�C 
leng� o   z {�B�B 0 
foundnames 
foundNames� o      �A�A 0 	namecount 	nameCount� ��� X   �Y��@�� k   �T�� ��� r   � ���� o   � ��?�? 0 aref aRef� J      �� ��� o      �>�> 0 thename theName� ��=� o      �<�< 0 
nameprefix 
namePrefix�=  � ��� Q   � ����� r   � ���� c   � ���� o   � ��;�; 0 thename theName� m   � ��:
�: 
ctxt� o      �9�9 0 thename theName� R      �8�7�
�8 .ascrerr ****      � ****�7  � �6��5
�6 
errn� d      �� m      �4�4��5  � R   � ��3��
�3 .ascrerr ****      � ****� m   � ��� ��� r I n v a l i d   o p t i o n   d e f i n i t i o n   ( s h o r t / l o n g   n a m e   m u s t   b e   t e x t ) .� �2��
�2 
errn� m   � ��1�1�\� �0��/
�0 
erob� o   � ��.�. 0 	optionref 	optionRef�/  � ��-� Z   �T���,�+� >  � ���� o   � ��*�* 0 thename theName� m   � ��� ���  � k   �P�� ��� Z  � ����)�(� E  � ���� o   � ��'�' 0 
foundnames 
foundNames� J   � ��� ��&� o   � ��%�% 0 thename theName�&  � R   � ��$��
�$ .ascrerr ****      � ****� m   � ��� ��� x I n v a l i d   o p t i o n   d e f i n i t i o n   ( f o u n d   d u p l i c a t e   s h o r t / l o n g   n a m e ) .� �#��
�# 
errn� m   � ��"�"�Y� �!�� 
�! 
erob� o   � ��� 0 	optionref 	optionRef�   �)  �(  � ��� r   ���� o   � ��� 0 thename theName� n      ���  ;   � o   � �� 0 
foundnames 
foundNames� ��� P  F���� Z  
E����� =  
��� n 
��� 1  �
� 
leng� o  
�� 0 
nameprefix 
namePrefix� m  �� � l A���� Z A����� l (���� G  (��� >  ��� n ��� 1  �
� 
leng� o  �� 0 thename theName� m  �� � H  $�� E #��� m  !�� ��� 4 a b c d e f g h i j k l m n o p q r s t u v w x y z� o  !"�� 0 thename theName�  �  � R  +=���
� .ascrerr ****      � ****� m  9<�� ��� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( s h o r t   n a m e   m u s t   b e   a   s i n g l e   A - Z   o r   a - z   c h a r a c t e r ) .� ���
� 
errn� m  /2���Y� ���
� 
erob� o  56�
�
 0 	optionref 	optionRef�  �  �  �   validate short name   � ��� (   v a l i d a t e   s h o r t   n a m e�  � l DD���� l DD�	���	  � ) # TO DO: how to validate long names?   � ��� F   T O   D O :   h o w   t o   v a l i d a t e   l o n g   n a m e s ?�   validate long name   � ��� &   v a l i d a t e   l o n g   n a m e�  � ��
� conscase�  � ��� l GP���� n GP��� I  HP���� &0 setobject_forkey_ setObject_forKey_� ��� o  HI�� $0 optiondefinition optionDefinition� �� � l IL������ b  IL	 		  o  IJ���� 0 
nameprefix 
namePrefix	 o  JK���� 0 thename theName��  ��  �   �  � o  GH���� 20 optiondefinitionsbyname optionDefinitionsByName�  �  �  �,  �+  �-  �@ 0 aref aRef� J   � �		 			 J   � �		 			 n  � �				 o   � ����� 0 	shortname 	shortName		 o   � ����� $0 optiondefinition optionDefinition	 	
��	
 m   � �		 �		  -��  	 	��	 J   � �		 			 n  � �			 o   � ����� 0 longname longName	 o   � ����� $0 optiondefinition optionDefinition	 	��	 m   � �		 �		  - -��  ��  � 	��	 Z Zz		����	 =  Za			 n  Z_			 1  [_��
�� 
leng	 o  Z[���� 0 
foundnames 
foundNames	 o  _`���� 0 	namecount 	nameCount	 R  dv��		
�� .ascrerr ****      � ****	 m  ru		 �	 	  � I n v a l i d   o p t i o n   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   n o n - e m p t y    s h o r t N a m e    a n d / o r    l o n g N a m e    p r o p e r t y ) .	 ��	!	"
�� 
errn	! m  hk�����Y	" ��	#��
�� 
erob	# o  no���� 0 	optionref 	optionRef��  ��  ��  ��  �m 0 	optionref 	optionRefC o    ���� &0 optiondefinitions optionDefinitionsA 	$��	$ L  ��	%	% o  ������ 20 optiondefinitionsbyname optionDefinitionsByName��  ) 	&	'	& l     ��������  ��  ��  	' 	(	)	( l     ��������  ��  ��  	) 	*	+	* i  z }	,	-	, I      ��	.���� 0 _parseoptions _parseOptions	. 	/	0	/ o      ���� 0 rawarguments rawArguments	0 	1	2	1 o      ���� &0 optiondefinitions optionDefinitions	2 	3��	3 o      ���� &0 hasdefaultoptions hasDefaultOptions��  ��  	- k    n	4	4 	5	6	5 l     ��	7	8��  	7oi given a list of raw arguments passed to script's run handler, extract those items that are command option names and (where relevant) their corresponding values, converting those values to the required type and returning an NSMutableDictionary of option name-value pairs plus a list of any remaining (i.e. non-option) arguments to be passed to _parseArguments()   	8 �	9	9�   g i v e n   a   l i s t   o f   r a w   a r g u m e n t s   p a s s e d   t o   s c r i p t ' s   r u n   h a n d l e r ,   e x t r a c t   t h o s e   i t e m s   t h a t   a r e   c o m m a n d   o p t i o n   n a m e s   a n d   ( w h e r e   r e l e v a n t )   t h e i r   c o r r e s p o n d i n g   v a l u e s ,   c o n v e r t i n g   t h o s e   v a l u e s   t o   t h e   r e q u i r e d   t y p e   a n d   r e t u r n i n g   a n   N S M u t a b l e D i c t i o n a r y   o f   o p t i o n   n a m e - v a l u e   p a i r s   p l u s   a   l i s t   o f   a n y   r e m a i n i n g   ( i . e .   n o n - o p t i o n )   a r g u m e n t s   t o   b e   p a s s e d   t o   _ p a r s e A r g u m e n t s ( )	6 	:	;	: l     ��	<	=��  	< 6 0 first build a lookup table of all known options   	= �	>	> `   f i r s t   b u i l d   a   l o o k u p   t a b l e   o f   a l l   k n o w n   o p t i o n s	; 	?	@	? r     	A	B	A I     ��	C���� (0 _buildoptionstable _buildOptionsTable	C 	D��	D o    ���� &0 optiondefinitions optionDefinitions��  ��  	B o      ���� 20 optiondefinitionsbyname optionDefinitionsByName	@ 	E	F	E r   	 	G	H	G n  	 	I	J	I I    �������� 0 
dictionary  ��  ��  	J n  	 	K	L	K o   
 ���� *0 nsmutabledictionary NSMutableDictionary	L m   	 
��
�� misccura	H o      ���� (0 asocparametersdict asocParametersDict	F 	M	N	M l   	O	P	Q	O r    	R	S	R m    	T	T �	U	U  =	S n     	V	W	V 1    ��
�� 
txdl	W 1    ��
�� 
ascr	P P J note: a long option can use a space or '=' to separate its name and value   	Q �	X	X �   n o t e :   a   l o n g   o p t i o n   c a n   u s e   a   s p a c e   o r   ' = '   t o   s e p a r a t e   i t s   n a m e   a n d   v a l u e	N 	Y	Z	Y l   ��	[	\��  	[ R L consume raw arguments list until it is empty or a non-option is encountered   	\ �	]	] �   c o n s u m e   r a w   a r g u m e n t s   l i s t   u n t i l   i t   i s   e m p t y   o r   a   n o n - o p t i o n   i s   e n c o u n t e r e d	Z 	^	_	^ W   h	`	a	` k   "c	b	b 	c	d	c r   " (	e	f	e n   " &	g	h	g 4  # &��	i
�� 
cobj	i m   $ %���� 	h o   " #���� 0 rawarguments rawArguments	f o      ���� 0 thearg theArg	d 	j	k	j Z   ) 	l	m	n	o	l C   ) ,	p	q	p o   ) *���� 0 thearg theArg	q m   * +	r	r �	s	s  - -	m l  / m	t	u	v	t k   / m	w	w 	x	y	x Z   / @	z	{����	z =  / 2	|	}	| o   / 0���� 0 thearg theArg	} m   0 1	~	~ �		  - -	{ l  5 <	�	�	�	� k   5 <	�	� 	�	�	� r   5 :	�	�	� n   5 8	�	�	� 1   6 8��
�� 
rest	� o   5 6���� 0 rawarguments rawArguments	� o      ���� 0 rawarguments rawArguments	� 	���	�  S   ; <��  	� i c double-hypens terminates the option list, so anything left in rawArguments is positional arguments   	� �	�	� �   d o u b l e - h y p e n s   t e r m i n a t e s   t h e   o p t i o n   l i s t ,   s o   a n y t h i n g   l e f t   i n   r a w A r g u m e n t s   i s   p o s i t i o n a l   a r g u m e n t s��  ��  	y 	�	�	� l  A G	�	�	�	� r   A G	�	�	� n   A E	�	�	� 4  B E��	�
�� 
citm	� m   C D���� 	� o   A B���� 0 thearg theArg	� o      ���� 0 
optionname 
optionName	�   get "--NAME"   	� �	�	�    g e t   " - - N A M E "	� 	���	� Z   H m	�	���	�	� ?   H Q	�	�	� l  H O	�����	� I  H O��	�	�
�� .corecnte****       ****	� o   H I���� 0 thearg theArg	� ��	���
�� 
kocl	� m   J K��
�� 
citm��  ��  ��  	� m   O P���� 	� l  T e	�	�	�	� r   T e	�	�	� n   T `	�	�	� 7  U `��	�	�
�� 
ctxt	� l  Y \	�����	� 4   Y \��	�
�� 
citm	� m   Z [���� ��  ��  	� m   ] _������	� o   T U���� 0 thearg theArg	� n      	�	�	� 4  a d��	�
�� 
cobj	� m   b c���� 	� o   ` a���� 0 rawarguments rawArguments	� * $ put "VALUE" back on stack for later   	� �	�	� H   p u t   " V A L U E "   b a c k   o n   s t a c k   f o r   l a t e r��  	� l  h m	�	�	�	� r   h m	�	�	� n   h k	�	�	� 1   i k��
�� 
rest	� o   h i���� 0 rawarguments rawArguments	� o      ���� 0 rawarguments rawArguments	� ( " remove the option name from stack   	� �	�	� D   r e m o v e   t h e   o p t i o n   n a m e   f r o m   s t a c k��  	u < 6 found "--[NAME[=VALUE]]" (NAME is a long option name)   	v �	�	� l   f o u n d   " - - [ N A M E [ = V A L U E ] ] "   ( N A M E   i s   a   l o n g   o p t i o n   n a m e )	n 	�	�	� C   p s	�	�	� o   p q���� 0 thearg theArg	� m   q r	�	� �	�	�  -	� 	���	� l  v �	�	�	�	� k   v �	�	� 	�	�	� l  v �	�	�	�	� Z  v �	�	�����	� G   v �	�	�	� =  v {	�	�	� o   v w���� 0 thearg theArg	� m   w z	�	� �	�	�  -	� E  ~ �	�	�	� m   ~ �	�	� �	�	�  0 1 2 3 4 5 6 7 8 9 0	� n  � �	�	�	� 4   � ���	�
�� 
cha 	� m   � ����� 	� o   � ����� 0 thearg theArg	�  S   � ���  ��  	� � { it's a lone hyphen or a negative number (i.e. not an option), so treat it and rest of rawArguments as positional arguments   	� �	�	� �   i t ' s   a   l o n e   h y p h e n   o r   a   n e g a t i v e   n u m b e r   ( i . e .   n o t   a n   o p t i o n ) ,   s o   t r e a t   i t   a n d   r e s t   o f   r a w A r g u m e n t s   a s   p o s i t i o n a l   a r g u m e n t s	� 	�	�	� l  � �	�	�	�	� r   � �	�	�	� n   � �	�	�	� 7  � ���	�	�
�� 
ctxt	� m   � ����� 	� m   � ����� 	� o   � ����� 0 thearg theArg	� o      ���� 0 
optionname 
optionName	�  	 get "-N"   	� �	�	�    g e t   " - N "	� 	���	� Z   � �	�	���	�	� ?   � �	�	�	� n  � �	�	�	� 1   � ���
�� 
leng	� o   � ����� 0 thearg theArg	� m   � ����� 	� l  � �	�	�	�	� k   � �	�	� 	�	�	� r   � �	�	�	� n   � �	�	�	� 7  � ���	�	�
�� 
ctxt	� m   � ����� 	� m   � �������	� o   � ����� 0 thearg theArg	� n      	�	�	� 4  � ���	�
�� 
cobj	� m   � ����� 	� o   � ����� 0 rawarguments rawArguments	� 	�	�	� r   � �	�	�	� n  � �
 

  I   � ���
���� 0 objectforkey_ objectForKey_
 
��
 o   � ����� 0 
optionname 
optionName��  ��  
 o   � ����� 20 optiondefinitionsbyname optionDefinitionsByName	� o      ���� $0 optiondefinition optionDefinition	� 
��
 Z   � �

����
 F   � �


 >  � �
	


	 o   � ��� $0 optiondefinition optionDefinition

 m   � ��~
�~ 
msng
 =  � �


 n  � �


 o   � ��}�} 0 	valuetype 	valueType
 l  � �
�|�{
 c   � �


 o   � ��z�z $0 optiondefinition optionDefinition
 m   � ��y
�y 
****�|  �{  
 m   � ��x
�x 
bool
 r   � �


 b   � �


 m   � �

 �

  -
 n   � �


 4  � ��w

�w 
cobj
 m   � ��v�v 
 o   � ��u�u 0 rawarguments rawArguments
 n      


 4  � ��t

�t 
cobj
 m   � ��s�s 
 o   � ��r�r 0 rawarguments rawArguments��  ��  ��  	� / ) put "[-N�]VALUE" back on stack for later   	� �

 R   p u t   " [ - N & ] V A L U E "   b a c k   o n   s t a c k   f o r   l a t e r��  	� l  � �

 
!
 r   � �
"
#
" n   � �
$
%
$ 1   � ��q
�q 
rest
% o   � ��p�p 0 rawarguments rawArguments
# o      �o�o 0 rawarguments rawArguments
  ' !remove the option name from stack   
! �
&
& B r e m o v e   t h e   o p t i o n   n a m e   f r o m   s t a c k��  	� H B found "-N[N�][VALUE]" (N is a single-character short option name)   	� �
'
' �   f o u n d   " - N [ N & ] [ V A L U E ] "   ( N   i s   a   s i n g l e - c h a r a c t e r   s h o r t   o p t i o n   n a m e )��  	o l  � 
(
)
*
(  S   � 
) S M not an option name, so anything left in rawArguments is positional arguments   
* �
+
+ �   n o t   a n   o p t i o n   n a m e ,   s o   a n y t h i n g   l e f t   i n   r a w A r g u m e n t s   i s   p o s i t i o n a l   a r g u m e n t s	k 
,
-
, l �n
.
/�n  
. - ' look up the option's definition record   
/ �
0
0 N   l o o k   u p   t h e   o p t i o n ' s   d e f i n i t i o n   r e c o r d
- 
1
2
1 r  	
3
4
3 n 
5
6
5 I  �m
7�l�m 0 objectforkey_ objectForKey_
7 
8�k
8 o  �j�j 0 
optionname 
optionName�k  �l  
6 o  �i�i 20 optiondefinitionsbyname optionDefinitionsByName
4 o      �h�h $0 optiondefinition optionDefinition
2 
9
:
9 Z  
�
;
<�g�f
; = 

=
>
= o  
�e�e $0 optiondefinition optionDefinition
> m  �d
�d 
msng
< l �
?
@
A
? k  �
B
B 
C
D
C Z  t
E
F�c�b
E o  �a�a &0 hasdefaultoptions hasDefaultOptions
F k  p
G
G 
H
I
H r  ?
J
K
J J  0
L
L 
M
N
M E "
O
P
O J  
Q
Q 
R
S
R m  
T
T �
U
U  - h
S 
V�`
V m  
W
W �
X
X  - - h e l p�`  
P J  !
Y
Y 
Z�_
Z o  �^�^ 0 
optionname 
optionName�_  
N 
[�]
[ E ".
\
]
\ J  "*
^
^ 
_
`
_ m  "%
a
a �
b
b  - v
` 
c�\
c m  %(
d
d �
e
e  - - v e r s i o n�\  
] J  *-
f
f 
g�[
g o  *+�Z�Z 0 
optionname 
optionName�[  �]  
K J      
h
h 
i
j
i o      �Y�Y 0 ishelp isHelp
j 
k�X
k o      �W�W 0 	isversion 	isVersion�X  
I 
l�V
l Z  @p
m
n�U�T
m G  @I
o
p
o o  @A�S�S 0 ishelp isHelp
p o  DE�R�R 0 	isversion 	isVersion
n l Ll
q
r
s
q k  Ll
t
t 
u
v
u n LQ
w
x
w I  MQ�Q�P�O�Q $0 removeallobjects removeAllObjects�P  �O  
x o  LM�N�N (0 asocparametersdict asocParametersDict
v 
y
z
y n R[
{
|
{ I  S[�M
}�L�M $0 setvalue_forkey_ setValue_forKey_
} 
~

~ o  ST�K�K 0 ishelp isHelp
 
��J
� m  TW
�
� �
�
�  h e l p�J  �L  
| o  RS�I�I (0 asocparametersdict asocParametersDict
z 
�
�
� n \e
�
�
� I  ]e�H
��G�H $0 setvalue_forkey_ setValue_forKey_
� 
�
�
� o  ]^�F�F 0 	isversion 	isVersion
� 
��E
� m  ^a
�
� �
�
�  v e r s i o n�E  �G  
� o  \]�D�D (0 asocparametersdict asocParametersDict
� 
�
�
� r  fj
�
�
� J  fh�C�C  
� o      �B�B 0 rawarguments rawArguments
� 
��A
�  S  kl�A  
r  � ignore everything else and return a minimal record containing only `help` and `version` properties, one or both of which are true, so must be dealt with accordingly by `run` handler (i.e. format+log help text and return and/or return version number)   
s �
�
��   i g n o r e   e v e r y t h i n g   e l s e   a n d   r e t u r n   a   m i n i m a l   r e c o r d   c o n t a i n i n g   o n l y   ` h e l p `   a n d   ` v e r s i o n `   p r o p e r t i e s ,   o n e   o r   b o t h   o f   w h i c h   a r e   t r u e ,   s o   m u s t   b e   d e a l t   w i t h   a c c o r d i n g l y   b y   ` r u n `   h a n d l e r   ( i . e .   f o r m a t + l o g   h e l p   t e x t   a n d   r e t u r n   a n d / o r   r e t u r n   v e r s i o n   n u m b e r )�U  �T  �V  �c  �b  
D 
��@
� R  u��?
�
�
�? .ascrerr ****      � ****
� b  �
�
�
� m  �
�
� �
�
�   U n k n o w n   o p t i o n :  
� o  ���>�> 0 
optionname 
optionName
� �=
��<
�= 
errn
� o  y~�;�;  0 _argvusererror _ArgvUserError�<  �@  
@ A ; check for default options (help/version), else raise error   
A �
�
� v   c h e c k   f o r   d e f a u l t   o p t i o n s   ( h e l p / v e r s i o n ) ,   e l s e   r a i s e   e r r o r�g  �f  
: 
�
�
� r  ��
�
�
� c  ��
�
�
� o  ���:�: $0 optiondefinition optionDefinition
� m  ���9
�9 
****
� o      �8�8 $0 optiondefinition optionDefinition
� 
�
�
� r  ��
�
�
� n ��
�
�
� o  ���7�7 0 propertyname propertyName
� o  ���6�6 $0 optiondefinition optionDefinition
� o      �5�5 0 propertyname propertyName
� 
�
�
� l ���4
�
��4  
� #  now process the option value   
� �
�
� :   n o w   p r o c e s s   t h e   o p t i o n   v a l u e
� 
�
�
� Z  �
�
��3
�
� = ��
�
�
� n ��
�
�
� o  ���2�2 0 	valuetype 	valueType
� o  ���1�1 $0 optiondefinition optionDefinition
� m  ���0
�0 
bool
� Q  ��
�
�
�
� r  ��
�
�
� H  ��
�
� n ��
�
�
� o  ���/�/ 0 defaultvalue defaultValue
� o  ���.�. $0 optiondefinition optionDefinition
� o      �-�- 0 thevalue theValue
� R      �,�+�*
�, .ascrerr ****      � ****�+  �*  
� R  ���)
�
�
�) .ascrerr ****      � ****
� b  ��
�
�
� m  ��
�
� �
�
� J B a d   d e f a u l t V a l u e   f o r   b o o l e a n   o p t i o n :  
� o  ���(�( 0 
optionname 
optionName
� �'
�
�
�' 
errn
� m  ���&�&�\
� �%
��$
�% 
erob
� l ��
��#�"
� N  ��
�
� n  ��
�
�
� o  ���!�! 0 defaultvalue defaultValue
� o  ��� �  $0 optiondefinition optionDefinition�#  �"  �$  �3  
� k  �
�
� 
�
�
� Z ��
�
���
� = ��
�
�
� o  ���� 0 rawarguments rawArguments
� J  ����  
� R  ���
�
�
� .ascrerr ****      � ****
� b  ��
�
�
� m  ��
�
� �
�
� 4 M i s s i n g   v a l u e   f o r   o p t i o n :  
� o  ���� 0 
optionname 
optionName
� �
��
� 
errn
� o  ����  0 _argvusererror _ArgvUserError�  �  �  
� 
�
�
� r  ��
�
�
� I  ���
��� 0 _unpackvalue _unpackValue
� 
�
�
� n  ��
�
�
� 4 ���
�
� 
cobj
� m  ���� 
� o  ���� 0 rawarguments rawArguments
� 
��
� o  ���� $0 optiondefinition optionDefinition�  �  
� o      �� 0 thevalue theValue
� 
��
� r  �
�
�
� n  �
�
�
� 1  ��
� 
rest
� o  ���� 0 rawarguments rawArguments
� o      �� 0 rawarguments rawArguments�  
� 
�
�
� Z  [
�
�
��

� n 

�
�
� o  	�	�	 0 islist isList
� o  �� $0 optiondefinition optionDefinition
� l 7
�
�
�
� k  7
�
� 
�
�
� r  
�
�
� n 
�
�
� I  �
��� 0 objectforkey_ objectForKey_
� 
��
� o  �� 0 propertyname propertyName�  �  
� o  �� (0 asocparametersdict asocParametersDict
� o      �� 0 thelist theList
� 
��
� Z  7
�
�� 
�
� =    o  ���� 0 thelist theList m  ��
�� 
msng
� r  * n ( I  #(������ $0 arraywithobject_ arrayWithObject_ �� o  #$���� 0 thevalue theValue��  ��   n #	 o  #����  0 nsmutablearray NSMutableArray	 m  ��
�� misccura o      ���� 0 thevalue theValue�   
� k  -7

  n -3 I  .3������ 0 
addobject_ 
addObject_ �� o  ./���� 0 thevalue theValue��  ��   o  -.���� 0 thelist theList �� r  47 o  45���� 0 thelist theList o      ���� 0 thevalue theValue��  �  
� = 7 option can appear multiple times, so collect in a list   
� � n   o p t i o n   c a n   a p p e a r   m u l t i p l e   t i m e s ,   s o   c o l l e c t   i n   a   l i s t
�  > :D l :@���� n :@ I  ;@������ 0 objectforkey_ objectForKey_ �� o  ;<���� 0 propertyname propertyName��  ��   o  :;���� (0 asocparametersdict asocParametersDict��  ��   m  @C��
�� 
msng �� R  GW�� 
�� .ascrerr ****      � **** b  QV!"! m  QT## �$$ $ D u p l i c a t e   o p t i o n :  " o  TU���� 0 
optionname 
optionName  ��%��
�� 
errn% o  KP����  0 _argvusererror _ArgvUserError��  ��  �
  
� &��& n \c'(' I  ]c��)���� &0 setobject_forkey_ setObject_forKey_) *+* o  ]^���� 0 thevalue theValue+ ,��, o  ^_���� 0 propertyname propertyName��  ��  ( o  \]���� (0 asocparametersdict asocParametersDict��  	a =   !-.- o    ���� 0 rawarguments rawArguments. J     ����  	_ /��/ L  in00 J  im11 232 o  ij���� (0 asocparametersdict asocParametersDict3 4��4 o  jk���� 0 rawarguments rawArguments��  ��  	+ 565 l     ��������  ��  ��  6 787 l     ��������  ��  ��  8 9:9 i  ~ �;<; I      ��=���� (0 _adddefaultoptions _addDefaultOptions= >?> o      ���� (0 asocparametersdict asocParametersDict? @��@ o      ���� &0 optiondefinitions optionDefinitions��  ��  < k     �AA BCB X     �D��ED k    �FF GHG r    "IJI b     KLK l   M����M c    NON o    ���� 0 recref recRefO m    ��
�� 
reco��  ��  L K    PP ��QR�� 0 propertyname propertyNameQ m    SS �TT  R ��UV�� 0 longname longNameU m    WW �XX  V ��Y���� 0 defaultvalue defaultValueY o    ���� 0 novalue NoValue��  J o      ���� 0 rec  H Z[Z r   # (\]\ n  # &^_^ o   $ &���� 0 propertyname propertyName_ o   # $���� 0 rec  ] o      ���� 0 propertyname propertyName[ `a` Z  ) 8bc����b =  ) ,ded o   ) *���� 0 propertyname propertyNamee m   * +ff �gg  c r   / 4hih n  / 2jkj o   0 2���� 0 longname longNamek o   / 0���� 0 rec  i o      ���� 0 propertyname propertyName��  ��  a l��l Z   9 �mn����m =  9 Aopo l  9 ?q����q n  9 ?rsr I   : ?��t���� 0 objectforkey_ objectForKey_t u��u o   : ;���� 0 propertyname propertyName��  ��  s o   9 :���� (0 asocparametersdict asocParametersDict��  ��  p m   ? @��
�� 
msngn k   D �vv wxw r   D Iyzy n  D G{|{ o   E G���� 0 defaultvalue defaultValue| o   D E���� 0 rec  z o      ���� 0 thevalue theValuex }~} Z   J ������ =  J Q��� o   J K���� 0 thevalue theValue� o   K P���� 0 novalue NoValue� l  T ����� k   T ��� ��� r   T [��� b   T Y��� m   T U�� ���  - -� n  U X��� o   V X���� 0 longname longName� o   U V���� 0 rec  � o      ���� 0 
optionname 
optionName� ��� Z  \ o������� =  \ _��� o   \ ]���� 0 
optionname 
optionName� m   ] ^�� ���  - -� r   b k��� b   b i��� m   b c�� ���  -� n  c h��� o   d h���� 0 	shortname 	shortName� o   c d���� 0 rec  � o      ���� 0 
optionname 
optionName��  ��  � ���� R   p �����
�� .ascrerr ****      � ****� b   z ��� m   z }�� ��� 2 M i s s i n g   r e q u i r e d   o p t i o n :  � o   } ~���� 0 
optionname 
optionName� �����
�� 
errn� o   t y����  0 _argvusererror _ArgvUserError��  ��  � 2 , record doesn't have a defaultValue property   � ��� X   r e c o r d   d o e s n ' t   h a v e   a   d e f a u l t V a l u e   p r o p e r t y��  ��  ~ ��� Z  � �������� =  � ���� o   � ����� 0 thevalue theValue� m   � ���
�� 
msng� r   � ���� n  � ���� I   � ��������� 0 null  ��  ��  � n  � ���� o   � ����� 0 nsnull NSNull� m   � ���
�� misccura� o      ���� 0 thevalue theValue��  ��  � ���� l  � ������� n  � ���� I   � �������� &0 setobject_forkey_ setObject_forKey_� ��� o   � ����� 0 thevalue theValue� ���� o   � ����� 0 propertyname propertyName��  ��  � o   � ����� (0 asocparametersdict asocParametersDict��  ��  ��  ��  ��  ��  �� 0 recref recRefE o    ���� &0 optiondefinitions optionDefinitionsC ��� l  � �����  � ` Z set default help, version properties if not already supplied by user of optionDefinitions   � ��� �   s e t   d e f a u l t   h e l p ,   v e r s i o n   p r o p e r t i e s   i f   n o t   a l r e a d y   s u p p l i e d   b y   u s e r   o f   o p t i o n D e f i n i t i o n s� ��~� X   � ���}�� Z  � ����|�{� =  � ���� l  � ���z�y� n  � ���� I   � ��x��w�x 0 objectforkey_ objectForKey_� ��v� o   � ��u�u 0 aref aRef�v  �w  � o   � ��t�t (0 asocparametersdict asocParametersDict�z  �y  � m   � ��s
�s 
msng� l  � ���r�q� n  � ���� I   � ��p��o�p &0 setobject_forkey_ setObject_forKey_� ��� m   � ��n
�n boovfals� ��m� o   � ��l�l 0 aref aRef�m  �o  � o   � ��k�k (0 asocparametersdict asocParametersDict�r  �q  �|  �{  �} 0 aref aRef� J   � ��� ��� m   � ��� ���  h e l p� ��j� m   � ��� ���  v e r s i o n�j  �~  : ��� l     �i�h�g�i  �h  �g  � ��� l     �f�e�d�f  �e  �d  � ��� i  � ���� I      �c��b�c "0 _parsearguments _parseArguments� ��� o      �a�a 0 argumentslist argumentsList� ��� o      �`�` *0 argumentdefinitions argumentDefinitions� ��_� o      �^�^ (0 asocparametersdict asocParametersDict�_  �b  � k    |�� ��� l     �]���]  � q k parse the remaining raw arguments, converting to the required type and adding to the parameters dictionary   � ��� �   p a r s e   t h e   r e m a i n i n g   r a w   a r g u m e n t s ,   c o n v e r t i n g   t o   t h e   r e q u i r e d   t y p e   a n d   a d d i n g   t o   t h e   p a r a m e t e r s   d i c t i o n a r y� ��� r     ��� m     �\�\  � o      �[�[ 0 i  � ��� r    	��� n   ��� 1    �Z
�Z 
leng� o    �Y�Y 0 argumentslist argumentsList� o      �X�X 0 argcount argCount� ��� l  
 �� � r   
  m   
 �W
�W boovfals o      �V�V  0 mustbeoptional mustBeOptional� � � repeat loop will throw invalid argument definition error if an optional argument definition is followed by a required argument definition     �   r e p e a t   l o o p   w i l l   t h r o w   i n v a l i d   a r g u m e n t   d e f i n i t i o n   e r r o r   i f   a n   o p t i o n a l   a r g u m e n t   d e f i n i t i o n   i s   f o l l o w e d   b y   a   r e q u i r e d   a r g u m e n t   d e f i n i t i o n�  X   V�U k   Q 	
	 r    # [    ! o    �T�T 0 i   m     �S�S  o      �R�R 0 i  
  r   $ : b   $ 8 l  $ )�Q�P c   $ ) n  $ ' 1   % '�O
�O 
pcnt o   $ %�N�N 0 argref argRef m   ' (�M
�M 
reco�Q  �P   K   ) 7 �L�L 0 propertyname propertyName m   * + �   �K �K 0 	valuetype 	valueType m   , -�J
�J 
ctxt  �I!"�I 0 islist isList! m   . /�H
�H boovfals" �G#�F�G 0 defaultvalue defaultValue# o   0 5�E�E 0 novalue NoValue�F   o      �D�D (0 argumentdefinition argumentDefinition $%$ Z   ; m&'(�C& >  ; B)*) o   ; <�B�B 0 defaultvalue defaultValue* o   < A�A�A 0 novalue NoValue' r   E H+,+ m   E F�@
�@ boovtrue, o      �?�?  0 mustbeoptional mustBeOptional( -.- F   K X/0/ o   K L�>�>  0 mustbeoptional mustBeOptional0 =  O V121 o   O P�=�= 0 defaultvalue defaultValue2 o   P U�<�< 0 novalue NoValue. 3�;3 R   [ i�:45
�: .ascrerr ****      � ****4 m   e h66 �77 � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( a   n o n - o p t i o n a l   a r g u m e n t   c a n n o t   f o l l o w   a n   o p t i o n a l   a r g u m e n t ) .5 �989
�9 
errn8 m   ] ^�8�8�Y9 �7:�6
�7 
erob: o   a b�5�5 0 argref argRef�6  �;  �C  % ;<; Z  n �=>�4�3= =  n u?@? n  n qABA o   o q�2�2 0 propertyname propertyNameB o   n o�1�1 (0 argumentdefinition argumentDefinition@ m   q tCC �DD  > R   x ��0EF
�0 .ascrerr ****      � ****E m   � �GG �HH � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   n o n - e m p t y   p r o p e r t y N a m e   p r o p e r t y ) .F �/IJ
�/ 
errnI m   z {�.�.�YJ �-K�,
�- 
erobK o   ~ �+�+ 0 argref argRef�,  �4  �3  < LML Z   � �NO�*PN =   � �QRQ o   � ��)�) 0 argumentslist argumentsListR J   � ��(�(  O k   � �SS TUT r   � �VWV n  � �XYX o   � ��'�' 0 defaultvalue defaultValueY o   � ��&�& (0 argumentdefinition argumentDefinitionW o      �%�% 0 thevalue theValueU Z�$Z Z   � �[\�#�"[ =  � �]^] o   � ��!�! 0 thevalue theValue^ o   � �� �  0 novalue NoValue\ l  � �_`a_ k   � �bb cdc r   � �efe n  � �ghg o   � ��� $0 valueplaceholder valuePlaceholderh o   � ��� (0 argumentdefinition argumentDefinitionf o      �� "0 placeholdertext placeholderTextd iji Z  � �kl��k =   � �mnm n  � �opo 1   � ��
� 
lengp o   � ��� "0 placeholdertext placeholderTextn m   � ���  l r   � �qrq I   � ��s�� 40 _defaultvalueplaceholder _defaultValuePlaceholders t�t n  � �uvu o   � ��� 0 	valuetype 	valueTypev o   � ��� (0 argumentdefinition argumentDefinition�  �  r o      �� "0 placeholdertext placeholderText�  �  j w�w R   � ��xy
� .ascrerr ****      � ****x b   � �z{z b   � �|}| b   � �~~ b   � ���� m   � ��� ��� 4 M i s s i n g   r e q u i r e d   a r g u m e n t  � o   � ��� 0 i   m   � ��� ���    ( e x p e c t e d  } o   � ��� "0 placeholdertext placeholderText{ m   � ��� ���  ) .y ���
� 
errn� o   � ���  0 _argvusererror _ArgvUserError�  �  ` W Q record doesn't have a defaultValue property, so user should've supplied argument   a ��� �   r e c o r d   d o e s n ' t   h a v e   a   d e f a u l t V a l u e   p r o p e r t y ,   s o   u s e r   s h o u l d ' v e   s u p p l i e d   a r g u m e n t�#  �"  �$  �*  P k   � ��� ��� r   � ���� I   � ��
��	�
 0 _unpackvalue _unpackValue� ��� n   � ���� 4  � ���
� 
cobj� m   � ��� � o   � ��� 0 argumentslist argumentsList� ��� o   � ��� (0 argumentdefinition argumentDefinition�  �	  � o      �� 0 thevalue theValue� ��� r   � ���� n   � ���� 1   � ��
� 
rest� o   � �� �  0 argumentslist argumentsList� o      ���� 0 argumentslist argumentsList�  M ��� Z   �G������� n  � ���� o   � ����� 0 islist isList� o   � ����� (0 argumentdefinition argumentDefinition� k   �C�� ��� Z  �������� A   ���� o   � ����� 0 i  � n   � ��� 1   � ��
�� 
leng� o   � ����� *0 argumentdefinitions argumentDefinitions� R  ����
�� .ascrerr ****      � ****� m  �� ��� � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( o n l y   t h e   l a s t   a r g u m e n t   d e f i n i t i o n   m a y   c o n t a i n   a n    i s L i s t : t r u e    p r o p e r t y ) .� ����
�� 
errn� m  �����Y� �����
�� 
erob� o  
���� 0 argref argRef��  ��  ��  � ��� r  ��� J  �� ���� o  ���� 0 thevalue theValue��  � o      ���� 0 thevalue theValue� ��� X  >����� r  -9��� I  -6������� 0 _unpackvalue _unpackValue� ��� n .1��� 1  /1��
�� 
pcnt� o  ./���� 0 aref aRef� ���� o  12���� (0 argumentdefinition argumentDefinition��  ��  � n      ���  ;  78� o  67���� 0 thevalue theValue�� 0 aref aRef� o   !���� 0 argumentslist argumentsList� ���� r  ?C��� J  ?A����  � o      ���� 0 argumentslist argumentsList��  ��  ��  � ���� l HQ������ n HQ��� I  IQ������� &0 setobject_forkey_ setObject_forKey_� ��� o  IJ���� 0 thevalue theValue� ���� l JM������ n JM��� o  KM���� 0 propertyname propertyName� o  JK���� (0 argumentdefinition argumentDefinition��  ��  ��  ��  � o  HI���� (0 asocparametersdict asocParametersDict��  ��  ��  �U 0 argref argRef o    ���� *0 argumentdefinitions argumentDefinitions ���� Z W|������� > W[��� o  WX���� 0 argumentslist argumentsList� J  XZ����  � R  ^x����
�� .ascrerr ****      � ****� b  fw��� b  fs��� b  fq��� b  fm��� m  fi�� ��� : T o o   m a n y   a r g u m e n t s   ( e x p e c t e d  � n  il��� 1  jl��
�� 
leng� o  ij���� *0 argumentdefinitions argumentDefinitions� m  mp�� ���    b u t   r e c e i v e d  � o  qr���� 0 argcount argCount� m  sv�� ���  ) .� �����
�� 
errn� o  `e����  0 _argvusererror _ArgvUserError��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ������  � ) # format built-in help documentation   � ��� F   f o r m a t   b u i l t - i n   h e l p   d o c u m e n t a t i o n� ��� l     ��������  ��  ��  � ��� i  � ���� I      �������  0 _formatoptions _formatOptions� ��� o      ���� &0 optiondefinitions optionDefinitions�    o      ���� 0 vtstyle vtStyle �� o      ���� &0 hasdefaultoptions hasDefaultOptions��  ��  � k    �  l     ����   ] W generates OPTIONS section, along with options synopsis for inclusion in autogenerated     � �   g e n e r a t e s   O P T I O N S   s e c t i o n ,   a l o n g   w i t h   o p t i o n s   s y n o p s i s   f o r   i n c l u s i o n   i n   a u t o g e n e r a t e d   	
	 r      J       m      �    m     �   �� m     �  ��   J        o      ����  0 defaultoptions defaultOptions  o      ����  0 booleanoptions booleanOptions �� o      ���� 0 otheroptions otherOptions��  
   r    '!"! b    %#$# b    !%&% n   '(' o    ���� 0 b  ( o    ���� 0 vtstyle vtStyle& m     )) �**  O P T I O N S$ n  ! $+,+ o   " $���� 0 n  , o   ! "���� 0 vtstyle vtStyle" o      ����  0 optionssection optionsSection  -.- X   (/��0/ k   811 232 r   8 `454 b   8 ^676 l  8 ;8����8 c   8 ;9:9 o   8 9���� 0 	optionref 	optionRef: m   9 :��
�� 
reco��  ��  7 K   ; ];; ��<=�� 0 	shortname 	shortName< m   < =>> �??  = ��@A�� 0 longname longName@ m   > ?BB �CC  A ��DE�� 0 	valuetype 	valueTypeD m   @ A��
�� 
ctxtE ��FG�� 0 islist isListF m   D E��
�� boovfalsG ��HI�� 0 defaultvalue defaultValueH o   H M���� 0 novalue NoValueI ��JK�� $0 valueplaceholder valuePlaceholderJ m   P SLL �MM  K ��N���� $0 valuedescription valueDescriptionN m   V YOO �PP  ��  5 o      ���� $0 optiondefinition optionDefinition3 QRQ Q   a �STUS k   d �VV WXW r   d kYZY c   d i[\[ n  d g]^] o   e g���� 0 	shortname 	shortName^ o   d e���� $0 optiondefinition optionDefinition\ m   g h��
�� 
ctxtZ o      ���� 0 	shortname 	shortNameX _`_ r   l saba c   l qcdc n  l oefe o   m o���� 0 longname longNamef o   l m���� $0 optiondefinition optionDefinitiond m   o p��
�� 
ctxtb o      ���� 0 longname longName` ghg r   t }iji c   t {klk n  t wmnm o   u w���� 0 	valuetype 	valueTypen o   t u���� $0 optiondefinition optionDefinitionl m   w z��
�� 
typej o      ���� 0 	valuetype 	valueTypeh opo r   ~ �qrq c   ~ �sts n  ~ �uvu o    ����� 0 islist isListv o   ~ ���� $0 optiondefinition optionDefinitiont m   � ���
�� 
boolr o      ���� 0 islist isListp wxw r   � �yzy c   � �{|{ n  � �}~} o   � ����� $0 valueplaceholder valuePlaceholder~ o   � ����� $0 optiondefinition optionDefinition| m   � ���
�� 
ctxtz o      ���� $0 valueplaceholder valuePlaceholderx �� r   � ���� c   � ���� n  � ���� o   � ����� $0 valuedescription valueDescription� o   � ����� $0 optiondefinition optionDefinition� m   � ���
�� 
ctxt� o      ���� $0 valuedescription valueDescription��  T R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  U n  � ���� I   � ����~� 60 throwinvalidparametertype throwInvalidParameterType� ��� o   � ��}�} &0 optiondefinitions optionDefinitions� ��� m   � ��� ���  o p t i o n s� ��� m   � ��� ��� ` l i s t   o f    c o m m a n d   l i n e   o p t i o n   d e f i n i t i o n    r e c o r d s� ��|� m   � ��{
�{ 
reco�|  �~  � o   � ��z�z 0 _support  R ��� r   � ���� b   � ���� b   � ���� o   � ��y�y  0 optionssection optionsSection� o   � ��x�x 
0 lf2 LF2� o   � ��w�w 0 indent1 Indent1� o      �v�v  0 optionssection optionsSection� ��� Z   �#���u�� =  � ���� o   � ��t�t 0 	shortname 	shortName� m   � ��� ���  � k   � ��� ��� Z  � ����s�r� =  � ���� o   � ��q�q 0 longname longName� m   � ��� ���  � R   � ��p��
�p .ascrerr ****      � ****� m   � ��� ��� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a    s h o r t N a m e    a n d / o r    l o n g N a m e    p r o p e r t y ) .� �o��
�o 
errn� m   � ��n�n�Y� �m��l
�m 
erob� o   � ��k�k 0 	optionref 	optionRef�l  �s  �r  � ��� r   � ���� o   � ��j�j 0 longname longName� o      �i�i 0 
optionname 
optionName� ��h� r   � ���� b   � ���� b   � ���� o   � ��g�g  0 optionssection optionsSection� m   � ��� ���  - -� o   � ��f�f 0 longname longName� o      �e�e  0 optionssection optionsSection�h  �u  � k   #�� ��� r   ��� o   �d�d 0 	shortname 	shortName� o      �c�c 0 
optionname 
optionName� ��� r  ��� b  ��� b  	��� o  �b�b  0 optionssection optionsSection� m  �� ���  -� o  	
�a�a 0 	shortname 	shortName� o      �`�`  0 optionssection optionsSection� ��_� Z #���^�]� > ��� o  �\�\ 0 longname longName� m  �� ���  � r  ��� b  ��� b  ��� o  �[�[  0 optionssection optionsSection� m  �� ���  ,   - -� o  �Z�Z 0 longname longName� o      �Y�Y  0 optionssection optionsSection�^  �]  �_  � ��� Z  $����X�� = $)��� o  $%�W�W 0 	valuetype 	valueType� m  %(�V
�V 
bool� l ,1���� r  ,1��� b  ,/��� o  ,-�U�U  0 booleanoptions booleanOptions� o  -.�T�T 0 
optionname 
optionName� o      �S�S  0 booleanoptions booleanOptions� ) # group all boolean flags as "[-N�]"   � ��� F   g r o u p   a l l   b o o l e a n   f l a g s   a s   " [ - N & ] "�X  � k  4��� ��� r  4C��� > 4?��� n 49��� o  59�R�R 0 defaultvalue defaultValue� o  45�Q�Q $0 optiondefinition optionDefinition� o  9>�P�P 0 novalue NoValue� o      �O�O 0 
isoptional 
isOptional� ��� r  DK��� b  DI� � o  DE�N�N 0 otheroptions otherOptions  1  EH�M
�M 
spac� o      �L�L 0 otheroptions otherOptions�  Z L]�K�J o  LO�I�I 0 
isoptional 
isOptional r  RY b  RW o  RS�H�H 0 otheroptions otherOptions m  SV		 �

  [ o      �G�G 0 otheroptions otherOptions�K  �J    r  ^g b  ^e b  ^c o  ^_�F�F 0 otheroptions otherOptions m  _b �  - o  cd�E�E 0 
optionname 
optionName o      �D�D 0 otheroptions otherOptions  r  hk o  hi�C�C $0 valueplaceholder valuePlaceholder o      �B�B $0 valueplaceholder valuePlaceholder  Z l��A�@ = lq o  lm�?�? $0 valueplaceholder valuePlaceholder m  mp �     r  t|!"! I  tz�>#�=�> 40 _defaultvalueplaceholder _defaultValuePlaceholder# $�<$ o  uv�;�; $0 optiondefinition optionDefinition�<  �=  " o      �:�: $0 valueplaceholder valuePlaceholder�A  �@   %&% r  ��'(' b  ��)*) b  ��+,+ n ��-.- o  ���9�9 0 u  . o  ���8�8 0 vtstyle vtStyle, o  ���7�7 $0 valueplaceholder valuePlaceholder* n ��/0/ o  ���6�6 0 n  0 o  ���5�5 0 vtstyle vtStyle( o      �4�4 $0 valueplaceholder valuePlaceholder& 121 r  ��343 b  ��565 b  ��787 o  ���3�3 0 otheroptions otherOptions8 1  ���2
�2 
spac6 o  ���1�1 $0 valueplaceholder valuePlaceholder4 o      �0�0 0 otheroptions otherOptions2 9:9 Z ��;<�/�.; o  ���-�- 0 
isoptional 
isOptional< r  ��=>= b  ��?@? o  ���,�, 0 otheroptions otherOptions@ m  ��AA �BB  ]> o      �+�+ 0 otheroptions otherOptions�/  �.  : CDC r  ��EFE b  ��GHG b  ��IJI o  ���*�*  0 optionssection optionsSectionJ 1  ���)
�) 
spacH o  ���(�( $0 valueplaceholder valuePlaceholderF o      �'�'  0 optionssection optionsSectionD KLK Z ��MN�&�%M > ��OPO n ��QRQ o  ���$�$ 0 defaultvalue defaultValueR o  ���#�# $0 optiondefinition optionDefinitionP o  ���"�" 0 novalue NoValueN r  ��STS b  ��UVU o  ���!�! $0 valuedescription valueDescriptionV I  ��� W��  *0 _formatdefaultvalue _formatDefaultValueW X�X o  ���� $0 optiondefinition optionDefinition�  �  T o      �� $0 valuedescription valueDescription�&  �%  L Y�Y Z ��Z[��Z o  ���� 0 islist isList[ r  ��\]\ b  ��^_^ o  ���� $0 valuedescription valueDescription_ m  ��`` �aa N T h i s   o p t i o n   c a n   b e   u s e d   m u l t i p l e   t i m e s .] o      �� $0 valuedescription valueDescription�  �  �  � b�b Z �cd��c > ��efe o  ���� $0 valuedescription valueDescriptionf m  ��gg �hh  d r  ��iji b  ��klk b  ��mnm b  ��opo b  ��qrq o  ����  0 optionssection optionsSectionr 1  ���
� 
lnfdp o  ���� 0 indent2 Indent2n o  ���� $0 valuedescription valueDescriptionl 1  ���
� 
spacj o      ��  0 optionssection optionsSection�  �  �  �� 0 	optionref 	optionRef0 o   + ,�� &0 optiondefinitions optionDefinitions. sts l �
uv�
  u � document default -h and -v options as needed (these will appear at bottom of OPTIONS section, which isn't aesthetically ideal but is simplest to implement and avoids messing with the order of the option definitions specified by the shell script's author)   v �ww�   d o c u m e n t   d e f a u l t   - h   a n d   - v   o p t i o n s   a s   n e e d e d   ( t h e s e   w i l l   a p p e a r   a t   b o t t o m   o f   O P T I O N S   s e c t i o n ,   w h i c h   i s n ' t   a e s t h e t i c a l l y   i d e a l   b u t   i s   s i m p l e s t   t o   i m p l e m e n t   a n d   a v o i d s   m e s s i n g   w i t h   t h e   o r d e r   o f   t h e   o p t i o n   d e f i n i t i o n s   s p e c i f i e d   b y   t h e   s h e l l   s c r i p t ' s   a u t h o r )t xyx Z  |z{�	�z o  �� &0 hasdefaultoptions hasDefaultOptions{ k  x|| }~} Z  A��� H  �� E  ��� o  ��  0 booleanoptions booleanOptions� m  �� ���  h� k  =�� ��� r  ��� b  ��� m  �� ���  h� o  ��  0 defaultoptions defaultOptions� o      ��  0 defaultoptions defaultOptions� ��� r  =��� b  ;��� b  7��� b  1��� b  -��� b  )��� b  #��� o  � �   0 optionssection optionsSection� o  "���� 
0 lf2 LF2� o  #(���� 0 indent1 Indent1� m  ),�� ���  - h ,   - - h e l p� 1  -0��
�� 
lnfd� o  16���� 0 indent2 Indent2� m  7:�� ��� 2 P r i n t   t h i s   h e l p   a n d   e x i t .� o      ����  0 optionssection optionsSection�  �  �  ~ ���� Z  Bx������� H  BH�� E  BG��� o  BC����  0 booleanoptions booleanOptions� m  CF�� ���  v� k  Kt�� ��� r  KR��� b  KP��� o  KL����  0 defaultoptions defaultOptions� m  LO�� ���  v� o      ����  0 defaultoptions defaultOptions� ���� r  St��� b  Sr��� b  Sn��� b  Sh��� b  Sd��� b  S`��� b  SZ��� o  ST����  0 optionssection optionsSection� o  TY���� 
0 lf2 LF2� o  Z_���� 0 indent1 Indent1� m  `c�� ���  - v ,   - - v e r s i o n� 1  dg��
�� 
lnfd� o  hm���� 0 indent2 Indent2� m  nq�� ��� < P r i n t   v e r s i o n   n u m b e r   a n d   e x i t .� o      ����  0 optionssection optionsSection��  ��  ��  ��  �	  �  y ��� r  }���� m  }��� ���  � o      ���� "0 optionssynopsis optionsSynopsis� ��� Z ��������� > ����� o  ������  0 defaultoptions defaultOptions� m  ���� ���  � r  ����� b  ����� b  ����� b  ����� o  ������ "0 optionssynopsis optionsSynopsis� m  ���� ���    [ -� o  ������  0 defaultoptions defaultOptions� m  ���� ���  ]� o      ���� "0 optionssynopsis optionsSynopsis��  ��  � ��� Z ��������� > ����� o  ������  0 booleanoptions booleanOptions� m  ���� ���  � r  ����� b  ����� b  ����� b  ����� o  ������ "0 optionssynopsis optionsSynopsis� m  ���� ���    [ -� o  ������  0 booleanoptions booleanOptions� m  ���� ���  ]� o      ���� "0 optionssynopsis optionsSynopsis��  ��  � ��� Z ��������� > ����� o  ������ 0 otheroptions otherOptions� m  ���� ���  � r  ����� b  ����� o  ������ "0 optionssynopsis optionsSynopsis� o  ������ 0 otheroptions otherOptions� o      ���� "0 optionssynopsis optionsSynopsis��  ��  �  ��  L  �� J  ��  o  ������ "0 optionssynopsis optionsSynopsis �� o  ������  0 optionssection optionsSection��  ��  �  l     ��������  ��  ��   	 l     ��������  ��  ��  	 

 i  � � I      ������ $0 _formatarguments _formatArguments  o      ���� *0 argumentdefinitions argumentDefinitions �� o      ���� 0 vtstyle vtStyle��  ��   k    >  Z    ���� =     o     ���� *0 argumentdefinitions argumentDefinitions J    ����   L     J      m     �   �� m    	   �!!  ��  ��  ��   "#" r    $%$ m    && �''  % o      ���� &0 argumentssynopsis argumentsSynopsis# ()( r     *+* b    ,-, b    ./. n   010 o    ���� 0 b  1 o    ���� 0 vtstyle vtStyle/ m    22 �33  A R G U M E N T S- n   454 o    ���� 0 n  5 o    ���� 0 vtstyle vtStyle+ o      ���� $0 argumentssection argumentsSection) 676 X   !48��98 k   1/:: ;<; r   1 M=>= b   1 K?@? l  1 4A����A c   1 4BCB o   1 2���� 0 argumentref argumentRefC m   2 3��
�� 
reco��  ��  @ K   4 JDD ��EF�� 0 	valuetype 	valueTypeE m   5 6��
�� 
ctxtF ��GH�� 0 islist isListG m   7 8��
�� boovfalsH ��IJ�� 0 defaultvalue defaultValueI o   9 >���� 0 novalue NoValueJ ��KL�� $0 valueplaceholder valuePlaceholderK m   ? @MM �NN  L ��O���� $0 valuedescription valueDescriptionO m   C FPP �QQ  ��  > o      ���� (0 argumentdefinition argumentDefinition< RSR Q   N �TUVT k   Q vWW XYX r   Q ZZ[Z c   Q X\]\ n  Q T^_^ o   R T���� 0 	valuetype 	valueType_ o   Q R���� (0 argumentdefinition argumentDefinition] m   T W��
�� 
type[ o      ���� 0 	valuetype 	valueTypeY `a` r   [ dbcb c   [ bded n  [ ^fgf o   \ ^���� 0 islist isListg o   [ \���� (0 argumentdefinition argumentDefinitione m   ^ a��
�� 
boolc o      ���� 0 islist isLista hih r   e ljkj c   e jlml n  e hnon o   f h���� $0 valueplaceholder valuePlaceholdero o   e f���� (0 argumentdefinition argumentDefinitionm m   h i��
�� 
ctxtk o      ���� $0 valueplaceholder valuePlaceholderi p��p r   m vqrq c   m tsts n  m ruvu o   n r���� $0 valuedescription valueDescriptionv o   m n���� (0 argumentdefinition argumentDefinitiont m   r s��
�� 
ctxtr o      ���� $0 valuedescription valueDescription��  U R      ����w
�� .ascrerr ****      � ****��  w ��x��
�� 
errnx d      yy m      �������  V n  ~ �z{z I   � ���|���� 60 throwinvalidparametertype throwInvalidParameterType| }~} o   � ����� *0 argumentdefinitions argumentDefinitions~ � m   � ��� ���  a r g u m e n t s� ��� m   � ��� ��� d l i s t   o f    c o m m a n d   l i n e   a r g u m e n t   d e f i n i t i o n    r e c o r d s� ���� m   � ���
�� 
reco��  ��  { o   ~ ����� 0 _support  S ��� Z  � �������� =  � ���� o   � ����� $0 valueplaceholder valuePlaceholder� m   � ��� ���  � r   � ���� I   � �������� 40 _defaultvalueplaceholder _defaultValuePlaceholder� ���� o   � ����� (0 argumentdefinition argumentDefinition��  ��  � o      ���� $0 valueplaceholder valuePlaceholder��  ��  � ��� Z  � �������� o   � ����� 0 islist isList� r   � ���� b   � ���� o   � ����� $0 valueplaceholder valuePlaceholder� m   � ��� ���    . . .� o      ���� $0 valueplaceholder valuePlaceholder��  ��  � ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� o   � ����� $0 argumentssection argumentsSection� o   � ����� 
0 lf2 LF2� o   � ����� 0 indent1 Indent1� n  � ���� o   � ����� 0 u  � o   � ����� 0 vtstyle vtStyle� o   � ����� $0 valueplaceholder valuePlaceholder� n  � ���� o   � ����� 0 n  � o   � ����� 0 vtstyle vtStyle� o      ���� $0 argumentssection argumentsSection� ��� Z  � �����~� >  � ���� n  � ���� o   � ��}�} 0 defaultvalue defaultValue� o   � ��|�| (0 argumentdefinition argumentDefinition� o   � ��{�{ 0 novalue NoValue� r   � ���� b   � ���� o   � ��z�z $0 valuedescription valueDescription� I   � ��y��x�y *0 _formatdefaultvalue _formatDefaultValue� ��w� o   � ��v�v (0 argumentdefinition argumentDefinition�w  �x  � o      �u�u $0 valuedescription valueDescription�  �~  � ��� Z  �	���t�s� >  � ���� o   � ��r�r $0 valuedescription valueDescription� m   � ��� ���  � r   ���� b   ���� b   ���� b   � ���� o   � ��q�q $0 argumentssection argumentsSection� 1   � ��p
�p 
lnfd� o   � �o�o 0 indent2 Indent2� o  �n�n $0 valuedescription valueDescription� o      �m�m $0 argumentssection argumentsSection�t  �s  � ��� Z 
%���l�k� > 
��� n 
��� o  �j�j 0 defaultvalue defaultValue� o  
�i�i (0 argumentdefinition argumentDefinition� o  �h�h 0 novalue NoValue� r  !��� b  ��� b  ��� m  �� ���  [� o  �g�g $0 valueplaceholder valuePlaceholder� m  �� ���  ]� o      �f�f $0 valueplaceholder valuePlaceholder�l  �k  � ��e� r  &/��� b  &-��� b  &+��� o  &'�d�d &0 argumentssynopsis argumentsSynopsis� 1  '*�c
�c 
spac� o  +,�b�b $0 valueplaceholder valuePlaceholder� o      �a�a &0 argumentssynopsis argumentsSynopsis�e  �� 0 argumentref argumentRef9 o   $ %�`�` *0 argumentdefinitions argumentDefinitions7 ��_� L  5>�� J  5=�� ��� b  5:��� m  58�� ��� 
   [ - - ]� o  89�^�^ &0 argumentssynopsis argumentsSynopsis� ��]� o  :;�\�\ $0 argumentssection argumentsSection�]  �_   ��� l     �[�Z�Y�[  �Z  �Y  � ��� l     �X���X  �  -----   � ��� 
 - - - - -� ��� l     �W�V�U�W  �V  �U  � ��� i  � ���� I     �T��
�T .Fil:Argvnull���     ****� l 
     �S�R  o      �Q�Q 0 argv  �S  �R  � �P
�P 
OpsD |�O�N�M�O  �N   o      �L�L &0 optiondefinitions optionDefinitions�M   l 
    �K�J J      �I�I  �K  �J   �H
�H 
OpsA |�G�F�E	�G  �F   o      �D�D *0 argumentdefinitions argumentDefinitions�E  	 l 
    
�C�B
 J       �A K       �@�@ 0 propertyname propertyName m       �  a r g u m e n t s L i s t �?�>�? 0 islist isList m      �=
�= boovtrue�>  �A  �C  �B   �<�;
�< 
DefO |�:�9�8�:  �9   o      �7�7 &0 hasdefaultoptions hasDefaultOptions�8   l     �6�5 m      �4
�4 boovtrue�6  �5  �;  � k     �  l     �3�3  �� note: while NSUserDefaults provides some argument parsing support (see its NSArgumentDomain), it uses an atypical syntax and reads directly from argv, making it difficult both to omit arguments provided to osascript itself and to extract any arguments remaining after options are parsed; thus, this handler implements its own argv parser that avoids NSUserDefaults' deficiencies while also providing a better optparse-style UI/UX to both shell script authors and users    ��   n o t e :   w h i l e   N S U s e r D e f a u l t s   p r o v i d e s   s o m e   a r g u m e n t   p a r s i n g   s u p p o r t   ( s e e   i t s   N S A r g u m e n t D o m a i n ) ,   i t   u s e s   a n   a t y p i c a l   s y n t a x   a n d   r e a d s   d i r e c t l y   f r o m   a r g v ,   m a k i n g   i t   d i f f i c u l t   b o t h   t o   o m i t   a r g u m e n t s   p r o v i d e d   t o   o s a s c r i p t   i t s e l f   a n d   t o   e x t r a c t   a n y   a r g u m e n t s   r e m a i n i n g   a f t e r   o p t i o n s   a r e   p a r s e d ;   t h u s ,   t h i s   h a n d l e r   i m p l e m e n t s   i t s   o w n   a r g v   p a r s e r   t h a t   a v o i d s   N S U s e r D e f a u l t s '   d e f i c i e n c i e s   w h i l e   a l s o   p r o v i d i n g   a   b e t t e r   o p t p a r s e - s t y l e   U I / U X   t o   b o t h   s h e l l   s c r i p t   a u t h o r s   a n d   u s e r s �2 P     �  k    �!! "#" r    
$%$ n   &'& 1    �1
�1 
txdl' 1    �0
�0 
ascr% o      �/�/ 0 oldtids oldTIDs# (�.( Q    �)*+) k    j,, -.- l   �-/0�-  / ) # first, ensure parameters are lists   0 �11 F   f i r s t ,   e n s u r e   p a r a m e t e r s   a r e   l i s t s. 232 r    454 n   676 I    �,8�+�, "0 aslistparameter asListParameter8 9�*9 o    �)�) 0 argv  �*  �+  7 o    �(�( 0 _support  5 o      �'�' 0 argv  3 :;: r    '<=< n   %>?> I     %�&@�%�& "0 aslistparameter asListParameter@ A�$A o     !�#�# &0 optiondefinitions optionDefinitions�$  �%  ? o     �"�" 0 _support  = o      �!�! &0 optiondefinitions optionDefinitions; BCB r   ( 4DED n  ( 2FGF I   - 2� H��  "0 aslistparameter asListParameterH I�I o   - .�� *0 argumentdefinitions argumentDefinitions�  �  G o   ( -�� 0 _support  E o      �� *0 argumentdefinitions argumentDefinitionsC JKJ l  5 5�LM�  L � � next iterate over the raw argument list, identifying option names and (if non-boolean) values, returning a NSMutableDictionary of parsed option values plus a list of any remaining (i.e. non-option) arguments   M �NN�   n e x t   i t e r a t e   o v e r   t h e   r a w   a r g u m e n t   l i s t ,   i d e n t i f y i n g   o p t i o n   n a m e s   a n d   ( i f   n o n - b o o l e a n )   v a l u e s ,   r e t u r n i n g   a   N S M u t a b l e D i c t i o n a r y   o f   p a r s e d   o p t i o n   v a l u e s   p l u s   a   l i s t   o f   a n y   r e m a i n i n g   ( i . e .   n o n - o p t i o n )   a r g u m e n t sK OPO r   5 NQRQ I      �S�� 0 _parseoptions _parseOptionsS TUT n   6 9VWV 2  7 9�
� 
cobjW o   6 7�� 0 argv  U XYX o   9 :�� &0 optiondefinitions optionDefinitionsY Z�Z o   : ;�� &0 hasdefaultoptions hasDefaultOptions�  �  R J      [[ \]\ o      �� (0 asocparametersdict asocParametersDict] ^�^ o      �� 0 argumentslist argumentsList�  P _`_ l  O O�ab�  a v p add default values for any missing options to asocParametersDict, raising error if a required option is missing   b �cc �   a d d   d e f a u l t   v a l u e s   f o r   a n y   m i s s i n g   o p t i o n s   t o   a s o c P a r a m e t e r s D i c t ,   r a i s i n g   e r r o r   i f   a   r e q u i r e d   o p t i o n   i s   m i s s i n g` ded I   O V�f�� (0 _adddefaultoptions _addDefaultOptionsf ghg o   P Q�� (0 asocparametersdict asocParametersDicth i�i o   Q R�
�
 &0 optiondefinitions optionDefinitions�  �  e jkj l  W W�	lm�	  l b \ parse the remaining arguments as named positional parameters, adding them to the dictionary   m �nn �   p a r s e   t h e   r e m a i n i n g   a r g u m e n t s   a s   n a m e d   p o s i t i o n a l   p a r a m e t e r s ,   a d d i n g   t h e m   t o   t h e   d i c t i o n a r yk opo I   W _�q�� "0 _parsearguments _parseArgumentsq rsr o   X Y�� 0 argumentslist argumentsLists tut o   Y Z�� *0 argumentdefinitions argumentDefinitionsu v�v o   Z [�� (0 asocparametersdict asocParametersDict�  �  p wxw r   ` eyzy o   ` a�� 0 oldtids oldTIDsz n     {|{ 1   b d�
� 
txdl| 1   a b� 
�  
ascrx }��} l  f j~�~ L   f j�� c   f i��� o   f g���� (0 asocparametersdict asocParametersDict� m   g h��
�� 
**** : 4 coerce the dictionary to an AS record and return it   � ��� h   c o e r c e   t h e   d i c t i o n a r y   t o   a n   A S   r e c o r d   a n d   r e t u r n   i t��  * R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  + k   r ��� ��� r   r w��� o   r s���� 0 oldtids oldTIDs� n     ��� 1   t v��
�� 
txdl� 1   s t��
�� 
ascr� ���� Z   x ������� =   x ��� o   x y���� 0 enumber eNumber� o   y ~����  0 _argvusererror _ArgvUserError� l  � ����� R   � �����
�� .ascrerr ****      � ****� o   � ����� 0 etext eText� ����
�� 
errn� o   � ����� 0 enumber eNumber� ����
�� 
erob� o   � ����� 0 efrom eFrom� �����
�� 
errt� o   � ����� 
0 eto eTo��  � : 4 TO DO: check how osascript displays this error info   � ��� h   T O   D O :   c h e c k   h o w   o s a s c r i p t   d i s p l a y s   t h i s   e r r o r   i n f o��  � I   � �������� 
0 _error  � ��� m   � ��� ��� 8 p a r s e   c o m m a n d   l i n e   a r g u m e n t s� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  ��  �.   ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��    ����
�� consnume��  �2  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Fil:FHlpnull��� ��� null��  � ����
�� 
Name� |����������  ��  � o      ���� 0 commandname commandName��  � l 
    ������ l     ������ m      �� ���  ��  ��  ��  ��  � ����
�� 
Summ� |����������  ��  � o      ���� $0 shortdescription shortDescription��  � l 
    ������ l     ������ m      �� ���  ��  ��  ��  ��  � ����
�� 
Usag� |����������  ��  � o      ���� "0 commandsynopses commandSynopses��  � l 
    ������ J      ����  ��  ��  � ����
�� 
OpsD� |����������  ��  � o      ���� &0 optiondefinitions optionDefinitions��  � l 
    ������ J      ����  ��  ��  � ����
�� 
OpsA� |����������  ��  � o      ���� *0 argumentdefinitions argumentDefinitions��  � l 
    ������ J      �� ���� K      �� ������ 0 propertyname propertyName� m      �� ���  a r g u m e n t s L i s t� ������� 0 islist isList� m      ��
�� boovtrue��  ��  ��  ��  � ����
�� 
Docu� |����������  ��  � o      ���� "0 longdescription longDescription��  � l 
    ������ l     ������ m      �� ���  ��  ��  ��  ��  � ����
�� 
VFmt� |����������  ��  � o      ���� 0 isstyled isStyled��  � l 
    ������ l     ������ m      ��
�� boovtrue��  ��  ��  ��  � �����
�� 
DefO� |����������  ��  � o      ���� &0 hasdefaultoptions hasDefaultOptions��  � l     ������ m      ��
�� boovtrue��  ��  ��  � P    ����� Q   ����� k   ��� ��� r    � � n    I    ������ "0 astextparameter asTextParameter  o    ���� 0 commandname commandName � m     �  n a m e�  ��   o    �~�~ 0 _support    o      �}�} 0 commandname commandName� 	
	 r    " n     I     �|�{�| "0 aslistparameter asListParameter �z o    �y�y &0 optiondefinitions optionDefinitions�z  �{   o    �x�x 0 _support   o      �w�w &0 optiondefinitions optionDefinitions
  r   # / n  # - I   ( -�v�u�v "0 aslistparameter asListParameter �t o   ( )�s�s *0 argumentdefinitions argumentDefinitions�t  �u   o   # (�r�r 0 _support   o      �q�q *0 argumentdefinitions argumentDefinitions  r   0 < n  0 : I   5 :�p�o�p "0 aslistparameter asListParameter  �n  o   5 6�m�m "0 commandsynopses commandSynopses�n  �o   o   0 5�l�l 0 _support   o      �k�k "0 commandsynopses commandSynopses !"! r   = J#$# n  = H%&% I   B H�j'�i�j "0 astextparameter asTextParameter' ()( o   B C�h�h $0 shortdescription shortDescription) *�g* m   C D++ �,,  s u m m a r y�g  �i  & o   = B�f�f 0 _support  $ o      �e�e $0 shortdescription shortDescription" -.- r   K X/0/ n  K V121 I   P V�d3�c�d "0 astextparameter asTextParameter3 454 o   P Q�b�b "0 longdescription longDescription5 6�a6 m   Q R77 �88  d o c u m e n t a t i o n�a  �c  2 o   K P�`�` 0 _support  0 o      �_�_ "0 longdescription longDescription. 9:9 Z   Y �;<�^=; n  Y d>?> I   ^ d�]@�\�] (0 asbooleanparameter asBooleanParameter@ ABA o   ^ _�[�[ 0 isstyled isStyledB C�ZC m   _ `DD �EE  t e r m i n a l   s t y l e s�Z  �\  ? o   Y ^�Y�Y 0 _support  < l  g �FGHF r   g �IJI K   g ~KK �XLM�X 0 n  L I   h n�WN�V�W 0 vt100 VT100N O�UO m   i j�T�T  �U  �V  M �SPQ�S 0 b  P I   o u�RR�Q�R 0 vt100 VT100R S�PS m   p q�O�O �P  �Q  Q �NT�M�N 0 u  T I   v |�LU�K�L 0 vt100 VT100U V�JV m   w x�I�I �J  �K  �M  J o      �H�H 0 vtstyle vtStyleG   normal, bold, underline   H �WW 0   n o r m a l ,   b o l d ,   u n d e r l i n e�^  = r   � �XYX K   � �ZZ �G[\�G 0 n  [ m   � �]] �^^  \ �F_`�F 0 b  _ m   � �aa �bb  ` �Ec�D�E 0 u  c m   � �dd �ee  �D  Y o      �C�C 0 vtstyle vtStyle: fgf l  � ��Bhi�B  h %  construct NAME summary section   i �jj >   c o n s t r u c t   N A M E   s u m m a r y   s e c t i o ng klk Z   � �mn�A�@m =  � �opo o   � ��?�? 0 commandname commandNamep m   � �qq �rr  n l  � �stus Q   � �vwxv r   � �yzy l  � �{�>�={ I  � ��<|�;
�< .Fil:SplPnull���     ctxt| l  � �}�:�9} n   � �~~ o   � ��8�8 0 _   l  � ���7�6� I  � ��5�4�3
�5 .Fil:EnVanull��� ��� null�4  �3  �7  �6  �:  �9  �;  �>  �=  z o      �2�2 0 commandname commandNamew R      �1�0�/
�1 .ascrerr ****      � ****�0  �/  x l  � ����� r   � ���� m   � ��� ���  C O M M A N D� o      �.�. 0 commandname commandName� T N fallback on the offchance the above should fail to get the script's file name   � ��� �   f a l l b a c k   o n   t h e   o f f c h a n c e   t h e   a b o v e   s h o u l d   f a i l   t o   g e t   t h e   s c r i p t ' s   f i l e   n a m et B < use the AppleScript shell script's own file name by default   u ��� x   u s e   t h e   A p p l e S c r i p t   s h e l l   s c r i p t ' s   o w n   f i l e   n a m e   b y   d e f a u l t�A  �@  l ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� n  � ���� o   � ��-�- 0 b  � o   � ��,�, 0 vtstyle vtStyle� m   � ��� ���  N A M E� n  � ���� o   � ��+�+ 0 n  � o   � ��*�* 0 vtstyle vtStyle� o   � ��)�) 
0 lf2 LF2� o   � ��(�( 0 indent1 Indent1� o   � ��'�' 0 commandname commandName� o      �&�& 0 helptext helpText� ��� Z   � ����%�$� >  � ���� o   � ��#�# $0 shortdescription shortDescription� m   � ��� ���  � r   � ���� b   � ���� b   � ���� o   � ��"�" 0 helptext helpText� m   � ��� ���    - -  � o   � ��!�! $0 shortdescription shortDescription� o      � �  0 helptext helpText�%  �$  � ��� l  � �����  � B < construct default SYNOPSIS, OPTIONS, and ARGUMENTS sections   � ��� x   c o n s t r u c t   d e f a u l t   S Y N O P S I S ,   O P T I O N S ,   a n d   A R G U M E N T S   s e c t i o n s� ��� r   ���� I      ����  0 _formatoptions _formatOptions� ��� o   � ��� &0 optiondefinitions optionDefinitions� ��� o   � ��� 0 vtstyle vtStyle� ��� o   � ��� &0 hasdefaultoptions hasDefaultOptions�  �  � J      �� ��� o      �� 00 defaultoptionssynopsis defaultOptionsSynopsis� ��� o      ��  0 optionssection optionsSection�  � ��� r  &��� I      ���� $0 _formatarguments _formatArguments� ��� o  �� *0 argumentdefinitions argumentDefinitions� ��� o  �� 0 vtstyle vtStyle�  �  � J      �� ��� o      �� 40 defaultargumentssynopsis defaultArgumentsSynopsis� ��� o      �� $0 argumentssection argumentsSection�  � ��� r  '<��� b  ':��� b  '6��� b  '2��� b  '.��� o  '(�� 0 helptext helpText� o  (-�� 
0 lf2 LF2� n .1��� o  /1�� 0 b  � o  ./�
�
 0 vtstyle vtStyle� m  25�� ���  S Y N O P S I S� n 69��� o  79�	�	 0 n  � o  67�� 0 vtstyle vtStyle� o      �� 0 helptext helpText� ��� Z  =Q����� = =A��� o  =>�� "0 commandsynopses commandSynopses� J  >@��  � r  DM��� J  DK�� ��� b  DI��� b  DG��� o  DE�� 0 commandname commandName� o  EF� �  00 defaultoptionssynopsis defaultOptionsSynopsis� o  GH���� 40 defaultargumentssynopsis defaultArgumentsSynopsis�  � o      ���� "0 commandsynopses commandSynopses�  �  � ��� Q  R����� X  U����� r  iz��� b  ix��� b  iv��� b  ip��� o  ij���� 0 helptext helpText� o  jo���� 
0 lf2 LF2� o  pu���� 0 indent1 Indent1� o  vw���� 0 textref textRef� o      ���� 0 helptext helpText�� 0 textref textRef� o  XY���� "0 commandsynopses commandSynopses� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � n ��� � I  �������� 60 throwinvalidparametertype throwInvalidParameterType  o  ������ "0 commandsynopses commandSynopses  m  �� �  s y n o p s i s 	 m  ��

 �  l i s t   o f   t e x t	 �� m  ����
�� 
list��  ��    o  ������ 0 _support  �  r  �� b  �� b  �� b  �� b  �� o  ������ 0 helptext helpText o  ������ 
0 lf2 LF2 o  ������  0 optionssection optionsSection o  ������ 
0 lf2 LF2 o  ������ $0 argumentssection argumentsSection o      ���� 0 helptext helpText  l ������   - ' add long DESCRIPTION section, if given    � N   a d d   l o n g   D E S C R I P T I O N   s e c t i o n ,   i f   g i v e n  Z  �� !����  > ��"#" o  ������ "0 longdescription longDescription# m  ��$$ �%%  ! r  ��&'& b  ��()( b  ��*+* b  ��,-, b  ��./. b  ��010 b  ��232 o  ������ 0 helptext helpText3 o  ������ 
0 lf2 LF21 n ��454 o  ������ 0 b  5 o  ������ 0 vtstyle vtStyle/ m  ��66 �77  D E S C R I P T I O N- n ��898 o  ������ 0 n  9 o  ������ 0 vtstyle vtStyle+ o  ������ 
0 lf2 LF2) o  ������ "0 longdescription longDescription' o      ���� 0 helptext helpText��  ��   :��: L  ��;; b  ��<=< o  ������ 0 helptext helpText= 1  ����
�� 
lnfd��  � R      ��>?
�� .ascrerr ****      � ****> o      ���� 0 etext eText? ��@A
�� 
errn@ o      ���� 0 enumber eNumberA ��BC
�� 
erobB o      ���� 0 efrom eFromC ��D��
�� 
errtD o      ���� 
0 eto eTo��  � I  ����E���� 
0 _error  E FGF m  ��HH �II 0 f o r m a t   c o m m a n d   l i n e   h e l pG JKJ o  ������ 0 etext eTextK LML o  ������ 0 enumber eNumberM NON o  ������ 0 efrom eFromO P��P o  ������ 
0 eto eTo��  ��  � ��Q
�� conscaseQ ��R
�� consdiacR ��S
�� conshyphS ��T
�� conspuncT ����
�� conswhit��  � ����
�� consnume��  � UVU l     ��������  ��  ��  V WXW l     ��������  ��  ��  X YZY l     ��������  ��  ��  Z [\[ i  � �]^] I     ������
�� .Fil:CurFnull��� ��� null��  ��  ^ Q     :_`a_ k    (bb cdc r    efe n   ghg I   
 �������� ,0 currentdirectorypath currentDirectoryPath��  ��  h n   
iji I    
��������  0 defaultmanager defaultManager��  ��  j n   klk o    ���� 0 nsfilemanager NSFileManagerl m    ��
�� misccuraf o      ���� 0 asocpath asocPathd mnm Z   !op����o =   qrq o    ���� 0 asocpath asocPathr m    ��
�� 
msngp R    ��st
�� .ascrerr ****      � ****s m    uu �vv  N o t   a v a i l a b l e .t ��w��
�� 
errnw m    �����@��  ��  ��  n x��x L   " (yy c   " 'z{z c   " %|}| o   " #���� 0 asocpath asocPath} m   # $��
�� 
ctxt{ m   % &��
�� 
psxf��  ` R      ��~
�� .ascrerr ****      � ****~ o      ���� 0 etext eText ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  a I   0 :������� 
0 _error  � ��� m   1 2�� ��� , c u r r e n t   w o r k i n g   f o l d e r� ��� o   2 3���� 0 etext eText� ��� o   3 4���� 0 enumber eNumber� ��� o   4 5�� 0 efrom eFrom� ��� o   5 6�� 
0 eto eTo�  ��  \ ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  � ���� I     ���
� .Fil:EnVanull��� ��� null�  �  � L     �� c     ��� l    ���� n    ��� I    ���� 0 environment  �  �  � n    ��� I    �~�}�|�~ 0 processinfo processInfo�}  �|  � n    ��� o    �{�{ 0 nsprocessinfo NSProcessInfo� m     �z
�z misccura�  �  � m    �y
�y 
****� ��� l     �x�w�v�x  �w  �v  � ��� l     �u�t�s�u  �t  �s  � ��� i  � ���� I     �r�q�
�r .Fil:RSInnull��� ��� null�q  � �p��
�p 
Prmt� |�o�n��m��o  �n  � o      �l�l 0 
prompttext 
promptText�m  � l     ��k�j� m      �� ���  > >  �k  �j  � �i��h
�i 
ReTo� |�g�f��e��g  �f  � o      �d�d 0 isinteractive isInteractive�e  � l     ��c�b� m      �a
�a boovfals�c  �b  �h  � Q     ����� k    ��� ��� r    ��� n   
��� I    
�`�_�^�` :0 filehandlewithstandardinput fileHandleWithStandardInput�_  �^  � n   ��� o    �]�] 0 nsfilehandle NSFileHandle� m    �\
�\ misccura� o      �[�[ 0 	asocstdin 	asocStdin� ��� Z    =���Z�� o    �Y�Y 0 isinteractive isInteractive� k    3�� ��� I   �X��
�X .Fil:WSOunull���     ctxt� o    �W�W 0 
prompttext 
promptText� �V��
�V 
SLiB� m    �U
�U boovfals� �T��S
�T 
ALiE�S  � ��� r    "��� n    ��� I     �R�Q�P�R 0 availabledata availableData�Q  �P  � o    �O�O 0 	asocstdin 	asocStdin� o      �N�N 0 asocdata asocData� ��M� Z  # 3���L�K� =   # *��� n  # (��� I   $ (�J�I�H�J 
0 length  �I  �H  � o   # $�G�G 0 asocdata asocData� m   ( )�F�F  � L   - /�� m   - .�E
�E 
msng�L  �K  �M  �Z  � r   6 =��� n  6 ;��� I   7 ;�D�C�B�D *0 readdatatoendoffile readDataToEndOfFile�C  �B  � o   6 7�A�A 0 	asocstdin 	asocStdin� o      �@�@ 0 asocdata asocData� ��� r   > O��� n  > M��� I   E M�?��>�? 00 initwithdata_encoding_ initWithData_encoding_� ��� o   E F�=�= 0 asocdata asocData� ��<� l  F I��;�:� n  F I��� o   G I�9�9 ,0 nsutf8stringencoding NSUTF8StringEncoding� m   F G�8
�8 misccura�;  �:  �<  �>  � n  > E��� I   A E�7�6�5�7 	0 alloc  �6  �5  � n  > A��� o   ? A�4�4 0 nsstring NSString� m   > ?�3
�3 misccura� o      �2�2 0 
asocstring 
asocString� ��� Z  P d���1�0� =  P S��� o   P Q�/�/ 0 
asocstring 
asocString� m   Q R�.
�. 
msng� R   V `�-��
�- .ascrerr ****      � ****� m   \ _�� ��� , N o t   U T F 8 - e n c o d e d   t e x t .� �,��+
�, 
errn� m   X [�*�*�\�+  �1  �0  � ��� Z  e �� �)�(� n  e m I   f m�'�&�' 0 
hassuffix_ 
hasSuffix_ �% 1   f i�$
�$ 
lnfd�%  �&   o   e f�#�# 0 
asocstring 
asocString  r   p ~ n  p | I   q |�"	�!�" &0 substringtoindex_ substringToIndex_	 
� 
 l  q x�� \   q x l  q v�� n  q v I   r v���� 
0 length  �  �   o   q r�� 0 
asocstring 
asocString�  �   m   v w�� �  �  �   �!   o   p q�� 0 
asocstring 
asocString o      �� 0 
asocstring 
asocString�)  �(  � � L   � � c   � � o   � ��� 0 
asocstring 
asocString m   � ��
� 
ctxt�  � R      �
� .ascrerr ****      � **** o      �� 0 etext eText �
� 
errn o      �� 0 enumber eNumber �
� 
erob o      �� 0 efrom eFrom ��

� 
errt o      �	�	 
0 eto eTo�
  � I   � ���� 
0 _error    m   � � �   & r e a d   s t a n d a r d   i n p u t !"! o   � ��� 0 etext eText" #$# o   � ��� 0 enumber eNumber$ %&% o   � ��� 0 efrom eFrom& '�' o   � ��� 
0 eto eTo�  �  � ()( l     �� ���  �   ��  ) *+* l     ��������  ��  ��  + ,-, i  � �./. I     ��01
�� .Fil:WSOunull���     ctxt0 o      ���� 0 thetext theText1 ��23
�� 
SLiB2 |����4��5��  ��  4 o      ���� 0 uselinefeeds useLinefeeds��  5 l     6����6 m      ��
�� boovtrue��  ��  3 ��7��
�� 
ALiE7 |����8��9��  ��  8 o      ����  0 withlineending withLineEnding��  9 l     :����: m      ��
�� boovtrue��  ��  ��  / Q     �;<=; k    >> ?@? r    ABA n   CDC I    ��E���� &0 asnsmutablestring asNSMutableStringE F��F n   GHG I    ��I���� "0 astextparameter asTextParameterI JKJ o    ���� 0 thetext theTextK L��L m    MM �NN  ��  ��  H o    ���� 0 _support  ��  ��  D o    ���� 0 _support  B o      ���� 0 
asocstring 
asocString@ OPO Z    IQR����Q o    ���� 0 uselinefeeds useLinefeedsR k    ESS TUT n   2VWV I    2��X���� l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_X YZY l 
  "[����[ l   "\����\ b    "]^] o     ��
�� 
ret ^ 1     !��
�� 
lnfd��  ��  ��  ��  Z _`_ l  " #a����a 1   " #��
�� 
lnfd��  ��  ` bcb m   # $����  c d��d K   $ .ee ��fg�� 0 location  f m   % &����  g ��h���� 
0 length  h n  ' ,iji I   ( ,�������� 
0 length  ��  ��  j o   ' (���� 0 
asocstring 
asocString��  ��  ��  W o    ���� 0 
asocstring 
asocStringU k��k n  3 Elml I   4 E��n���� l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_n opo l 
 4 5q����q l  4 5r���r o   4 5�
� 
ret ��  �  ��  ��  p sts l  5 6u��u 1   5 6�
� 
lnfd�  �  t vwv m   6 7��  w x�x K   7 Ayy �z{� 0 location  z m   8 9��  { �|�� 
0 length  | n  : ?}~} I   ; ?���� 
0 length  �  �  ~ o   : ;�� 0 
asocstring 
asocString�  �  ��  m o   3 4�� 0 
asocstring 
asocString��  ��  ��  P � Z  J d����� F   J W��� o   J K��  0 withlineending withLineEnding� H   N U�� l  N T���� n  N T��� I   O T���� 0 
hassuffix_ 
hasSuffix_� ��� 1   O P�
� 
lnfd�  �  � o   N O�� 0 
asocstring 
asocString�  �  � n  Z `��� I   [ `���� 0 appendstring_ appendString_� ��� 1   [ \�
� 
lnfd�  �  � o   Z [�� 0 
asocstring 
asocString�  �  � ��� r   e n��� n  e l��� I   h l���� <0 filehandlewithstandardoutput fileHandleWithStandardOutput�  �  � n  e h��� o   f h�� 0 nsfilehandle NSFileHandle� m   e f�
� misccura� o      �� 0 
asocstdout 
asocStdout� ��� n  o |��� I   p |���� 0 
writedata_ 
writeData_� ��� l  p x���� n  p x��� I   q x���� (0 datausingencoding_ dataUsingEncoding_� ��� l  q t���� n  q t��� o   r t�� ,0 nsutf8stringencoding NSUTF8StringEncoding� m   q r�
� misccura�  �  �  �  � o   p q�� 0 
asocstring 
asocString�  �  �  �  � o   o p�� 0 
asocstdout 
asocStdout� ��� L   } ��  �  < R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  = I   � ����� 
0 _error  � ��� m   � ��� ��� * w r i t e   s t a n d a r d   o u t p u t� ��� o   � ��� 0 etext eText� ��� o   � ��~�~ 0 enumber eNumber� ��� o   � ��}�} 0 efrom eFrom� ��|� o   � ��{�{ 
0 eto eTo�|  �  - ��� l     �z�y�x�z  �y  �x  � ��w� l     �v�u�t�v  �u  �t  �w       !�s������������r��ty�����������������s  � �q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�U�T�S
�q 
pimr�p 0 _support  �o 
0 _error  �n (0 _nsstringencodings _NSStringEncodings
�m .Fil:Readnull���     file
�l .Fil:Writnull���     file
�k .Fil:ConPnull���     ****
�j .Fil:NorPnull���     ****
�i .Fil:JoiPnull���     ****
�h .Fil:SplPnull���     ctxt�g  0 _argvusererror _ArgvUserError�f 0 novalue NoValue�e 
0 lf2 LF2�d 0 indent1 Indent1�c 0 indent2 Indent2�b 0 vt100 VT100�a 0 _unpackvalue _unpackValue�` 40 _defaultvalueplaceholder _defaultValuePlaceholder�_ *0 _formatdefaultvalue _formatDefaultValue�^ (0 _buildoptionstable _buildOptionsTable�] 0 _parseoptions _parseOptions�\ (0 _adddefaultoptions _addDefaultOptions�[ "0 _parsearguments _parseArguments�Z  0 _formatoptions _formatOptions�Y $0 _formatarguments _formatArguments
�X .Fil:Argvnull���     ****
�W .Fil:FHlpnull��� ��� null
�V .Fil:CurFnull��� ��� null
�U .Fil:EnVanull��� ��� null
�T .Fil:RSInnull��� ��� null
�S .Fil:WSOunull���     ctxt� �R��R �  ��� �Q��P
�Q 
cobj� ��   �O 
�O 
frmk�P  � �N��M
�N 
cobj� ��   �L
�L 
osax�M  � ��   �K +
�K 
scpt� �J 5�I�H���G�J 
0 _error  �I �F��F �  �E�D�C�B�A�E 0 handlername handlerName�D 0 etext eText�C 0 enumber eNumber�B 0 efrom eFrom�A 
0 eto eTo�H  � �@�?�>�=�<�@ 0 handlername handlerName�? 0 etext eText�> 0 enumber eNumber�= 0 efrom eFrom�< 
0 eto eTo�  E�;�:�; �: &0 throwcommanderror throwCommandError�G b  ࠡ����+ � �9 b  ��9 (0 _nsstringencodings _NSStringEncodings�  ���� �8�7�8 
0 _list_  �7 0 getencoding getEncoding� �6��6 �  ���������������������� �5��5 �  �4�3
�4 FEncFE01�3 � �2��2 �  �1�0
�1 FEncFE02�0 
� �/ �/    �. �
�. FEncFE03� �-�-   �, �
�, FEncFE04� �+�+   �* �
�* FEncFE05� �)�)   �( �
�( FEncFE06� �'�'   �& �
�& FEncFE07� �%�%   �$�#
�$ FEncFE11�# � �"�"   �!� 
�! FEncFE12�  � ��   ��
� FEncFE13� � ��   ��
� FEncFE14� 	� �	� 	  ��
� FEncFE15� � �
� 
  ��
� FEncFE16� � ��   ��
� FEncFE17� � ��   ��
� FEncFE18� � ��   ��
� FEncFE19� � �
�
   �	�
�	 FEncFE50� � ��   ��
� FEncFE51� � ��   ��
� FEncFE52� � ��   � ��
�  FEncFE53�� � ����   ����
�� FEncFE54�� � ���������� 0 getencoding getEncoding�� ����   ���� 0 textencoding textEncoding��   ������ 0 textencoding textEncoding�� 0 aref aRef ������������������������E
�� 
enum�� 
0 _list_  
�� 
kocl
�� 
cobj
�� .corecnte****       ****��   ������
�� 
errn���\��  
�� 
long
�� 
errn���Y
�� 
erob
�� 
errt�� �� W 5��&E�O ))�,[��l kh ��k/�  ��l/EY h[OY��W X   	��&W X  hO)�������� ��Z������
�� .Fil:Readnull���     file�� 0 thefile theFile�� ��
�� 
Type {�������� 0 datatype dataType��  
�� 
ctxt ����
�� 
Enco {�������� 0 textencoding textEncoding��  
�� FEncFE01��   �������������������������� 0 thefile theFile�� 0 datatype dataType�� 0 textencoding textEncoding�� 0 	posixpath 	posixPath�� 0 
asocstring 
asocString�� 0 theerror theError�� 0 fh  �� 0 	theresult 	theResult�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo  t�������������������������������������������� ,0 asposixpathparameter asPOSIXPathParameter�� "0 astypeparameter asTypeParameter
�� 
ctxt
�� FEncFEPE
�� 
bool�� 0 getencoding getEncoding
�� misccura�� 0 nsstring NSString
�� 
obj �� T0 (stringwithcontentsoffile_encoding_error_ (stringWithContentsOfFile_encoding_error_
�� 
cobj
�� 
msng
� 
errn� 0 code  
� 
erob
� 
errt� � ,0 localizeddescription localizedDescription
� 
psxf
� .rdwropenshor       file
� 
as  
� .rdwrread****        ****
� .rdwrclosnull���     ****� 0 etext eText ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom ���
� 
errt� 
0 eto eTo�  �  �  � � 
0 _error  �� � �b  ��l+ E�Ob  ��l+ E�O�� 	 ���& Ub  �k+ E�O��,���m+ E[�k/E�Z[�l/E�ZO��  )�j+ a �a �a �j+ �&Y hO��&Y O�a &j E�O �a �l E�O�j O�W )X   
�j W X  hO)�a �a �a �W X  *a ����a + � ��� �
� .Fil:Writnull���     file� 0 thefile theFile� ��!
� 
Data� 0 thedata theData! �"#
� 
Type" {���� 0 datatype dataType�  
� 
ctxt# �$�
� 
Enco$ {���� 0 textencoding textEncoding�  
� FEncFE01�   �������������� 0 thefile theFile� 0 thedata theData� 0 datatype dataType� 0 textencoding textEncoding� 0 	posixpath 	posixPath� 0 
asocstring 
asocString� 0 
didsucceed 
didSucceed� 0 theerror theError� 0 fh  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo  ')�5������Q��������~�}�|�{�z�y�x�w�v�u�t�s�r�q�p�o%�n�m��l�k� ,0 asposixpathparameter asPOSIXPathParameter� "0 astypeparameter asTypeParameter
� 
ctxt
� FEncFEPE
� 
bool
� misccura� 0 nsstring NSString� "0 astextparameter asTextParameter� &0 stringwithstring_ stringWithString_� 0 getencoding getEncoding
� 
obj � � P0 &writetofile_atomically_encoding_error_ &writeToFile_atomically_encoding_error_
� 
cobj
�~ 
errn�} 0 code  
�| 
erob
�{ 
errt�z �y ,0 localizeddescription localizedDescription
�x 
psxf
�w 
perm
�v .rdwropenshor       file
�u 
set2
�t .rdwrseofnull���     ****
�s 
refn
�r 
as  
�q .rdwrwritnull���     ****
�p .rdwrclosnull���     ****�o 0 etext eText% �j�i&
�j 
errn�i 0 enumber eNumber& �h�g'
�h 
erob�g 0 efrom eFrom' �f�e�d
�f 
errt�e 
0 eto eTo�d  �n  �m  �l �k 
0 _error  �
 �b  ��l+ E�Ob  ��l+ E�O�� 	 ���& i��,b  ��l+ 
k+ E�Ob  �k+ E�O��e���+ E[a k/E�Z[a l/E�ZO� !)a �j+ a �a �a �j+ �&Y hY a�a &a el E�O %�a jl O�a �a �� O�j OhW +X   ! 
�j W X " #hO)a �a �a �a �W X   !*a $����a %+ &� �c��b�a()�`
�c .Fil:ConPnull���     ****�b 0 filepath filePath�a �_*+
�_ 
From* {�^�]�\�^ 0 
fromformat 
fromFormat�]  
�\ FLCTFLCP+ �[,�Z
�[ 
To__, {�Y�X�W�Y 0 toformat toFormat�X  
�W FLCTFLCP�Z  ( 	�V�U�T�S�R�Q�P�O�N�V 0 filepath filePath�U 0 
fromformat 
fromFormat�T 0 toformat toFormat�S 0 	posixpath 	posixPath�R 0 asocurl asocURL�Q 0 etext eText�P 0 enumber eNumber�O 0 efrom eFrom�N 
0 eto eTo) *�M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=�<�;F�:�9�8M�7d�6�5�4�3�2�1�0��/��.-��-�,
�M 
kocl
�L 
ctxt
�K .corecnte****       ****�J ,0 asposixpathparameter asPOSIXPathParameter
�I FLCTFLCP
�H FLCTFLCH
�G 
file
�F 
psxp
�E FLCTFLCU
�D misccura�C 0 nsurl NSURL�B  0 urlwithstring_ URLWithString_
�A 
msng�@ 0 fileurl fileURL
�? 
bool
�> 
errn�=�Y
�< 
erob�; 
�: 
errt
�9 
enum�8 
�7 
leng
�6 FLCTFLCA
�5 
psxf
�4 
alis
�3 FLCTFLCX
�2 FLCTFLCS
�1 
ascr�0 $0 fileurlwithpath_ fileURLWithPath_�/  0 absolutestring absoluteString�. 0 etext eText- �+�*.
�+ 
errn�* 0 enumber eNumber. �)�(/
�) 
erob�( 0 efrom eFrom/ �'�&�%
�' 
errt�& 
0 eto eTo�%  �- �, 
0 _error  �`xc�kv��l j  b  ��l+ E�Y r��  �E�Y f��  *�/�,E�Y U��  7��,�k+ E�O�� 
 
�j+ �& )a a a �a a Y hY )a a a �a a a a O�a ,j  )a a a �a a Y hO��  �Y ��a   �a &a &Y ��a   �a &Y �a   _  �a &�&/Y f��  �a &�&Y U��  7��,�k+ !E�O��  )a a a �a a "�%Y hO�j+ #�&Y )a a a �a a a a $W X % &*a '����a (+ )� �$��#�"01�!
�$ .Fil:NorPnull���     ****�# 0 filepath filePath�" � 2�
�  
ExpR2 {���� 0 isexpanding isExpanding�  
� boovfals�  0 ������ 0 filepath filePath� 0 isexpanding isExpanding� 0 etext eText� 0 enumber eNumber� 
0 eto eTo1 ����������3:��� ,0 asposixpathparameter asPOSIXPathParameter
� 
bool
� .Fil:CurFnull��� ��� null
� .Fil:JoiPnull���     ****
� misccura� 0 nsstring NSString� &0 stringwithstring_ stringWithString_� 60 stringbystandardizingpath stringByStandardizingPath
� 
ctxt� 0 etext eText3 �
�	4
�
 
errn�	 0 enumber eNumber4 ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �! S Bb  ��l+ E�O�	 ���& *j �lvj E�Y hO��,�k+ j+ 	�&W X  *������+ � �J��56�
� .Fil:JoiPnull���     ****�  0 pathcomponents pathComponents� �7� 
� 
Exte7 {����Q�� 0 fileextension fileExtension��  �   5 	��������������������  0 pathcomponents pathComponents�� 0 fileextension fileExtension�� 0 subpaths subPaths�� 0 aref aRef�� 0 asocpath asocPath�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo6 c����������~�����������������������������������8������� "0 aslistparameter asListParameter
�� 
cobj
�� 
kocl
�� .corecnte****       ****
�� 
pcnt�� ,0 asposixpathparameter asPOSIXPathParameter��  ��  
�� 
errn���Y
�� 
erob�� 
�� misccura�� 0 nsstring NSString�� *0 pathwithcomponents_ pathWithComponents_�� "0 astextparameter asTextParameter
�� 
leng�� B0 stringbyappendingpathextension_ stringByAppendingPathExtension_
�� 
msng
�� 
ctxt�� 0 etext eText8 ����9
�� 
errn�� 0 enumber eNumber9 ����:
�� 
erob�� 0 efrom eFrom: ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � � �b  ��l+ �-E�O ;�jv  	)jhY hO %�[��l kh b  ��,�l+ ��,F[OY��W X  	)�����O�a ,�k+ E�Ob  �a l+ E�O�a ,j $��k+ E�O�a   )����a Y hY hO�a &W X  *a ����a + � �������;<��
�� .Fil:SplPnull���     ctxt�� 0 filepath filePath�� ��=��
�� 
Upon= {�������� 0 splitposition splitPosition��  
�� FLSPFLSL��  ; ������������������ 0 filepath filePath�� 0 splitposition splitPosition�� 0 asocpath asocPath�� 0 matchformat matchFormat�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo< ���������������������������1�>B��
�� misccura�� 0 nsstring NSString�� ,0 asposixpathparameter asPOSIXPathParameter�� &0 stringwithstring_ stringWithString_
�� FLSPFLSL�� F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent
� 
ctxt� &0 lastpathcomponent lastPathComponent
� FLSPFLSE� >0 stringbydeletingpathextension stringByDeletingPathExtension� 0 pathextension pathExtension
� FLSPFLSA�  0 pathcomponents pathComponents
� 
list
� 
errn��Y
� 
erob
� 
errt
� 
enum� � 0 etext eText> ��?
� 
errn� 0 enumber eNumber? ��@
� 
erob� 0 efrom eFrom@ ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� � u��,b  ��l+ k+ E�O��  �j+ �&�j+ �&lvY C��  �j+ 
�&�j+ �&lvY )��  �j+ �&Y )�a a �a a a a W X  *a ����a + �r'� �f  A� 0 novalue NoValueA  BB  � �CC  
 
� ����DE�� 0 vt100 VT100� �F� F  �� 0 
formatcode 
formatCode�  D �� 0 
formatcode 
formatCodeE �����
� 
cha � 
� kfrmID  � )���0�%�%�%� ����GH�� 0 _unpackvalue _unpackValue� �I� I  ��� 0 thevalue theValue� $0 definitionrecord definitionRecord�  G �������� 0 thevalue theValue� $0 definitionrecord definitionRecord� 0 	valuetype 	valueType� 0 	theresult 	theResult� 0 asocformatter asocFormatter� 0 
asocresult 
asocResult� 0 basepath basePathH 9�����������������~�}�|&�{�z�y�x�wO�v�u�tf�s�r�q�p�oJ��n�������m�������l�k�j�i�� 0 	valuetype 	valueType
� 
type
� 
ctxt
� 
long
� 
doub
� 
nmbr
� misccura� &0 nsnumberformatter NSNumberFormatter� 	0 alloc  � 0 init  � D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� "0 setnumberstyle_ setNumberStyle_� 0 nslocale NSLocale� 0 systemlocale systemLocale� 0 
setlocale_ 
setLocale_� &0 numberfromstring_ numberFromString_
�~ 
msng
�} 
errn
�| 
****
�{ 
furl
�z 
alis
�y 
file
�x 
psxf�w �v 0 nsfilemanager NSFileManager�u  0 defaultmanager defaultManager�t ,0 currentdirectorypath currentDirectoryPath�s 0 nsstring NSString�r *0 pathwithcomponents_ pathWithComponents_�q &0 stringwithstring_ stringWithString_�p 60 stringbystandardizingpath stringByStandardizingPath�o  J �h�g�f
�h 
errn�g���f  
�n 
bool�m �l�Y
�k 
erob
�j 
errt�i �ȡ�,�&E�O��  �E�Y����mv�kv ���,j+ j+ 	E�O���,k+ O���,j+ k+ O��k+ E�O�a   )a b  
la �%Y hO�a &E�O��  '�k#j )a b  
la �%Y hO��&E�Y hY%a a a a a v�kv ��a  A�a ,j+ j+ E�O�a   )a b  
la �%Y hO�a ,��lvk+  E�Y hO�a ,�k+ !j+ "�&a &E�O �a   �a &E�Y hW X # $)a b  
la %�%Y |�a &  [ga ' Qa (a )a *a +a ,a -v�kv eY 1a .a /a 0a 1a 2a -v�kv fY )a b  
la 3�%VY )a a 4a 5��,a 6�a 7a 8O�� �e�d�cKL�b�e 40 _defaultvalueplaceholder _defaultValuePlaceholder�d �aM�a M  �`�` $0 definitionrecord definitionRecord�c  K �_�^�_ $0 definitionrecord definitionRecord�^ 0 	valuetype 	valueTypeL �]�\�[!�Z�Y�X7:�W�V�U�T�SM�RU�Q�P�O�N�MY�] 0 	valuetype 	valueType
�\ 
type
�[ 
ctxt
�Z 
long
�Y 
doub
�X 
nmbr
�W 
furl
�V 
alis
�U 
file
�T 
psxf�S 
�R 
bool
�Q 
errn�P�Y
�O 
erob
�N 
errt�M �b h��,�&E�O��  �Y V���mv�kv ��  �Y �Y :�����v�kv �Y (��  	a Y )a a a ��,a �a a � �Ll�K�JNO�I�L *0 _formatdefaultvalue _formatDefaultValue�K �HP�H P  �G�G $0 definitionrecord definitionRecord�J  N �F�E�D�C�F $0 definitionrecord definitionRecord�E 0 defaultvalue defaultValue�D 0 defaulttext defaultText�C 0 asocformatter asocFormatterO �B�A�@�?�>�=�<�;�:�9�8�7�6�5�4�3�2�1�0�/�.�-�,�+
�B 0 defaultvalue defaultValue
�A 
kocl
�@ 
list
�? .corecnte****       ****
�> 
leng
�= 
bool
�< 
cobj
�; 
ctxt
�: 
long
�9 
doub
�8 misccura�7 &0 nsnumberformatter NSNumberFormatter�6 	0 alloc  �5 0 init  �4 >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle�3 "0 setnumberstyle_ setNumberStyle_�2 0 nslocale NSLocale�1 0 systemlocale systemLocale�0 0 
setlocale_ 
setLocale_�/ &0 stringfromnumber_ stringFromNumber_
�. 
****
�- 
furl
�, 
alis
�+ 
psxp�I ��,E�O�kv��l j	 	��,k �& ��k/E�Y hO�kv��l j �E�Y ��kv��l j
 �kv��l j�& 7��,j+ j+ E�O���,k+ O��a ,j+ k+ O��k+ a &E�Y N�kv�a l j
 �kv�a l j�& �a ,E�Y "�e  
a E�Y �f  
a E�Y a Oa �%a %� �*+�)�(QR�'�* (0 _buildoptionstable _buildOptionsTable�) �&S�& S  �%�% &0 optiondefinitions optionDefinitions�(  Q 
�$�#�"�!� ������$ &0 optiondefinitions optionDefinitions�# 0 
foundnames 
foundNames�" 20 optiondefinitionsbyname optionDefinitionsByName�! 0 	optionref 	optionRef�  $0 optiondefinition optionDefinition� 0 propertyname propertyName� 0 	namecount 	nameCount� 0 aref aRef� 0 thename theName� 0 
nameprefix 
namePrefixR (���������V�Z�^�����{�
�	�T�����		��������	
� misccura� *0 nsmutabledictionary NSMutableDictionary� 0 
dictionary  
� 
kocl
� 
cobj
� .corecnte****       ****
� 
pcnt
� 
reco� 0 	shortname 	shortName� 0 longname longName� 0 propertyname propertyName� 0 	valuetype 	valueType
� 
ctxt� 0 islist isList� 0 defaultvalue defaultValue� 
�
 
errn�	�\�  T �� ��
� 
errn� �\��  ��Y
� 
erob� 
� 
leng
� 
bool� &0 setobject_forkey_ setObject_forKey_�'�jvE�O��,j+ E�Oo�[��l kh ��,�&��������a fa fa %E�O %��,�&E�O��,a   )a a lhY hW X  )a a a �a a O�a ,E�O ֤�,a lv��,a lvlv[��l kh �E[�k/E�Z[�l/E�ZO 
��&E�W X  )a a a �a a O�a   v��kv )a a a �a a !Y hO��6FOga " >�a ,k  2�a ,k
 a #�a $& )a a a �a a %Y hY hVO����%l+ &Y h[OY�IO�a ,�  )a a a �a a 'Y h[OY��O�� ��	-����UV���� 0 _parseoptions _parseOptions�� ��W�� W  �������� 0 rawarguments rawArguments�� &0 optiondefinitions optionDefinitions�� &0 hasdefaultoptions hasDefaultOptions��  U ���������������������������� 0 rawarguments rawArguments�� &0 optiondefinitions optionDefinitions�� &0 hasdefaultoptions hasDefaultOptions�� 20 optiondefinitionsbyname optionDefinitionsByName�� (0 asocparametersdict asocParametersDict�� 0 thearg theArg�� 0 
optionname 
optionName�� $0 optiondefinition optionDefinition�� 0 ishelp isHelp�� 0 	isversion 	isVersion�� 0 propertyname propertyName�� 0 thevalue theValue�� 0 thelist theListV 4��������	T������	r	~����������	�	�	���������������

T
W
a
d��
���
���
���������������
�
�����������#���� (0 _buildoptionstable _buildOptionsTable
�� misccura�� *0 nsmutabledictionary NSMutableDictionary�� 0 
dictionary  
�� 
ascr
�� 
txdl
�� 
cobj
�� 
rest
�� 
citm
�� 
kocl
�� .corecnte****       ****
�� 
ctxt
�� 
cha 
�� 
bool
�� 
leng�� 0 objectforkey_ objectForKey_
�� 
msng
�� 
****�� 0 	valuetype 	valueType�� $0 removeallobjects removeAllObjects�� $0 setvalue_forkey_ setValue_forKey_
�� 
errn�� 0 propertyname propertyName�� 0 defaultvalue defaultValue��  ��  ���\
�� 
erob�� �� 0 _unpackvalue _unpackValue�� 0 islist isList��  0 nsmutablearray NSMutableArray�� $0 arraywithobject_ arrayWithObject_�� 0 
addobject_ 
addObject_�� &0 setobject_forkey_ setObject_forKey_��o*�k+  E�O��,j+ E�O���,FONh�jv ��k/E�O�� C��  ��,E�OY hO��k/E�O���l k �[�\[�l/\Zi2��k/FY ��,E�Y ��� ��a  
 a �a l/a & Y hO�[�\[Zk\Zl2E�O�a ,l L�[�\[Zm\Zi2��k/FO��k+ E�O�a 	 �a &a ,a  a & a ��k/%��k/FY hY ��,E�Y O��k+ E�O�a   x� _a a lv�kva a lv�kvlvE[�k/E�Z[�l/E�ZO�
 �a & %�j+ O��a l+  O��a !l+  OjvE�OY hY hO)a "b  
la #�%Y hO�a &E�O�a $,E�O�a ,a   1 �a %,E�W  X & ')a "a (a )�a %,a *a +�%Y 0�jv  )a "b  
la ,�%Y hO*��k/�l+ -E�O��,E�O�a .,E /��k+ E�O�a   �a /,�k+ 0E�Y ��k+ 1O�E�Y #��k+ a  )a "b  
la 2�%Y hO���l+ 3[OY��O��lv� ��<����XY���� (0 _adddefaultoptions _addDefaultOptions�� ��Z�� Z  ������ (0 asocparametersdict asocParametersDict�� &0 optiondefinitions optionDefinitions��  X ��������� (0 asocparametersdict asocParametersDict� &0 optiondefinitions optionDefinitions� 0 recref recRef� 0 rec  � 0 propertyname propertyName� 0 thevalue theValue� 0 
optionname 
optionName� 0 aref aRefY �����S�W��f��������������
� 
kocl
� 
cobj
� .corecnte****       ****
� 
reco� 0 propertyname propertyName� 0 longname longName� 0 defaultvalue defaultValue� � 0 objectforkey_ objectForKey_
� 
msng� 0 	shortname 	shortName
� 
errn
� misccura� 0 nsnull NSNull� 0 null  � &0 setobject_forkey_ setObject_forKey_�� � ��[��l kh ��&�����b  �%E�O��,E�O��  
��,E�Y hO��k+ �  e��,E�O�b    1���,%E�O��  �a ,%E�Y hO)a b  
la �%Y hO��  a a ,j+ E�Y hO���l+ Y h[OY�bO 1a a lv[��l kh ��k+ �  �f�l+ Y h[OY��� ����[\�� "0 _parsearguments _parseArguments� �]� ]  ���� 0 argumentslist argumentsList� *0 argumentdefinitions argumentDefinitions� (0 asocparametersdict asocParametersDict�  [ ������������� 0 argumentslist argumentsList� *0 argumentdefinitions argumentDefinitions� (0 asocparametersdict asocParametersDict� 0 i  � 0 argcount argCount�  0 mustbeoptional mustBeOptional� 0 argref argRef� (0 argumentdefinition argumentDefinition� 0 defaultvalue defaultValue� 0 thevalue theValue� "0 placeholdertext placeholderText� 0 aref aRef\ !������������������������������6CG������������~���
� 
leng
� 
kocl
� 
cobj
� .corecnte****       ****
�� 
pcnt
�� 
reco�� 0 propertyname propertyName�� 0 	valuetype 	valueType
�� 
ctxt�� 0 islist isList�� 0 defaultvalue defaultValue�� 
�� 
bool
�� 
errn���Y
�� 
erob�� �� $0 valueplaceholder valuePlaceholder�� 40 _defaultvalueplaceholder _defaultValuePlaceholder�� 0 _unpackvalue _unpackValue
� 
rest�~ &0 setobject_forkey_ setObject_forKey_�}jE�O��,E�OfE�OG�[��l kh �kE�O��,�&�����f�b  �%E�O�b   eE�Y $�	 �b   �& )��a �a a Y hO��,a   )��a �a a Y hO�jv  P��,E�O�b    <�a ,E�O��,j  *��,k+ E�Y hO)�b  
la �%a %�%a %Y hY *��k/�l+ E�O�a ,E�O��,E L���, )��a �a a Y hO�kvE�O  �[��l kh *��,�l+ �6F[OY��OjvE�Y hO����,l+ [OY��O�jv )�b  
la ��,%a %�%a  %Y h� �}��|�{^_�z�}  0 _formatoptions _formatOptions�| �y`�y `  �x�w�v�x &0 optiondefinitions optionDefinitions�w 0 vtstyle vtStyle�v &0 hasdefaultoptions hasDefaultOptions�{  ^ �u�t�s�r�q�p�o�n�m�l�k�j�i�h�g�f�e�d�u &0 optiondefinitions optionDefinitions�t 0 vtstyle vtStyle�s &0 hasdefaultoptions hasDefaultOptions�r  0 defaultoptions defaultOptions�q  0 booleanoptions booleanOptions�p 0 otheroptions otherOptions�o  0 optionssection optionsSection�n 0 	optionref 	optionRef�m $0 optiondefinition optionDefinition�l 0 	shortname 	shortName�k 0 longname longName�j 0 	valuetype 	valueType�i 0 islist isList�h $0 valueplaceholder valuePlaceholder�g $0 valuedescription valueDescription�f 0 
optionname 
optionName�e 0 
isoptional 
isOptional�d "0 optionssynopsis optionsSynopsis_ D�c�b)�a�`�_�^�]>�\B�[�Z�Y�X�WL�VO�U�T�S�Ra���Q�P���O�N�M������L	�K�JA�I`g�H����������������
�c 
cobj�b 0 b  �a 0 n  
�` 
kocl
�_ .corecnte****       ****
�^ 
reco�] 0 	shortname 	shortName�\ 0 longname longName�[ 0 	valuetype 	valueType
�Z 
ctxt�Y 0 islist isList�X 0 defaultvalue defaultValue�W $0 valueplaceholder valuePlaceholder�V $0 valuedescription valueDescription�U 
�T 
type
�S 
bool�R  a �G�F�E
�G 
errn�F�\�E  �Q �P 60 throwinvalidparametertype throwInvalidParameterType
�O 
errn�N�Y
�M 
erob
�L 
spac�K 40 _defaultvalueplaceholder _defaultValuePlaceholder�J 0 u  �I *0 _formatdefaultvalue _formatDefaultValue
�H 
lnfd�z����mvE[�k/E�Z[�l/E�Z[�m/E�ZO��,�%��,%E�Oݠ[��l kh ��&������a fa b  a a a a a %E�O >��,�&E�O��,�&E�O��,a &E�O�a ,a &E�O�a ,�&E�O�a ,�&E�W X  b  �a a �a + O�b  %b  %E�O�a   1�a    )a !a "a #�a a $Y hO�E�O�a %%�%E�Y %�E�O�a &%�%E�O�a ' �a (%�%E�Y hO�a   
��%E�Y ��a ,b  E^ O�_ )%E�O]  �a *%E�Y hO�a +%�%E�O�E�O�a ,  *�k+ -E�Y hO�a .,�%��,%E�O�_ )%�%E�O]  �a /%E�Y hO�_ )%�%E�O�a ,b   �*�k+ 0%E�Y hO� �a 1%E�Y hO�a 2 �_ 3%b  %�%_ )%E�Y h[OY�1O� r�a 4 .a 5�%E�O�b  %b  %a 6%_ 3%b  %a 7%E�Y hO�a 8 .�a 9%E�O�b  %b  %a :%_ 3%b  %a ;%E�Y hY hOa <E^ O�a = ] a >%�%a ?%E^ Y hO�a @ ] a A%�%a B%E^ Y hO�a C ] �%E^ Y hO] �lv� �D�C�Bbc�A�D $0 _formatarguments _formatArguments�C �@d�@ d  �?�>�? *0 argumentdefinitions argumentDefinitions�> 0 vtstyle vtStyle�B  b 
�=�<�;�:�9�8�7�6�5�4�= *0 argumentdefinitions argumentDefinitions�< 0 vtstyle vtStyle�; &0 argumentssynopsis argumentsSynopsis�: $0 argumentssection argumentsSection�9 0 argumentref argumentRef�8 (0 argumentdefinition argumentDefinition�7 0 	valuetype 	valueType�6 0 islist isList�5 $0 valueplaceholder valuePlaceholder�4 $0 valuedescription valueDescriptionc & &�32�2�1�0�/�.�-�,�+�*�)M�(P�'�&�%�$e���#�"��!�� ��������3 0 b  �2 0 n  
�1 
kocl
�0 
cobj
�/ .corecnte****       ****
�. 
reco�- 0 	valuetype 	valueType
�, 
ctxt�+ 0 islist isList�* 0 defaultvalue defaultValue�) $0 valueplaceholder valuePlaceholder�( $0 valuedescription valueDescription�' 

�& 
type
�% 
bool�$  e ���
� 
errn��\�  �# �" 60 throwinvalidparametertype throwInvalidParameterType�! 40 _defaultvalueplaceholder _defaultValuePlaceholder�  0 u  � *0 _formatdefaultvalue _formatDefaultValue
� 
lnfd
� 
spac�A?�jv  
��lvY hO�E�O��,�%��,%E�O�[��l kh ��&���f�b  ��a a a %E�O *��,a &E�O��,a &E�O��,�&E�O�a ,�&E�W X  b  �a a �a + O�a   *�k+ E�Y hO� �a %E�Y hO�b  %b  %�a ,%�%��,%E�O��,b   �*�k+ %E�Y hO�a   �_ !%b  %�%E�Y hO��,b   a "�%a #%E�Y hO�_ $%�%E�[OY��Oa %�%�lv� ����fg�
� .Fil:Argvnull���     ****� 0 argv  � �hi
� 
OpsDh {���� &0 optiondefinitions optionDefinitions�  �  i �jk
� 
OpsAj {��l� *0 argumentdefinitions argumentDefinitions�  l �m� m  nn �o� 0 propertyname propertyNameo ���
� 0 islist isList
� boovtrue�
  k �	p�
�	 
DefOp {���� &0 hasdefaultoptions hasDefaultOptions�  
� boovtrue�  f ����� ������������� 0 argv  � &0 optiondefinitions optionDefinitions� *0 argumentdefinitions argumentDefinitions� &0 hasdefaultoptions hasDefaultOptions�  0 oldtids oldTIDs�� (0 asocparametersdict asocParametersDict�� 0 argumentslist argumentsList�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTog  ������������������q�������������
�� 
ascr
�� 
txdl�� "0 aslistparameter asListParameter
�� 
cobj�� 0 _parseoptions _parseOptions�� (0 _adddefaultoptions _addDefaultOptions�� "0 _parsearguments _parseArguments
�� 
****�� 0 etext eTextq ����r
�� 
errn�� 0 enumber eNumberr ����s
�� 
erob�� 0 efrom eFroms ������
�� 
errt�� 
0 eto eTo��  
�� 
errn
�� 
erob
�� 
errt�� �� �� 
0 _error  � ��� ���,E�O ab  �k+ E�Ob  �k+ E�Ob  �k+ E�O*��-��m+ E[�k/E�Z[�l/E�ZO*��l+ O*���m+ O���,FO��&W 2X 
 ���,FO�b  
  )�����Y *a ����a + V� �������tu��
�� .Fil:FHlpnull��� ��� null��  �� ��vw
�� 
Namev {������� 0 commandname commandName��  w ��xy
�� 
Summx {������� $0 shortdescription shortDescription��  y ��z{
�� 
Usagz {�������� "0 commandsynopses commandSynopses��  ��  { ��|}
�� 
OpsD| {�������� &0 optiondefinitions optionDefinitions��  ��  } ��~
�� 
OpsA~ {������� *0 argumentdefinitions argumentDefinitions��  � ����� �  �� ������ 0 propertyname propertyName� �������� 0 islist isList
�� boovtrue��   ����
�� 
Docu� {������� "0 longdescription longDescription��  � ����
�� 
VFmt� {�������� 0 isstyled isStyled��  
�� boovtrue� �����
�� 
DefO� {������ &0 hasdefaultoptions hasDefaultOptions�  
� boovtrue��  t �������������������� 0 commandname commandName� $0 shortdescription shortDescription� "0 commandsynopses commandSynopses� &0 optiondefinitions optionDefinitions� *0 argumentdefinitions argumentDefinitions� "0 longdescription longDescription� 0 isstyled isStyled� &0 hasdefaultoptions hasDefaultOptions� 0 vtstyle vtStyle� 0 helptext helpText� 00 defaultoptionssynopsis defaultOptionsSynopsis�  0 optionssection optionsSection� 40 defaultargumentssynopsis defaultArgumentsSynopsis� $0 argumentssection argumentsSection� 0 textref textRef� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTou /����+7D�������]adq����������������
��$6���H��� "0 astextparameter asTextParameter� "0 aslistparameter asListParameter� (0 asbooleanparameter asBooleanParameter� 0 n  � 0 vt100 VT100� 0 b  � 0 u  � � 
� .Fil:EnVanull��� ��� null� 0 _  
� .Fil:SplPnull���     ctxt�  �  �  0 _formatoptions _formatOptions
� 
cobj� $0 _formatarguments _formatArguments
� 
kocl
� .corecnte****       ****� ���
� 
errn��\�  
� 
list� 60 throwinvalidparametertype throwInvalidParameterType
� 
lnfd� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �������b  ��l+ E�Ob  �k+ E�Ob  �k+ E�Ob  �k+ E�Ob  ��l+ E�Ob  ��l+ E�Ob  ��l+  �*jk+ 
�*kk+ 
�*�k+ 
�E�Y ���a �a �E�O�a   $ *j a ,j E�W X  a E�Y hO��,a %��,%b  %b  %�%E�O�a  �a %�%E�Y hO*���m+ E[a k/E�Z[a l/E�ZO*��l+ E[a k/E�Z[a l/E�ZO�b  %��,%a %��,%E�O�jv  ��%�%kvE�Y hO / )�[a  a l !kh �b  %b  %�%E�[OY��W X  "b  �a #a $a %�+ &O�b  %�%b  %�%E�O�a ' "�b  %��,%a (%��,%b  %�%E�Y hO�_ )%W X * +*a ,�] ] ] a -+ .V� �^�����
� .Fil:CurFnull��� ��� null�  �  � ������ 0 asocpath asocPath� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� �~�}�|�{�z�y�xu�w�v�u���t�s
�~ misccura�} 0 nsfilemanager NSFileManager�|  0 defaultmanager defaultManager�{ ,0 currentdirectorypath currentDirectoryPath
�z 
msng
�y 
errn�x�@
�w 
ctxt
�v 
psxf�u 0 etext eText� �r�q�
�r 
errn�q 0 enumber eNumber� �p�o�
�p 
erob�o 0 efrom eFrom� �n�m�l
�n 
errt�m 
0 eto eTo�l  �t �s 
0 _error  � ; *��,j+ j+ E�O��  )��l�Y hO��&�&W X 
 *졢���+ � �k��j�i���h
�k .Fil:EnVanull��� ��� null�j  �i  �  � �g�f�e�d�c
�g misccura�f 0 nsprocessinfo NSProcessInfo�e 0 processinfo processInfo�d 0 environment  
�c 
****�h ��,j+ j+ �&� �b��a�`���_
�b .Fil:RSInnull��� ��� null�a  �` �^��
�^ 
Prmt� {�]�\��] 0 
prompttext 
promptText�\  � �[��Z
�[ 
ReTo� {�Y�X�W�Y 0 isinteractive isInteractive�X  
�W boovfals�Z  � 	�V�U�T�S�R�Q�P�O�N�V 0 
prompttext 
promptText�U 0 isinteractive isInteractive�T 0 	asocstdin 	asocStdin�S 0 asocdata asocData�R 0 
asocstring 
asocString�Q 0 etext eText�P 0 enumber eNumber�O 0 efrom eFrom�N 
0 eto eTo� �M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=��<�;�:�9�8��7�6
�M misccura�L 0 nsfilehandle NSFileHandle�K :0 filehandlewithstandardinput fileHandleWithStandardInput
�J 
SLiB
�I 
ALiE�H 
�G .Fil:WSOunull���     ctxt�F 0 availabledata availableData�E 
0 length  
�D 
msng�C *0 readdatatoendoffile readDataToEndOfFile�B 0 nsstring NSString�A 	0 alloc  �@ ,0 nsutf8stringencoding NSUTF8StringEncoding�? 00 initwithdata_encoding_ initWithData_encoding_
�> 
errn�=�\
�< 
lnfd�; 0 
hassuffix_ 
hasSuffix_�: &0 substringtoindex_ substringToIndex_
�9 
ctxt�8 0 etext eText� �5�4�
�5 
errn�4 0 enumber eNumber� �3�2�
�3 
erob�2 0 efrom eFrom� �1�0�/
�1 
errt�0 
0 eto eTo�/  �7 �6 
0 _error  �_ � ���,j+ E�O� '��f�f� O�j+ E�O�j+ j  �Y hY 	�j+ 
E�O��,j+ ���,l+ E�O��  )�a la Y hO�_ k+  ��j+ kk+ E�Y hO�a &W X  *a ����a + � �./�-�,���+
�. .Fil:WSOunull���     ctxt�- 0 thetext theText�, �*��
�* 
SLiB� {�)�(�'�) 0 uselinefeeds useLinefeeds�(  
�' boovtrue� �&��%
�& 
ALiE� {�$�#�"�$  0 withlineending withLineEnding�#  
�" boovtrue�%  � 	�!� ��������! 0 thetext theText�  0 uselinefeeds useLinefeeds�  0 withlineending withLineEnding� 0 
asocstring 
asocString� 0 
asocstdout 
asocStdout� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� M���������������
�	������� "0 astextparameter asTextParameter� &0 asnsmutablestring asNSMutableString
� 
ret 
� 
lnfd� 0 location  � 
0 length  � � l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_� 0 
hassuffix_ 
hasSuffix_
� 
bool� 0 appendstring_ appendString_
� misccura� 0 nsfilehandle NSFileHandle� <0 filehandlewithstandardoutput fileHandleWithStandardOutput�
 ,0 nsutf8stringencoding NSUTF8StringEncoding�	 (0 datausingencoding_ dataUsingEncoding_� 0 
writedata_ 
writeData_� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� � ����
�  
errt�� 
0 eto eTo��  � � 
0 _error  �+ � �b  b  ��l+ k+ E�O� ,���%�j�j�j+ ��+ O���j�j�j+ ��+ Y hO�	 ��k+ 	�& ��k+ Y hO��,j+ E�O����,k+ k+ OhW X  *a ����a +  ascr  ��ޭ