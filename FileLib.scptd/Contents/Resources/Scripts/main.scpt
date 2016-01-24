FasdUAS 1.101.10   ��   ��    k             l      ��  ��   	L	F FileLib -- common file system and path string operations

Caution:

- Coercing file identifier objects to �class bmrk� currently causes AS to crash.

Notes:

- Path manipulation commands all operate on POSIX paths, as those are reliable whereas HFS paths (which are already deprecated everywhere else in OS X) are not. As POSIX paths are the default, handler names do not include the word 'POSIX' as standard; other formats (HFS/Windows/file URL) must be explicitly indicated.

- Library handlers should use LibrarySupportLib's asPOSIXPathParameter(...) to validate user-supplied alias/furl/path parameters and normalize them as POSIX path strings (if a file object is specifically required, just coerce the path string to `POSIX file`). This should insulate library handlers from the worst of the mess that is AS's file identifier types.


TO DO:

- is there a Cocoa API to fuzzily convert IANA charset names to NSString encodings? if so, would be better than hardcoded list of encoding constants

- add `alias object` (`new alias`, `file alias`, `create alias`, `alias for path`, etc?) convenience command (i.e. lightweight equivalent to `convert path PATH to alias file object`) for converting POSIX path to alias object? (analogous to `alias TEXT` specifier, except that it takes POSIX, not HFS, path); see also DateLib, which has similar debate over whether to provide `datetime` convenience command as concise version of `convert record to date` as a more robust alternative to `date TEXT` specifier 

- how does -[NSString stringWithContentsOfFile:encoding:error:] deal with BOM vs encoding param? If it always ignores BOM then, when user specifies any UTF* encoding, would it make sense to sniff file for BOM first and, if found, use that as encoding? (or add `any Unicode encoding` enum which explicitly requires BOM?)

- add `with/without byte order mark` option to `write file`? (Q. what does NSString's writeToFile... method normally do?) if NSString never includes BOM itself, BOM sequence will presumably have to be prefixed to text before converting it to NSString

- implement Windows path support in `convert path` (suspect this requires CoreFoundation calls, which is a pain)

- what is status of alias and bookmark objects in AS? (the former is deprecated everywhere else in OS X; the latter is poorly supported, with crashing bugs, and rarely appears)

     � 	 	�   F i l e L i b   - -   c o m m o n   f i l e   s y s t e m   a n d   p a t h   s t r i n g   o p e r a t i o n s 
 
 C a u t i o n : 
 
 -   C o e r c i n g   f i l e   i d e n t i f i e r   o b j e c t s   t o   � c l a s s   b m r k �   c u r r e n t l y   c a u s e s   A S   t o   c r a s h . 
 
 N o t e s : 
 
 -   P a t h   m a n i p u l a t i o n   c o m m a n d s   a l l   o p e r a t e   o n   P O S I X   p a t h s ,   a s   t h o s e   a r e   r e l i a b l e   w h e r e a s   H F S   p a t h s   ( w h i c h   a r e   a l r e a d y   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X )   a r e   n o t .   A s   P O S I X   p a t h s   a r e   t h e   d e f a u l t ,   h a n d l e r   n a m e s   d o   n o t   i n c l u d e   t h e   w o r d   ' P O S I X '   a s   s t a n d a r d ;   o t h e r   f o r m a t s   ( H F S / W i n d o w s / f i l e   U R L )   m u s t   b e   e x p l i c i t l y   i n d i c a t e d . 
 
 -   L i b r a r y   h a n d l e r s   s h o u l d   u s e   L i b r a r y S u p p o r t L i b ' s   a s P O S I X P a t h P a r a m e t e r ( . . . )   t o   v a l i d a t e   u s e r - s u p p l i e d   a l i a s / f u r l / p a t h   p a r a m e t e r s   a n d   n o r m a l i z e   t h e m   a s   P O S I X   p a t h   s t r i n g s   ( i f   a   f i l e   o b j e c t   i s   s p e c i f i c a l l y   r e q u i r e d ,   j u s t   c o e r c e   t h e   p a t h   s t r i n g   t o   ` P O S I X   f i l e ` ) .   T h i s   s h o u l d   i n s u l a t e   l i b r a r y   h a n d l e r s   f r o m   t h e   w o r s t   o f   t h e   m e s s   t h a t   i s   A S ' s   f i l e   i d e n t i f i e r   t y p e s . 
 
 
 T O   D O : 
 
 -   i s   t h e r e   a   C o c o a   A P I   t o   f u z z i l y   c o n v e r t   I A N A   c h a r s e t   n a m e s   t o   N S S t r i n g   e n c o d i n g s ?   i f   s o ,   w o u l d   b e   b e t t e r   t h a n   h a r d c o d e d   l i s t   o f   e n c o d i n g   c o n s t a n t s 
 
 -   a d d   ` a l i a s   o b j e c t `   ( ` n e w   a l i a s ` ,   ` f i l e   a l i a s ` ,   ` c r e a t e   a l i a s ` ,   ` a l i a s   f o r   p a t h ` ,   e t c ? )   c o n v e n i e n c e   c o m m a n d   ( i . e .   l i g h t w e i g h t   e q u i v a l e n t   t o   ` c o n v e r t   p a t h   P A T H   t o   a l i a s   f i l e   o b j e c t ` )   f o r   c o n v e r t i n g   P O S I X   p a t h   t o   a l i a s   o b j e c t ?   ( a n a l o g o u s   t o   ` a l i a s   T E X T `   s p e c i f i e r ,   e x c e p t   t h a t   i t   t a k e s   P O S I X ,   n o t   H F S ,   p a t h ) ;   s e e   a l s o   D a t e L i b ,   w h i c h   h a s   s i m i l a r   d e b a t e   o v e r   w h e t h e r   t o   p r o v i d e   ` d a t e t i m e `   c o n v e n i e n c e   c o m m a n d   a s   c o n c i s e   v e r s i o n   o f   ` c o n v e r t   r e c o r d   t o   d a t e `   a s   a   m o r e   r o b u s t   a l t e r n a t i v e   t o   ` d a t e   T E X T `   s p e c i f i e r   
 
 -   h o w   d o e s   - [ N S S t r i n g   s t r i n g W i t h C o n t e n t s O f F i l e : e n c o d i n g : e r r o r : ]   d e a l   w i t h   B O M   v s   e n c o d i n g   p a r a m ?   I f   i t   a l w a y s   i g n o r e s   B O M   t h e n ,   w h e n   u s e r   s p e c i f i e s   a n y   U T F *   e n c o d i n g ,   w o u l d   i t   m a k e   s e n s e   t o   s n i f f   f i l e   f o r   B O M   f i r s t   a n d ,   i f   f o u n d ,   u s e   t h a t   a s   e n c o d i n g ?   ( o r   a d d   ` a n y   U n i c o d e   e n c o d i n g `   e n u m   w h i c h   e x p l i c i t l y   r e q u i r e s   B O M ? ) 
 
 -   a d d   ` w i t h / w i t h o u t   b y t e   o r d e r   m a r k `   o p t i o n   t o   ` w r i t e   f i l e ` ?   ( Q .   w h a t   d o e s   N S S t r i n g ' s   w r i t e T o F i l e . . .   m e t h o d   n o r m a l l y   d o ? )   i f   N S S t r i n g   n e v e r   i n c l u d e s   B O M   i t s e l f ,   B O M   s e q u e n c e   w i l l   p r e s u m a b l y   h a v e   t o   b e   p r e f i x e d   t o   t e x t   b e f o r e   c o n v e r t i n g   i t   t o   N S S t r i n g 
 
 -   i m p l e m e n t   W i n d o w s   p a t h   s u p p o r t   i n   ` c o n v e r t   p a t h `   ( s u s p e c t   t h i s   r e q u i r e s   C o r e F o u n d a t i o n   c a l l s ,   w h i c h   i s   a   p a i n ) 
 
 -   w h a t   i s   s t a t u s   o f   a l i a s   a n d   b o o k m a r k   o b j e c t s   i n   A S ?   ( t h e   f o r m e r   i s   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X ;   t h e   l a t t e r   i s   p o o r l y   s u p p o r t e d ,   w i t h   c r a s h i n g   b u g s ,   a n d   r a r e l y   a p p e a r s ) 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �        s u p p o r t   ! " ! l     ��������  ��  ��   "  # $ # l      % & ' % j    �� (�� 0 _supportlib _supportLib ( N     ) ) 4    �� *
�� 
scpt * m     + + � , , " L i b r a r y S u p p o r t L i b & "  used for parameter checking    ' � - - 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g $  . / . l     ��������  ��  ��   /  0 1 0 l     ��������  ��  ��   1  2 3 2 i   ! 4 5 4 I      �� 6���� 
0 _error   6  7 8 7 o      ���� 0 handlername handlerName 8  9 : 9 o      ���� 0 etext eText :  ; < ; o      ���� 0 enumber eNumber <  = > = o      ���� 0 efrom eFrom >  ?�� ? o      ���� 
0 eto eTo��  ��   5 n     @ A @ I    �� B���� &0 throwcommanderror throwCommandError B  C D C m     E E � F F  F i l e L i b D  G H G o    ���� 0 handlername handlerName H  I J I o    ���� 0 etext eText J  K L K o    	���� 0 enumber eNumber L  M N M o   	 
���� 0 efrom eFrom N  O�� O o   
 ���� 
0 eto eTo��  ��   A o     ���� 0 _supportlib _supportLib 3  P Q P l     ��������  ��  ��   Q  R S R l     ��������  ��  ��   S  T U T l     �� V W��   V J D--------------------------------------------------------------------    W � X X � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - U  Y Z Y l     �� [ \��   [  File Read/Write; these are atomic alternatives to StandardAdditions' File Read/Write suite, with better support for text encodings (incremental read/write is almost entirely useless in practice as AS doesn't have the capabilities or smarts to do it right)    \ � ] ]    F i l e   R e a d / W r i t e ;   t h e s e   a r e   a t o m i c   a l t e r n a t i v e s   t o   S t a n d a r d A d d i t i o n s '   F i l e   R e a d / W r i t e   s u i t e ,   w i t h   b e t t e r   s u p p o r t   f o r   t e x t   e n c o d i n g s   ( i n c r e m e n t a l   r e a d / w r i t e   i s   a l m o s t   e n t i r e l y   u s e l e s s   i n   p r a c t i c e   a s   A S   d o e s n ' t   h a v e   t h e   c a p a b i l i t i e s   o r   s m a r t s   t o   d o   i t   r i g h t ) Z  ^ _ ^ l     ��������  ��  ��   _  ` a ` h   " )�� b�� (0 _nsstringencodings _NSStringEncodings b k       c c  d e d l     �� f g��   f � � note: AS can't natively represent integers larger than 2^30, but as long as they're not larger than 2^50 (1e15) then AS's real (Double) representation will reliably coerce back to integer when passed to ASOC    g � h h�   n o t e :   A S   c a n ' t   n a t i v e l y   r e p r e s e n t   i n t e g e r s   l a r g e r   t h a n   2 ^ 3 0 ,   b u t   a s   l o n g   a s   t h e y ' r e   n o t   l a r g e r   t h a n   2 ^ 5 0   ( 1 e 1 5 )   t h e n   A S ' s   r e a l   ( D o u b l e )   r e p r e s e n t a t i o n   w i l l   r e l i a b l y   c o e r c e   b a c k   t o   i n t e g e r   w h e n   p a s s e d   t o   A S O C e  i j i l     ��������  ��  ��   j  k l k l     �� m n��   m ) # TO DO: use NS...Encoding constants    n � o o F   T O   D O :   u s e   N S . . . E n c o d i n g   c o n s t a n t s l  p q p j     ��� r�� 
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
 - - - - -Q UVU l     �(�'�&�(  �'  �&  V WXW l     �%YZ�%  Y C = TO DO: option to determine UTF8 encoding from BOM, if found?   Z �[[ z   T O   D O :   o p t i o n   t o   d e t e r m i n e   U T F 8   e n c o d i n g   f r o m   B O M ,   i f   f o u n d ?X \]\ l     �$�#�"�$  �#  �"  ] ^_^ i  * -`a` I     �!bc
�! .Fil:Readnull���     fileb o      � �  0 thefile theFilec �de
� 
Typed |��f�g�  �  f o      �� 0 datatype dataType�  g l     h��h m      �
� 
ctxt�  �  e �i�
� 
Encoi |��j�k�  �  j o      �� 0 textencoding textEncoding�  k l     l��l m      �
� FEncFE01�  �  �  a Q     �mnom k    �pp qrq r    sts n   uvu I    �w�� ,0 asposixpathparameter asPOSIXPathParameterw xyx o    	�� 0 thefile theFiley z�z m   	 
{{ �||  �  �  v o    �
�
 0 _supportlib _supportLibt o      �	�	 0 	posixpath 	posixPathr }~} r    � n   ��� I    ���� "0 astypeparameter asTypeParameter� ��� o    �� 0 datatype dataType� ��� m    �� ���  a s�  �  � o    �� 0 _supportlib _supportLib� o      �� 0 datatype dataType~ ��� Z    ������ F    *��� =   "��� o     � �  0 datatype dataType� m     !��
�� 
ctxt� >  % (��� o   % &���� 0 textencoding textEncoding� m   & '��
�� FEncFEPE� l  - }���� k   - }�� ��� r   - 9��� n  - 7��� I   2 7������� 0 getencoding getEncoding� ���� o   2 3���� 0 textencoding textEncoding��  ��  � o   - 2���� (0 _nsstringencodings _NSStringEncodings� o      ���� 0 textencoding textEncoding� ��� r   : S��� n  : D��� I   = D������� T0 (stringwithcontentsoffile_encoding_error_ (stringWithContentsOfFile_encoding_error_� ��� o   = >���� 0 	posixpath 	posixPath� ��� o   > ?���� 0 textencoding textEncoding� ���� l  ? @������ m   ? @��
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
ctxt��  �'! note: AS treats `text`, `string`, and `Unicode text` as synonyms when comparing for equality, which is a little bit problematic as StdAdds' `read` command treats `string` as 'primary encoding' and `Unicode text` as UTF16; passing `primary encoding` for `using` parameter provides an 'out'   � ���B   n o t e :   A S   t r e a t s   ` t e x t ` ,   ` s t r i n g ` ,   a n d   ` U n i c o d e   t e x t `   a s   s y n o n y m s   w h e n   c o m p a r i n g   f o r   e q u a l i t y ,   w h i c h   i s   a   l i t t l e   b i t   p r o b l e m a t i c   a s   S t d A d d s '   ` r e a d `   c o m m a n d   t r e a t s   ` s t r i n g `   a s   ' p r i m a r y   e n c o d i n g '   a n d   ` U n i c o d e   t e x t `   a s   U T F 1 6 ;   p a s s i n g   ` p r i m a r y   e n c o d i n g `   f o r   ` u s i n g `   p a r a m e t e r   p r o v i d e s   a n   ' o u t '�  � k   � ��� ��� r   � ���� I  � ������
�� .rdwropenshor       file� l  � ������� c   � ���� o   � ����� 0 	posixpath 	posixPath� m   � ���
�� 
psxf��  ��  ��  � o      ���� 0 fh  � ���� Q   � ����� k   � ��� ��� l  � ����� r   � ���� I  � �����
�� .rdwrread****        ****� o   � ����� 0 fh  � �����
�� 
as  � o   � ����� 0 datatype dataType��  � o      ���� 0 	theresult 	theResult� r l TO DO: how to produce better error messages (e.g. passing wrong dataType just gives 'Parameter error.' -50)   � ��� �   T O   D O :   h o w   t o   p r o d u c e   b e t t e r   e r r o r   m e s s a g e s   ( e . g .   p a s s i n g   w r o n g   d a t a T y p e   j u s t   g i v e s   ' P a r a m e t e r   e r r o r . '   - 5 0 )� ��� I  � ������
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
0 eto eTo��  ��  ��  �  n R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� �� 
�� 
errn  o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  o I   � ������� 
0 _error    m   � � �		  r e a d   f i l e 

 o   � ����� 0 etext eText  o   � ����� 0 enumber eNumber  o   � ����� 0 efrom eFrom �� o   � ����� 
0 eto eTo��  ��  _  l     ��������  ��  ��    l     ��������  ��  ��    i  . 1 I     ��
�� .Fil:Writnull���     file o      ���� 0 thefile theFile ��
�� 
Data o      ���� 0 thedata theData ��
�� 
Type |������ ��  ��   o      ���� 0 datatype dataType��    l     !����! m      ��
�� 
ctxt��  ��   ��"��
�� 
Enco" |��~#�}$�  �~  # o      �|�| 0 textencoding textEncoding�}  $ l     %�{�z% m      �y
�y FEncFE01�{  �z  ��   Q    	&'(& k    �)) *+* r    ,-, n   ./. I    �x0�w�x ,0 asposixpathparameter asPOSIXPathParameter0 121 o    	�v�v 0 thefile theFile2 3�u3 m   	 
44 �55  �u  �w  / o    �t�t 0 _supportlib _supportLib- o      �s�s 0 	posixpath 	posixPath+ 676 r    898 n   :;: I    �r<�q�r "0 astypeparameter asTypeParameter< =>= o    �p�p 0 datatype dataType> ?�o? m    @@ �AA  a s�o  �q  ; o    �n�n 0 _supportlib _supportLib9 o      �m�m 0 datatype dataType7 B�lB Z    �CD�kEC F    *FGF =   "HIH o     �j�j 0 datatype dataTypeI m     !�i
�i 
ctxtG >  % (JKJ o   % &�h�h 0 textencoding textEncodingK m   & '�g
�g FEncFEPED k   - �LL MNM r   - AOPO n  - ?QRQ I   0 ?�fS�e�f &0 stringwithstring_ stringWithString_S T�dT l  0 ;U�c�bU n  0 ;VWV I   5 ;�aX�`�a "0 astextparameter asTextParameterX YZY o   5 6�_�_ 0 thedata theDataZ [�^[ m   6 7\\ �]]  d a t a�^  �`  W o   0 5�]�] 0 _supportlib _supportLib�c  �b  �d  �e  R n  - 0^_^ o   . 0�\�\ 0 nsstring NSString_ m   - .�[
�[ misccuraP o      �Z�Z 0 
asocstring 
asocStringN `a` r   B Nbcb n  B Lded I   G L�Yf�X�Y 0 getencoding getEncodingf g�Wg o   G H�V�V 0 textencoding textEncoding�W  �X  e o   B G�U�U (0 _nsstringencodings _NSStringEncodingsc o      �T�T 0 textencoding textEncodinga hih r   O kjkj n  O Xlml I   P X�Sn�R�S P0 &writetofile_atomically_encoding_error_ &writeToFile_atomically_encoding_error_n opo o   P Q�Q�Q 0 	posixpath 	posixPathp qrq m   Q R�P
�P boovtruer sts o   R S�O�O 0 textencoding textEncodingt u�Nu l  S Tv�M�Lv m   S T�K
�K 
obj �M  �L  �N  �R  m o   O P�J�J 0 
asocstring 
asocStringk J      ww xyx o      �I�I 0 
didsucceed 
didSucceedy z�Hz o      �G�G 0 theerror theError�H  i {�F{ Z   l �|}�E�D| H   l n~~ o   l m�C�C 0 
didsucceed 
didSucceed} R   q ��B�
�B .ascrerr ****      � **** l  � ���A�@� c   � ���� n  � ���� I   � ��?�>�=�? ,0 localizeddescription localizedDescription�>  �=  � o   � ��<�< 0 theerror theError� m   � ��;
�; 
ctxt�A  �@  � �:��
�: 
errn� n  u z��� I   v z�9�8�7�9 0 code  �8  �7  � o   u v�6�6 0 theerror theError� �5��
�5 
erob� o   } ~�4�4 0 thefile theFile� �3��2
�3 
errt� o   � ��1�1 0 datatype dataType�2  �E  �D  �F  �k  E k   � ��� ��� r   � ���� I  � ��0��
�0 .rdwropenshor       file� l  � ���/�.� c   � ���� o   � ��-�- 0 	posixpath 	posixPath� m   � ��,
�, 
psxf�/  �.  � �+��*
�+ 
perm� m   � ��)
�) boovtrue�*  � o      �(�( 0 fh  � ��'� Q   � ����� k   � ��� ��� l  � ����� I  � ��&��
�& .rdwrseofnull���     ****� o   � ��%�% 0 fh  � �$��#
�$ 
set2� m   � ��"�"  �#  � e _ important: when overwriting an existing file, make sure its previous contents are erased first   � ��� �   i m p o r t a n t :   w h e n   o v e r w r i t i n g   a n   e x i s t i n g   f i l e ,   m a k e   s u r e   i t s   p r e v i o u s   c o n t e n t s   a r e   e r a s e d   f i r s t� ��� l  � ����� I  � ��!��
�! .rdwrwritnull���     ****� o   � �� �  0 thedata theData� ���
� 
refn� o   � ��� 0 fh  � ���
� 
as  � o   � ��� 0 datatype dataType�  � 2 , TO DO: how to produce better error messages   � ��� X   T O   D O :   h o w   t o   p r o d u c e   b e t t e r   e r r o r   m e s s a g e s� ��� I  � ����
� .rdwrclosnull���     ****� o   � ��� 0 fh  �  � ��� L   � ��� o   � ��� 0 	theresult 	theResult�  � R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � k   � ��� ��� Q   � ����� I  � ����

� .rdwrclosnull���     ****� o   � ��	�	 0 fh  �
  � R      ���
� .ascrerr ****      � ****�  �  �  � ��� R   � ����
� .ascrerr ****      � ****� o   � ��� 0 etext eText� ���
� 
errn� o   � ��� 0 enumber eNumber� � ��
�  
erob� o   � ����� 0 efrom eFrom� �����
�� 
errt� o   � ����� 
0 eto eTo��  �  �'  �l  ' R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  ( I   �	������� 
0 _error  � ��� m   � ��� ���  w r i t e   f i l e� ��� o   � ���� 0 etext eText� ��� o   ���� 0 enumber eNumber� ��� o  ���� 0 efrom eFrom� ���� o  ���� 
0 eto eTo��  ��   ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   POSIX path manipulation   � ��� 0   P O S I X   p a t h   m a n i p u l a t i o n� ��� l     ��������  ��  ��  � ��� i  2 5��� I     ����
�� .Fil:ConPnull���     ****� o      ���� 0 filepath filePath� ����
�� 
From� |����������  ��  � o      ���� 0 
fromformat 
fromFormat��  � l     ������ m      ��
�� FLCTFLCP��  ��  � �����
�� 
To__� |����������  ��  � o      ���� 0 toformat toFormat��  � l     ������ m      ��
�� FLCTFLCP��  ��  ��  � l   ����� Q    �   k     Z    ��� =    	
	 l   ���� I   ��
�� .corecnte****       **** J     �� o    ���� 0 filepath filePath��   ����
�� 
kocl m    ��
�� 
ctxt��  ��  ��  
 m    ����   l    r     n    I    ������ ,0 asposixpathparameter asPOSIXPathParameter  o    ���� 0 filepath filePath �� m     �  ��  ��   o    ���� 0 _supportlib _supportLib o      ���� 0 	posixpath 	posixPath F @ assume it's a file identifier object (alias, �class furl�, etc)    � �   a s s u m e   i t ' s   a   f i l e   i d e n t i f i e r   o b j e c t   ( a l i a s ,   � c l a s s   f u r l � ,   e t c )��   l  ! � ! Z   ! �"#$%" =  ! $&'& o   ! "���� 0 
fromformat 
fromFormat' m   " #��
�� FLCTFLCP# r   ' *()( o   ' (���� 0 filepath filePath) o      ���� 0 	posixpath 	posixPath$ *+* =  - 0,-, o   - .���� 0 
fromformat 
fromFormat- m   . /��
�� FLCTFLCH+ ./. l  3 ;0120 r   3 ;343 n   3 9565 1   7 9��
�� 
psxp6 l  3 77����7 4   3 7��8
�� 
file8 o   5 6���� 0 filepath filePath��  ��  4 o      ���� 0 	posixpath 	posixPath1 � � caution: HFS path format is flawed and deprecated everywhere else in OS X (unlike POSIX path format, it can't distinguish between two volumes with the same name), but is still used by AS and a few older scriptable apps so must be supported   2 �99�   c a u t i o n :   H F S   p a t h   f o r m a t   i s   f l a w e d   a n d   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X   ( u n l i k e   P O S I X   p a t h   f o r m a t ,   i t   c a n ' t   d i s t i n g u i s h   b e t w e e n   t w o   v o l u m e s   w i t h   t h e   s a m e   n a m e ) ,   b u t   i s   s t i l l   u s e d   b y   A S   a n d   a   f e w   o l d e r   s c r i p t a b l e   a p p s   s o   m u s t   b e   s u p p o r t e d/ :;: =  > A<=< o   > ?���� 0 
fromformat 
fromFormat= m   ? @��
�� FLCTFLCW; >?> l  D H@AB@ R   D H��C��
�� .ascrerr ****      � ****C m   F GDD �EE ^ T O D O :   W i n d o w s   p a t h   c o n v e r s i o n   n o t   y e t   s u p p o r t e d��  A W Q CFURLCreateWithFileSystemPath(NULL,(CFStringRef)path,kCFURLWindowsPathStyle,0);    B �FF �   C F U R L C r e a t e W i t h F i l e S y s t e m P a t h ( N U L L , ( C F S t r i n g R e f ) p a t h , k C F U R L W i n d o w s P a t h S t y l e , 0 ) ;  ? GHG =  K NIJI o   K L���� 0 
fromformat 
fromFormatJ m   L M��
�� FLCTFLCUH K��K k   Q �LL MNM r   Q [OPO n  Q YQRQ I   T Y��S����  0 urlwithstring_ URLWithString_S T��T o   T U���� 0 filepath filePath��  ��  R n  Q TUVU o   R T���� 0 nsurl NSURLV m   Q R��
�� misccuraP o      ���� 0 asocurl asocURLN W��W Z  \ �XY����X G   \ lZ[Z =  \ _\]\ o   \ ]���� 0 asocurl asocURL] m   ] ^��
�� 
msng[ H   b h^^ n  b g_`_ I   c g�������� 0 fileurl fileURL��  ��  ` o   b c���� 0 asocurl asocURLY R   o ���ab
�� .ascrerr ****      � ****a m   } �cc �dd T I n v a l i d   d i r e c t   p a r a m e t e r   ( n o t   a   f i l e   U R L ) .b ��ef
�� 
errne m   s v�����Yf ��g��
�� 
erobg o   y z���� 0 filepath filePath��  ��  ��  ��  ��  % R   � ���hi
�� .ascrerr ****      � ****h m   � �jj �kk f I n v a l i d    f r o m    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .i ��lm
�� 
errnl m   � ������Ym ��no
�� 
erobn o   � ����� 0 
fromformat 
fromFormato ��p��
�� 
errtp m   � ���
�� 
enum��    \ V it's a text path in the user-specified format, so convert it to a standard POSIX path   ! �qq �   i t ' s   a   t e x t   p a t h   i n   t h e   u s e r - s p e c i f i e d   f o r m a t ,   s o   c o n v e r t   i t   t o   a   s t a n d a r d   P O S I X   p a t h rsr l  � ���tu��  t   sanity check   u �vv    s a n i t y   c h e c ks wxw l  � �yz{y Z  � �|}����| =   � �~~ n  � ���� 1   � ���
�� 
leng� o   � ����� 0 	posixpath 	posixPath m   � �����  } R   � �����
�� .ascrerr ****      � ****� m   � ��� ��� L I n v a l i d   d i r e c t   p a r a m e t e r   ( e m p t y   p a t h ) .� ����
�� 
errn� m   � ������Y� �����
�� 
erob� o   � ����� 0 filepath filePath��  ��  ��  z B < TO DO: what, if any, additional validation to perform here?   { ��� x   T O   D O :   w h a t ,   i f   a n y ,   a d d i t i o n a l   v a l i d a t i o n   t o   p e r f o r m   h e r e ?x ��� l  � �������  � ; 5 convert POSIX path text to the requested format/type   � ��� j   c o n v e r t   P O S I X   p a t h   t e x t   t o   t h e   r e q u e s t e d   f o r m a t / t y p e� ��� Z   ������ =  � ���� o   � ��~�~ 0 toformat toFormat� m   � ��}
�} FLCTFLCP� L   � ��� o   � ��|�| 0 	posixpath 	posixPath� ��� =  � ���� o   � ��{�{ 0 toformat toFormat� m   � ��z
�z FLCTFLCA� ��� l  � ����� L   � ��� c   � ���� c   � ���� o   � ��y�y 0 	posixpath 	posixPath� m   � ��x
�x 
psxf� m   � ��w
�w 
alis� %  returns object of type `alias`   � ��� >   r e t u r n s   o b j e c t   o f   t y p e   ` a l i a s `� ��� =  � ���� o   � ��v�v 0 toformat toFormat� m   � ��u
�u FLCTFLCX� ��� l  � ����� L   � ��� c   � ���� o   � ��t�t 0 	posixpath 	posixPath� m   � ��s
�s 
psxf� , & returns object of type `�class furl�`   � ��� L   r e t u r n s   o b j e c t   o f   t y p e   ` � c l a s s   f u r l � `� ��� =  � ���� o   � ��r�r 0 toformat toFormat� m   � ��q
�q FLCTFLCS� ��� l  �	���� L   �	�� N   ��� n   ���� 4   ��p�
�p 
file� l  ���o�n� c   ���� c   ���� o   � �m�m 0 	posixpath 	posixPath� m   �l
�l 
psxf� m  �k
�k 
ctxt�o  �n  � 1   � ��j
�j 
ascr�NH returns an _object specifier_ of type 'file'. Caution: unlike alias and �class furl� objects, this is not a true object but may be used by some applications; not to be confused with the deprecated `file specifier` type (�class fss�), although it uses the same `file TEXT` constructor. Furthermore, it uses an HFS path string so suffers the same problems as HFS paths. Also, being a specifier, requires disambiguation when used [e.g.] in an `open` command otherwise command will be dispatched to it instead of target app, e.g. `tell app "TextEdit" to open {fileSpecifierObject}`. Horribly nasty, brittle, and confusing mis-feature, in other words, but supported (though not encouraged) as an option here for sake of compatibility as there's usually some scriptable app or other API in AS that will absolutely refuse to accept anything else.   � ����   r e t u r n s   a n   _ o b j e c t   s p e c i f i e r _   o f   t y p e   ' f i l e ' .   C a u t i o n :   u n l i k e   a l i a s   a n d   � c l a s s   f u r l �   o b j e c t s ,   t h i s   i s   n o t   a   t r u e   o b j e c t   b u t   m a y   b e   u s e d   b y   s o m e   a p p l i c a t i o n s ;   n o t   t o   b e   c o n f u s e d   w i t h   t h e   d e p r e c a t e d   ` f i l e   s p e c i f i e r `   t y p e   ( � c l a s s   f s s � ) ,   a l t h o u g h   i t   u s e s   t h e   s a m e   ` f i l e   T E X T `   c o n s t r u c t o r .   F u r t h e r m o r e ,   i t   u s e s   a n   H F S   p a t h   s t r i n g   s o   s u f f e r s   t h e   s a m e   p r o b l e m s   a s   H F S   p a t h s .   A l s o ,   b e i n g   a   s p e c i f i e r ,   r e q u i r e s   d i s a m b i g u a t i o n   w h e n   u s e d   [ e . g . ]   i n   a n   ` o p e n `   c o m m a n d   o t h e r w i s e   c o m m a n d   w i l l   b e   d i s p a t c h e d   t o   i t   i n s t e a d   o f   t a r g e t   a p p ,   e . g .   ` t e l l   a p p   " T e x t E d i t "   t o   o p e n   { f i l e S p e c i f i e r O b j e c t } ` .   H o r r i b l y   n a s t y ,   b r i t t l e ,   a n d   c o n f u s i n g   m i s - f e a t u r e ,   i n   o t h e r   w o r d s ,   b u t   s u p p o r t e d   ( t h o u g h   n o t   e n c o u r a g e d )   a s   a n   o p t i o n   h e r e   f o r   s a k e   o f   c o m p a t i b i l i t y   a s   t h e r e ' s   u s u a l l y   s o m e   s c r i p t a b l e   a p p   o r   o t h e r   A P I   i n   A S   t h a t   w i l l   a b s o l u t e l y   r e f u s e   t o   a c c e p t   a n y t h i n g   e l s e .� ��� = ��� o  �i�i 0 toformat toFormat� m  �h
�h FLCTFLCH� ��� L  �� c  ��� c  ��� o  �g�g 0 	posixpath 	posixPath� m  �f
�f 
psxf� m  �e
�e 
ctxt� ��� =  ��� o  �d�d 0 toformat toFormat� m  �c
�c FLCTFLCW� ��� l #)���� R  #)�b��a
�b .ascrerr ****      � ****� m  %(�� ��� ^ T O D O :   W i n d o w s   p a t h   c o n v e r s i o n   n o t   y e t   s u p p o r t e d�a  � F @ CFURLCopyFileSystemPath((CFURLRef)url, kCFURLWindowsPathStyle);   � ��� �   C F U R L C o p y F i l e S y s t e m P a t h ( ( C F U R L R e f ) u r l ,   k C F U R L W i n d o w s P a t h S t y l e ) ;� ��� = ,/��� o  ,-�`�` 0 toformat toFormat� m  -.�_
�_ FLCTFLCU� ��^� k  2d�� ��� r  2<��� n 2:��� I  5:�]��\�] $0 fileurlwithpath_ fileURLWithPath_� ��[� o  56�Z�Z 0 	posixpath 	posixPath�[  �\  � n 25��� o  35�Y�Y 0 nsurl NSURL� m  23�X
�X misccura� o      �W�W 0 asocurl asocURL� ��� Z  =[���V�U� = =@��� o  =>�T�T 0 asocurl asocURL� m  >?�S
�S 
msng� R  CW�R��
�R .ascrerr ****      � ****� b  QV��� m  QT�� ��� f C o u l d n ' t   c o n v e r t   t h e   f o l l o w i n g   p a t h   t o   a   f i l e   U R L :  � o  TU�Q�Q 0 	posixpath 	posixPath� �P��
�P 
errn� m  GJ�O�O�Y� �N��M
�N 
erob� o  MN�L�L 0 filepath filePath�M  �V  �U  � ��K� L  \d�� c  \c   l \a�J�I n \a I  ]a�H�G�F�H  0 absolutestring absoluteString�G  �F   o  \]�E�E 0 asocurl asocURL�J  �I   m  ab�D
�D 
ctxt�K  �^  � R  g�C
�C .ascrerr ****      � **** m  {~ � b I n v a l i d    t o    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) . �B	

�B 
errn	 m  kn�A�A�Y
 �@
�@ 
erob o  qr�?�? 0 toformat toFormat �>�=
�> 
errt m  ux�<
�< 
enum�=  �   R      �;
�; .ascrerr ****      � **** o      �:�: 0 etext eText �9
�9 
errn o      �8�8 0 enumber eNumber �7
�7 
erob o      �6�6 0 efrom eFrom �5�4
�5 
errt o      �3�3 
0 eto eTo�4   I  ���2�1�2 
0 _error    m  �� �  c o n v e r t   p a t h  o  ���0�0 0 etext eText  o  ���/�/ 0 enumber eNumber  o  ���.�. 0 efrom eFrom  �-  o  ���,�, 
0 eto eTo�-  �1  � x r brings a modicum of sanity to the horrible mess that is AppleScript's file path formats and file identifier types   � �!! �   b r i n g s   a   m o d i c u m   o f   s a n i t y   t o   t h e   h o r r i b l e   m e s s   t h a t   i s   A p p l e S c r i p t ' s   f i l e   p a t h   f o r m a t s   a n d   f i l e   i d e n t i f i e r   t y p e s� "#" l     �+�*�)�+  �*  �)  # $%$ l     �(�'�&�(  �'  �&  % &'& i  6 9()( I     �%*+
�% .Fil:NorPnull���     ***** o      �$�$ 0 filepath filePath+ �#,�"
�# 
ExpR, |�!� -�.�!  �   - o      �� 0 isexpanding isExpanding�  . l     /��/ m      �
� boovfals�  �  �"  ) Q     R0120 k    @33 454 r    676 n   898 I    �:�� ,0 asposixpathparameter asPOSIXPathParameter: ;<; o    	�� 0 filepath filePath< =�= m   	 
>> �??  �  �  9 o    �� 0 _supportlib _supportLib7 o      �� 0 filepath filePath5 @A@ Z    0BC��B F    DED o    �� 0 isexpanding isExpandingE H    FF C    GHG o    �� 0 filepath filePathH m    II �JJ  /C r    ,KLK I   *�M�
� .Fil:JoiPnull���     ****M J    &NN OPO I   #���
� .Fil:CurFnull��� ��� null�  �  P Q�Q o   # $�
�
 0 filepath filePath�  �  L o      �	�	 0 filepath filePath�  �  A R�R L   1 @SS c   1 ?TUT l  1 =V��V n  1 =WXW I   9 =���� 60 stringbystandardizingpath stringByStandardizingPath�  �  X l  1 9Y��Y n  1 9Z[Z I   4 9� \���  &0 stringwithstring_ stringWithString_\ ]��] o   4 5���� 0 filepath filePath��  ��  [ n  1 4^_^ o   2 4���� 0 nsstring NSString_ m   1 2��
�� misccura�  �  �  �  U m   = >��
�� 
ctxt�  1 R      ��`a
�� .ascrerr ****      � ****` o      ���� 0 etext eTexta ��bc
�� 
errnb o      ���� 0 enumber eNumberc ��d��
�� 
errtd o      ���� 
0 eto eTo��  2 I   H R��e���� 
0 _error  e fgf m   I Jhh �ii  n o r m a l i z e   p a t hg jkj o   J K���� 0 etext eTextk lml o   K L���� 0 enumber eNumberm non o   L M���� 0 filepath filePatho p��p o   M N���� 
0 eto eTo��  ��  ' qrq l     ��������  ��  ��  r sts l     ��������  ��  ��  t uvu i  : =wxw I     ��yz
�� .Fil:JoiPnull���     ****y o      ����  0 pathcomponents pathComponentsz ��{��
�� 
Exte{ |����|��}��  ��  | o      ���� 0 fileextension fileExtension��  } l     ~����~ m       ���  ��  ��  ��  x Q     ����� k    ��� ��� r    ��� n    ��� 2   ��
�� 
cobj� n   ��� I    ������� "0 aslistparameter asListParameter� ��� o    	����  0 pathcomponents pathComponents� ���� m   	 
�� ���  ��  ��  � o    ���� 0 _supportlib _supportLib� o      ���� 0 subpaths subPaths� ��� Q    \���� k    L�� ��� Z   %������� =   ��� o    ���� 0 subpaths subPaths� J    ����  � R    !������
�� .ascrerr ****      � ****��  ��  ��  ��  � ���� X   & L����� l  6 G���� r   6 G��� n  6 C��� I   ; C������� ,0 asposixpathparameter asPOSIXPathParameter� ��� n  ; >��� 1   < >��
�� 
pcnt� o   ; <���� 0 aref aRef� ���� m   > ?�� ���  ��  ��  � o   6 ;���� 0 _supportlib _supportLib� n     ��� 1   D F��
�� 
pcnt� o   C D���� 0 aref aRef� | v TO DO: how should absolute paths after first item get handled? (e.g. Python's os.path.join discards everything prior)   � ��� �   T O   D O :   h o w   s h o u l d   a b s o l u t e   p a t h s   a f t e r   f i r s t   i t e m   g e t   h a n d l e d ?   ( e . g .   P y t h o n ' s   o s . p a t h . j o i n   d i s c a r d s   e v e r y t h i n g   p r i o r )�� 0 aref aRef� o   ) *���� 0 subpaths subPaths��  � R      ������
�� .ascrerr ****      � ****��  ��  � R   T \����
�� .ascrerr ****      � ****� m   Z [�� ��� � I n v a l i d   p a t h   c o m p o n e n t s   l i s t   ( e x p e c t e d   o n e   o r   m o r e   t e x t   a n d / o r   f i l e   i t e m s ) .� ����
�� 
errn� m   V W�����Y� �����
�� 
erob� o   X Y����  0 pathcomponents pathComponents��  � ��� r   ] i��� l  ] g������ n  ] g��� I   b g������� *0 pathwithcomponents_ pathWithComponents_� ���� o   b c���� 0 subpaths subPaths��  ��  � n  ] b��� o   ^ b���� 0 nsstring NSString� m   ] ^��
�� misccura��  ��  � o      ���� 0 asocpath asocPath� ��� r   j y��� n  j w��� I   o w������� "0 astextparameter asTextParameter� ��� o   o p���� 0 fileextension fileExtension� ���� m   p s�� ��� ( u s i n g   f i l e   e x t e n s i o n��  ��  � o   j o���� 0 _supportlib _supportLib� o      ���� 0 fileextension fileExtension� ��� Z   z �������� >   z ���� n  z ��� 1   { ��
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
ctxt��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I   � �������� 
0 _error  � ��� m   � ��� ���  j o i n   p a t h� � � o   � ����� 0 etext eText   o   � ����� 0 enumber eNumber  o   � ����� 0 efrom eFrom �� o   � ����� 
0 eto eTo��  ��  v  l     �������  ��  �   	 l     �~�}�|�~  �}  �|  	 

 i  > A I     �{
�{ .Fil:SplPnull���     ctxt o      �z�z 0 filepath filePath �y�x
�y 
Upon |�w�v�u�w  �v   o      �t�t 0 splitposition splitPosition�u   l     �s�r m      �q
�q FLSPFLSL�s  �r  �x   Q     � k    s  r     n    I    �p�o�p &0 stringwithstring_ stringWithString_ �n l    �m�l  n   !"! I    �k#�j�k ,0 asposixpathparameter asPOSIXPathParameter# $%$ o    �i�i 0 filepath filePath% &�h& m    '' �((  �h  �j  " o    �g�g 0 _supportlib _supportLib�m  �l  �n  �o   n   )*) o    �f�f 0 nsstring NSString* m    �e
�e misccura o      �d�d 0 asocpath asocPath +�c+ Z    s,-./, =   010 o    �b�b 0 splitposition splitPosition1 m    �a
�a FLSPFLSL- L    /22 J    .33 454 c    %676 l   #8�`�_8 n   #9:9 I    #�^�]�\�^ F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent�]  �\  : o    �[�[ 0 asocpath asocPath�`  �_  7 m   # $�Z
�Z 
ctxt5 ;�Y; c   % ,<=< l  % *>�X�W> n  % *?@? I   & *�V�U�T�V &0 lastpathcomponent lastPathComponent�U  �T  @ o   % &�S�S 0 asocpath asocPath�X  �W  = m   * +�R
�R 
ctxt�Y  . ABA =  2 5CDC o   2 3�Q�Q 0 splitposition splitPositionD m   3 4�P
�P FLSPFLSEB EFE L   8 IGG J   8 HHH IJI c   8 ?KLK l  8 =M�O�NM n  8 =NON I   9 =�M�L�K�M >0 stringbydeletingpathextension stringByDeletingPathExtension�L  �K  O o   8 9�J�J 0 asocpath asocPath�O  �N  L m   = >�I
�I 
ctxtJ P�HP c   ? FQRQ l  ? DS�G�FS n  ? DTUT I   @ D�E�D�C�E 0 pathextension pathExtension�D  �C  U o   ? @�B�B 0 asocpath asocPath�G  �F  R m   D E�A
�A 
ctxt�H  F VWV =  L OXYX o   L M�@�@ 0 splitposition splitPositionY m   M N�?
�? FLSPFLSAW Z�>Z L   R Z[[ c   R Y\]\ l  R W^�=�<^ n  R W_`_ I   S W�;�:�9�;  0 pathcomponents pathComponents�:  �9  ` o   R S�8�8 0 asocpath asocPath�=  �<  ] m   W X�7
�7 
list�>  / R   ] s�6ab
�6 .ascrerr ****      � ****a m   o rcc �dd b I n v a l i d    a t    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .b �5ef
�5 
errne m   _ b�4�4�Yf �3gh
�3 
erobg o   e f�2�2 0 matchformat matchFormath �1i�0
�1 
errti m   i l�/
�/ 
enum�0  �c   R      �.jk
�. .ascrerr ****      � ****j o      �-�- 0 etext eTextk �,lm
�, 
errnl o      �+�+ 0 enumber eNumberm �*no
�* 
erobn o      �)�) 0 efrom eFromo �(p�'
�( 
errtp o      �&�& 
0 eto eTo�'   I   { ��%q�$�% 
0 _error  q rsr m   | tt �uu  s p l i t   p a t hs vwv o    ��#�# 0 etext eTextw xyx o   � ��"�" 0 enumber eNumbery z{z o   � ��!�! 0 efrom eFrom{ |� | o   � ��� 
0 eto eTo�   �$   }~} l     ����  �  �  ~ � l     ����  �  �  � ��� l     ����  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ����  � S M Shell Script Support handlers for use in AppleScripts that run via osascript   � ��� �   S h e l l   S c r i p t   S u p p o r t   h a n d l e r s   f o r   u s e   i n   A p p l e S c r i p t s   t h a t   r u n   v i a   o s a s c r i p t� ��� l     ����  �  �  � ��� l     ���� j   B F���  0 kargvusererror kArgvUserError� m   B E��'� � � error code used to indicate the shell script's user supplied invalid command line options (errors due to bugs in invalid option/argument definitions supplied by shell script author use standard AS error codes)   � ����   e r r o r   c o d e   u s e d   t o   i n d i c a t e   t h e   s h e l l   s c r i p t ' s   u s e r   s u p p l i e d   i n v a l i d   c o m m a n d   l i n e   o p t i o n s   ( e r r o r s   d u e   t o   b u g s   i n   i n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n s   s u p p l i e d   b y   s h e l l   s c r i p t   a u t h o r   u s e   s t a n d a r d   A S   e r r o r   c o d e s )� ��� l     ����  �  �  � ��� h   G R��� 0 novalue NoValue� l     ����  � J D unique constant used to indicate no defaultValue property was given   � ��� �   u n i q u e   c o n s t a n t   u s e d   t o   i n d i c a t e   n o   d e f a u l t V a l u e   p r o p e r t y   w a s   g i v e n� ��� l     ���
�  �  �
  � ��� j   S [�	��	 
0 lf2 LF2� b   S Z��� 1   S V�
� 
lnfd� 1   V Y�
� 
lnfd� ��� j   \ `��� 0 indent1 Indent1� m   \ _�� ���     � ��� j   a e��� 0 indent2 Indent2� m   a d�� ���             � ��� l     ����  �  �  � ��� l     �� ���  �   ��  � ��� l     ��������  ��  ��  � ��� i  f i��� I      ������� 0 vt100 VT100� ���� o      ���� 0 
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
 	� ���� L     �� b     ��� b     	��� b     ��� l    ������ 5     �����
�� 
cha � m    ���� 
�� kfrmID  ��  ��  � m    �� ���  [� o    ���� 0 
formatcode 
formatCode� m   	 
�� ���  m��  � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ������  � - ' convert raw args to supported AS types   � ��� N   c o n v e r t   r a w   a r g s   t o   s u p p o r t e d   A S   t y p e s� ��� l     ��������  ��  ��  � ��� i  j m��� I      ������� 0 _unpackvalue _unpackValue� ��� o      ���� 0 thevalue theValue� ���� o      ���� $0 definitionrecord definitionRecord��  ��  � k    ��� ��� l     ������  � � � note that only ASOC-friendly AS types are supported here since NSDictionaries are used as temporary storage for parsed options and arguments   � ���   n o t e   t h a t   o n l y   A S O C - f r i e n d l y   A S   t y p e s   a r e   s u p p o r t e d   h e r e   s i n c e   N S D i c t i o n a r i e s   a r e   u s e d   a s   t e m p o r a r y   s t o r a g e   f o r   p a r s e d   o p t i o n s   a n d   a r g u m e n t s� ��� r     ��� c     ��� n    ��� o    ���� 0 	valuetype 	valueType� o     ���� $0 definitionrecord definitionRecord� m    ��
�� 
type� o      ���� 0 	valuetype 	valueType� ��� Z   ������ =   ��� o    	���� 0 	valuetype 	valueType� m   	 
��
�� 
ctxt� r    ��� o    ���� 0 thevalue theValue� o      ���� 0 	theresult 	theResult� ��� E   ��� J    ��    m    ��
�� 
long  m    ��
�� 
doub �� m    ��
�� 
nmbr��  � J     �� o    ���� 0 	valuetype 	valueType��  �  l    �	
	 k     �  r     - n    + I   ' +�������� 0 init  ��  ��   n    ' I   # '�������� 	0 alloc  ��  ��   n    # o   ! #���� &0 nsnumberformatter NSNumberFormatter m     !��
�� misccura o      ���� 0 asocformatter asocFormatter  n  . 6 I   / 6������ "0 setnumberstyle_ setNumberStyle_ �� l  / 2���� n  / 2 o   0 2���� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle m   / 0��
�� misccura��  ��  ��  ��   o   . /���� 0 asocformatter asocFormatter  !  n  7 C"#" I   8 C��$���� 0 
setlocale_ 
setLocale_$ %��% l  8 ?&����& n  8 ?'(' I   ; ?�������� 0 systemlocale systemLocale��  ��  ( n  8 ;)*) o   9 ;���� 0 nslocale NSLocale* m   8 9��
�� misccura��  ��  ��  ��  # o   7 8���� 0 asocformatter asocFormatter! +,+ r   D L-.- n  D J/0/ I   E J��1���� &0 numberfromstring_ numberFromString_1 2��2 o   E F���� 0 thevalue theValue��  ��  0 o   D E���� 0 asocformatter asocFormatter. o      ���� 0 
asocresult 
asocResult, 343 Z  M i56����5 =  M R787 o   M N���� 0 
asocresult 
asocResult8 m   N Q��
�� 
msng6 R   U e��9:
�� .ascrerr ****      � ****9 b   _ d;<; m   _ b== �>> ( N o t   a   v a l i d   n u m b e r :  < o   b c���� 0 thevalue theValue: ��?��
�� 
errn? o   Y ^����  0 kargvusererror kArgvUserError��  ��  ��  4 @A@ r   j qBCB c   j oDED o   j k���� 0 
asocresult 
asocResultE m   k n��
�� 
****C o      ���� 0 	theresult 	theResultA F��F Z   r �GH����G =  r uIJI o   r s���� 0 	valuetype 	valueTypeJ m   s t��
�� 
longH k   x �KK LML Z  x �NO����N >   x }PQP `   x {RSR o   x y���� 0 	theresult 	theResultS m   y z���� Q m   { |����  O R   � ���TU
�� .ascrerr ****      � ****T b   � �VWV m   � �XX �YY * N o t   a   v a l i d   i n t e g e r :  W o   � ����� 0 thevalue theValueU ��Z��
�� 
errnZ o   � �����  0 kargvusererror kArgvUserError��  ��  ��  M [��[ r   � �\]\ c   � �^_^ o   � ����� 0 	theresult 	theResult_ m   � ���
�� 
long] o      ���� 0 	theresult 	theResult��  ��  ��  ��  
 6 0 note: decimal numbers must be in canonical form    �`` `   n o t e :   d e c i m a l   n u m b e r s   m u s t   b e   i n   c a n o n i c a l   f o r m aba E  � �cdc J   � �ee fgf m   � ���
�� 
furlg hih m   � ���
�� 
alisi jkj m   � ���
�� 
filek l��l m   � ���
�� 
psxf��  d J   � �mm n��n o   � ����� 0 	valuetype 	valueType��  b opo l  �Gqrsq k   �Gtt uvu l  � ���wx��  w   expand/normalize path   x �yy ,   e x p a n d / n o r m a l i z e   p a t hv z{z Z   �|}����| H   � �~~ C   � �� o   � ����� 0 thevalue theValue� m   � ��� ���  /} k   � ��� ��� r   � ���� n  � ���� I   � ��������� ,0 currentdirectorypath currentDirectoryPath��  ��  � n  � ���� I   � ���������  0 defaultmanager defaultManager��  ��  � n  � ���� o   � ����� 0 nsfilemanager NSFileManager� m   � ���
�� misccura� o      �� 0 basepath basePath� ��� Z  � ����~�}� =  � ���� o   � ��|�| 0 basepath basePath� m   � ��{
�{ 
msng� R   � ��z��
�z .ascrerr ****      � ****� b   � ���� m   � ��� ��� � C a n ' t   e x p a n d   r e l a t i v e   f i l e   p a t h   ( c u r r e n t   w o r k i n g   d i r e c t o r y   i s   u n k n o w n ) :  � o   � ��y�y 0 thevalue theValue� �x��w
�x 
errn� o   � ��v�v  0 kargvusererror kArgvUserError�w  �~  �}  � ��u� r   � ���� l  � ���t�s� n  � ���� I   � ��r��q�r *0 pathwithcomponents_ pathWithComponents_� ��p� J   � ��� ��� o   � ��o�o 0 basepath basePath� ��n� o   � ��m�m 0 thevalue theValue�n  �p  �q  � n  � ���� o   � ��l�l 0 nsstring NSString� m   � ��k
�k misccura�t  �s  � o      �j�j 0 thevalue theValue�u  ��  ��  { ��� r  ��� c  ��� c  ��� l ��i�h� n ��� I  �g�f�e�g 60 stringbystandardizingpath stringByStandardizingPath�f  �e  � l ��d�c� n ��� I  �b��a�b &0 stringwithstring_ stringWithString_� ��`� o  �_�_ 0 thevalue theValue�`  �a  � n ��� o  �^�^ 0 nsstring NSString� m  �]
�] misccura�d  �c  �i  �h  � m  �\
�\ 
ctxt� m  �[
�[ 
psxf� o      �Z�Z 0 	theresult 	theResult� ��Y� Q  G���� Z /���X�W� = !��� o  �V�V 0 	valuetype 	valueType� m   �U
�U 
alis� r  $+��� c  $)��� o  $%�T�T 0 	theresult 	theResult� m  %(�S
�S 
alis� o      �R�R 0 	theresult 	theResult�X  �W  � R      �Q�P�
�Q .ascrerr ****      � ****�P  � �O��N
�O 
errn� d      �� m      �M�M +�N  � l 7G���� R  7G�L��
�L .ascrerr ****      � ****� b  AF��� m  AD�� ��� 2 F i l e   p a t h   d o e s n  t   e x i s t :  � o  DE�K�K 0 thevalue theValue� �J��I
�J 
errn� o  ;@�H�H  0 kargvusererror kArgvUserError�I  �   file not found   � ���    f i l e   n o t   f o u n d�Y  r � � note: `file` is treated as synonym for `POSIX file` here, as actual 'file' object specifiers are both mostly pointless and much more problematic due to using HFS paths   s ���P   n o t e :   ` f i l e `   i s   t r e a t e d   a s   s y n o n y m   f o r   ` P O S I X   f i l e `   h e r e ,   a s   a c t u a l   ' f i l e '   o b j e c t   s p e c i f i e r s   a r e   b o t h   m o s t l y   p o i n t l e s s   a n d   m u c h   m o r e   p r o b l e m a t i c   d u e   t o   u s i n g   H F S   p a t h sp ��� = JO��� o  JK�G�G 0 	valuetype 	valueType� m  KN�F
�F 
bool� ��E� l R����� P  R���D�� Z  Y������ E Ym��� J  Yi�� ��� m  Y\�� ���  t r u e� ��� m  \_�� ���  y e s� ��� m  _b�� ���  t� ��C� m  be�� ���  y�C  � J  il�� ��B� o  ij�A�A 0 thevalue theValue�B  � l pr���� L  pr�� m  pq�@
�@ boovtrue� 7 1 TO DO: what should constitute 'true' vs 'false'?   � ��� b   T O   D O :   w h a t   s h o u l d   c o n s t i t u t e   ' t r u e '   v s   ' f a l s e ' ?� ��� E u�� � J  u�  m  ux � 
 f a l s e  m  x{ �		  n o 

 m  {~ �  f �? m  ~� �  n�?    J  �� �> o  ���=�= 0 thevalue theValue�>  � �< L  �� m  ���;
�; boovfals�<  � R  ���:
�: .ascrerr ****      � **** b  �� m  �� � 2 N o t    y e s    o r    n o    ( Y | N ) :   o  ���9�9 0 thevalue theValue �8�7
�8 
errn o  ���6�6  0 kargvusererror kArgvUserError�7  �D  � �5�4
�5 conscase�4  � W Q may be used by boolean argument definitions (boolean options don't take a value)   � � �   m a y   b e   u s e d   b y   b o o l e a n   a r g u m e n t   d e f i n i t i o n s   ( b o o l e a n   o p t i o n s   d o n ' t   t a k e   a   v a l u e )�E  � R  ���3
�3 .ascrerr ****      � **** m  �� �   r I n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n   ( n o t   a n   a l l o w e d   t y p e ) . �2!"
�2 
errn! m  ���1�1�Y" �0#$
�0 
erob# l ��%�/�.% N  ��&& n  ��'(' o  ���-�- 0 	valuetype 	valueType( o  ���,�, $0 definitionrecord definitionRecord�/  �.  $ �+)�*
�+ 
errt) m  ���)
�) 
type�*  � *�(* L  ��++ o  ���'�' 0 	theresult 	theResult�(  � ,-, l     �&�%�$�&  �%  �$  - ./. l     �#�"�!�#  �"  �!  / 010 i  n q232 I      � 4��  40 _defaultvalueplaceholder _defaultValuePlaceholder4 5�5 o      �� $0 definitionrecord definitionRecord�  �  3 l    g6786 k     g99 :;: r     <=< c     >?> n    @A@ o    �� 0 	valuetype 	valueTypeA o     �� $0 definitionrecord definitionRecord? m    �
� 
type= o      �� 0 	valuetype 	valueType; BCB l   �DE�  D ^ X note: the following conditional block should implement same branches as in _unpackValue   E �FF �   n o t e :   t h e   f o l l o w i n g   c o n d i t i o n a l   b l o c k   s h o u l d   i m p l e m e n t   s a m e   b r a n c h e s   a s   i n   _ u n p a c k V a l u eC G�G Z    gHIJKH =   LML o    	�� 0 	valuetype 	valueTypeM m   	 
�
� 
ctxtI L    NN m    OO �PP  T E X TJ QRQ E   STS J    UU VWV m    �
� 
longW XYX m    �
� 
doubY Z�Z m    �
� 
nmbr�  T J    [[ \�\ o    �� 0 	valuetype 	valueType�  R ]^] Z    ,_`�a_ =   "bcb o     �� 0 	valuetype 	valueTypec m     !�
� 
long` L   % 'dd m   % &ee �ff  I N T E G E R�  a L   * ,gg m   * +hh �ii  N U M B E R^ jkj E  / 9lml J   / 5nn opo m   / 0�
� 
furlp qrq m   0 1�

�
 
alisr sts m   1 2�	
�	 
filet u�u m   2 3�
� 
psxf�  m J   5 8vv w�w o   5 6�� 0 	valuetype 	valueType�  k xyx L   < >zz m   < ={{ �||  F I L Ey }~} =  A D� o   A B�� 0 	valuetype 	valueType� m   B C�
� 
bool~ ��� L   G K�� m   G J�� ���  Y | N�  K R   N g���
� .ascrerr ****      � ****� m   c f�� ��� r I n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n   ( n o t   a n   a l l o w e d   t y p e ) .� � ��
�  
errn� m   R U�����Y� ����
�� 
erob� l  X \������ N   X \�� n   X [��� o   Y [���� 0 	valuetype 	valueType� o   X Y���� $0 definitionrecord definitionRecord��  ��  � �����
�� 
errt� m   _ `��
�� 
type��  �  7 J D returns appropriate default placeholderValue according to valueType   8 ��� �   r e t u r n s   a p p r o p r i a t e   d e f a u l t   p l a c e h o l d e r V a l u e   a c c o r d i n g   t o   v a l u e T y p e1 ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  r u��� I      ������� *0 _formatdefaultvalue _formatDefaultValue� ���� o      ���� $0 definitionrecord definitionRecord��  ��  � l    ����� k     ��� ��� r     ��� n     ��� o    ���� 0 defaultvalue defaultValue� o     ���� $0 definitionrecord definitionRecord� o      ���� 0 defaultvalue defaultValue� ��� Z   (������� F    ��� >    ��� l   ������ I   ����
�� .corecnte****       ****� J    	�� ���� o    ���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   
 ��
�� 
list��  ��  ��  � m    ����  � =    ��� n    ��� 1    ��
�� 
leng� o    ���� 0 defaultvalue defaultValue� m    ���� � r    $��� n    "��� 4    "���
�� 
cobj� m     !���� � o    ���� 0 defaultvalue defaultValue� o      ���� 0 defaultvalue defaultValue��  ��  � ��� Z   ) ������ >   ) 4��� l  ) 2������ I  ) 2����
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
setLocale_� ���� l  s |������ n  s |� � I   x |�������� 0 systemlocale systemLocale��  ��    n  s x o   t x���� 0 nslocale NSLocale m   s t��
�� misccura��  ��  ��  ��  � o   r s���� 0 asocformatter asocFormatter� �� r   � � c   � � l  � ����� n  � �	
	 I   � ������� &0 stringfromnumber_ stringFromNumber_ �� o   � ����� 0 defaultvalue defaultValue��  ��  
 o   � ����� 0 asocformatter asocFormatter��  ��   m   � ���
�� 
**** o      ���� 0 defaulttext defaultText��  �  G   � � >   � � l  � ����� I  � ���
�� .corecnte****       **** J   � � �� o   � ����� 0 defaultvalue defaultValue��   ����
�� 
kocl m   � ���
�� 
furl��  ��  ��   m   � �����   >   � � l  � ����� I  � ���
�� .corecnte****       **** J   � � �� o   � ����� 0 defaultvalue defaultValue��   �� ��
�� 
kocl  m   � ���
�� 
alis��  ��  ��   m   � �����   !"! r   � �#$# n   � �%&% 1   � ���
�� 
psxp& o   � ����� 0 defaultvalue defaultValue$ o      ���� 0 defaulttext defaultText" '(' =  � �)*) o   � ��� 0 defaultvalue defaultValue* m   � ��~
�~ boovtrue( +,+ r   � �-.- m   � �// �00  Y. o      �}�} 0 defaulttext defaultText, 121 =  � �343 o   � ��|�| 0 defaultvalue defaultValue4 m   � ��{
�{ boovfals2 5�z5 r   � �676 m   � �88 �99  N7 o      �y�y 0 defaulttext defaultText�z  � L   � �:: m   � �;; �<<  � =�x= L   � �>> b   � �?@? b   � �ABA m   � �CC �DD  D e f a u l t :   B o   � ��w�w 0 defaulttext defaultText@ m   � �EE �FF    �x  � G A formats default value for inclusion in OPTIONS/ARGUMENTS section   � �GG �   f o r m a t s   d e f a u l t   v a l u e   f o r   i n c l u s i o n   i n   O P T I O N S / A R G U M E N T S   s e c t i o n� HIH l     �v�u�t�v  �u  �t  I JKJ l     �sLM�s  L  -----   M �NN 
 - - - - -K OPO l     �rQR�r  Q   parse ARGV   R �SS    p a r s e   A R G VP TUT l     �q�p�o�q  �p  �o  U VWV i  v yXYX I      �nZ�m�n (0 _buildoptionstable _buildOptionsTableZ [�l[ o      �k�k &0 optiondefinitions optionDefinitions�l  �m  Y k     �\\ ]^] l     �j_`�j  _ � � create a case-sensitive lookup table of all short and long option names (e.g. "-a", "-A", "-o", "--output-file", etc); used by _parseOptions() to obtain the definition record for each option it encounters   ` �aa�   c r e a t e   a   c a s e - s e n s i t i v e   l o o k u p   t a b l e   o f   a l l   s h o r t   a n d   l o n g   o p t i o n   n a m e s   ( e . g .   " - a " ,   " - A " ,   " - o " ,   " - - o u t p u t - f i l e " ,   e t c ) ;   u s e d   b y   _ p a r s e O p t i o n s ( )   t o   o b t a i n   t h e   d e f i n i t i o n   r e c o r d   f o r   e a c h   o p t i o n   i t   e n c o u n t e r s^ bcb r     	ded n    fgf I    �i�h�g�i 0 
dictionary  �h  �g  g n    hih o    �f�f *0 nsmutabledictionary NSMutableDictionaryi m     �e
�e misccurae o      �d�d 20 optiondefinitionsbyname optionDefinitionsByNamec jkj X   
 �l�cml k    �nn opo l   6qrsq r    6tut b    4vwv l   x�b�ax c    yzy n   {|{ 1    �`
�` 
pcnt| o    �_�_ 0 	optionref 	optionRefz m    �^
�^ 
reco�b  �a  w K    3}} �]~�] 0 	shortname 	shortName~ m     !�� ���   �\���\ 0 longname longName� m   " #�� ���  � �[���[ 0 propertyname propertyName� m   $ %�� ���  � �Z���Z 0 	valuetype 	valueType� m   & '�Y
�Y 
ctxt� �X���X 0 islist isList� m   * +�W
�W boovfals� �V��U�V 0 defaultvalue defaultValue� m   . /�T
�T boovfals�U  u o      �S�S $0 optiondefinition optionDefinitionr 5 / this defaultValue is only used by boolean opts   s ��� ^   t h i s   d e f a u l t V a l u e   i s   o n l y   u s e d   b y   b o o l e a n   o p t sp ��� Z   7 q����R� >  7 >��� n  7 :��� o   8 :�Q�Q 0 	shortname 	shortName� o   7 8�P�P $0 optiondefinition optionDefinition� m   : =�� ���  � l  A N��O�N� n  A N��� I   B N�M��L�M &0 setobject_forkey_ setObject_forKey_� ��� o   B C�K�K $0 optiondefinition optionDefinition� ��J� l  C J��I�H� b   C J��� m   C F�� ���  -� n  F I��� o   G I�G�G 0 	shortname 	shortName� o   F G�F�F $0 optiondefinition optionDefinition�I  �H  �J  �L  � o   A B�E�E 20 optiondefinitionsbyname optionDefinitionsByName�O  �N  � ��� =  Q X��� n  Q T��� o   R T�D�D 0 longname longName� o   Q R�C�C $0 optiondefinition optionDefinition� m   T W�� ���  � ��B� l  [ m���� R   [ m�A��
�A .ascrerr ****      � ****� m   i l�� ��� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   n o n - e m p t y   s h o r t N a m e   a n d / o r   l o n g N a m e   p r o p e r t y ) .� �@��
�@ 
errn� m   _ b�?�?�Y� �>��=
�> 
erob� o   e f�<�< 0 	optionref 	optionRef�=  � @ : if it doesn't have a short name, it must have a long name   � ��� t   i f   i t   d o e s n ' t   h a v e   a   s h o r t   n a m e ,   i t   m u s t   h a v e   a   l o n g   n a m e�B  �R  � ��;� Z   r �����:� >  r y��� n  r u��� o   s u�9�9 0 longname longName� o   r s�8�8 $0 optiondefinition optionDefinition� m   u x�� ���  � l  | ���7�6� n  | ���� I   } ��5��4�5 &0 setobject_forkey_ setObject_forKey_� ��� o   } ~�3�3 $0 optiondefinition optionDefinition� ��2� l  ~ ���1�0� b   ~ ���� m   ~ ��� ���  - -� n  � ���� o   � ��/�/ 0 longname longName� o   � ��.�. $0 optiondefinition optionDefinition�1  �0  �2  �4  � o   | }�-�- 20 optiondefinitionsbyname optionDefinitionsByName�7  �6  � ��� =  � ���� n  � ���� o   � ��,�, 0 propertyname propertyName� o   � ��+�+ $0 optiondefinition optionDefinition� m   � ��� ���  � ��*� R   � ��)��
�) .ascrerr ****      � ****� m   � ��� ��� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   p r o p e r t y N a m e   a n d / o r   l o n g N a m e   p r o p e r t y ) .� �(��
�( 
errn� m   � ��'�'�Y� �&��%
�& 
erob� o   � ��$�$ 0 	optionref 	optionRef�%  �*  �:  �;  �c 0 	optionref 	optionRefm o    �#�# &0 optiondefinitions optionDefinitionsk ��"� L   � ��� o   � ��!�! 20 optiondefinitionsbyname optionDefinitionsByName�"  W ��� l     � ���   �  �  � ��� l     ����  �  �  � ��� i  z }��� I      ���� 0 _parseoptions _parseOptions� ��� o      �� 0 rawarguments rawArguments� ��� o      �� &0 optiondefinitions optionDefinitions� ��� o      �� &0 hasdefaultoptions hasDefaultOptions�  �  � k    p�� ��� l     ����  �oi given a list of raw arguments passed to script's run handler, extract those items that are command option names and (where relevant) their corresponding values, converting those values to the required type and returning an NSMutableDictionary of option name-value pairs plus a list of any remaining (i.e. non-option) arguments to be passed to _parseArguments()   � ����   g i v e n   a   l i s t   o f   r a w   a r g u m e n t s   p a s s e d   t o   s c r i p t ' s   r u n   h a n d l e r ,   e x t r a c t   t h o s e   i t e m s   t h a t   a r e   c o m m a n d   o p t i o n   n a m e s   a n d   ( w h e r e   r e l e v a n t )   t h e i r   c o r r e s p o n d i n g   v a l u e s ,   c o n v e r t i n g   t h o s e   v a l u e s   t o   t h e   r e q u i r e d   t y p e   a n d   r e t u r n i n g   a n   N S M u t a b l e D i c t i o n a r y   o f   o p t i o n   n a m e - v a l u e   p a i r s   p l u s   a   l i s t   o f   a n y   r e m a i n i n g   ( i . e .   n o n - o p t i o n )   a r g u m e n t s   t o   b e   p a s s e d   t o   _ p a r s e A r g u m e n t s ( )� ��� l     ����  � 6 0 first build a lookup table of all known options   � ��� `   f i r s t   b u i l d   a   l o o k u p   t a b l e   o f   a l l   k n o w n   o p t i o n s� 	 		  r     			 I     �	�� (0 _buildoptionstable _buildOptionsTable	 	�	 o    �� &0 optiondefinitions optionDefinitions�  �  	 o      �� 20 optiondefinitionsbyname optionDefinitionsByName	 			 r   	 				 n  	 	
		
 I    ���� 0 
dictionary  �  �  	 n  	 			 o   
 �
�
 *0 nsmutabledictionary NSMutableDictionary	 m   	 
�	
�	 misccura		 o      �� (0 asocparametersdict asocParametersDict	 			 l   				 r    			 m    		 �		  =	 n     			 1    �
� 
txdl	 1    �
� 
ascr	 P J note: a long option can use a space or '=' to separate its name and value   	 �		 �   n o t e :   a   l o n g   o p t i o n   c a n   u s e   a   s p a c e   o r   ' = '   t o   s e p a r a t e   i t s   n a m e   a n d   v a l u e	 			 l   �		�  	 R L consume raw arguments list until it is empty or a non-option is encountered   	 �		 �   c o n s u m e   r a w   a r g u m e n t s   l i s t   u n t i l   i t   i s   e m p t y   o r   a   n o n - o p t i o n   i s   e n c o u n t e r e d	 		 	 W   j	!	"	! k   "e	#	# 	$	%	$ r   " (	&	'	& n   " &	(	)	( 4  # &�	*
� 
cobj	* m   $ %�� 	) o   " #�� 0 rawarguments rawArguments	' o      �� 0 thearg theArg	% 	+	,	+ Z   ) �	-	.	/	0	- C   ) ,	1	2	1 o   ) *� �  0 thearg theArg	2 m   * +	3	3 �	4	4  - -	. l  / m	5	6	7	5 k   / m	8	8 	9	:	9 Z   / @	;	<����	; =  / 2	=	>	= o   / 0���� 0 thearg theArg	> m   0 1	?	? �	@	@  - -	< l  5 <	A	B	C	A k   5 <	D	D 	E	F	E r   5 :	G	H	G n   5 8	I	J	I 1   6 8��
�� 
rest	J o   5 6���� 0 rawarguments rawArguments	H o      ���� 0 rawarguments rawArguments	F 	K��	K  S   ; <��  	B i c double-hypens terminates the option list, so anything left in rawArguments is positional arguments   	C �	L	L �   d o u b l e - h y p e n s   t e r m i n a t e s   t h e   o p t i o n   l i s t ,   s o   a n y t h i n g   l e f t   i n   r a w A r g u m e n t s   i s   p o s i t i o n a l   a r g u m e n t s��  ��  	: 	M	N	M l  A G	O	P	Q	O r   A G	R	S	R n   A E	T	U	T 4  B E��	V
�� 
citm	V m   C D���� 	U o   A B���� 0 thearg theArg	S o      ���� 0 
optionname 
optionName	P   get "--NAME"   	Q �	W	W    g e t   " - - N A M E "	N 	X��	X Z   H m	Y	Z��	[	Y ?   H Q	\	]	\ l  H O	^����	^ I  H O��	_	`
�� .corecnte****       ****	_ o   H I���� 0 thearg theArg	` ��	a��
�� 
kocl	a m   J K��
�� 
citm��  ��  ��  	] m   O P���� 	Z l  T e	b	c	d	b r   T e	e	f	e n   T `	g	h	g 7  U `��	i	j
�� 
ctxt	i l  Y \	k����	k 4   Y \��	l
�� 
citm	l m   Z [���� ��  ��  	j m   ] _������	h o   T U���� 0 thearg theArg	f n      	m	n	m 4  a d��	o
�� 
cobj	o m   b c���� 	n o   ` a���� 0 rawarguments rawArguments	c * $ put "VALUE" back on stack for later   	d �	p	p H   p u t   " V A L U E "   b a c k   o n   s t a c k   f o r   l a t e r��  	[ l  h m	q	r	s	q r   h m	t	u	t n   h k	v	w	v 1   i k��
�� 
rest	w o   h i���� 0 rawarguments rawArguments	u o      ���� 0 rawarguments rawArguments	r ( " remove the option name from stack   	s �	x	x D   r e m o v e   t h e   o p t i o n   n a m e   f r o m   s t a c k��  	6 < 6 found "--[NAME[=VALUE]]" (NAME is a long option name)   	7 �	y	y l   f o u n d   " - - [ N A M E [ = V A L U E ] ] "   ( N A M E   i s   a   l o n g   o p t i o n   n a m e )	/ 	z	{	z C   p s	|	}	| o   p q���� 0 thearg theArg	} m   q r	~	~ �		  -	{ 	���	� l  v �	�	�	�	� k   v �	�	� 	�	�	� l  v �	�	�	�	� Z  v �	�	�����	� =  v {	�	�	� o   v w���� 0 thearg theArg	� m   w z	�	� �	�	�  -	�  S   ~ ��  ��  	� W Q it's not an option, so treat it and rest of rawArguments as positional arguments   	� �	�	� �   i t ' s   n o t   a n   o p t i o n ,   s o   t r e a t   i t   a n d   r e s t   o f   r a w A r g u m e n t s   a s   p o s i t i o n a l   a r g u m e n t s	� 	�	�	� l  � �	�	�	�	� r   � �	�	�	� n   � �	�	�	� 7  � ���	�	�
�� 
ctxt	� m   � ����� 	� m   � ����� 	� o   � ����� 0 thearg theArg	� o      ���� 0 
optionname 
optionName	�  	 get "-N"   	� �	�	�    g e t   " - N "	� 	���	� Z   � �	�	���	�	� ?   � �	�	�	� n  � �	�	�	� 1   � ���
�� 
leng	� o   � ����� 0 thearg theArg	� m   � ����� 	� l  � �	�	�	�	� k   � �	�	� 	�	�	� r   � �	�	�	� n   � �	�	�	� 7  � ���	�	�
�� 
ctxt	� m   � ����� 	� m   � �������	� o   � ����� 0 thearg theArg	� n      	�	�	� 4  � ���	�
�� 
cobj	� m   � ����� 	� o   � ����� 0 rawarguments rawArguments	� 	�	�	� r   � �	�	�	� n  � �	�	�	� I   � ���	����� 0 objectforkey_ objectForKey_	� 	���	� o   � ����� 0 
optionname 
optionName��  ��  	� o   � ����� 20 optiondefinitionsbyname optionDefinitionsByName	� o      ���� $0 optiondefinition optionDefinition	� 	���	� Z   � �	�	�����	� F   � �	�	�	� >  � �	�	�	� o   � ����� $0 optiondefinition optionDefinition	� m   � ���
�� 
msng	� =  � �	�	�	� n  � �	�	�	� o   � ����� 0 	valuetype 	valueType	� l  � �	�����	� c   � �	�	�	� o   � ����� $0 optiondefinition optionDefinition	� m   � ���
�� 
****��  ��  	� m   � ���
�� 
bool	� r   � �	�	�	� b   � �	�	�	� m   � �	�	� �	�	�  -	� n   � �	�	�	� 4  � ���	�
�� 
cobj	� m   � ����� 	� o   � ����� 0 rawarguments rawArguments	� n      	�	�	� 4  � ���	�
�� 
cobj	� m   � ����� 	� o   � ����� 0 rawarguments rawArguments��  ��  ��  	� / ) put "[-N�]VALUE" back on stack for later   	� �	�	� R   p u t   " [ - N & ] V A L U E "   b a c k   o n   s t a c k   f o r   l a t e r��  	� l  � �	�	�	�	� r   � �	�	�	� n   � �	�	�	� 1   � ���
�� 
rest	� o   � ����� 0 rawarguments rawArguments	� o      ���� 0 rawarguments rawArguments	� ' !remove the option name from stack   	� �	�	� B r e m o v e   t h e   o p t i o n   n a m e   f r o m   s t a c k��  	� H B found "-N[N�][VALUE]" (N is a single-character short option name)   	� �	�	� �   f o u n d   " - N [ N & ] [ V A L U E ] "   ( N   i s   a   s i n g l e - c h a r a c t e r   s h o r t   o p t i o n   n a m e )��  	0 l  � �	�	�	�	�  S   � �	� S M not an option name, so anything left in rawArguments is positional arguments   	� �	�	� �   n o t   a n   o p t i o n   n a m e ,   s o   a n y t h i n g   l e f t   i n   r a w A r g u m e n t s   i s   p o s i t i o n a l   a r g u m e n t s	, 	�	�	� l  � ���	�	���  	� - ' look up the option's definition record   	� �	�	� N   l o o k   u p   t h e   o p t i o n ' s   d e f i n i t i o n   r e c o r d	� 	�	�	� r   � �	�	�	� n  � �	�	�	� I   � ���	����� 0 objectforkey_ objectForKey_	� 	���	� o   � ����� 0 
optionname 
optionName��  ��  	� o   � ����� 20 optiondefinitionsbyname optionDefinitionsByName	� o      ���� $0 optiondefinition optionDefinition	� 	�	�	� Z   �x	�	�����	� =  � �	�	�	� o   � ����� $0 optiondefinition optionDefinition	� m   � ���
�� 
msng	� l t	�	�	�	� k  t	�	� 	�	�	� Z  c	�	�����	� o  ���� &0 hasdefaultoptions hasDefaultOptions	� k  _	�	� 
 

  r  .


 J  

 


 E 


 J  
	
	 




 m  

 �

  - h
 
��
 m  

 �

  - - h e l p��  
 J  

 
��
 o  ���� 0 
optionname 
optionName��  
 
��
 E 


 J  

 


 m  

 �

  - v
 
��
 m  

 �

  - - v e r s i o n��  
 J  

 
��
 o  ���� 0 
optionname 
optionName��  ��  
 J      
 
  
!
"
! o      ���� 0 ishelp isHelp
" 
#��
# o      ���� 0 	isversion 	isVersion��  
 
$��
$ Z  /_
%
&����
% G  /8
'
(
' o  /0���� 0 ishelp isHelp
( o  34���� 0 	isversion 	isVersion
& l ;[
)
*
+
) k  ;[
,
, 
-
.
- n ;@
/
0
/ I  <@�������� $0 removeallobjects removeAllObjects��  ��  
0 o  ;<���� (0 asocparametersdict asocParametersDict
. 
1
2
1 n AJ
3
4
3 I  BJ��
5���� $0 setvalue_forkey_ setValue_forKey_
5 
6
7
6 o  BC���� 0 ishelp isHelp
7 
8��
8 m  CF
9
9 �
:
:  h e l p��  ��  
4 o  AB���� (0 asocparametersdict asocParametersDict
2 
;
<
; n KT
=
>
= I  LT��
?���� $0 setvalue_forkey_ setValue_forKey_
? 
@
A
@ o  LM���� 0 	isversion 	isVersion
A 
B��
B m  MP
C
C �
D
D  v e r s i o n��  ��  
> o  KL���� (0 asocparametersdict asocParametersDict
< 
E
F
E r  UY
G
H
G J  UW����  
H o      ���� 0 rawarguments rawArguments
F 
I��
I  S  Z[��  
*  � ignore everything else and return a minimal record containing only `help` and `version` properties, one or both of which are true, so must be dealt with accordingly by `run` handler (i.e. format+log help text and return and/or return version number)   
+ �
J
J�   i g n o r e   e v e r y t h i n g   e l s e   a n d   r e t u r n   a   m i n i m a l   r e c o r d   c o n t a i n i n g   o n l y   ` h e l p `   a n d   ` v e r s i o n `   p r o p e r t i e s ,   o n e   o r   b o t h   o f   w h i c h   a r e   t r u e ,   s o   m u s t   b e   d e a l t   w i t h   a c c o r d i n g l y   b y   ` r u n `   h a n d l e r   ( i . e .   f o r m a t + l o g   h e l p   t e x t   a n d   r e t u r n   a n d / o r   r e t u r n   v e r s i o n   n u m b e r )��  ��  ��  ��  ��  	� 
K�
K R  dt�~
L
M
�~ .ascrerr ****      � ****
L b  ns
N
O
N m  nq
P
P �
Q
Q   U n k n o w n   o p t i o n :  
O o  qr�}�} 0 
optionname 
optionName
M �|
R�{
�| 
errn
R o  hm�z�z  0 kargvusererror kArgvUserError�{  �  	� A ; check for default options (help/version), else raise error   	� �
S
S v   c h e c k   f o r   d e f a u l t   o p t i o n s   ( h e l p / v e r s i o n ) ,   e l s e   r a i s e   e r r o r��  ��  	� 
T
U
T r  y�
V
W
V c  y~
X
Y
X o  yz�y�y $0 optiondefinition optionDefinition
Y m  z}�x
�x 
****
W o      �w�w $0 optiondefinition optionDefinition
U 
Z
[
Z r  ��
\
]
\ n ��
^
_
^ o  ���v�v 0 propertyname propertyName
_ o  ���u�u $0 optiondefinition optionDefinition
] o      �t�t 0 propertyname propertyName
[ 
`
a
` l ��
b
c
d
b Z ��
e
f�s�r
e = ��
g
h
g o  ���q�q 0 propertyname propertyName
h m  ��
i
i �
j
j  
f r  ��
k
l
k n ��
m
n
m o  ���p�p 0 longname longName
n o  ���o�o $0 optiondefinition optionDefinition
l o      �n�n 0 propertyname propertyName�s  �r  
c ~ x TO DO: would make more sense if _buildOptionsTable just assigned the propertyName (this shouldn't affect client's code)   
d �
o
o �   T O   D O :   w o u l d   m a k e   m o r e   s e n s e   i f   _ b u i l d O p t i o n s T a b l e   j u s t   a s s i g n e d   t h e   p r o p e r t y N a m e   ( t h i s   s h o u l d n ' t   a f f e c t   c l i e n t ' s   c o d e )
a 
p
q
p l ���m
r
s�m  
r #  now process the option value   
s �
t
t :   n o w   p r o c e s s   t h e   o p t i o n   v a l u e
q 
u
v
u Z  �
w
x�l
y
w = ��
z
{
z n ��
|
}
| o  ���k�k 0 	valuetype 	valueType
} o  ���j�j $0 optiondefinition optionDefinition
{ m  ���i
�i 
bool
x Q  ��
~

�
~ r  ��
�
�
� H  ��
�
� n ��
�
�
� o  ���h�h 0 defaultvalue defaultValue
� o  ���g�g $0 optiondefinition optionDefinition
� o      �f�f 0 thevalue theValue
 R      �e�d�c
�e .ascrerr ****      � ****�d  �c  
� R  ���b
�
�
�b .ascrerr ****      � ****
� b  ��
�
�
� m  ��
�
� �
�
� J B a d   d e f a u l t V a l u e   f o r   b o o l e a n   o p t i o n :  
� o  ���a�a 0 
optionname 
optionName
� �`
��_
�` 
errn
� m  ���^�^�\�_  �l  
y k  �
�
� 
�
�
� Z ��
�
��]�\
� = ��
�
�
� o  ���[�[ 0 rawarguments rawArguments
� J  ���Z�Z  
� R  ���Y
�
�
�Y .ascrerr ****      � ****
� b  ��
�
�
� m  ��
�
� �
�
� 4 M i s s i n g   v a l u e   f o r   o p t i o n :  
� o  ���X�X 0 
optionname 
optionName
� �W
�
�
�W 
errn
� o  ���V�V  0 kargvusererror kArgvUserError
� �U
��T
�U 
errt
� n ��
�
�
� o  ���S�S 0 	valuetype 	valueType
� o  ���R�R $0 optiondefinition optionDefinition�T  �]  �\  
� 
�
�
� r  ��
�
�
� I  ���Q
��P�Q 0 _unpackvalue _unpackValue
� 
�
�
� n  ��
�
�
� 4 ���O
�
�O 
cobj
� m  ���N�N 
� o  ���M�M 0 rawarguments rawArguments
� 
��L
� o  ���K�K $0 optiondefinition optionDefinition�L  �P  
� o      �J�J 0 thevalue theValue
� 
��I
� r   
�
�
� n   
�
�
� 1  �H
�H 
rest
� o   �G�G 0 rawarguments rawArguments
� o      �F�F 0 rawarguments rawArguments�I  
v 
�
�
� Z  ]
�
�
��E
� n 
�
�
� o  �D�D 0 islist isList
� o  �C�C $0 optiondefinition optionDefinition
� l 9
�
�
�
� k  9
�
� 
�
�
� r  
�
�
� n 
�
�
� I  �B
��A�B 0 objectforkey_ objectForKey_
� 
��@
� o  �?�? 0 propertyname propertyName�@  �A  
� o  �>�> (0 asocparametersdict asocParametersDict
� o      �=�= 0 thelist theList
� 
��<
� Z  9
�
��;
�
� = 
�
�
� o  �:�: 0 thelist theList
� m  �9
�9 
msng
� r   ,
�
�
� n  *
�
�
� I  %*�8
��7�8 $0 arraywithobject_ arrayWithObject_
� 
��6
� o  %&�5�5 0 thevalue theValue�6  �7  
� n  %
�
�
� o  !%�4�4  0 nsmutablearray NSMutableArray
� m   !�3
�3 misccura
� o      �2�2 0 thevalue theValue�;  
� k  /9
�
� 
�
�
� n /5
�
�
� I  05�1
��0�1 0 
addobject_ 
addObject_
� 
��/
� o  01�.�. 0 thevalue theValue�/  �0  
� o  /0�-�- 0 thelist theList
� 
��,
� r  69
�
�
� o  67�+�+ 0 thelist theList
� o      �*�* 0 thevalue theValue�,  �<  
� = 7 option can appear multiple times, so collect in a list   
� �
�
� n   o p t i o n   c a n   a p p e a r   m u l t i p l e   t i m e s ,   s o   c o l l e c t   i n   a   l i s t
� 
�
�
� > <F
�
�
� l <B
��)�(
� n <B
�
�
� I  =B�'
��&�' 0 objectforkey_ objectForKey_
� 
��%
� o  =>�$�$ 0 propertyname propertyName�%  �&  
� o  <=�#�# (0 asocparametersdict asocParametersDict�)  �(  
� m  BE�"
�" 
msng
� 
��!
� R  IY� 
�
�
�  .ascrerr ****      � ****
� b  SX
�
�
� m  SV
�
� �
�
� $ D u p l i c a t e   o p t i o n :  
� o  VW�� 0 
optionname 
optionName
� �
��
� 
errn
� o  MR��  0 kargvusererror kArgvUserError�  �!  �E  
� 
��
� n ^e
�
�
� I  _e�
��� &0 setobject_forkey_ setObject_forKey_
� 
�
�
� o  _`�� 0 thevalue theValue
� 
��
� o  `a�� 0 propertyname propertyName�  �  
� o  ^_�� (0 asocparametersdict asocParametersDict�  	" =   !
�
�
� o    �� 0 rawarguments rawArguments
� J     ��  	  
��
� L  kp
�
� J  ko
�
� 
�
�
� o  kl�� (0 asocparametersdict asocParametersDict
� 
��
� o  lm�� 0 rawarguments rawArguments�  �  � 
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
� 
� i  ~ � I      ��� (0 _adddefaultoptions _addDefaultOptions  o      �� (0 asocparametersdict asocParametersDict � o      �� &0 optiondefinitions optionDefinitions�  �   k     � 	 X     �
�
 k    �  r    " b      l   �� c     o    � �  0 recref recRef m    ��
�� 
reco�  �   K     ���� 0 propertyname propertyName m     �   ���� 0 longname longName m     �   ������ 0 defaultvalue defaultValue o    ���� 0 novalue NoValue��   o      ���� 0 rec    !  r   # ("#" n  # &$%$ o   $ &���� 0 propertyname propertyName% o   # $���� 0 rec  # o      ���� 0 propertyname propertyName! &'& Z  ) 8()����( =  ) ,*+* o   ) *���� 0 propertyname propertyName+ m   * +,, �--  ) r   / 4./. n  / 2010 o   0 2���� 0 longname longName1 o   / 0���� 0 rec  / o      ���� 0 propertyname propertyName��  ��  ' 2��2 Z   9 �34����3 =  9 A565 l  9 ?7����7 n  9 ?898 I   : ?��:���� 0 objectforkey_ objectForKey_: ;��; o   : ;���� 0 propertyname propertyName��  ��  9 o   9 :���� (0 asocparametersdict asocParametersDict��  ��  6 m   ? @��
�� 
msng4 k   D �<< =>= r   D I?@? n  D GABA o   E G���� 0 defaultvalue defaultValueB o   D E���� 0 rec  @ o      ���� 0 thevalue theValue> CDC Z   J �EF����E =  J QGHG o   J K���� 0 thevalue theValueH o   K P���� 0 novalue NoValueF l  T �IJKI k   T �LL MNM r   T [OPO b   T YQRQ m   T USS �TT  - -R n  U XUVU o   V X���� 0 longname longNameV o   U V���� 0 rec  P o      ���� 0 
optionname 
optionNameN WXW Z  \ oYZ����Y =  \ _[\[ o   \ ]���� 0 
optionname 
optionName\ m   ] ^]] �^^  - -Z r   b k_`_ b   b iaba m   b ccc �dd  -b n  c hefe o   d h���� 0 	shortname 	shortNamef o   c d���� 0 rec  ` o      ���� 0 
optionname 
optionName��  ��  X g��g R   p ���hi
�� .ascrerr ****      � ****h b   z jkj m   z }ll �mm 2 M i s s i n g   r e q u i r e d   o p t i o n :  k o   } ~���� 0 
optionname 
optionNamei ��n��
�� 
errnn o   t y����  0 kargvusererror kArgvUserError��  ��  J 2 , record doesn't have a defaultValue property   K �oo X   r e c o r d   d o e s n ' t   h a v e   a   d e f a u l t V a l u e   p r o p e r t y��  ��  D pqp Z  � �rs����r =  � �tut o   � ����� 0 thevalue theValueu m   � ���
�� 
msngs r   � �vwv n  � �xyx I   � ��������� 0 null  ��  ��  y n  � �z{z o   � ����� 0 nsnull NSNull{ m   � ���
�� misccuraw o      ���� 0 thevalue theValue��  ��  q |��| l  � �}����} n  � �~~ I   � �������� &0 setobject_forkey_ setObject_forKey_� ��� o   � ����� 0 thevalue theValue� ���� o   � ����� 0 propertyname propertyName��  ��   o   � ����� (0 asocparametersdict asocParametersDict��  ��  ��  ��  ��  ��  � 0 recref recRef o    ���� &0 optiondefinitions optionDefinitions	 ��� l  � �������  � ` Z set default help, version properties if not already supplied by user of optionDefinitions   � ��� �   s e t   d e f a u l t   h e l p ,   v e r s i o n   p r o p e r t i e s   i f   n o t   a l r e a d y   s u p p l i e d   b y   u s e r   o f   o p t i o n D e f i n i t i o n s� ���� X   � ������ Z  � �������� =  � ���� l  � ������� n  � ���� I   � �������� 0 objectforkey_ objectForKey_� ���� o   � ����� 0 aref aRef��  ��  � o   � ����� (0 asocparametersdict asocParametersDict��  ��  � m   � ���
�� 
msng� l  � ������� n  � ���� I   � �������� &0 setobject_forkey_ setObject_forKey_� ��� m   � ���
�� boovfals� ���� o   � ����� 0 aref aRef��  ��  � o   � ����� (0 asocparametersdict asocParametersDict��  ��  ��  ��  �� 0 aref aRef� J   � ��� ��� m   � ��� ���  h e l p� ���� m   � ��� ���  v e r s i o n��  ��    ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I      ������� "0 _parsearguments _parseArguments� ��� o      ���� 0 argumentslist argumentsList� ��� o      ���� *0 argumentdefinitions argumentDefinitions� ���� o      ���� (0 asocparametersdict asocParametersDict��  ��  � k    �� ��� l     ������  � q k parse the remaining raw arguments, converting to the required type and adding to the parameters dictionary   � ��� �   p a r s e   t h e   r e m a i n i n g   r a w   a r g u m e n t s ,   c o n v e r t i n g   t o   t h e   r e q u i r e d   t y p e   a n d   a d d i n g   t o   t h e   p a r a m e t e r s   d i c t i o n a r y� ��� r     ��� m     ����  � o      ���� 0 i  � ��� r    	��� n   ��� 1    ��
�� 
leng� o    ���� 0 argumentslist argumentsList� o      ���� 0 argcount argCount� ��� l  
 
������  � � � TO DO: this should throw invalid argument definition error if an optional argument definition is followed by a required argument definition   � ���   T O   D O :   t h i s   s h o u l d   t h r o w   i n v a l i d   a r g u m e n t   d e f i n i t i o n   e r r o r   i f   a n   o p t i o n a l   a r g u m e n t   d e f i n i t i o n   i s   f o l l o w e d   b y   a   r e q u i r e d   a r g u m e n t   d e f i n i t i o n� ��� X   
 ������ k    ��� ��� r    ��� [    ��� o    ���� 0 i  � m    ���� � o      ���� 0 i  � ��� r     6��� b     4��� l    %������ c     %��� n    #��� 1   ! #��
�� 
pcnt� o     !���� 0 argref argRef� m   # $��
�� 
reco��  ��  � K   % 3�� ������ 0 propertyname propertyName� m   & '�� ���  � ������ 0 	valuetype 	valueType� m   ( )��
�� 
ctxt� ������ 0 islist isList� m   * +��
�� boovfals� ������� 0 defaultvalue defaultValue� o   , 1���� 0 novalue NoValue��  � o      ���� (0 argumentdefinition argumentDefinition� ��� Z  7 Q����~� =  7 <��� n  7 :��� o   8 :�}�} 0 propertyname propertyName� o   7 8�|�| (0 argumentdefinition argumentDefinition� m   : ;�� ���  � R   ? M�{��
�{ .ascrerr ****      � ****� m   I L�� ��� � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   n o n - e m p t y   p r o p e r t y N a m e   p r o p e r t y ) .� �z��
�z 
errn� m   A B�y�y�Y� �x��w
�x 
erob� o   E F�v�v 0 argref argRef�w  �  �~  � ��� Z   R ����u�� =   R V��� o   R S�t�t 0 argumentslist argumentsList� J   S U�s�s  � k   Y ��    r   Y ^ n  Y \ o   Z \�r�r 0 defaultvalue defaultValue o   Y Z�q�q (0 argumentdefinition argumentDefinition o      �p�p 0 thevalue theValue �o Z   _ �n�m =  _ f	
	 o   _ `�l�l 0 thevalue theValue
 o   ` e�k�k 0 novalue NoValue l  i { l  i { R   i {�j
�j .ascrerr ****      � **** b   q z b   q v m   q t � 4 M i s s i n g   r e q u i r e d   a r g u m e n t   o   t u�i�i 0 i   m   v y �  . �h�g
�h 
errn o   k p�f�f  0 kargvusererror kArgvUserError�g   J D TO DO: include placeholderValue/valueType in error message if given    � �   T O   D O :   i n c l u d e   p l a c e h o l d e r V a l u e / v a l u e T y p e   i n   e r r o r   m e s s a g e   i f   g i v e n W Q record doesn't have a defaultValue property, so user should've supplied argument    � �   r e c o r d   d o e s n ' t   h a v e   a   d e f a u l t V a l u e   p r o p e r t y ,   s o   u s e r   s h o u l d ' v e   s u p p l i e d   a r g u m e n t�n  �m  �o  �u  � k   � �   r   � �!"! I   � ��e#�d�e 0 _unpackvalue _unpackValue# $%$ n   � �&'& 4  � ��c(
�c 
cobj( m   � ��b�b ' o   � ��a�a 0 argumentslist argumentsList% )�`) o   � ��_�_ (0 argumentdefinition argumentDefinition�`  �d  " o      �^�^ 0 thevalue theValue  *�]* r   � �+,+ n   � �-.- 1   � ��\
�\ 
rest. o   � ��[�[ 0 argumentslist argumentsList, o      �Z�Z 0 argumentslist argumentsList�]  � /0/ Z   � �12�Y�X1 n  � �343 o   � ��W�W 0 islist isList4 o   � ��V�V (0 argumentdefinition argumentDefinition2 k   � �55 676 Z  � �89�U�T8 A   � �:;: o   � ��S�S 0 i  ; n   � �<=< 1   � ��R
�R 
leng= o   � ��Q�Q *0 argumentdefinitions argumentDefinitions9 R   � ��P>?
�P .ascrerr ****      � ****> m   � �@@ �AA � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( o n l y   t h e   l a s t   a r g u m e n t   d e f i n i t i o n   m a y   c o n t a i n   a n    i s L i s t : t r u e    p r o p e r t y ) .? �OBC
�O 
errnB m   � ��N�N�YC �MD�L
�M 
erobD o   � ��K�K 0 argref argRef�L  �U  �T  7 EFE r   � �GHG J   � �II J�JJ o   � ��I�I 0 thevalue theValue�J  H o      �H�H 0 thevalue theValueF KLK X   � �M�GNM r   � �OPO I   � ��FQ�E�F 0 _unpackvalue _unpackValueQ RSR n  � �TUT 1   � ��D
�D 
pcntU o   � ��C�C 0 aref aRefS V�BV o   � ��A�A (0 argumentdefinition argumentDefinition�B  �E  P n      WXW  ;   � �X o   � ��@�@ 0 thevalue theValue�G 0 aref aRefN o   � ��?�? 0 argumentslist argumentsListL Y�>Y r   � �Z[Z J   � ��=�=  [ o      �<�< 0 argumentslist argumentsList�>  �Y  �X  0 \�;\ l  � �]�:�9] n  � �^_^ I   � ��8`�7�8 &0 setobject_forkey_ setObject_forKey_` aba o   � ��6�6 0 thevalue theValueb c�5c l  � �d�4�3d n  � �efe o   � ��2�2 0 propertyname propertyNamef o   � ��1�1 (0 argumentdefinition argumentDefinition�4  �3  �5  �7  _ o   � ��0�0 (0 asocparametersdict asocParametersDict�:  �9  �;  �� 0 argref argRef� o    �/�/ *0 argumentdefinitions argumentDefinitions� g�.g Z  �hi�-�,h >  � �jkj o   � ��+�+ 0 argumentslist argumentsListk J   � ��*�*  i R   �)lm
�) .ascrerr ****      � ****l b  non b  pqp b  rsr b  tut m  vv �ww : T o o   m a n y   a r g u m e n t s   ( e x p e c t e d  u n  xyx 1  �(
�( 
lengy o  �'�' *0 argumentdefinitions argumentDefinitionss m  zz �{{    b u t   r e c e i v e d  q o  �&�& 0 argcount argCounto m  || �}}  ) .m �%~�$
�% 
errn~ o  �#�#  0 kargvusererror kArgvUserError�$  �-  �,  �.  � � l     �"�!� �"  �!  �   � ��� l     ����  �  -----   � ��� 
 - - - - -� ��� l     ����  � ) # format built-in help documentation   � ��� F   f o r m a t   b u i l t - i n   h e l p   d o c u m e n t a t i o n� ��� l     ����  �  �  � ��� i  � ���� I      ����  0 _formatoptions _formatOptions� ��� o      �� &0 optiondefinitions optionDefinitions� ��� o      �� 0 vtstyle vtStyle� ��� o      �� &0 hasdefaultoptions hasDefaultOptions�  �  � k    ��� ��� l     ����  � ] W generates OPTIONS section, along with options synopsis for inclusion in autogenerated    � ��� �   g e n e r a t e s   O P T I O N S   s e c t i o n ,   a l o n g   w i t h   o p t i o n s   s y n o p s i s   f o r   i n c l u s i o n   i n   a u t o g e n e r a t e d  � ��� r     ��� J     �� ��� m     �� ���  � ��� m    �� ���  � ��� m    �� ���  �  � J      �� ��� o      ��  0 defaultoptions defaultOptions� ��� o      ��  0 booleanoptions booleanOptions� ��� o      �� 0 otheroptions otherOptions�  � ��� l   '���� r    '��� b    %��� b    !��� n   ��� o    �� 0 b  � o    �� 0 vtstyle vtStyle� m     �� ���  O P T I O N S� n  ! $��� o   " $�� 0 n  � o   ! "�� 0 vtstyle vtStyle� o      �
�
  0 optionssection optionsSection� � � TO DO: add option descriptions to NSMutableArray so they can be sorted alphabetically at end? ditto for boolean and other options in synopsis   � ���   T O   D O :   a d d   o p t i o n   d e s c r i p t i o n s   t o   N S M u t a b l e A r r a y   s o   t h e y   c a n   b e   s o r t e d   a l p h a b e t i c a l l y   a t   e n d ?   d i t t o   f o r   b o o l e a n   a n d   o t h e r   o p t i o n s   i n   s y n o p s i s� ��� X   (��	�� k   8�� ��� r   8 `��� b   8 ^��� l  8 ;���� c   8 ;��� o   8 9�� 0 	optionref 	optionRef� m   9 :�
� 
reco�  �  � K   ; ]�� ���� 0 	shortname 	shortName� m   < =�� ���  � ���� 0 longname longName� m   > ?�� ���  � ���� 0 	valuetype 	valueType� m   @ A�
� 
ctxt� � ���  0 islist isList� m   D E��
�� boovfals� ������ 0 defaultvalue defaultValue� o   H M���� 0 novalue NoValue� ������ $0 valueplaceholder valuePlaceholder� m   P S�� ���  � ������� $0 valuedescription valueDescription� m   V Y�� ���  ��  � o      ���� $0 optiondefinition optionDefinition� ��� Q   a ����� k   d ��� ��� r   d k��� c   d i��� n  d g��� o   e g���� 0 	shortname 	shortName� o   d e���� $0 optiondefinition optionDefinition� m   g h��
�� 
ctxt� o      ���� 0 	shortname 	shortName� ��� r   l s��� c   l q��� n  l o��� o   m o���� 0 longname longName� o   l m���� $0 optiondefinition optionDefinition� m   o p��
�� 
ctxt� o      ���� 0 longname longName� � � r   t } c   t { n  t w o   u w���� 0 	valuetype 	valueType o   t u���� $0 optiondefinition optionDefinition m   w z��
�� 
type o      ���� 0 	valuetype 	valueType   r   ~ �	
	 c   ~ � n  ~ � o    ����� 0 islist isList o   ~ ���� $0 optiondefinition optionDefinition m   � ���
�� 
bool
 o      ���� 0 islist isList  r   � � c   � � n  � � o   � ����� $0 valueplaceholder valuePlaceholder o   � ����� $0 optiondefinition optionDefinition m   � ���
�� 
ctxt o      ���� $0 valueplaceholder valuePlaceholder �� r   � � c   � � n  � � o   � ����� $0 valuedescription valueDescription o   � ����� $0 optiondefinition optionDefinition m   � ���
�� 
ctxt o      ���� $0 valuedescription valueDescription��  � R      ����
�� .ascrerr ****      � ****��   ����
�� 
errn d         m      �������  � n  � �!"! I   � ���#���� 60 throwinvalidparametertype throwInvalidParameterType# $%$ o   � ����� &0 optiondefinitions optionDefinitions% &'& m   � �(( �))  o p t i o n s' *+* m   � �,, �-- ` l i s t   o f    c o m m a n d   l i n e   o p t i o n   d e f i n i t i o n    r e c o r d s+ .��. m   � ���
�� 
reco��  ��  " o   � ����� 0 _supportlib _supportLib� /0/ r   � �121 b   � �343 b   � �565 o   � �����  0 optionssection optionsSection6 o   � ����� 
0 lf2 LF24 o   � ����� 0 indent1 Indent12 o      ����  0 optionssection optionsSection0 787 Z   �#9:��;9 =  � �<=< o   � ����� 0 	shortname 	shortName= m   � �>> �??  : k   � �@@ ABA Z  � �CD����C =  � �EFE o   � ����� 0 longname longNameF m   � �GG �HH  D R   � ���IJ
�� .ascrerr ****      � ****I m   � �KK �LL � I n v a l i d   o p t i o n   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   s h o r t N a m e   a n d / o r   l o n g N a m e   p r o p e r t y ) .J ��MN
�� 
errnM m   � ������YN ��O��
�� 
erobO o   � ����� 0 	optionref 	optionRef��  ��  ��  B PQP r   � �RSR o   � ����� 0 longname longNameS o      ���� 0 
optionname 
optionNameQ T��T r   � �UVU b   � �WXW b   � �YZY o   � �����  0 optionssection optionsSectionZ m   � �[[ �\\  - -X o   � ����� 0 longname longNameV o      ����  0 optionssection optionsSection��  ��  ; k   #]] ^_^ r   `a` o   ���� 0 	shortname 	shortNamea o      ���� 0 
optionname 
optionName_ bcb r  ded b  fgf b  	hih o  ����  0 optionssection optionsSectioni m  jj �kk  -g o  	
���� 0 	shortname 	shortNamee o      ����  0 optionssection optionsSectionc l��l Z #mn����m > opo o  ���� 0 longname longNamep m  qq �rr  n r  sts b  uvu b  wxw o  ����  0 optionssection optionsSectionx m  yy �zz  ,   - -v o  ���� 0 longname longNamet o      ����  0 optionssection optionsSection��  ��  ��  8 {|{ Z  $�}~��} = $)��� o  $%���� 0 	valuetype 	valueType� m  %(��
�� 
bool~ l ,1���� r  ,1��� b  ,/��� o  ,-����  0 booleanoptions booleanOptions� o  -.���� 0 
optionname 
optionName� o      ����  0 booleanoptions booleanOptions� ) # group all boolean flags as "[-N�]"   � ��� F   g r o u p   a l l   b o o l e a n   f l a g s   a s   " [ - N & ] "��   k  4��� ��� r  4C��� > 4?��� n 49��� o  59���� 0 defaultvalue defaultValue� o  45���� $0 optiondefinition optionDefinition� o  9>���� 0 novalue NoValue� o      ���� 0 
isoptional 
isOptional� ��� r  DK��� b  DI��� o  DE���� 0 otheroptions otherOptions� 1  EH��
�� 
spac� o      ���� 0 otheroptions otherOptions� ��� Z L]������� o  LO���� 0 
isoptional 
isOptional� r  RY��� b  RW��� o  RS���� 0 otheroptions otherOptions� m  SV�� ���  [� o      ���� 0 otheroptions otherOptions��  ��  � ��� r  ^g��� b  ^e��� b  ^c��� o  ^_���� 0 otheroptions otherOptions� m  _b�� ���  -� o  cd���� 0 
optionname 
optionName� o      ���� 0 otheroptions otherOptions� ��� r  hk��� o  hi���� $0 valueplaceholder valuePlaceholder� o      ���� $0 valueplaceholder valuePlaceholder� ��� Z l�������� = lq��� o  lm���� $0 valueplaceholder valuePlaceholder� m  mp�� ���  � r  t|��� I  tz������� 40 _defaultvalueplaceholder _defaultValuePlaceholder� ���� o  uv���� $0 optiondefinition optionDefinition��  ��  � o      ���� $0 valueplaceholder valuePlaceholder��  ��  � ��� r  ����� b  ����� b  ����� n ����� o  ������ 0 u  � o  ������ 0 vtstyle vtStyle� o  ������ $0 valueplaceholder valuePlaceholder� n ����� o  ������ 0 n  � o  ������ 0 vtstyle vtStyle� o      ���� $0 valueplaceholder valuePlaceholder� ��� r  ����� b  ����� b  ����� o  ������ 0 otheroptions otherOptions� 1  ����
�� 
spac� o  ������ $0 valueplaceholder valuePlaceholder� o      ���� 0 otheroptions otherOptions� ��� Z ��������� o  ������ 0 
isoptional 
isOptional� r  ����� b  ����� o  ������ 0 otheroptions otherOptions� m  ���� ���  ]� o      ���� 0 otheroptions otherOptions��  ��  � ��� r  ����� b  ����� b  ����� o  ������  0 optionssection optionsSection� 1  ����
�� 
spac� o  ������ $0 valueplaceholder valuePlaceholder� o      ����  0 optionssection optionsSection� ��� Z ��������� > ����� n ����� o  ���� 0 defaultvalue defaultValue� o  ���~�~ $0 optiondefinition optionDefinition� o  ���}�} 0 novalue NoValue� r  ����� b  ����� o  ���|�| $0 valuedescription valueDescription� I  ���{��z�{ *0 _formatdefaultvalue _formatDefaultValue� ��y� o  ���x�x $0 optiondefinition optionDefinition�y  �z  � o      �w�w $0 valuedescription valueDescription��  ��  � ��v� Z �����u�t� o  ���s�s 0 islist isList� r  ����� b  ����� o  ���r�r $0 valuedescription valueDescription� m  ���� ��� N T h i s   o p t i o n   c a n   b e   u s e d   m u l t i p l e   t i m e s .� o      �q�q $0 valuedescription valueDescription�u  �t  �v  | ��p� Z ����o�n� > ����� o  ���m�m $0 valuedescription valueDescription� m  ���� �    � r  �� b  �� b  �� b  �� b  ��	
	 o  ���l�l  0 optionssection optionsSection
 1  ���k
�k 
lnfd o  ���j�j 0 indent2 Indent2 o  ���i�i $0 valuedescription valueDescription 1  ���h
�h 
spac o      �g�g  0 optionssection optionsSection�o  �n  �p  �	 0 	optionref 	optionRef� o   + ,�f�f &0 optiondefinitions optionDefinitions�  l �e�e   3 - document default -h and -v options as needed    � Z   d o c u m e n t   d e f a u l t   - h   a n d   - v   o p t i o n s   a s   n e e d e d  Z  |�d�c o  �b�b &0 hasdefaultoptions hasDefaultOptions k  x  Z  A�a�` H   E   o  �_�_  0 booleanoptions booleanOptions m   �  h k  =   r  !"! b  #$# m  %% �&&  h$ o  �^�^  0 defaultoptions defaultOptions" o      �]�]  0 defaultoptions defaultOptions  '�\' r  =()( b  ;*+* b  7,-, b  1./. b  -010 b  )232 b  #454 o  �[�[  0 optionssection optionsSection5 o  "�Z�Z 
0 lf2 LF23 o  #(�Y�Y 0 indent1 Indent11 m  ),66 �77  - h ,   - - h e l p/ 1  -0�X
�X 
lnfd- o  16�W�W 0 indent2 Indent2+ m  7:88 �99 2 P r i n t   t h i s   h e l p   a n d   e x i t .) o      �V�V  0 optionssection optionsSection�\  �a  �`   :�U: Z  Bx;<�T�S; H  BH== E  BG>?> o  BC�R�R  0 booleanoptions booleanOptions? m  CF@@ �AA  v< k  KtBB CDC r  KREFE b  KPGHG o  KL�Q�Q  0 defaultoptions defaultOptionsH m  LOII �JJ  vF o      �P�P  0 defaultoptions defaultOptionsD K�OK r  StLML b  SrNON b  SnPQP b  ShRSR b  SdTUT b  S`VWV b  SZXYX o  ST�N�N  0 optionssection optionsSectionY o  TY�M�M 
0 lf2 LF2W o  Z_�L�L 0 indent1 Indent1U m  `cZZ �[[  - v ,   - - v e r s i o nS 1  dg�K
�K 
lnfdQ o  hm�J�J 0 indent2 Indent2O m  nq\\ �]] < P r i n t   v e r s i o n   n u m b e r   a n d   e x i t .M o      �I�I  0 optionssection optionsSection�O  �T  �S  �U  �d  �c   ^_^ r  }�`a` m  }�bb �cc  a o      �H�H "0 optionssynopsis optionsSynopsis_ ded Z ��fg�G�Ff > ��hih o  ���E�E  0 defaultoptions defaultOptionsi m  ��jj �kk  g r  ��lml b  ��non b  ��pqp b  ��rsr o  ���D�D "0 optionssynopsis optionsSynopsiss m  ��tt �uu    [ -q o  ���C�C  0 defaultoptions defaultOptionso m  ��vv �ww  ]m o      �B�B "0 optionssynopsis optionsSynopsis�G  �F  e xyx Z ��z{�A�@z > ��|}| o  ���?�?  0 booleanoptions booleanOptions} m  ��~~ �  { r  ����� b  ����� b  ����� b  ����� o  ���>�> "0 optionssynopsis optionsSynopsis� m  ���� ���    [ -� o  ���=�=  0 booleanoptions booleanOptions� m  ���� ���  ]� o      �<�< "0 optionssynopsis optionsSynopsis�A  �@  y ��� Z �����;�:� > ����� o  ���9�9 0 otheroptions otherOptions� m  ���� ���  � r  ����� b  ����� o  ���8�8 "0 optionssynopsis optionsSynopsis� o  ���7�7 0 otheroptions otherOptions� o      �6�6 "0 optionssynopsis optionsSynopsis�;  �:  � ��5� L  ���� J  ���� ��� o  ���4�4 "0 optionssynopsis optionsSynopsis� ��3� o  ���2�2  0 optionssection optionsSection�3  �5  � ��� l     �1�0�/�1  �0  �/  � ��� l     �.�-�,�.  �-  �,  � ��� i  � ���� I      �+��*�+ $0 _formatarguments _formatArguments� ��� o      �)�) *0 argumentdefinitions argumentDefinitions� ��(� o      �'�' 0 vtstyle vtStyle�(  �*  � k    >�� ��� Z    ���&�%� =    ��� o     �$�$ *0 argumentdefinitions argumentDefinitions� J    �#�#  � L    �� J    �� ��� m    �� ���  � ��"� m    	�� ���  �"  �&  �%  � ��� r    ��� m    �� ���  � o      �!�! &0 argumentssynopsis argumentsSynopsis� ��� r     ��� b    ��� b    ��� n   ��� o    � �  0 b  � o    �� 0 vtstyle vtStyle� m    �� ���  A R G U M E N T S� n   ��� o    �� 0 n  � o    �� 0 vtstyle vtStyle� o      �� $0 argumentssection argumentsSection� ��� X   !4���� k   1/�� ��� r   1 M��� b   1 K��� l  1 4���� c   1 4��� o   1 2�� 0 argumentref argumentRef� m   2 3�
� 
reco�  �  � K   4 J�� ���� 0 	valuetype 	valueType� m   5 6�
� 
ctxt� ���� 0 islist isList� m   7 8�
� boovfals� ���� 0 defaultvalue defaultValue� o   9 >�� 0 novalue NoValue� ���� $0 valueplaceholder valuePlaceholder� m   ? @�� ���  � ���� $0 valuedescription valueDescription� m   C F�� ���  �  � o      �� (0 argumentdefinition argumentDefinition� ��� Q   N ����� k   Q v�� ��� r   Q Z��� c   Q X��� n  Q T��� o   R T�� 0 	valuetype 	valueType� o   Q R�� (0 argumentdefinition argumentDefinition� m   T W�

�
 
type� o      �	�	 0 	valuetype 	valueType� ��� r   [ d��� c   [ b��� n  [ ^��� o   \ ^�� 0 islist isList� o   [ \�� (0 argumentdefinition argumentDefinition� m   ^ a�
� 
bool� o      �� 0 islist isList�    r   e l c   e j n  e h o   f h�� $0 valueplaceholder valuePlaceholder o   e f�� (0 argumentdefinition argumentDefinition m   h i�
� 
ctxt o      �� $0 valueplaceholder valuePlaceholder �  r   m v	
	 c   m t n  m r o   n r���� $0 valuedescription valueDescription o   m n���� (0 argumentdefinition argumentDefinition m   r s��
�� 
ctxt
 o      ���� $0 valuedescription valueDescription�   � R      ����
�� .ascrerr ****      � ****��   ����
�� 
errn d       m      �������  � n  ~ � I   � ������� 60 throwinvalidparametertype throwInvalidParameterType  o   � ����� *0 argumentdefinitions argumentDefinitions  m   � � �  a r g u m e n t s  m   � � � d l i s t   o f    c o m m a n d   l i n e   a r g u m e n t   d e f i n i t i o n    r e c o r d s �� m   � ���
�� 
reco��  ��   o   ~ ����� 0 _supportlib _supportLib�  !  Z  � �"#����" =  � �$%$ o   � ����� $0 valueplaceholder valuePlaceholder% m   � �&& �''  # r   � �()( I   � ���*���� 40 _defaultvalueplaceholder _defaultValuePlaceholder* +��+ o   � ����� (0 argumentdefinition argumentDefinition��  ��  ) o      ���� $0 valueplaceholder valuePlaceholder��  ��  ! ,-, Z  � �./����. o   � ����� 0 islist isList/ r   � �010 b   � �232 o   � ����� $0 valueplaceholder valuePlaceholder3 m   � �44 �55    . . .1 o      ���� $0 valueplaceholder valuePlaceholder��  ��  - 676 r   � �898 b   � �:;: b   � �<=< b   � �>?> b   � �@A@ b   � �BCB o   � ����� $0 argumentssection argumentsSectionC o   � ����� 
0 lf2 LF2A o   � ����� 0 indent1 Indent1? n  � �DED o   � ����� 0 u  E o   � ����� 0 vtstyle vtStyle= o   � ����� $0 valueplaceholder valuePlaceholder; n  � �FGF o   � ����� 0 n  G o   � ����� 0 vtstyle vtStyle9 o      ���� $0 argumentssection argumentsSection7 HIH Z  � �JK����J >  � �LML n  � �NON o   � ����� 0 defaultvalue defaultValueO o   � ����� (0 argumentdefinition argumentDefinitionM o   � ����� 0 novalue NoValueK r   � �PQP b   � �RSR o   � ����� $0 valuedescription valueDescriptionS I   � ���T���� *0 _formatdefaultvalue _formatDefaultValueT U��U o   � ����� (0 argumentdefinition argumentDefinition��  ��  Q o      ���� $0 valuedescription valueDescription��  ��  I VWV Z  �	XY����X >  � �Z[Z o   � ����� $0 valuedescription valueDescription[ m   � �\\ �]]  Y r   �^_^ b   �`a` b   �bcb b   � �ded o   � ����� $0 argumentssection argumentsSectione 1   � ���
�� 
lnfdc o   � ���� 0 indent2 Indent2a o  ���� $0 valuedescription valueDescription_ o      ���� $0 argumentssection argumentsSection��  ��  W fgf Z 
%hi����h > 
jkj n 
lml o  ���� 0 defaultvalue defaultValuem o  
���� (0 argumentdefinition argumentDefinitionk o  ���� 0 novalue NoValuei r  !non b  pqp b  rsr m  tt �uu  [s o  ���� $0 valueplaceholder valuePlaceholderq m  vv �ww  ]o o      ���� $0 valueplaceholder valuePlaceholder��  ��  g x��x r  &/yzy b  &-{|{ b  &+}~} o  &'���� &0 argumentssynopsis argumentsSynopsis~ 1  '*��
�� 
spac| o  +,���� $0 valueplaceholder valuePlaceholderz o      ���� &0 argumentssynopsis argumentsSynopsis��  � 0 argumentref argumentRef� o   $ %���� *0 argumentdefinitions argumentDefinitions� �� L  5>�� J  5=�� ��� b  5:��� m  58�� ��� 
   [ - - ]� o  89���� &0 argumentssynopsis argumentsSynopsis� ���� o  :;���� $0 argumentssection argumentsSection��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ��������  ��  ��  � ��� i  � ���� I     ����
�� .Fil:Argvnull���     ****� l 
    ������ o      ���� 0 argv  ��  ��  � ����
�� 
OpsD� |����������  ��  � o      ���� &0 optiondefinitions optionDefinitions��  � l 
    ������ J      ����  ��  ��  � ����
�� 
OpsA� |����������  ��  � o      ���� *0 argumentdefinitions argumentDefinitions��  � l 
    ������ J      �� ���� K      �� ������ 0 propertyname propertyName� m      �� ���  a r g u m e n t s L i s t� ������� 0 islist isList� m      ��
�� boovtrue��  ��  ��  ��  � �����
�� 
DefO� |����������  ��  � o      ���� &0 hasdefaultoptions hasDefaultOptions��  � l     ������ m      ��
�� boovtrue��  ��  ��  � k     ��� ��� l     ������  ��� note: while NSUserDefaults provides some argument parsing support (see its NSArgumentDomain), it uses an atypical syntax and reads directly from argv, making it difficult both to omit arguments provided to osascript itself and to extract any arguments remaining after options are parsed; thus, this handler implements its own argv parser that avoids NSUserDefaults' deficiencies while also providing a better optparse-style UI/UX to both shell script authors and users   � ����   n o t e :   w h i l e   N S U s e r D e f a u l t s   p r o v i d e s   s o m e   a r g u m e n t   p a r s i n g   s u p p o r t   ( s e e   i t s   N S A r g u m e n t D o m a i n ) ,   i t   u s e s   a n   a t y p i c a l   s y n t a x   a n d   r e a d s   d i r e c t l y   f r o m   a r g v ,   m a k i n g   i t   d i f f i c u l t   b o t h   t o   o m i t   a r g u m e n t s   p r o v i d e d   t o   o s a s c r i p t   i t s e l f   a n d   t o   e x t r a c t   a n y   a r g u m e n t s   r e m a i n i n g   a f t e r   o p t i o n s   a r e   p a r s e d ;   t h u s ,   t h i s   h a n d l e r   i m p l e m e n t s   i t s   o w n   a r g v   p a r s e r   t h a t   a v o i d s   N S U s e r D e f a u l t s '   d e f i c i e n c i e s   w h i l e   a l s o   p r o v i d i n g   a   b e t t e r   o p t p a r s e - s t y l e   U I / U X   t o   b o t h   s h e l l   s c r i p t   a u t h o r s   a n d   u s e r s� ��� l     ��������  ��  ��  � ��� l     ������  ��� TO DO: if default -h/-v is invoked, output relevant info to stderr/stdout and immediately exit(0)? (this'd require merging `format command line help` parameters and adding optional version number parameter (default: "0.1.0"); this would save users having to implement their own processing for help and version in every single script, the downside being more complex command documentation   � ���   T O   D O :   i f   d e f a u l t   - h / - v   i s   i n v o k e d ,   o u t p u t   r e l e v a n t   i n f o   t o   s t d e r r / s t d o u t   a n d   i m m e d i a t e l y   e x i t ( 0 ) ?   ( t h i s ' d   r e q u i r e   m e r g i n g   ` f o r m a t   c o m m a n d   l i n e   h e l p `   p a r a m e t e r s   a n d   a d d i n g   o p t i o n a l   v e r s i o n   n u m b e r   p a r a m e t e r   ( d e f a u l t :   " 0 . 1 . 0 " ) ;   t h i s   w o u l d   s a v e   u s e r s   h a v i n g   t o   i m p l e m e n t   t h e i r   o w n   p r o c e s s i n g   f o r   h e l p   a n d   v e r s i o n   i n   e v e r y   s i n g l e   s c r i p t ,   t h e   d o w n s i d e   b e i n g   m o r e   c o m p l e x   c o m m a n d   d o c u m e n t a t i o n� ���� P     ����� k    ��� ��� r    
��� n   ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� o      ���� 0 oldtids oldTIDs� ���� Q    ����� k    j�� ��� l   ������  � ) # first, ensure parameters are lists   � ��� F   f i r s t ,   e n s u r e   p a r a m e t e r s   a r e   l i s t s� ��� r    ��� n   ��� I    ������� "0 aslistparameter asListParameter� ���� o    ���� 0 argv  ��  ��  � o    �� 0 _supportlib _supportLib� o      �~�~ 0 argv  � ��� r    '��� n   %��� I     %�}��|�} "0 aslistparameter asListParameter� ��{� o     !�z�z &0 optiondefinitions optionDefinitions�{  �|  � o     �y�y 0 _supportlib _supportLib� o      �x�x &0 optiondefinitions optionDefinitions� ��� r   ( 4��� n  ( 2��� I   - 2�w��v�w "0 aslistparameter asListParameter� ��u� o   - .�t�t *0 argumentdefinitions argumentDefinitions�u  �v  � o   ( -�s�s 0 _supportlib _supportLib� o      �r�r *0 argumentdefinitions argumentDefinitions� ��� l  5 5�q���q  � � � next iterate over the raw argument list, identifying option names and (if non-boolean) values, returning a NSMutableDictionary of parsed option values plus a list of any remaining (i.e. non-option) arguments   � ����   n e x t   i t e r a t e   o v e r   t h e   r a w   a r g u m e n t   l i s t ,   i d e n t i f y i n g   o p t i o n   n a m e s   a n d   ( i f   n o n - b o o l e a n )   v a l u e s ,   r e t u r n i n g   a   N S M u t a b l e D i c t i o n a r y   o f   p a r s e d   o p t i o n   v a l u e s   p l u s   a   l i s t   o f   a n y   r e m a i n i n g   ( i . e .   n o n - o p t i o n )   a r g u m e n t s� ��� r   5 N��� I      �p��o�p 0 _parseoptions _parseOptions� ��� n   6 9��� 2  7 9�n
�n 
cobj� o   6 7�m�m 0 argv  � ��� o   9 :�l�l &0 optiondefinitions optionDefinitions� ��k� o   : ;�j�j &0 hasdefaultoptions hasDefaultOptions�k  �o  � J      �� ��� o      �i�i (0 asocparametersdict asocParametersDict� ��h� o      �g�g 0 argumentslist argumentsList�h  � ��� l  O O�f �f    v p add default values for any missing options to asocParametersDict, raising error if a required option is missing    � �   a d d   d e f a u l t   v a l u e s   f o r   a n y   m i s s i n g   o p t i o n s   t o   a s o c P a r a m e t e r s D i c t ,   r a i s i n g   e r r o r   i f   a   r e q u i r e d   o p t i o n   i s   m i s s i n g�  I   O V�e�d�e (0 _adddefaultoptions _addDefaultOptions  o   P Q�c�c (0 asocparametersdict asocParametersDict �b o   Q R�a�a &0 optiondefinitions optionDefinitions�b  �d   	
	 l  W W�`�`   b \ parse the remaining arguments as named positional parameters, adding them to the dictionary    � �   p a r s e   t h e   r e m a i n i n g   a r g u m e n t s   a s   n a m e d   p o s i t i o n a l   p a r a m e t e r s ,   a d d i n g   t h e m   t o   t h e   d i c t i o n a r y
  I   W _�_�^�_ "0 _parsearguments _parseArguments  o   X Y�]�] 0 argumentslist argumentsList  o   Y Z�\�\ *0 argumentdefinitions argumentDefinitions �[ o   Z [�Z�Z (0 asocparametersdict asocParametersDict�[  �^    r   ` e o   ` a�Y�Y 0 oldtids oldTIDs n      1   b d�X
�X 
txdl 1   a b�W
�W 
ascr  l  f f�V�V   6 0log (asocParametersDict's description() as text)    �   ` l o g   ( a s o c P a r a m e t e r s D i c t ' s   d e s c r i p t i o n ( )   a s   t e x t ) !�U! l  f j"#$" L   f j%% c   f i&'& o   f g�T�T (0 asocparametersdict asocParametersDict' m   g h�S
�S 
****# : 4 coerce the dictionary to an AS record and return it   $ �(( h   c o e r c e   t h e   d i c t i o n a r y   t o   a n   A S   r e c o r d   a n d   r e t u r n   i t�U  � R      �R)*
�R .ascrerr ****      � ****) o      �Q�Q 0 etext eText* �P+,
�P 
errn+ o      �O�O 0 enumber eNumber, �N-.
�N 
erob- o      �M�M 0 efrom eFrom. �L/�K
�L 
errt/ o      �J�J 
0 eto eTo�K  � k   r �00 121 r   r w343 o   r s�I�I 0 oldtids oldTIDs4 n     565 1   t v�H
�H 
txdl6 1   s t�G
�G 
ascr2 7�F7 Z   x �89�E:8 =   x ;<; o   x y�D�D 0 enumber eNumber< o   y ~�C�C  0 kargvusererror kArgvUserError9 l  � �=>?= R   � ��B@A
�B .ascrerr ****      � ****@ o   � ��A�A 0 etext eTextA �@BC
�@ 
errnB o   � ��?�? 0 enumber eNumberC �>DE
�> 
erobD o   � ��=�= 0 efrom eFromE �<F�;
�< 
errtF o   � ��:�: 
0 eto eTo�;  > : 4 TO DO: check how osascript displays this error info   ? �GG h   T O   D O :   c h e c k   h o w   o s a s c r i p t   d i s p l a y s   t h i s   e r r o r   i n f o�E  : I   � ��9H�8�9 
0 _error  H IJI m   � �KK �LL 8 p a r s e   c o m m a n d   l i n e   a r g u m e n t sJ MNM o   � ��7�7 0 etext eTextN OPO o   � ��6�6 0 enumber eNumberP QRQ o   � ��5�5 0 efrom eFromR S�4S o   � ��3�3 
0 eto eTo�4  �8  �F  ��  � �2T
�2 conscaseT �1U
�1 consdiacU �0V
�0 conshyphV �/W
�/ conspuncW �.�-
�. conswhit�-  � �,�+
�, consnume�+  ��  � XYX l     �*�)�(�*  �)  �(  Y Z[Z l     �'�&�%�'  �&  �%  [ \]\ i  � �^_^ I     �$�#`
�$ .Fil:FHlpnull��� ��� null�#  ` �"ab
�" 
Namea |�!� c�d�!  �   c o      �� 0 commandname commandName�  d l 
    e��e l     f��f m      gg �hh  �  �  �  �  b �ij
� 
Summi |��k�l�  �  k o      �� $0 shortdescription shortDescription�  l l 
    m��m l     n��n m      oo �pp  �  �  �  �  j �qr
� 
Usagq |��s�t�  �  s o      �� "0 commandsynopses commandSynopses�  t l 
    u��
u J      �	�	  �  �
  r �vw
� 
OpsDv |��x�y�  �  x o      �� &0 optiondefinitions optionDefinitions�  y l 
    z��z J      ��  �  �  w � {|
�  
OpsA{ |����}��~��  ��  } o      ���� *0 argumentdefinitions argumentDefinitions��  ~ l 
    ���� J      �� ���� K      �� ������ 0 propertyname propertyName� m      �� ���  a r g u m e n t s L i s t� ������� 0 islist isList� m      ��
�� boovtrue��  ��  ��  ��  | ����
�� 
Docu� |����������  ��  � o      ���� "0 longdescription longDescription��  � l 
    ������ l     ������ m      �� ���  ��  ��  ��  ��  � ����
�� 
VFmt� |����������  ��  � o      ���� 0 isstyled isStyled��  � l 
    ������ l     ������ m      ��
�� boovtrue��  ��  ��  ��  � �����
�� 
DefO� |����������  ��  � o      ���� &0 hasdefaultoptions hasDefaultOptions��  � l     ������ m      ��
�� boovtrue��  ��  ��  _ k    ��� ��� l     ��������  ��  ��  � ��� l     ������  �WQ TO DO: `description` should probably be list of form {{title, text},...}; alternatively, just get rid of `description` parameter as users can append additional content to results themselves (though that would really require style and formatting tools be made available to them; TBH, it's almost certainly not worth the extra complexity)   � ����   T O   D O :   ` d e s c r i p t i o n `   s h o u l d   p r o b a b l y   b e   l i s t   o f   f o r m   { { t i t l e ,   t e x t } , . . . } ;   a l t e r n a t i v e l y ,   j u s t   g e t   r i d   o f   ` d e s c r i p t i o n `   p a r a m e t e r   a s   u s e r s   c a n   a p p e n d   a d d i t i o n a l   c o n t e n t   t o   r e s u l t s   t h e m s e l v e s   ( t h o u g h   t h a t   w o u l d   r e a l l y   r e q u i r e   s t y l e   a n d   f o r m a t t i n g   t o o l s   b e   m a d e   a v a i l a b l e   t o   t h e m ;   T B H ,   i t ' s   a l m o s t   c e r t a i n l y   n o t   w o r t h   t h e   e x t r a   c o m p l e x i t y )� ��� l     ��������  ��  ��  � ��� l     ������  � �  TO DO: any way to determine (via Cocoa) if stderr is connected to a terminal? (if not, isStyled should automatically be false)   � ��� �   T O   D O :   a n y   w a y   t o   d e t e r m i n e   ( v i a   C o c o a )   i f   s t d e r r   i s   c o n n e c t e d   t o   a   t e r m i n a l ?   ( i f   n o t ,   i s S t y l e d   s h o u l d   a u t o m a t i c a l l y   b e   f a l s e )� ��� l     ��������  ��  ��  � ��� l     ������  � � � TO DO: if isStyled, text should be auto-wrapped to terminal width; Q. any way to get current terminal width, if available? (suspect that's a C call only; anything in NSUserDefaults?)   � ���n   T O   D O :   i f   i s S t y l e d ,   t e x t   s h o u l d   b e   a u t o - w r a p p e d   t o   t e r m i n a l   w i d t h ;   Q .   a n y   w a y   t o   g e t   c u r r e n t   t e r m i n a l   w i d t h ,   i f   a v a i l a b l e ?   ( s u s p e c t   t h a t ' s   a   C   c a l l   o n l y ;   a n y t h i n g   i n   N S U s e r D e f a u l t s ? )� ��� l     ��������  ��  ��  � ���� P    ����� Q   ����� k   ��� ��� l   ���� r    ��� n   ��� I    ������� "0 astextparameter asTextParameter� ��� o    ���� 0 commandname commandName� ���� m    �� ���  n a m e��  ��  � o    ���� 0 _supportlib _supportLib� o      ���� 0 commandname commandName� F @ TO DO: also accept file object, and use its last path component   � ��� �   T O   D O :   a l s o   a c c e p t   f i l e   o b j e c t ,   a n d   u s e   i t s   l a s t   p a t h   c o m p o n e n t� ��� r    "��� n    ��� I     ������� "0 aslistparameter asListParameter� ���� o    ���� &0 optiondefinitions optionDefinitions��  ��  � o    ���� 0 _supportlib _supportLib� o      ���� &0 optiondefinitions optionDefinitions� ��� r   # /��� n  # -��� I   ( -������� "0 aslistparameter asListParameter� ���� o   ( )���� *0 argumentdefinitions argumentDefinitions��  ��  � o   # (���� 0 _supportlib _supportLib� o      ���� *0 argumentdefinitions argumentDefinitions� ��� r   0 <��� n  0 :��� I   5 :������� "0 aslistparameter asListParameter� ���� o   5 6���� "0 commandsynopses commandSynopses��  ��  � o   0 5���� 0 _supportlib _supportLib� o      ���� "0 commandsynopses commandSynopses� ��� r   = J��� n  = H��� I   B H������� "0 astextparameter asTextParameter� ��� o   B C���� $0 shortdescription shortDescription� ���� m   C D�� ���  s u m m a r y��  ��  � o   = B���� 0 _supportlib _supportLib� o      ���� $0 shortdescription shortDescription� ��� r   K X��� n  K V��� I   P V������� "0 astextparameter asTextParameter� ��� o   P Q���� "0 longdescription longDescription� ���� m   Q R�� ���  d o c u m e n t a t i o n��  ��  � o   K P���� 0 _supportlib _supportLib� o      ���� "0 longdescription longDescription� ��� Z   Y ������� n  Y d� � I   ^ d������ (0 asbooleanparameter asBooleanParameter  o   ^ _���� 0 isstyled isStyled �� m   _ ` �  t e r m i n a l   s t y l e s��  ��    o   Y ^���� 0 _supportlib _supportLib� l  g �	 r   g �

 K   g ~ ���� 0 n   I   h n������ 0 vt100 VT100 �� m   i j����  ��  ��   ���� 0 b   I   o u������ 0 vt100 VT100 �� m   p q���� ��  ��   ������ 0 u   I   v |������ 0 vt100 VT100 �� m   w x���� ��  ��  ��   o      ���� 0 vtstyle vtStyle�� normal, bold, underline; TO DO: worth putting this in reusable script object as boldText, underlineText methods? (the problem is composability: VT100 codes don't nest as 0 turns everything off, so to selectively turn off one of several styles it's necessary to turn them all off then turn back on those that are still needed; thus to apply styles correctly it's necessary to split the text into an intermediate object tree representation, with each node applying a single style, then walk that tree to generate and insert the appropriate codes; thus a general-purpose VT formatting solution that client scripts can use too really falls outside the scope of FileLib, and probably isn't of sufficient use to ASers to warrant stdlib inclusion anyway)   	 ��   n o r m a l ,   b o l d ,   u n d e r l i n e ;   T O   D O :   w o r t h   p u t t i n g   t h i s   i n   r e u s a b l e   s c r i p t   o b j e c t   a s   b o l d T e x t ,   u n d e r l i n e T e x t   m e t h o d s ?   ( t h e   p r o b l e m   i s   c o m p o s a b i l i t y :   V T 1 0 0   c o d e s   d o n ' t   n e s t   a s   0   t u r n s   e v e r y t h i n g   o f f ,   s o   t o   s e l e c t i v e l y   t u r n   o f f   o n e   o f   s e v e r a l   s t y l e s   i t ' s   n e c e s s a r y   t o   t u r n   t h e m   a l l   o f f   t h e n   t u r n   b a c k   o n   t h o s e   t h a t   a r e   s t i l l   n e e d e d ;   t h u s   t o   a p p l y   s t y l e s   c o r r e c t l y   i t ' s   n e c e s s a r y   t o   s p l i t   t h e   t e x t   i n t o   a n   i n t e r m e d i a t e   o b j e c t   t r e e   r e p r e s e n t a t i o n ,   w i t h   e a c h   n o d e   a p p l y i n g   a   s i n g l e   s t y l e ,   t h e n   w a l k   t h a t   t r e e   t o   g e n e r a t e   a n d   i n s e r t   t h e   a p p r o p r i a t e   c o d e s ;   t h u s   a   g e n e r a l - p u r p o s e   V T   f o r m a t t i n g   s o l u t i o n   t h a t   c l i e n t   s c r i p t s   c a n   u s e   t o o   r e a l l y   f a l l s   o u t s i d e   t h e   s c o p e   o f   F i l e L i b ,   a n d   p r o b a b l y   i s n ' t   o f   s u f f i c i e n t   u s e   t o   A S e r s   t o   w a r r a n t   s t d l i b   i n c l u s i o n   a n y w a y )��  � r   � � K   � � ���� 0 n   m   � � �   �� !�� 0 b    m   � �"" �##  ! ��$���� 0 u  $ m   � �%% �&&  ��   o      ���� 0 vtstyle vtStyle� '(' l  � ���)*��  ) %  construct NAME summary section   * �++ >   c o n s t r u c t   N A M E   s u m m a r y   s e c t i o n( ,-, Z   � �./����. =  � �010 o   � ����� 0 commandname commandName1 m   � �22 �33  / Q   � �4564 l  � �7897 r   � �:;: l  � �<����< I  � ���=��
�� .Fil:SplPnull���     ctxt= l  � �>���> n   � �?@? o   � ��~�~ 0 _  @ l  � �A�}�|A I  � ��{�z�y
�{ .Fil:EnVanull��� ��� null�z  �y  �}  �|  ��  �  ��  ��  ��  ; o      �x�x 0 commandname commandName8 I C TO DO: check this is always available when running via `osascript`   9 �BB �   T O   D O :   c h e c k   t h i s   i s   a l w a y s   a v a i l a b l e   w h e n   r u n n i n g   v i a   ` o s a s c r i p t `5 R      �w�v�u
�w .ascrerr ****      � ****�v  �u  6 l  � �CDEC r   � �FGF m   � �HH �II  C O M M A N DG o      �t�t 0 commandname commandNameD   TO DO: or error?   E �JJ "   T O   D O :   o r   e r r o r ?��  ��  - KLK r   � �MNM b   � �OPO b   � �QRQ b   � �STS b   � �UVU b   � �WXW n  � �YZY o   � ��s�s 0 b  Z o   � ��r�r 0 vtstyle vtStyleX m   � �[[ �\\  N A M EV n  � �]^] o   � ��q�q 0 n  ^ o   � ��p�p 0 vtstyle vtStyleT o   � ��o�o 
0 lf2 LF2R o   � ��n�n 0 indent1 Indent1P o   � ��m�m 0 commandname commandNameN o      �l�l 0 helptext helpTextL _`_ Z   � �ab�k�ja >  � �cdc o   � ��i�i $0 shortdescription shortDescriptiond m   � �ee �ff  b r   � �ghg b   � �iji b   � �klk o   � ��h�h 0 helptext helpTextl m   � �mm �nn    - -  j o   � ��g�g $0 shortdescription shortDescriptionh o      �f�f 0 helptext helpText�k  �j  ` opo l  � ��eqr�e  q B < construct default SYNOPSIS, OPTIONS, and ARGUMENTS sections   r �ss x   c o n s t r u c t   d e f a u l t   S Y N O P S I S ,   O P T I O N S ,   a n d   A R G U M E N T S   s e c t i o n sp tut r   �vwv I      �dx�c�d  0 _formatoptions _formatOptionsx yzy o   � ��b�b &0 optiondefinitions optionDefinitionsz {|{ o   � ��a�a 0 vtstyle vtStyle| }�`} o   � ��_�_ &0 hasdefaultoptions hasDefaultOptions�`  �c  w J      ~~ � o      �^�^ 00 defaultoptionssynopsis defaultOptionsSynopsis� ��]� o      �\�\  0 optionssection optionsSection�]  u ��� r  &��� I      �[��Z�[ $0 _formatarguments _formatArguments� ��� o  �Y�Y *0 argumentdefinitions argumentDefinitions� ��X� o  �W�W 0 vtstyle vtStyle�X  �Z  � J      �� ��� o      �V�V 40 defaultargumentssynopsis defaultArgumentsSynopsis� ��U� o      �T�T $0 argumentssection argumentsSection�U  � ��� r  '<��� b  ':��� b  '6��� b  '2��� b  '.��� o  '(�S�S 0 helptext helpText� o  (-�R�R 
0 lf2 LF2� n .1��� o  /1�Q�Q 0 b  � o  ./�P�P 0 vtstyle vtStyle� m  25�� ���  S Y N O P S I S� n 69��� o  79�O�O 0 n  � o  67�N�N 0 vtstyle vtStyle� o      �M�M 0 helptext helpText� ��� Z  =Q���L�K� = =A��� o  =>�J�J "0 commandsynopses commandSynopses� J  >@�I�I  � r  DM��� J  DK�� ��H� b  DI��� b  DG��� o  DE�G�G 0 commandname commandName� o  EF�F�F 00 defaultoptionssynopsis defaultOptionsSynopsis� o  GH�E�E 40 defaultargumentssynopsis defaultArgumentsSynopsis�H  � o      �D�D "0 commandsynopses commandSynopses�L  �K  � ��� Q  R����� X  U��C�� r  iz��� b  ix��� b  iv��� b  ip��� o  ij�B�B 0 helptext helpText� o  jo�A�A 
0 lf2 LF2� o  pu�@�@ 0 indent1 Indent1� o  vw�?�? 0 textref textRef� o      �>�> 0 helptext helpText�C 0 textref textRef� o  XY�=�= "0 commandsynopses commandSynopses� R      �<�;�
�< .ascrerr ****      � ****�;  � �:��9
�: 
errn� d      �� m      �8�8��9  � n ����� I  ���7��6�7 60 throwinvalidparametertype throwInvalidParameterType� ��� o  ���5�5 "0 commandsynopses commandSynopses� ��� m  ���� ���  s y n o p s i s� ��� m  ���� ���  l i s t   o f   t e x t� ��4� m  ���3
�3 
list�4  �6  � o  ���2�2 0 _supportlib _supportLib� ��� r  ����� b  ����� b  ����� b  ����� b  ����� o  ���1�1 0 helptext helpText� o  ���0�0 
0 lf2 LF2� o  ���/�/  0 optionssection optionsSection� o  ���.�. 
0 lf2 LF2� o  ���-�- $0 argumentssection argumentsSection� o      �,�, 0 helptext helpText� ��� l ���+���+  � - ' add long DESCRIPTION section, if given   � ��� N   a d d   l o n g   D E S C R I P T I O N   s e c t i o n ,   i f   g i v e n� ��� Z  �����*�)� > ����� o  ���(�( "0 longdescription longDescription� m  ���� ���  � r  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� o  ���'�' 0 helptext helpText� o  ���&�& 
0 lf2 LF2� n ����� o  ���%�% 0 b  � o  ���$�$ 0 vtstyle vtStyle� m  ���� ���  D E S C R I P T I O N� n ����� o  ���#�# 0 n  � o  ���"�" 0 vtstyle vtStyle� o  ���!�! 
0 lf2 LF2� o  ��� �  "0 longdescription longDescription� o      �� 0 helptext helpText�*  �)  � ��� L  ���� b  ����� o  ���� 0 helptext helpText� 1  ���
� 
lnfd�  � R      �� 
� .ascrerr ****      � ****� o      �� 0 etext eText  �
� 
errn o      �� 0 enumber eNumber �
� 
erob o      �� 0 efrom eFrom ��
� 
errt o      �� 
0 eto eTo�  � I  ����� 
0 _error    m  ��		 �

 0 f o r m a t   c o m m a n d   l i n e   h e l p  o  ���� 0 etext eText  o  ���� 0 enumber eNumber  o  ���� 0 efrom eFrom � o  ���� 
0 eto eTo�  �  � �
� conscase �

�
 consdiac �	
�	 conshyph �
� conspunc ��
� conswhit�  � ��
� consnume�  ��  ]  l     ����  �  �    l     � �����   ��  ��    l     ��������  ��  ��    i  � � I     ������
�� .Fil:CurFnull��� ��� null��  ��   Q     : !"  k    (## $%$ r    &'& n   ()( I   
 �������� ,0 currentdirectorypath currentDirectoryPath��  ��  ) n   
*+* I    
��������  0 defaultmanager defaultManager��  ��  + n   ,-, o    ���� 0 nsfilemanager NSFileManager- m    ��
�� misccura' o      ���� 0 asocpath asocPath% ./. Z   !01����0 =   232 o    ���� 0 asocpath asocPath3 m    ��
�� 
msng1 R    ��45
�� .ascrerr ****      � ****4 m    66 �77  N o t   a v a i l a b l e .5 ��8��
�� 
errn8 m    �����@��  ��  ��  / 9��9 L   " (:: c   " ';<; c   " %=>= o   " #���� 0 asocpath asocPath> m   # $��
�� 
ctxt< m   % &��
�� 
psxf��  ! R      ��?@
�� .ascrerr ****      � ****? o      ���� 0 etext eText@ ��AB
�� 
errnA o      ���� 0 enumber eNumberB ��CD
�� 
erobC o      ���� 0 efrom eFromD ��E��
�� 
errtE o      ���� 
0 eto eTo��  " I   0 :��F���� 
0 _error  F GHG m   1 2II �JJ , c u r r e n t   w o r k i n g   f o l d e rH KLK o   2 3���� 0 etext eTextL MNM o   3 4���� 0 enumber eNumberN OPO o   4 5���� 0 efrom eFromP Q��Q o   5 6���� 
0 eto eTo��  ��   RSR l     ��������  ��  ��  S TUT l     ��������  ��  ��  U VWV i  � �XYX I     ������
�� .Fil:EnVanull��� ��� null��  ��  Y L     ZZ c     [\[ l    ]����] n    ^_^ I    �������� 0 environment  ��  ��  _ n    `a` I    �������� 0 processinfo processInfo��  ��  a n    bcb o    ���� 0 nsprocessinfo NSProcessInfoc m     ��
�� misccura��  ��  \ m    ��
�� 
****W ded l     ��������  ��  ��  e fgf l     ��������  ��  ��  g hih i  � �jkj I     ������
�� .Fil:RSInnull��� ��� null��  ��  k l    Elmnl Q     Eopqo k    3rr sts r    uvu n   wxw I   
 �������� *0 readdatatoendoffile readDataToEndOfFile��  ��  x n   
yzy I    
�������� :0 filehandlewithstandardinput fileHandleWithStandardInput��  ��  z n   {|{ o    ���� 0 nsfilehandle NSFileHandle| m    ��
�� misccurav o      ���� 0 asocdata asocDatat }~} r    "� n    ��� I     ������� 00 initwithdata_encoding_ initWithData_encoding_� ��� o    ���� 0 asocdata asocData� ���� l   ������ n   ��� o    ���� ,0 nsutf8stringencoding NSUTF8StringEncoding� m    ��
�� misccura��  ��  ��  ��  � n   ��� I    �������� 	0 alloc  ��  ��  � n   ��� o    ���� 0 nsstring NSString� m    ��
�� misccura� o      ���� 0 
asocstring 
asocString~ ���� Z  # 3������� =  # &��� o   # $���� 0 asocdata asocData� m   $ %��
�� 
msng� R   ) /����
�� .ascrerr ****      � ****� m   - .�� ��� , N o t   U T F 8 - e n c o d e d   t e x t .� �����
�� 
errn� m   + ,�����\��  ��  ��  ��  p R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  q I   ; E���� 
0 _error  � ��� m   < =�� ��� & r e a d   s t a n d a r d   i n p u t� ��� o   = >�� 0 etext eText� ��� o   > ?�� 0 enumber eNumber� ��� o   ? @�� 0 efrom eFrom� ��� o   @ A�� 
0 eto eTo�  �  m 2 , TO DO: what about interactive (line) input?   n ��� X   T O   D O :   w h a t   a b o u t   i n t e r a c t i v e   ( l i n e )   i n p u t ?i ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ��~�}�  �~  �}  � ��� l     �|�{�z�|  �{  �z  � ��� l     �y���y  � / ) TEST -- TO DO: move to test suite, natch   � ��� R   T E S T   - -   T O   D O :   m o v e   t o   t e s t   s u i t e ,   n a t c h� ��� l     �x�w�v�x  �w  �v  � ��� i   � ���� I     �u�t�s
�u .aevtoappnull  �   � ****�t  �s  � k     �� ��� h     �r��r 0 	test_argv 	test_ARGV� k      �� ��� l     �q�p�o�q  �p  �o  � ��� j     b�n��n (0 _optiondefinitions _optionDefinitions� J     a�� ��� l 	   ��m�l� K     �� �k���k 0 	shortname 	shortName� m    �� ���  a� �j��i�j 0 propertyname propertyName� m    �� ���  a b l e�i  �m  �l  � ��� l 	  ��h�g� K    �� �f���f 0 	shortname 	shortName� m    �� ���  i� �e���e 0 longname longName� m   	 
�� ��� 
 i d i o t� �d���d 0 	valuetype 	valueType� m    �c
�c 
bool� �b��a�b 0 defaultvalue defaultValue� m    �`
�` boovtrue�a  �h  �g  � ��� l 	  ��_�^� K    �� �]���] 0 	shortname 	shortName� m    �� ���  I� �\���\ 0 longname longName� m    �� ���  b i g - i d i o t� �[���[ 0 propertyname propertyName� m    �� ���  b i g I d i o t� �Z��Y�Z 0 	valuetype 	valueType� m    �X
�X 
bool�Y  �_  �^  � ��� l 	  *��W�V� K    *�� �U���U 0 	shortname 	shortName� m    �� ���  n� �T���T 0 propertyname propertyName� m     �� �    n u m b e r� �S�S 0 	valuetype 	valueType m   ! $�R
�R 
nmbr �Q�P�Q 0 defaultvalue defaultValue m   % ( ?�(�\)�P  �W  �V  �  l 	 * F�O�N K   * F �M	
�M 0 	shortname 	shortName	 m   + . �  f
 �L�L 0 longname longName m   / 2 �  f o o �K�K 0 	valuetype 	valueType m   3 6�J
�J 
ctxt �I�I $0 valueplaceholder valuePlaceholder m   9 < �  N A M E �H�G�H $0 valuedescription valueDescription m   ? B �  b l a h - b l a h�G  �O  �N   �F l 	 F ]�E�D l 
 F ]�C�B K   F ] �A�A 0 	shortname 	shortName m   G J   �!!  u �@"#�@ 0 longname longName" m   K N$$ �%%  u p p# �?&'�? 0 	valuetype 	valueType& m   O R�>
�> 
nmbr' �=()�= 0 islist isList( m   U V�<
�< boovtrue) �;*�:�; 0 defaultvalue defaultValue* J   W Y�9�9  �:  �C  �B  �E  �D  �F  � +,+ l     �8�7�6�8  �7  �6  , -.- j   c ��5/�5 ,0 _argumentdefinitions _argumentDefinitions/ J   c �00 121 l 	 c u3�4�33 K   c u44 �256�2 0 propertyname propertyName5 m   d g77 �88  a r g 16 �19:�1 0 	valuetype 	valueType9 m   h k�0
�0 
file: �/;�.�/ $0 valueplaceholder valuePlaceholder; m   n q<< �==  O U T D I R�.  �4  �3  2 >?> l 	 u �@�-�,@ K   u �AA �+BC�+ 0 propertyname propertyNameB m   v yDD �EE  a r g 2C �*FG�* 0 	valuetype 	valueTypeF m   z }�)
�) 
fileG �(HI�( $0 valueplaceholder valuePlaceholderH m   � �JJ �KK  S R C D I RI �'L�&�' 0 defaultvalue defaultValueL m   � �MM �NN  . /�&  �-  �,  ? O�%O l 	 � �P�$�#P l 
 � �Q�"�!Q K   � �RR � ST�  0 propertyname propertyNameS m   � �UU �VV  o t h e r A r g sT �WX� 0 	valuetype 	valueTypeW m   � ��
� 
ctxtX �YZ� 0 islist isListY m   � ��
� boovtrueZ �[�� 0 defaultvalue defaultValue[ J   � ���  �  �"  �!  �$  �#  �%  . \]\ l     ����  �  �  ] ^_^ l    `��` r     aba J     cc ded m     ff �gg  - i I u 3 3 . 3e hih m    jj �kk  - - f o o = b a ri lml m    nn �oo  - um pqp m    rr �ss  2 . 4q tut m    vv �ww  - u 5u xyx m    zz �{{  - a o ky |}| m    ~~ �  b l a g} ��� m    �� ���  a r g 1� ��� m    	�� ���  a r g 2�  b o      �� 0 args  �  �  _ ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l   1���
� I   1�	��
�	 .ascrcmnt****      � ****� l   -���� I   -���
� .Fil:FHlpnull��� ��� null�  � ���
� 
Name� m    �� ���  f o o� ���
� 
OpsD� o    �� (0 _optiondefinitions _optionDefinitions� � ��
�  
OpsA� o    ���� ,0 _argumentdefinitions _argumentDefinitions� ����
�� 
Summ� m    �� ��� , s m u r g l e s   t h e   w u r l i t z e r� ����
�� 
VFmt� m   & '��
�� boovfals� �����
�� 
DefO��  �  �  �  �  �
  � ��� l     ��������  ��  ��  � ��� l  2 E������ I  2 E����
�� .Fil:Argvnull���     ****� o   2 3���� 0 args  � ����
�� 
OpsD� o   4 9���� (0 _optiondefinitions _optionDefinitions� �����
�� 
OpsA� o   : ?���� ,0 _argumentdefinitions _argumentDefinitions��  ��  ��  � ��� l     ������  � � �> {|help|:false, bigIdiot:true, idiot:false, otherArgs:{"arg1", "arg2"}, arg1:file "Macintosh HD:blag", able:"ok", |version|:false, foo:"bar", upp:{33.3, 2.4, 5}}   � ���D >   { | h e l p | : f a l s e ,   b i g I d i o t : t r u e ,   i d i o t : f a l s e ,   o t h e r A r g s : { " a r g 1 " ,   " a r g 2 " } ,   a r g 1 : f i l e   " M a c i n t o s h   H D : b l a g " ,   a b l e : " o k " ,   | v e r s i o n | : f a l s e ,   f o o : " b a r " ,   u p p : { 3 3 . 3 ,   2 . 4 ,   5 } }� ���� l     ��������  ��  ��  ��  � ��� l   ��������  ��  ��  � ��� I   �����
�� .aevtoappnull  �   � ****� o    	���� 0 	test_argv 	test_ARGV��  � ���� l   ��������  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ���� l     ��������  ��  ��  ��       !�������������������������������������  � ��������������������������������������������������
�� 
pimr�� 0 _supportlib _supportLib�� 
0 _error  �� (0 _nsstringencodings _NSStringEncodings
�� .Fil:Readnull���     file
�� .Fil:Writnull���     file
�� .Fil:ConPnull���     ****
�� .Fil:NorPnull���     ****
�� .Fil:JoiPnull���     ****
�� .Fil:SplPnull���     ctxt��  0 kargvusererror kArgvUserError�� 0 novalue NoValue�� 
0 lf2 LF2�� 0 indent1 Indent1�� 0 indent2 Indent2�� 0 vt100 VT100�� 0 _unpackvalue _unpackValue�� 40 _defaultvalueplaceholder _defaultValuePlaceholder�� *0 _formatdefaultvalue _formatDefaultValue� (0 _buildoptionstable _buildOptionsTable� 0 _parseoptions _parseOptions� (0 _adddefaultoptions _addDefaultOptions� "0 _parsearguments _parseArguments�  0 _formatoptions _formatOptions� $0 _formatarguments _formatArguments
� .Fil:Argvnull���     ****
� .Fil:FHlpnull��� ��� null
� .Fil:CurFnull��� ��� null
� .Fil:EnVanull��� ��� null
� .Fil:RSInnull��� ��� null
� .aevtoappnull  �   � ****� ��� �  ��� ���
� 
cobj� ��   � 
� 
frmk�  � ���
� 
cobj� ��   �
� 
osax�  � ��   � +
� 
scpt� � 5������ 
0 _error  � ��� �  ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�  � ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�  E��� � &0 throwcommanderror throwCommandError� b  ࠡ����+ � � b  �� (0 _nsstringencodings _NSStringEncodings�  ���� ��� 
0 _list_  � 0 getencoding getEncoding� ��� �  ���������������������� ��� �  ��
� FEncFE01� � ��� �  ��
� FEncFE02� 
� ��� �  � �
� FEncFE03� ��� �  � �
� FEncFE04� � �    � �
� FEncFE05� ��   � �
� FEncFE06� ��   � �
� FEncFE07� ��   ��
� FEncFE11� � ��   ��
� FEncFE12� � ��   ��~
� FEncFE13�~ � �}�}   �|�{
�| FEncFE14�{ 	� �z�z   �y�x
�y FEncFE15�x � �w�w   �v�u
�v FEncFE16�u � �t	�t 	  �s�r
�s FEncFE17�r � �q
�q 
  �p�o
�p FEncFE18�o � �n�n   �m�l
�m FEncFE19�l � �k�k   �j�i
�j FEncFE50�i � �h�h   �g�f
�g FEncFE51�f � �e�e   �d�c
�d FEncFE52�c � �b�b   �a�`
�a FEncFE53�` � �_�_   �^�]
�^ FEncFE54�] � �\�[�Z�Y�\ 0 getencoding getEncoding�[ �X�X   �W�W 0 textencoding textEncoding�Z   �V�U�V 0 textencoding textEncoding�U 0 aref aRef �T�S�R�Q�P�O�N�M�L�K�J�IE
�T 
enum�S 
0 _list_  
�R 
kocl
�Q 
cobj
�P .corecnte****       ****�O   �H�G�F
�H 
errn�G�\�F  
�N 
long
�M 
errn�L�Y
�K 
erob
�J 
errt�I �Y W 5��&E�O ))�,[��l kh ��k/�  ��l/EY h[OY��W X   	��&W X  hO)�������� �Ea�D�C�B
�E .Fil:Readnull���     file�D 0 thefile theFile�C �A
�A 
Type {�@�?�>�@ 0 datatype dataType�?  
�> 
ctxt �=�<
�= 
Enco {�;�:�9�; 0 textencoding textEncoding�:  
�9 FEncFE01�<   �8�7�6�5�4�3�2�1�0�/�.�-�8 0 thefile theFile�7 0 datatype dataType�6 0 textencoding textEncoding�5 0 	posixpath 	posixPath�4 0 
asocstring 
asocString�3 0 theerror theError�2 0 fh  �1 0 	theresult 	theResult�0 0 etext eText�/ 0 enumber eNumber�. 0 efrom eFrom�- 
0 eto eTo  {�,��+�*�)�(�'�&�%�$�#�"�!� ����������������, ,0 asposixpathparameter asPOSIXPathParameter�+ "0 astypeparameter asTypeParameter
�* 
ctxt
�) FEncFEPE
�( 
bool�' 0 getencoding getEncoding
�& misccura�% 0 nsstring NSString
�$ 
obj �# T0 (stringwithcontentsoffile_encoding_error_ (stringWithContentsOfFile_encoding_error_
�" 
cobj
�! 
msng
�  
errn� 0 code  
� 
erob
� 
errt� � ,0 localizeddescription localizedDescription
� 
psxf
� .rdwropenshor       file
� 
as  
� .rdwrread****        ****
� .rdwrclosnull���     ****� 0 etext eText ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom ���

� 
errt� 
0 eto eTo�
  �  �  � � 
0 _error  �B � �b  ��l+ E�Ob  ��l+ E�O�� 	 ���& Ub  �k+ E�O��,���m+ E[�k/E�Z[�l/E�ZO��  )�j+ a �a �a �j+ �&Y hO��&Y O�a &j E�O �a �l E�O�j O�W )X   
�j W X  hO)�a �a �a �W X  *a ����a + � �	���
�	 .Fil:Writnull���     file� 0 thefile theFile� ��
� 
Data� 0 thedata theData � !
� 
Type  {��� � 0 datatype dataType�  
�  
ctxt! ��"��
�� 
Enco" {�������� 0 textencoding textEncoding��  
�� FEncFE01��   ������������������������������ 0 thefile theFile�� 0 thedata theData�� 0 datatype dataType�� 0 textencoding textEncoding�� 0 	posixpath 	posixPath�� 0 
asocstring 
asocString�� 0 
didsucceed 
didSucceed�� 0 theerror theError�� 0 fh  �� 0 	theresult 	theResult�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo '4��@������������\����������������������������������������������#����������� ,0 asposixpathparameter asPOSIXPathParameter�� "0 astypeparameter asTypeParameter
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
�� .rdwrclosnull���     ****�� 0 etext eText# ����$
�� 
errn�� 0 enumber eNumber$ ����%
�� 
erob�� 0 efrom eFrom% ������
�� 
errt�� 
0 eto eTo��  ��  ��  �� �� 
0 _error  �
 �b  ��l+ E�Ob  ��l+ E�O�� 	 ���& i��,b  ��l+ 
k+ E�Ob  �k+ E�O��e���+ E[a k/E�Z[a l/E�ZO� !)a �j+ a �a �a �j+ �&Y hY a�a &a el E�O %�a jl O�a �a �� O�j O�W +X   ! 
�j W X " #hO)a �a �a �a �W X   !*a $����a %+ &� �������&'��
�� .Fil:ConPnull���     ****�� 0 filepath filePath�� �()
� 
From( {���� 0 
fromformat 
fromFormat�  
� FLCTFLCP) �*�
� 
To__* {���� 0 toformat toFormat�  
� FLCTFLCP�  & 	���������� 0 filepath filePath� 0 
fromformat 
fromFormat� 0 toformat toFormat� 0 	posixpath 	posixPath� 0 asocurl asocURL� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo' -���������D�����������c���j�������������+��
� 
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
� FLCTFLCW
� FLCTFLCU
� misccura� 0 nsurl NSURL�  0 urlwithstring_ URLWithString_
� 
msng� 0 fileurl fileURL
� 
bool
� 
errn��Y
� 
erob� 
� 
errt
� 
enum� 
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
ascr� $0 fileurlwithpath_ fileURLWithPath_�  0 absolutestring absoluteString� 0 etext eText+ ��,
� 
errn� 0 enumber eNumber, ��-
� 
erob� 0 efrom eFrom- ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �����kv��l j  b  ��l+ E�Y ���  �E�Y u��  *�/�,E�Y d��  	)j�Y W��  9��,�k+ E�O�� 
 �j+ a & )a a a �a a Y hY )a a a �a a a a O�a ,j  )a a a �a a Y hO��  �Y ��a   �a &a &Y ��a    �a &Y ��a !  _ "�a &�&/Y u��  �a &�&Y d��  )ja #Y U��  7��,�k+ $E�O��  )a a a �a a %�%Y hO�j+ &�&Y )a a a �a a a a 'W X ( )*a *����a ++ ,� �)��./�
� .Fil:NorPnull���     ****� 0 filepath filePath� �0�~
� 
ExpR0 {�}�|�{�} 0 isexpanding isExpanding�|  
�{ boovfals�~  . �z�y�x�w�v�z 0 filepath filePath�y 0 isexpanding isExpanding�x 0 etext eText�w 0 enumber eNumber�v 
0 eto eTo/ >�uI�t�s�r�q�p�o�n�m�l1h�k�j�u ,0 asposixpathparameter asPOSIXPathParameter
�t 
bool
�s .Fil:CurFnull��� ��� null
�r .Fil:JoiPnull���     ****
�q misccura�p 0 nsstring NSString�o &0 stringwithstring_ stringWithString_�n 60 stringbystandardizingpath stringByStandardizingPath
�m 
ctxt�l 0 etext eText1 �i�h2
�i 
errn�h 0 enumber eNumber2 �g�f�e
�g 
errt�f 
0 eto eTo�e  �k �j 
0 _error  � S Bb  ��l+ E�O�	 ���& *j �lvj E�Y hO��,�k+ j+ 	�&W X  *������+ � �dx�c�b34�a
�d .Fil:JoiPnull���     ****�c  0 pathcomponents pathComponents�b �`5�_
�` 
Exte5 {�^�]�^ 0 fileextension fileExtension�]  �_  3 	�\�[�Z�Y�X�W�V�U�T�\  0 pathcomponents pathComponents�[ 0 fileextension fileExtension�Z 0 subpaths subPaths�Y 0 aref aRef�X 0 asocpath asocPath�W 0 etext eText�V 0 enumber eNumber�U 0 efrom eFrom�T 
0 eto eTo4 ��S�R�Q�P�O��N�M�L�K�J�I�H��G�F�E��D�C�B�A��@�?6��>�=�S "0 aslistparameter asListParameter
�R 
cobj
�Q 
kocl
�P .corecnte****       ****
�O 
pcnt�N ,0 asposixpathparameter asPOSIXPathParameter�M  �L  
�K 
errn�J�Y
�I 
erob�H 
�G misccura�F 0 nsstring NSString�E *0 pathwithcomponents_ pathWithComponents_�D "0 astextparameter asTextParameter
�C 
leng�B B0 stringbyappendingpathextension_ stringByAppendingPathExtension_
�A 
msng
�@ 
ctxt�? 0 etext eText6 �<�;7
�< 
errn�; 0 enumber eNumber7 �:�98
�: 
erob�9 0 efrom eFrom8 �8�7�6
�8 
errt�7 
0 eto eTo�6  �> �= 
0 _error  �a � �b  ��l+ �-E�O ;�jv  	)jhY hO %�[��l kh b  ��,�l+ ��,F[OY��W X  	)�����O�a ,�k+ E�Ob  �a l+ E�O�a ,j $��k+ E�O�a   )����a Y hY hO�a &W X  *a ����a + � �5�4�39:�2
�5 .Fil:SplPnull���     ctxt�4 0 filepath filePath�3 �1;�0
�1 
Upon; {�/�.�-�/ 0 splitposition splitPosition�.  
�- FLSPFLSL�0  9 �,�+�*�)�(�'�&�%�, 0 filepath filePath�+ 0 splitposition splitPosition�* 0 asocpath asocPath�) 0 matchformat matchFormat�( 0 etext eText�' 0 enumber eNumber�& 0 efrom eFrom�% 
0 eto eTo: �$�#'�"�!� ���������������c�<t��
�$ misccura�# 0 nsstring NSString�" ,0 asposixpathparameter asPOSIXPathParameter�! &0 stringwithstring_ stringWithString_
�  FLSPFLSL� F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent
� 
ctxt� &0 lastpathcomponent lastPathComponent
� FLSPFLSE� >0 stringbydeletingpathextension stringByDeletingPathExtension� 0 pathextension pathExtension
� FLSPFLSA�  0 pathcomponents pathComponents
� 
list
� 
errn��Y
� 
erob
� 
errt
� 
enum� � 0 etext eText< ��=
� 
errn� 0 enumber eNumber= ��
>
� 
erob�
 0 efrom eFrom> �	��
�	 
errt� 
0 eto eTo�  � � 
0 _error  �2 � u��,b  ��l+ k+ E�O��  �j+ �&�j+ �&lvY C��  �j+ 
�&�j+ �&lvY )��  �j+ �&Y )�a a �a a a a W X  *a ����a + ��'� ��  ?� 0 novalue NoValue?  @@  � �AA  
 
� ����BC�� 0 vt100 VT100� �D� D  � �  0 
formatcode 
formatCode�  B ���� 0 
formatcode 
formatCodeC ��������
�� 
cha �� 
�� kfrmID  � )���0�%�%�%� �������EF���� 0 _unpackvalue _unpackValue�� ��G�� G  ������ 0 thevalue theValue�� $0 definitionrecord definitionRecord��  E ���������������� 0 thevalue theValue�� $0 definitionrecord definitionRecord�� 0 	valuetype 	valueType�� 0 	theresult 	theResult�� 0 asocformatter asocFormatter�� 0 
asocresult 
asocResult�� 0 basepath basePathF 6������������������������������������=��X����������������������������H������������������ 0 	valuetype 	valueType
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
psxf�� �� 0 nsfilemanager NSFileManager��  0 defaultmanager defaultManager�� ,0 currentdirectorypath currentDirectoryPath�� 0 nsstring NSString�� *0 pathwithcomponents_ pathWithComponents_�� &0 stringwithstring_ stringWithString_�� 60 stringbystandardizingpath stringByStandardizingPath��  H ������
�� 
errn������  
�� 
bool���Y
�� 
erob
�� 
errt�� ��¡�,�&E�O��  �E�Y����mv�kv ���,j+ j+ 	E�O���,k+ O���,j+ k+ O��k+ E�O�a   )a b  
la �%Y hO�a &E�O��  '�k#j )a b  
la �%Y hO��&E�Y hYa a a a a v�kv ��a  A�a ,j+ j+ E�O�a   )a b  
la �%Y hO�a ,��lvk+  E�Y hO�a ,�k+ !j+ "�&a &E�O �a   �a &E�Y hW X # $)a b  
la %�%Y v�a &  Uga ' Ka (a )a *a +a v�kv eY .a ,a -a .a /a v�kv fY )a b  
la 0�%VY )a a 1a 2��,a 3�a 4a 5O�� ��3����IJ���� 40 _defaultvalueplaceholder _defaultValuePlaceholder�� ��K�� K  ���� $0 definitionrecord definitionRecord��  I ��� $0 definitionrecord definitionRecord� 0 	valuetype 	valueTypeJ ���O���eh�����{��������� 0 	valuetype 	valueType
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
� 
furl
� 
alis
� 
file
� 
psxf� 
� 
bool
� 
errn��Y
� 
erob
� 
errt� �� h��,�&E�O��  �Y V���mv�kv ��  �Y �Y :�����v�kv �Y (��  	a Y )a a a ��,a �a a � ����LM�� *0 _formatdefaultvalue _formatDefaultValue� �N� N  �� $0 definitionrecord definitionRecord�  L ����� $0 definitionrecord definitionRecord� 0 defaultvalue defaultValue� 0 defaulttext defaultText� 0 asocformatter asocFormatterM ������������������������/8;CE� 0 defaultvalue defaultValue
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
a E�Y a Oa �%a %� �Y��OP�� (0 _buildoptionstable _buildOptionsTable� �Q� Q  �� &0 optiondefinitions optionDefinitions�  O ����� &0 optiondefinitions optionDefinitions� 20 optiondefinitionsbyname optionDefinitionsByName� 0 	optionref 	optionRef� $0 optiondefinition optionDefinitionP  ���~�}�|�{�z�y�x��w��v��u�t�s�r�q���p��o�n�m�l�����
� misccura� *0 nsmutabledictionary NSMutableDictionary�~ 0 
dictionary  
�} 
kocl
�| 
cobj
�{ .corecnte****       ****
�z 
pcnt
�y 
reco�x 0 	shortname 	shortName�w 0 longname longName�v 0 propertyname propertyName�u 0 	valuetype 	valueType
�t 
ctxt�s 0 islist isList�r 0 defaultvalue defaultValue�q �p &0 setobject_forkey_ setObject_forKey_
�o 
errn�n�Y
�m 
erob�l � ���,j+ E�O ��[��l kh ��,�&��������a fa fa %E�O��,a  ��a ��,%l+ Y "��,a   )a a a �a a Y hO��,a  ��a ��,%l+ Y "��,a   )a a a �a a Y h[OY�hO�� �k��j�iRS�h�k 0 _parseoptions _parseOptions�j �gT�g T  �f�e�d�f 0 rawarguments rawArguments�e &0 optiondefinitions optionDefinitions�d &0 hasdefaultoptions hasDefaultOptions�i  R �c�b�a�`�_�^�]�\�[�Z�Y�X�W�c 0 rawarguments rawArguments�b &0 optiondefinitions optionDefinitions�a &0 hasdefaultoptions hasDefaultOptions�` 20 optiondefinitionsbyname optionDefinitionsByName�_ (0 asocparametersdict asocParametersDict�^ 0 thearg theArg�] 0 
optionname 
optionName�\ $0 optiondefinition optionDefinition�[ 0 ishelp isHelp�Z 0 	isversion 	isVersion�Y 0 propertyname propertyName�X 0 thevalue theValue�W 0 thelist theListS 4�V�U�T�S	�R�Q�P	3	?�O�N�M�L�K	~	��J�I�H�G�F�E	�



�D
9�C
C�B
P�A
i�@�?�>�=�<
��;�:
��9�8�7�6�5
��4�V (0 _buildoptionstable _buildOptionsTable
�U misccura�T *0 nsmutabledictionary NSMutableDictionary�S 0 
dictionary  
�R 
ascr
�Q 
txdl
�P 
cobj
�O 
rest
�N 
citm
�M 
kocl
�L .corecnte****       ****
�K 
ctxt
�J 
leng�I 0 objectforkey_ objectForKey_
�H 
msng
�G 
****�F 0 	valuetype 	valueType
�E 
bool�D $0 removeallobjects removeAllObjects�C $0 setvalue_forkey_ setValue_forKey_
�B 
errn�A 0 propertyname propertyName�@ 0 longname longName�? 0 defaultvalue defaultValue�>  �=  �<�\
�; 
errt�: �9 0 _unpackvalue _unpackValue�8 0 islist isList�7  0 nsmutablearray NSMutableArray�6 $0 arraywithobject_ arrayWithObject_�5 0 
addobject_ 
addObject_�4 &0 setobject_forkey_ setObject_forKey_�hq*�k+  E�O��,j+ E�O���,FOPh�jv ��k/E�O�� C��  ��,E�OY hO��k/E�O���l k �[�\[�l/\Zi2��k/FY ��,E�Y ��� z�a   Y hO�[�\[Zk\Zl2E�O�a ,l L�[�\[Zm\Zi2��k/FO��k+ E�O�a 	 �a &a ,a  a & a ��k/%��k/FY hY ��,E�Y O��k+ E�O�a   x� _a a lv�kva a lv�kvlvE[�k/E�Z[�l/E�ZO�
 �a & %�j+ O��a l+ O��a l+ OjvE�OY hY hO)a  b  
la !�%Y hO�a &E�O�a ",E�O�a #  �a $,E�Y hO�a ,a   & �a %,E�W X & ')a  a (la )�%Y :�jv  )a  b  
a *�a ,a +a ,�%Y hO*��k/�l+ -E�O��,E�O�a .,E /��k+ E�O�a   �a /,�k+ 0E�Y ��k+ 1O�E�Y #��k+ a  )a  b  
la 2�%Y hO���l+ 3[OY��O��lv� �3�2�1UV�0�3 (0 _adddefaultoptions _addDefaultOptions�2 �/W�/ W  �.�-�. (0 asocparametersdict asocParametersDict�- &0 optiondefinitions optionDefinitions�1  U �,�+�*�)�(�'�&�%�, (0 asocparametersdict asocParametersDict�+ &0 optiondefinitions optionDefinitions�* 0 recref recRef�) 0 rec  �( 0 propertyname propertyName�' 0 thevalue theValue�& 0 
optionname 
optionName�% 0 aref aRefV �$�#�"�!� ���,��S]c��l������
�$ 
kocl
�# 
cobj
�" .corecnte****       ****
�! 
reco�  0 propertyname propertyName� 0 longname longName� 0 defaultvalue defaultValue� � 0 objectforkey_ objectForKey_
� 
msng� 0 	shortname 	shortName
� 
errn
� misccura� 0 nsnull NSNull� 0 null  � &0 setobject_forkey_ setObject_forKey_�0 � ��[��l kh ��&�����b  �%E�O��,E�O��  
��,E�Y hO��k+ �  e��,E�O�b    1���,%E�O��  �a ,%E�Y hO)a b  
la �%Y hO��  a a ,j+ E�Y hO���l+ Y h[OY�bO 1a a lv[��l kh ��k+ �  �f�l+ Y h[OY��� ����XY�� "0 _parsearguments _parseArguments� �Z� Z  ���� 0 argumentslist argumentsList� *0 argumentdefinitions argumentDefinitions� (0 asocparametersdict asocParametersDict�  X 	���
�	������ 0 argumentslist argumentsList� *0 argumentdefinitions argumentDefinitions�
 (0 asocparametersdict asocParametersDict�	 0 i  � 0 argcount argCount� 0 argref argRef� (0 argumentdefinition argumentDefinition� 0 thevalue theValue� 0 aref aRefY ���� �������������������������������@��vz|
� 
leng
� 
kocl
� 
cobj
�  .corecnte****       ****
�� 
pcnt
�� 
reco�� 0 propertyname propertyName�� 0 	valuetype 	valueType
�� 
ctxt�� 0 islist isList�� 0 defaultvalue defaultValue�� 
�� 
errn���Y
�� 
erob�� �� 0 _unpackvalue _unpackValue
�� 
rest�� &0 setobject_forkey_ setObject_forKey_�jE�O��,E�O ��[��l kh �kE�O��,�&�����f�b  �%E�O��,�  )��a �a a Y hO�jv  +��,E�O�b    )�b  
la �%a %Y hY *��k/�l+ E�O�a ,E�O��,E L���, )��a �a a Y hO�kvE�O  �[��l kh *��,�l+ �6F[OY��OjvE�Y hO����,l+ [OY�!O�jv )�b  
la ��,%a %�%a %Y h� �������[\����  0 _formatoptions _formatOptions�� ��]�� ]  �������� &0 optiondefinitions optionDefinitions�� 0 vtstyle vtStyle�� &0 hasdefaultoptions hasDefaultOptions��  [ �������������������������������������� &0 optiondefinitions optionDefinitions�� 0 vtstyle vtStyle�� &0 hasdefaultoptions hasDefaultOptions��  0 defaultoptions defaultOptions��  0 booleanoptions booleanOptions�� 0 otheroptions otherOptions��  0 optionssection optionsSection�� 0 	optionref 	optionRef�� $0 optiondefinition optionDefinition�� 0 	shortname 	shortName�� 0 longname longName�� 0 	valuetype 	valueType�� 0 islist isList�� $0 valueplaceholder valuePlaceholder�� $0 valuedescription valueDescription�� 0 
optionname 
optionName�� 0 
isoptional 
isOptional�� "0 optionssynopsis optionsSynopsis\ D��������������������������������������������^(,����>G������K[jqy�����������%68@IZ\bjtv~���
�� 
cobj�� 0 b  �� 0 n  
�� 
kocl
�� .corecnte****       ****
�� 
reco�� 0 	shortname 	shortName�� 0 longname longName�� 0 	valuetype 	valueType
�� 
ctxt�� 0 islist isList�� 0 defaultvalue defaultValue�� $0 valueplaceholder valuePlaceholder�� $0 valuedescription valueDescription�� 
�� 
type
�� 
bool��  ^ ���
� 
errn��\�  �� �� 60 throwinvalidparametertype throwInvalidParameterType
�� 
errn���Y
�� 
erob
� 
spac� 40 _defaultvalueplaceholder _defaultValuePlaceholder� 0 u  � *0 _formatdefaultvalue _formatDefaultValue
� 
lnfd������mvE[�k/E�Z[�l/E�Z[�m/E�ZO��,�%��,%E�Oݠ[��l kh ��&������a fa b  a a a a a %E�O >��,�&E�O��,�&E�O��,a &E�O�a ,a &E�O�a ,�&E�O�a ,�&E�W X  b  �a a �a + O�b  %b  %E�O�a   1�a    )a !a "a #�a a $Y hO�E�O�a %%�%E�Y %�E�O�a &%�%E�O�a ' �a (%�%E�Y hO�a   
��%E�Y ��a ,b  E^ O�_ )%E�O]  �a *%E�Y hO�a +%�%E�O�E�O�a ,  *�k+ -E�Y hO�a .,�%��,%E�O�_ )%�%E�O]  �a /%E�Y hO�_ )%�%E�O�a ,b   �*�k+ 0%E�Y hO� �a 1%E�Y hO�a 2 �_ 3%b  %�%_ )%E�Y h[OY�1O� r�a 4 .a 5�%E�O�b  %b  %a 6%_ 3%b  %a 7%E�Y hO�a 8 .�a 9%E�O�b  %b  %a :%_ 3%b  %a ;%E�Y hY hOa <E^ O�a = ] a >%�%a ?%E^ Y hO�a @ ] a A%�%a B%E^ Y hO�a C ] �%E^ Y hO] �lv� ����_`�� $0 _formatarguments _formatArguments� �a� a  ��� *0 argumentdefinitions argumentDefinitions� 0 vtstyle vtStyle�  _ 
����������� *0 argumentdefinitions argumentDefinitions� 0 vtstyle vtStyle� &0 argumentssynopsis argumentsSynopsis� $0 argumentssection argumentsSection� 0 argumentref argumentRef� (0 argumentdefinition argumentDefinition� 0 	valuetype 	valueType� 0 islist isList� $0 valueplaceholder valuePlaceholder� $0 valuedescription valueDescription` &����������������������b��&�4��\�tv��� 0 b  � 0 n  
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
bool�  b ������
�� 
errn���\��  � � 60 throwinvalidparametertype throwInvalidParameterType� 40 _defaultvalueplaceholder _defaultValuePlaceholder� 0 u  � *0 _formatdefaultvalue _formatDefaultValue
� 
lnfd
� 
spac�?�jv  
��lvY hO�E�O��,�%��,%E�O�[��l kh ��&���f�b  ��a a a %E�O *��,a &E�O��,a &E�O��,�&E�O�a ,�&E�W X  b  �a a �a + O�a   *�k+ E�Y hO� �a %E�Y hO�b  %b  %�a ,%�%��,%E�O��,b   �*�k+ %E�Y hO�a   �_ !%b  %�%E�Y hO��,b   a "�%a #%E�Y hO�_ $%�%E�[OY��Oa %�%�lv� �������cd��
�� .Fil:Argvnull���     ****�� 0 argv  �� ��ef
�� 
OpsDe {�������� &0 optiondefinitions optionDefinitions��  ��  f ��gh
�� 
OpsAg {����i�� *0 argumentdefinitions argumentDefinitions��  i ��j�� j  kk ���l�� 0 propertyname propertyNamel ��~�}� 0 islist isList
�~ boovtrue�}  h �|m�{
�| 
DefOm {�z�y�x�z &0 hasdefaultoptions hasDefaultOptions�y  
�x boovtrue�{  c �w�v�u�t�s�r�q�p�o�n�m�w 0 argv  �v &0 optiondefinitions optionDefinitions�u *0 argumentdefinitions argumentDefinitions�t &0 hasdefaultoptions hasDefaultOptions�s 0 oldtids oldTIDs�r (0 asocparametersdict asocParametersDict�q 0 argumentslist argumentsList�p 0 etext eText�o 0 enumber eNumber�n 0 efrom eFrom�m 
0 eto eTod ���l�k�j�i�h�g�f�e�dn�c�b�a�`K�_�^
�l 
ascr
�k 
txdl�j "0 aslistparameter asListParameter
�i 
cobj�h 0 _parseoptions _parseOptions�g (0 _adddefaultoptions _addDefaultOptions�f "0 _parsearguments _parseArguments
�e 
****�d 0 etext eTextn �]�\o
�] 
errn�\ 0 enumber eNumbero �[�Zp
�[ 
erob�Z 0 efrom eFromp �Y�X�W
�Y 
errt�X 
0 eto eTo�W  
�c 
errn
�b 
erob
�a 
errt�` �_ �^ 
0 _error  �� ��� ���,E�O ab  �k+ E�Ob  �k+ E�Ob  �k+ E�O*��-��m+ E[�k/E�Z[�l/E�ZO*��l+ O*���m+ O���,FO��&W 2X 
 ���,FO�b  
  )�����Y *a ����a + V� �V_�U�Tqr�S
�V .Fil:FHlpnull��� ��� null�U  �T �Rst
�R 
Names {�Q�Pg�Q 0 commandname commandName�P  t �Ouv
�O 
Summu {�N�Mo�N $0 shortdescription shortDescription�M  v �Lwx
�L 
Usagw {�K�J�I�K "0 commandsynopses commandSynopses�J  �I  x �Hyz
�H 
OpsDy {�G�F�E�G &0 optiondefinitions optionDefinitions�F  �E  z �D{|
�D 
OpsA{ {�C�B}�C *0 argumentdefinitions argumentDefinitions�B  } �A~�A ~   �@���@ 0 propertyname propertyName� �?�>�=�? 0 islist isList
�> boovtrue�=  | �<��
�< 
Docu� {�;�:��; "0 longdescription longDescription�:  � �9��
�9 
VFmt� {�8�7�6�8 0 isstyled isStyled�7  
�6 boovtrue� �5��4
�5 
DefO� {�3�2�1�3 &0 hasdefaultoptions hasDefaultOptions�2  
�1 boovtrue�4  q �0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� ���0 0 commandname commandName�/ $0 shortdescription shortDescription�. "0 commandsynopses commandSynopses�- &0 optiondefinitions optionDefinitions�, *0 argumentdefinitions argumentDefinitions�+ "0 longdescription longDescription�* 0 isstyled isStyled�) &0 hasdefaultoptions hasDefaultOptions�( 0 vtstyle vtStyle�' 0 helptext helpText�& 00 defaultoptionssynopsis defaultOptionsSynopsis�%  0 optionssection optionsSection�$ 40 defaultargumentssynopsis defaultArgumentsSynopsis�# $0 argumentssection argumentsSection�" 0 textref textRef�! 0 etext eText�  0 enumber eNumber� 0 efrom eFrom� 
0 eto eTor /��������������"%2�����H[em����������
�	�����	��� "0 astextparameter asTextParameter� "0 aslistparameter asListParameter� (0 asbooleanparameter asBooleanParameter� 0 n  � 0 vt100 VT100� 0 b  � 0 u  � � 
� .Fil:EnVanull��� ��� null� 0 _  
� .Fil:SplPnull���     ctxt�  �  �  0 _formatoptions _formatOptions
� 
cobj� $0 _formatarguments _formatArguments
� 
kocl
� .corecnte****       ****� ���
� 
errn��\�  
�
 
list�	 60 throwinvalidparametertype throwInvalidParameterType
� 
lnfd� 0 etext eText� �� �
� 
errn�  0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  �S�����b  ��l+ E�Ob  �k+ E�Ob  �k+ E�Ob  �k+ E�Ob  ��l+ E�Ob  ��l+ E�Ob  ��l+  �*jk+ 
�*kk+ 
�*�k+ 
�E�Y ���a �a �E�O�a   $ *j a ,j E�W X  a E�Y hO��,a %��,%b  %b  %�%E�O�a  �a %�%E�Y hO*���m+ E[a k/E�Z[a l/E�ZO*��l+ E[a k/E�Z[a l/E�ZO�b  %��,%a %��,%E�O�jv  ��%�%kvE�Y hO / )�[a  a l !kh �b  %b  %�%E�[OY��W X  "b  �a #a $a %�+ &O�b  %�%b  %�%E�O�a ' "�b  %��,%a (%��,%b  %�%E�Y hO�_ )%W X * +*a ,�] ] ] a -+ .V� ����������
�� .Fil:CurFnull��� ��� null��  ��  � ������������ 0 asocpath asocPath�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ��������������6�������I����
�� misccura�� 0 nsfilemanager NSFileManager��  0 defaultmanager defaultManager�� ,0 currentdirectorypath currentDirectoryPath
�� 
msng
�� 
errn���@
�� 
ctxt
�� 
psxf�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� ; *��,j+ j+ E�O��  )��l�Y hO��&�&W X 
 *졢���+ � ��Y��������
�� .Fil:EnVanull��� ��� null��  ��  �  � ����������
�� misccura�� 0 nsprocessinfo NSProcessInfo�� 0 processinfo processInfo�� 0 environment  
�� 
****�� ��,j+ j+ �&� ��k��������
�� .Fil:RSInnull��� ��� null��  ��  � �������������� 0 asocdata asocData�� 0 
asocstring 
asocString�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� �����������������������������
�� misccura�� 0 nsfilehandle NSFileHandle�� :0 filehandlewithstandardinput fileHandleWithStandardInput�� *0 readdatatoendoffile readDataToEndOfFile�� 0 nsstring NSString�� 	0 alloc  �� ,0 nsutf8stringencoding NSUTF8StringEncoding�� 00 initwithdata_encoding_ initWithData_encoding_
�� 
msng
�� 
errn���\�� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� F 5��,j+ j+ E�O��,j+ ���,l+ E�O��  )��l�Y hW X  *���+ � �������
� .aevtoappnull  �   � ****�  �  � �� 0 	test_argv 	test_ARGV� ����� 0 	test_argv 	test_ARGV� �������
� .ascrinit****      � ****� k     ��� ��� -�� ��� i   � ���� I      ���
� .aevtoappnull  �   � ****�  �  � k     E�� ^�� ��� ���  �  �  �  � ���� (0 _optiondefinitions _optionDefinitions� ,0 _argumentdefinitions _argumentDefinitions
� .aevtoappnull  �   � ****� )���������������������� $���7�<DJMU��� 0 	shortname 	shortName� 0 propertyname propertyName� � 0 longname longName� 0 	valuetype 	valueType
� 
bool� 0 defaultvalue defaultValue� 
� 
nmbr
� 
ctxt� $0 valueplaceholder valuePlaceholder� $0 valuedescription valueDescription� 
� 0 islist isList� � (0 _optiondefinitions _optionDefinitions
� 
file� ,0 _argumentdefinitions _argumentDefinitions� �������
� .aevtoappnull  �   � ****�  �  � �� 0 args  � fjnrvz~����������������� 	
� 
Name
� 
OpsD
� 
OpsA
� 
Summ
� 
VFmt
� 
DefO� 
� .Fil:FHlpnull��� ��� null
� .ascrcmnt****      � ****� 
� .Fil:Argvnull���     ****� F����������vE�O*���b   �b  ��a fa fa  j O��b   �b  a  � �������������e�������������a �a �a ��a �a �a a a a a a �a �a �a a e�jva a v�O�a  �a !a a "a �a #�a !a a $�a %��a &�a a e�jv�mv�OL (
� .aevtoappnull  �   � ****� ��K S�O�j OPascr  ��ޭ