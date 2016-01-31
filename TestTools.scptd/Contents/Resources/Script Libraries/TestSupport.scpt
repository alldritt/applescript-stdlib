FasdUAS 1.101.10   ��   ��    k             l      ��  ��    X R TestSupport -- handlers and constants used by TestTools's unit testing framework
     � 	 	 �   T e s t S u p p o r t   - -   h a n d l e r s   a n d   c o n s t a n t s   u s e d   b y   T e s t T o o l s ' s   u n i t   t e s t i n g   f r a m e w o r k 
   
  
 l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��     
 constants     �      c o n s t a n t s      l     ��������  ��  ��        h     �� �� 0 novalue NoValue  l     ��  ��   HB used as unique placeholder to indicate an omitted value; since it's a script object, AS will compare for identity (i.e. is it the same object instance), not merely logical equality, so it can never be confused for a user-supplied value, though with the caveat that it can't go outside the current AS instance or be passed through a `copy` command as then it will be copied and thus no longer match -- TO DO: would it be safe enough just to use `�class ���!�` (no value placeholder)? (note: omitted parameters must use `�class ���!� as default parameter values must be literals)     �  �   u s e d   a s   u n i q u e   p l a c e h o l d e r   t o   i n d i c a t e   a n   o m i t t e d   v a l u e ;   s i n c e   i t ' s   a   s c r i p t   o b j e c t ,   A S   w i l l   c o m p a r e   f o r   i d e n t i t y   ( i . e .   i s   i t   t h e   s a m e   o b j e c t   i n s t a n c e ) ,   n o t   m e r e l y   l o g i c a l   e q u a l i t y ,   s o   i t   c a n   n e v e r   b e   c o n f u s e d   f o r   a   u s e r - s u p p l i e d   v a l u e ,   t h o u g h   w i t h   t h e   c a v e a t   t h a t   i t   c a n ' t   g o   o u t s i d e   t h e   c u r r e n t   A S   i n s t a n c e   o r   b e   p a s s e d   t h r o u g h   a   ` c o p y `   c o m m a n d   a s   t h e n   i t   w i l l   b e   c o p i e d   a n d   t h u s   n o   l o n g e r   m a t c h   - -   T O   D O :   w o u l d   i t   b e   s a f e   e n o u g h   j u s t   t o   u s e   ` � c l a s s   � � � ! � `   ( n o   v a l u e   p l a c e h o l d e r ) ?   ( n o t e :   o m i t t e d   p a r a m e t e r s   m u s t   u s e   ` � c l a s s   � � � ! �   a s   d e f a u l t   p a r a m e t e r   v a l u e s   m u s t   b e   l i t e r a l s )      l     ��������  ��  ��       !   j    
�� "�� 0 	_nostatus 	_NOSTATUS " m    	������ !  # $ # j    �� %�� 0 _success _SUCCESS % m    ����  $  & ' & j    �� (�� 0 _failure _FAILURE ( m    ����  '  ) * ) j    �� +�� 0 _broken _BROKEN + m    ����  *  , - , j    �� .�� 0 _skipped _SKIPPED . m    ����  -  / 0 / j    �� 1�� 0 
_skipsuite 
_SKIPSUITE 1 m    ���� 	 0  2 3 2 l     ��������  ��  ��   3  4 5 4 l     �� 6 7��   6 J D--------------------------------------------------------------------    7 � 8 8 � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 5  9 : 9 l     �� ; <��   ; t n expected/unexpected errors are trapped and their parameters stored in a 'caught error' record for portability    < � = = �   e x p e c t e d / u n e x p e c t e d   e r r o r s   a r e   t r a p p e d   a n d   t h e i r   p a r a m e t e r s   s t o r e d   i n   a   ' c a u g h t   e r r o r '   r e c o r d   f o r   p o r t a b i l i t y :  > ? > l     ��������  ��  ��   ?  @ A @ l      B C D B j    �� E�� $0 _caughterrortype _CaughtErrorType E m    ��
�� 
���� C2, the `class` property of error records passed to TestReport by `assert�` handlers; TestReport checks this record property to determine how to convert test data to its literal representation (unlike other records, which are converted wholesale, error info record properties are individually converted)    D � F FX   t h e   ` c l a s s `   p r o p e r t y   o f   e r r o r   r e c o r d s   p a s s e d   t o   T e s t R e p o r t   b y   ` a s s e r t & `   h a n d l e r s ;   T e s t R e p o r t   c h e c k s   t h i s   r e c o r d   p r o p e r t y   t o   d e t e r m i n e   h o w   t o   c o n v e r t   t e s t   d a t a   t o   i t s   l i t e r a l   r e p r e s e n t a t i o n   ( u n l i k e   o t h e r   r e c o r d s ,   w h i c h   a r e   c o n v e r t e d   w h o l e s a l e ,   e r r o r   i n f o   r e c o r d   p r o p e r t i e s   a r e   i n d i v i d u a l l y   c o n v e r t e d ) A  G H G l     ��������  ��  ��   H  I J I l     ��������  ��  ��   J  K L K i     M N M I      �� O���� .0 makecaughterrorrecord makeCaughtErrorRecord O  P Q P o      ���� 0 etext eText Q  R S R o      ���� 0 enumber eNumber S  T U T o      ���� 0 efrom eFrom U  V W V o      ���� 
0 eto eTo W  X�� X o      ���� 0 epartial ePartial��  ��   N L      Y Y K      Z Z �� [ \
�� 
pcls [ o    ���� $0 _caughterrortype _CaughtErrorType \ �� ] ^�� 0 	errortext 	errorText ] o    ���� 0 etext eText ^ �� _ `�� 0 errornumber errorNumber _ o   	 
���� 0 enumber eNumber ` �� a b�� 0 
errorvalue 
errorValue a o    ���� 0 efrom eFrom b �� c d�� 0 expectedtype expectedType c o    ���� 
0 eto eTo d �� e���� 0 partialresult partialResult e o    ���� 0 epartial ePartial��   L  f g f l     ��������  ��  ��   g  h i h l     ��������  ��  ��   i  j k j j   ! ,�� l�� *0 _defaulterrorrecord _defaultErrorRecord l I   ! +�� m���� .0 makecaughterrorrecord makeCaughtErrorRecord m  n o n o   " #���� 0 novalue NoValue o  p q p o   # $���� 0 novalue NoValue q  r s r o   $ %���� 0 novalue NoValue s  t u t o   % &���� 0 novalue NoValue u  v�� v o   & '���� 0 novalue NoValue��  ��   k  w x w l     ��������  ��  ��   x  y z y l     ��������  ��  ��   z  { | { i  - 0 } ~ } I      �� ���� <0 normalizeexpectederrorrecord normalizeExpectedErrorRecord   ��� � o      ���� 0 errorrecord errorRecord��  ��   ~ l    @ � � � � k     @ � �  � � � l     �� � ���   � � � make sure errorRecord contains at least one valid property and no invalid ones (note: this uses NoValue placeholders so isn't suitable for sending out of current AS instance)    � � � �^   m a k e   s u r e   e r r o r R e c o r d   c o n t a i n s   a t   l e a s t   o n e   v a l i d   p r o p e r t y   a n d   n o   i n v a l i d   o n e s   ( n o t e :   t h i s   u s e s   N o V a l u e   p l a c e h o l d e r s   s o   i s n ' t   s u i t a b l e   f o r   s e n d i n g   o u t   o f   c u r r e n t   A S   i n s t a n c e ) �  � � � Z     � ����� � =      � � � n     � � � 1    ��
�� 
leng � o     ���� 0 errorrecord errorRecord � m    ����   � R    �� � �
�� .ascrerr ****      � **** � m     � � � � � | I n v a l i d    i s    p a r a m e t e r   ( e r r o r   r e c o r d   c o n t a i n e d   n o   p r o p e r t i e s ) . � �� � �
�� 
errn � m   
 �����Y � �� � �
�� 
erob � o    ���� 0 errorrecord errorRecord � �� ���
�� 
errt � m    ��
�� 
reco��  ��  ��   �  � � � r      � � � b     � � � o    ���� 0 errorrecord errorRecord � o    ���� *0 _defaulterrorrecord _defaultErrorRecord � o      ���� $0 normalizedrecord normalizedRecord �  � � � Z  ! = � ����� � >   ! , � � � n  ! $ � � � 1   " $��
�� 
leng � o   ! "���� $0 normalizedrecord normalizedRecord � n  $ + � � � 1   ) +��
�� 
leng � o   $ )���� *0 _defaulterrorrecord _defaultErrorRecord � R   / 9�� � �
�� .ascrerr ****      � **** � m   7 8 � � � � � � I n v a l i d    i s    p a r a m e t e r   ( e r r o r   r e c o r d   c o n t a i n e d   u n r e c o g n i z e d   p r o p e r t i e s ) . � �� � �
�� 
errn � m   1 2�����Y � �� � �
�� 
erob � o   3 4���� 0 errorrecord errorRecord � �� ���
�� 
errt � m   5 6��
�� 
reco��  ��  ��   �  ��� � L   > @ � � o   > ?���� $0 normalizedrecord normalizedRecord��   � i c ensure error info record has all the correct properties and that at least one of them is populated    � � � � �   e n s u r e   e r r o r   i n f o   r e c o r d   h a s   a l l   t h e   c o r r e c t   p r o p e r t i e s   a n d   t h a t   a t   l e a s t   o n e   o f   t h e m   i s   p o p u l a t e d |  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  1 4 � � � I      � ��~� 20 formatcaughterrorrecord formatCaughtErrorRecord �  � � � o      �}�} 0 errorrecord errorRecord �  ��| � o      �{�{ 0 
lineindent 
lineIndent�|  �~   � k     � � �  � � � r      � � � m      � � � � �   � o      �z�z 0 	errortext 	errorText �  � � � l   �y � ��y   �jd TO DO: while fine for user-supplied 'expected error' records this is not ideal for formatting 'unexpected/incorrect' errors trapped by `on error...` clauses as AS populates unused error params with its own default values; thus all of the following will be included regardless; need to think about how to deal with that (not that there's an ideal solution)    � � � ��   T O   D O :   w h i l e   f i n e   f o r   u s e r - s u p p l i e d   ' e x p e c t e d   e r r o r '   r e c o r d s   t h i s   i s   n o t   i d e a l   f o r   f o r m a t t i n g   ' u n e x p e c t e d / i n c o r r e c t '   e r r o r s   t r a p p e d   b y   ` o n   e r r o r . . . `   c l a u s e s   a s   A S   p o p u l a t e s   u n u s e d   e r r o r   p a r a m s   w i t h   i t s   o w n   d e f a u l t   v a l u e s ;   t h u s   a l l   o f   t h e   f o l l o w i n g   w i l l   b e   i n c l u d e d   r e g a r d l e s s ;   n e e d   t o   t h i n k   a b o u t   h o w   t o   d e a l   w i t h   t h a t   ( n o t   t h a t   t h e r e ' s   a n   i d e a l   s o l u t i o n ) �  � � � Z    � ��x�w � >    � � � n    � � � o    �v�v 0 errornumber errorNumber � o    �u�u 0 errorrecord errorRecord � o    �t�t 0 novalue NoValue � r     � � � b     � � � b     � � � b     � � � o    �s�s 0 	errortext 	errorText � m     � � � � �  ( � n    � � � o    �r�r 0 errornumber errorNumber � o    �q�q 0 errorrecord errorRecord � m     � � � � �  )   � o      �p�p 0 	errortext 	errorText�x  �w   �  � � � Z    7 � ��o�n � >    ) � � � n    # � � � o   ! #�m�m 0 	errortext 	errorText � o     !�l�l 0 errorrecord errorRecord � o   # (�k�k 0 novalue NoValue � r   , 3 � � � b   , 1 � � � o   , -�j�j 0 	errortext 	errorText � n  - 0 � � � o   . 0�i�i 0 	errortext 	errorText � o   - .�h�h 0 errorrecord errorRecord � o      �g�g 0 	errortext 	errorText�o  �n   �  � � � Z  8 U � ��f�e � >  8 A � � � n  8 ; � � � o   9 ;�d�d 0 
errorvalue 
errorValue � o   8 9�c�c 0 errorrecord errorRecord � o   ; @�b�b 0 novalue NoValue � r   D Q � � � b   D O � � � b   D K �  � b   D I b   D G o   D E�a�a 0 	errortext 	errorText 1   E F�`
�` 
lnfd o   G H�_�_ 0 
lineindent 
lineIndent  m   I J �                       f r o m :   � n  K N o   L N�^�^ 0 
errorvalue 
errorValue o   K L�]�] 0 errorrecord errorRecord � o      �\�\ 0 	errortext 	errorText�f  �e   � 	
	 Z  V s�[�Z >  V _ n  V Y o   W Y�Y�Y 0 expectedtype expectedType o   V W�X�X 0 errorrecord errorRecord o   Y ^�W�W 0 novalue NoValue r   b o b   b m b   b i b   b g b   b e o   b c�V�V 0 	errortext 	errorText 1   c d�U
�U 
lnfd o   e f�T�T 0 
lineindent 
lineIndent m   g h �                           t o :   n  i l o   j l�S�S 0 expectedtype expectedType o   i j�R�R 0 errorrecord errorRecord o      �Q�Q 0 	errortext 	errorText�[  �Z  
   Z  t �!"�P�O! >  t }#$# n  t w%&% o   u w�N�N 0 partialresult partialResult& o   t u�M�M 0 errorrecord errorRecord$ o   w |�L�L 0 novalue NoValue" r   � �'(' b   � �)*) b   � �+,+ b   � �-.- b   � �/0/ o   � ��K�K 0 	errortext 	errorText0 1   � ��J
�J 
lnfd. o   � ��I�I 0 
lineindent 
lineIndent, m   � �11 �22   p a r t i a l   r e s u l t :  * n  � �343 o   � ��H�H 0 partialresult partialResult4 o   � ��G�G 0 errorrecord errorRecord( o      �F�F 0 	errortext 	errorText�P  �O    5�E5 L   � �66 o   � ��D�D 0 	errortext 	errorText�E   � 787 l     �C�B�A�C  �B  �A  8 9:9 l     �@�?�>�@  �?  �>  : ;<; i  5 8=>= I      �=?�<�= 0 istype isType? @A@ o      �;�; 0 thevalue theValueA B�:B o      �9�9 0 typename typeName�:  �<  > L     CC >     DED l    	F�8�7F I    	�6GH
�6 .corecnte****       ****G J     II J�5J o     �4�4 0 thevalue theValue�5  H �3K�2
�3 
koclK o    �1�1 0 typename typeName�2  �8  �7  E m   	 
�0�0  < LML l     �/�.�-�/  �.  �-  M NON l     �,�+�*�,  �+  �*  O PQP l     �)RS�)  R J D--------------------------------------------------------------------   S �TT � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -Q UVU l     �(WX�(  W "  `assert test error` support   X �YY 8   ` a s s e r t   t e s t   e r r o r `   s u p p o r tV Z[Z l     �'�&�%�'  �&  �%  [ \]\ i  9 <^_^ I      �$`�#�$ (0 sanitizeidentifier sanitizeIdentifier` a�"a o      �!�! 0 aname aName�"  �#  _ P     sbcdb k    ree fgf Z   hi� �h =   jkj o    �� 0 aname aNamek m    ll �mm  i L    nn m    oo �pp  | |�   �  g qrq r    sts m    uu �vv  t o      �� 0 res  r wxw r    yzy m    {{ �|| 6 a b c d e f g h i j k l m n o p q r s t u v w x y z _z o      �� 0 
legalchars 
legalCharsx }~} r    � m    �
� boovfals� o      �� 0 usepipes usePipes~ ��� X    _���� k   . Z�� ��� Z   . P����� H   . 4�� E  . 3��� o   . /�� 0 
legalchars 
legalChars� n  / 2��� 1   0 2�
� 
pcnt� o   / 0�� 0 charref charRef� k   7 L�� ��� r   7 :��� m   7 8�
� boovtrue� o      �� 0 usepipes usePipes� ��� Z  ; L����� E  ; @��� m   ; <�� ���  \ |� n  < ?��� 1   = ?�
� 
pcnt� o   < =�� 0 charref charRef� r   C H��� b   C F��� m   C D�� ���  \� o   D E�� 0 charref charRef� o      �� 0 charref charRef�  �  �  �  �  � ��� r   Q V��� b   Q T��� o   Q R�
�
 0 res  � o   R S�	�	 0 charref charRef� o      �� 0 res  � ��� r   W Z��� m   W X�� ��� J a b c d e f g h i j k l m n o p q r s t u v w x y z _ 1 2 3 4 5 6 7 8 9 0� o      �� 0 
legalchars 
legalChars�  � 0 charref charRef� o   ! "�� 0 aname aName� ��� Z  ` o����� o   ` a�� 0 usepipes usePipes� r   d k��� b   d i��� b   d g��� m   d e�� ���  |� o   e f�� 0 res  � m   g h�� ���  |� o      � �  0 res  �  �  � ���� L   p r�� o   p q���� 0 res  ��  c ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  d ���
�� conscase� ����
�� consnume��  ] ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  = @��� I      �������  0 makecallobject makeCallObject� ��� o      ���� 0 handlername handlerName� ���� o      ����  0 parametercount parameterCount��  ��  � k     ]�� ��� r     ��� m     �� ���  � o      ���� 0 args  � ��� Z    >������ =    ��� o    ����  0 parametercount parameterCount� m    ���� � r   
 ��� m   
 �� ���  p a r a m e t e r O b j e c t� o      ���� 0 args  � ��� ?    ��� o    ����  0 parametercount parameterCount� m    ���� � ���� k    :�� ��� Y    ,�������� r     '��� b     %��� b     #��� o     !���� 0 args  � m   ! "�� ��� 2 ,   p a r a m e t e r O b j e c t ' s   i t e m  � o   # $���� 0 i  � o      ���� 0 args  �� 0 i  � m    ���� � o    ����  0 parametercount parameterCount��  � ���� r   - :��� n   - 8��� 7  . 8����
�� 
ctxt� m   2 4���� � m   5 7������� o   - .���� 0 args  � o      ���� 0 args  ��  ��  ��  � ���� L   ? ]�� I  ? \�����
�� .sysodsct****        scpt� b   ? X��� b   ? V� � b   ? T b   ? R b   ? K b   ? I m   ? @		 �

 0 o n   r u n 
 	 	 	 	 	 	 	 	 	 	 s c r i p t   I   @ H������ (0 sanitizeidentifier sanitizeIdentifier �� b   A D m   A B �  C a l l O b j e c t _ o   B C���� 0 handlername handlerName��  ��   m   I J � � 
 	 	 	 	 	 	 	 	 	 	 	 o n   d o T e s t ( s u i t e O b j e c t ,   p a r a m e t e r O b j e c t ) 
 	 	 	 	 	 	 	 	 	 	 	 	 r e t u r n   s u i t e O b j e c t ' s   I   K Q������ (0 sanitizeidentifier sanitizeIdentifier �� o   L M���� 0 handlername handlerName��  ��   m   R S �  (  o   T U���� 0 args  � m   V W � t ) 
 	 	 	 	 	 	 	 	 	 	 	 e n d   r u n 
 	 	 	 	 	 	 	 	 	 	 e n d   s c r i p t 
 	 	 	 	 	 	 	 	 	 e n d   r u n��  ��  �  l     ��������  ��  ��    l     ��������  ��  ��    l     �� ��   J D--------------------------------------------------------------------     �!! � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "#" l     ��$%��  $   report generation   % �&& $   r e p o r t   g e n e r a t i o n# '(' l     ��������  ��  ��  ( )*) i  A D+,+ I      ��-���� 0 replacetext replaceText- ./. o      ���� 0 thetext theText/ 010 o      ���� 0 findtext findText1 2��2 o      ���� 0 replacetext replaceText��  ��  , k     33 454 r     676 o     ���� 0 findtext findText7 n     898 1    ��
�� 
txdl9 1    ��
�� 
ascr5 :;: r    <=< n    	>?> 2   	��
�� 
citm? o    ���� 0 thetext theText= o      ���� 0 	textitems 	textItems; @A@ r    BCB o    ���� 0 replacetext replaceTextC n     DED 1    ��
�� 
txdlE 1    ��
�� 
ascrA F��F L    GG c    HIH o    ���� 0 thetext theTextI m    ��
�� 
ctxt��  * JKJ l     ��������  ��  ��  K LML l     ��������  ��  ��  M NON i  E HPQP I      ��R���� $0 formatinvisibles formatInvisiblesR STS o      ���� 0 thetext theTextT U��U o      ���� 0 linewrap lineWrap��  ��  Q l    VWXV k     YY Z[Z l     ��\]��  \1+ TO DO: what about other invisibles? (problem: AS syntax doesn't provide escape sequences for control chars and other invisibles, so would need to use fake escapes, e.g. `\(0x00)`, `\(CODEPOINT)`; one possibility would be to extend `format text` to take `$(CODEPOINT)` escapes, then use that syntax)   ] �^^V   T O   D O :   w h a t   a b o u t   o t h e r   i n v i s i b l e s ?   ( p r o b l e m :   A S   s y n t a x   d o e s n ' t   p r o v i d e   e s c a p e   s e q u e n c e s   f o r   c o n t r o l   c h a r s   a n d   o t h e r   i n v i s i b l e s ,   s o   w o u l d   n e e d   t o   u s e   f a k e   e s c a p e s ,   e . g .   ` \ ( 0 x 0 0 ) ` ,   ` \ ( C O D E P O I N T ) ` ;   o n e   p o s s i b i l i t y   w o u l d   b e   t o   e x t e n d   ` f o r m a t   t e x t `   t o   t a k e   ` $ ( C O D E P O I N T ) `   e s c a p e s ,   t h e n   u s e   t h a t   s y n t a x )[ _��_ L     `` I     ��a���� 0 replacetext replaceTexta bcb I    ��d���� 0 replacetext replaceTextd efe I    
��g���� 0 replacetext replaceTextg hih o    ���� 0 thetext theTexti jkj 1    ��
�� 
tab k l��l m    mm �nn  \ t��  ��  f opo 1   
 ��
�� 
lnfdp q��q b    rsr m    tt �uu  \ ns o    ���� 0 linewrap lineWrap��  ��  c vwv o    ��
�� 
ret w x��x b    yzy m    {{ �||  \ rz o    ���� 0 linewrap lineWrap��  ��  ��  W %  linewrap = linefeed + N spaces   X �}} >   l i n e w r a p   =   l i n e f e e d   +   N   s p a c e sO ~~ l     ��������  ��  ��   ��� l     ��������  ��  ��  � ��� i  I L��� I      ������� 0 linewrap lineWrap� ��� o      ���� 0 thetext theText� ���� o      ���� 0 towidth toWidth��  ��  � l    ���� L     �� o     ���� 0 thetext theText� � � TO DO: implement; this should wrap on whole words, where practical (to keep it simple, theText should avoid using VT100 sequences, otherwise those will have to be detected and ignored when counting number of characters in line)   � ����   T O   D O :   i m p l e m e n t ;   t h i s   s h o u l d   w r a p   o n   w h o l e   w o r d s ,   w h e r e   p r a c t i c a l   ( t o   k e e p   i t   s i m p l e ,   t h e T e x t   s h o u l d   a v o i d   u s i n g   V T 1 0 0   s e q u e n c e s ,   o t h e r w i s e   t h o s e   w i l l   h a v e   t o   b e   d e t e c t e d   a n d   i g n o r e d   w h e n   c o u n t i n g   n u m b e r   o f   c h a r a c t e r s   i n   l i n e )� ��� l     ��������  ��  ��  � ��� l     �������  ��  �  � ��� i  M P��� I      �~��}�~ 0 vt100 VT100� ��|� o      �{�{ 0 
formatcode 
formatCode�|  �}  � k     �� ��� l      �z���z  �F@ Returns a magic character sequence that will apply the specified formatting or other control operation in Terminal.app and other VT100 terminal emulators. Multiple codes may be given as semicolon-separated numeric text, e.g. "1;7". Commonly used style codes are:
	
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
	   � ����   R e t u r n s   a   m a g i c   c h a r a c t e r   s e q u e n c e   t h a t   w i l l   a p p l y   t h e   s p e c i f i e d   f o r m a t t i n g   o r   o t h e r   c o n t r o l   o p e r a t i o n   i n   T e r m i n a l . a p p   a n d   o t h e r   V T 1 0 0   t e r m i n a l   e m u l a t o r s .   M u l t i p l e   c o d e s   m a y   b e   g i v e n   a s   s e m i c o l o n - s e p a r a t e d   n u m e r i c   t e x t ,   e . g .   " 1 ; 7 " .   C o m m o n l y   u s e d   s t y l e   c o d e s   a r e : 
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
 	� ��y� L     �� b     ��� b     	��� b     ��� l    ��x�w� 5     �v��u
�v 
cha � m    �t�t 
�u kfrmID  �x  �w  � m    �� ���  [� o    �s�s 0 
formatcode 
formatCode� m   	 
�� ���  m�y  � ��� l     �r�q�p�r  �q  �p  � ��� l     �o�n�m�o  �n  �m  � ��� l     �l���l  �  -----   � ��� 
 - - - - -� ��� l     �k�j�i�k  �j  �i  � ��� i  Q T��� I      �h��g�h  0 maketestreport makeTestReport� ��� o      �f�f 0 testsuitename testSuiteName� ��� o      �e�e "0 testhandlername testHandlerName� ��d� o      �c�c 0 terminalwidth terminalWidth�d  �g  � k     w�� ��� l    ���� r     ��� J     �� ��� m     �� ���         � ��b� m    �� ���             �b  � J      �� ��� o      �a�a 0 indent1  � ��`� o      �_�_ 0 indent2  �`  � l f indent to bullet, indent to wrapped bulleted lines; TO DO: ideally pass initial indent from `osatest`   � ��� �   i n d e n t   t o   b u l l e t ,   i n d e n t   t o   w r a p p e d   b u l l e t e d   l i n e s ;   T O   D O :   i d e a l l y   p a s s   i n i t i a l   i n d e n t   f r o m   ` o s a t e s t `� ��� Z    k���^�� =    ��� o    �]�] 0 terminalwidth terminalWidth� m    �\�\��� k    .�� ��� r    *��� K    (�� �[���[ 0 n  � m    �� ���  � �Z���Z 0 b  � m    �� ���  � �Y���Y 0 u  � m     �� ���  � �X���X 0 r  � m   ! "�� ���  � �W���W 0 g  � m   # $�� ���  � �V��U�V 0 e  � m   % &�� ���  �U  � o      �T�T 0 vtstyle vtStyle� ��S� r   + .��� m   + ,�R
�R boovfals� o      �Q�Q 0 uselinewrap useLineWrap�S  �^  � k   1 k�� � � r   1 g K   1 e �P�P 0 n   I   2 8�O�N�O 0 vt100 VT100 �M m   3 4�L�L  �M  �N   �K	�K 0 b   I   9 ?�J
�I�J 0 vt100 VT100
 �H m   : ;�G�G �H  �I  	 �F�F 0 u   I   @ H�E�D�E 0 vt100 VT100 �C m   A D�B�B �C  �D   �A�A 0 r   I   I Q�@�?�@ 0 vt100 VT100 �> m   J M �  1 ; 3 1�>  �?   �=�= 0 g   I   R Z�<�;�< 0 vt100 VT100 �: m   S V �  1 ; 3 2�:  �;   �9�8�9 0 e   I   [ c�7�6�7 0 vt100 VT100 �5 m   \ _ �    1 ; 3 4�5  �6  �8   o      �4�4 0 vtstyle vtStyle  !�3! r   h k"#" m   h i�2
�2 boovtrue# o      �1�1 0 uselinewrap useLineWrap�3  � $�0$ h   l w�/%�/ 0 
testreport 
TestReport% k      && '(' l     �.�-�,�.  �-  �,  ( )*) l     �++,�+  + � � TO DO: is it really necessary to record so much detail? all that's needed is assert count, plus whatever caused test to abort (if anything)   , �--   T O   D O :   i s   i t   r e a l l y   n e c e s s a r y   t o   r e c o r d   s o   m u c h   d e t a i l ?   a l l   t h a t ' s   n e e d e d   i s   a s s e r t   c o u n t ,   p l u s   w h a t e v e r   c a u s e d   t e s t   t o   a b o r t   ( i f   a n y t h i n g )* ./. l     �*�)�(�*  �)  �(  / 010 l     2342 j     �'5�' 0 _testresults _testResults5 J     �&�&  3 c ] a single test_NAME handler may perform multiple asserts, the result of each is recorded here   4 �66 �   a   s i n g l e   t e s t _ N A M E   h a n d l e r   m a y   p e r f o r m   m u l t i p l e   a s s e r t s ,   t h e   r e s u l t   o f   e a c h   i s   r e c o r d e d   h e r e1 787 l     �%�$�#�%  �$  �#  8 9:9 i   ;<; I      �"=�!�" 0 
_addreport 
_addReport= >?> o      � �  0 outcometype outcomeType? @A@ o      �� 0 fromhandler fromHandlerA BCB o      ��  0 problemsummary problemSummaryC DED o      �� 0 usernote userNoteE F�F o      �� 0 testdata testData�  �!  < l    GHIG k     JJ KLK l     �MN�  M ] W outcomeType indicates if test_NAME succeeded, failed, or aborted due to defective test   N �OO �   o u t c o m e T y p e   i n d i c a t e s   i f   t e s t _ N A M E   s u c c e e d e d ,   f a i l e d ,   o r   a b o r t e d   d u e   t o   d e f e c t i v e   t e s tL PQP l     �RS�  R W Q userNote is any additional info passed by `assert�` for inclusion in test report   S �TT �   u s e r N o t e   i s   a n y   a d d i t i o n a l   i n f o   p a s s e d   b y   ` a s s e r t & `   f o r   i n c l u s i o n   i n   t e s t   r e p o r tQ UVU l     �WX�  W � � testData is record of form {expectedResult:�, expectedError:�, actualResult:�, actualError:�}, unused properties should be omitted -- TO DO: make this a key-value list (easier to read, reformat, and render)   X �YY�   t e s t D a t a   i s   r e c o r d   o f   f o r m   { e x p e c t e d R e s u l t : & ,   e x p e c t e d E r r o r : & ,   a c t u a l R e s u l t : & ,   a c t u a l E r r o r : & } ,   u n u s e d   p r o p e r t i e s   s h o u l d   b e   o m i t t e d   - -   T O   D O :   m a k e   t h i s   a   k e y - v a l u e   l i s t   ( e a s i e r   t o   r e a d ,   r e f o r m a t ,   a n d   r e n d e r )V Z[Z r     \]\ K     ^^ �_`� 0 outcometype outcomeType_ o    �� 0 outcometype outcomeType` �ab� 0 fromhandler fromHandlera o    �� 0 fromhandler fromHandlerb �cd�  0 problemsummary problemSummaryc o    ��  0 problemsummary problemSummaryd �ef� 0 usernote userNotee o    �� 0 usernote userNotef �g�� 0 testdata testDatag o   	 
�� 0 testdata testData�  ] n      hih  ;    i o    �� 0 _testresults _testResults[ j�j l   �
kl�
  k  log result -- DEBUG   l �mm & l o g   r e s u l t   - -   D E B U G�  H � � TO DO: include param for indicating cause (`assert test result` received wrong result, `assert test error` received wrong/no error, unexpected error in `test_NAME` handler, etc)   I �nnd   T O   D O :   i n c l u d e   p a r a m   f o r   i n d i c a t i n g   c a u s e   ( ` a s s e r t   t e s t   r e s u l t `   r e c e i v e d   w r o n g   r e s u l t ,   ` a s s e r t   t e s t   e r r o r `   r e c e i v e d   w r o n g / n o   e r r o r ,   u n e x p e c t e d   e r r o r   i n   ` t e s t _ N A M E `   h a n d l e r ,   e t c ): opo l     �	���	  �  �  p qrq l     ����  �  �  r sts l     ����  �  �  t uvu i   wxw I      � y���  0 
addsuccess 
addSuccessy z{z o      ���� 0 fromhandler fromHandler{ |}| o      ���� 0 usernote userNote} ~��~ o      ���� 0 testdata testData��  ��  x I     ������ 0 
_addreport 
_addReport ��� o    ���� 0 _success _SUCCESS� ��� o    ���� 0 fromhandler fromHandler� ��� m    �� ���  � ��� o    	���� 0 usernote userNote� ���� o   	 
���� 0 testdata testData��  ��  v ��� l     ��������  ��  ��  � ��� i   ��� I      ������� 0 
addskipped 
addSkipped� ��� o      ���� 0 fromhandler fromHandler� ���� o      ���� 0 usernote userNote��  ��  � k     �� ��� Z    ������� =    ��� o     ���� 0 usernote userNote� m    �� ���  � r    	��� m    �� ��� @ s k i p p e d   b y    c o n f i g u r e _ s k i p T e s t s � o      ���� 0 usernote userNote��  ��  � ���� I    ������� 0 
_addreport 
_addReport� ��� o    ���� 0 _skipped _SKIPPED� ��� o    ���� 0 fromhandler fromHandler� ��� m    �� ���  � ��� o    ���� 0 usernote userNote� ���� J    ����  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� i   ��� I      ������� 0 	skipsuite 	skipSuite� ���� o      ���� 0 usernote userNote��  ��  � l    ���� k     �� ��� Z    ������� =    ��� o     ���� 0 usernote userNote� m    �� ���  � r    	��� m    �� ��� @ s k i p p e d   b y    c o n f i g u r e _ s k i p T e s t s � o      ���� 0 usernote userNote��  ��  � ���� I    ������� 0 
_addreport 
_addReport� ��� o    ���� 0 
_skipsuite 
_SKIPSUITE� ��� m    �� ���  � ��� m    �� ���  � ��� o    ���� 0 usernote userNote� ���� J    ����  ��  ��  ��  � Q K once called, `osatest` will skip this and all remaining tests in the suite   � ��� �   o n c e   c a l l e d ,   ` o s a t e s t `   w i l l   s k i p   t h i s   a n d   a l l   r e m a i n i n g   t e s t s   i n   t h e   s u i t e� ��� l     ��������  ��  ��  � ��� i   ��� I      ������� 0 
addfailure 
addFailure� ��� o      ���� 0 fromhandler fromHandler� ��� o      ����  0 problemsummary problemSummary� ��� o      ���� 0 usernote userNote� ���� o      ���� 0 testdata testData��  ��  � I     ������� 0 
_addreport 
_addReport� ��� o    ���� 0 _failure _FAILURE� ��� o    ���� 0 fromhandler fromHandler� ��� o    ����  0 problemsummary problemSummary� ��� o    	���� 0 usernote userNote� ���� o   	 
���� 0 testdata testData��  ��  � ��� l     ��������  ��  ��  � ��� i   ��� I      ������� 0 	addbroken 	addBroken� ��� o      ���� 0 fromhandler fromHandler� ��� o      ����  0 problemsummary problemSummary� ��� o      ���� 0 usernote userNote� ���� o      ���� 0 testdata testData��  ��  � I     ������� 0 
_addreport 
_addReport� ��� o    ���� 0 _broken _BROKEN�    o    ���� 0 fromhandler fromHandler  o    ����  0 problemsummary problemSummary  o    	���� 0 usernote userNote �� o   	 
���� 0 testdata testData��  ��  �  l     ��������  ��  ��   	
	 l     ����    -----    � 
 - - - - -
  l     ����  �� note: Converting AS objects to their literal representations requires some hoop-jumping: it's impractical for `perform unit test` to format test results on the fly as `osatest` doesn't have an event loop so sending itself AEs while the script is executing might be a tad fiddly. Instead, TestReport just captures everything in its _testResults property and is returned by `perform unit test` on completion (ensuring the captured data stays inside an AS context, so that e.g. application references don't lose their target application as happens when they're packed into an AE as a naked typeObjectSpecifier descriptor). `osaglue` must then repeatedly call the nextRawData() iterator via OSAExecuteEvent, which loads the result value directly into a new scriptValueID; that value's literal representation can then be retrieved via OSADisplay and the resulting text passed back to TestReport's updateRawData(), which reinserts it into the original _testResults data. Once the iterator is exhausted, `osatest` can then call TestReport's renderReport() to assemble all that information (which is now all concatenatable text values) into the final report text, which `osatext` can then print to stdout before doing the whole exercise all over again for the next test handler.    �	�   n o t e :   C o n v e r t i n g   A S   o b j e c t s   t o   t h e i r   l i t e r a l   r e p r e s e n t a t i o n s   r e q u i r e s   s o m e   h o o p - j u m p i n g :   i t ' s   i m p r a c t i c a l   f o r   ` p e r f o r m   u n i t   t e s t `   t o   f o r m a t   t e s t   r e s u l t s   o n   t h e   f l y   a s   ` o s a t e s t `   d o e s n ' t   h a v e   a n   e v e n t   l o o p   s o   s e n d i n g   i t s e l f   A E s   w h i l e   t h e   s c r i p t   i s   e x e c u t i n g   m i g h t   b e   a   t a d   f i d d l y .   I n s t e a d ,   T e s t R e p o r t   j u s t   c a p t u r e s   e v e r y t h i n g   i n   i t s   _ t e s t R e s u l t s   p r o p e r t y   a n d   i s   r e t u r n e d   b y   ` p e r f o r m   u n i t   t e s t `   o n   c o m p l e t i o n   ( e n s u r i n g   t h e   c a p t u r e d   d a t a   s t a y s   i n s i d e   a n   A S   c o n t e x t ,   s o   t h a t   e . g .   a p p l i c a t i o n   r e f e r e n c e s   d o n ' t   l o s e   t h e i r   t a r g e t   a p p l i c a t i o n   a s   h a p p e n s   w h e n   t h e y ' r e   p a c k e d   i n t o   a n   A E   a s   a   n a k e d   t y p e O b j e c t S p e c i f i e r   d e s c r i p t o r ) .   ` o s a g l u e `   m u s t   t h e n   r e p e a t e d l y   c a l l   t h e   n e x t R a w D a t a ( )   i t e r a t o r   v i a   O S A E x e c u t e E v e n t ,   w h i c h   l o a d s   t h e   r e s u l t   v a l u e   d i r e c t l y   i n t o   a   n e w   s c r i p t V a l u e I D ;   t h a t   v a l u e ' s   l i t e r a l   r e p r e s e n t a t i o n   c a n   t h e n   b e   r e t r i e v e d   v i a   O S A D i s p l a y   a n d   t h e   r e s u l t i n g   t e x t   p a s s e d   b a c k   t o   T e s t R e p o r t ' s   u p d a t e R a w D a t a ( ) ,   w h i c h   r e i n s e r t s   i t   i n t o   t h e   o r i g i n a l   _ t e s t R e s u l t s   d a t a .   O n c e   t h e   i t e r a t o r   i s   e x h a u s t e d ,   ` o s a t e s t `   c a n   t h e n   c a l l   T e s t R e p o r t ' s   r e n d e r R e p o r t ( )   t o   a s s e m b l e   a l l   t h a t   i n f o r m a t i o n   ( w h i c h   i s   n o w   a l l   c o n c a t e n a t a b l e   t e x t   v a l u e s )   i n t o   t h e   f i n a l   r e p o r t   t e x t ,   w h i c h   ` o s a t e x t `   c a n   t h e n   p r i n t   t o   s t d o u t   b e f o r e   d o i n g   t h e   w h o l e   e x e r c i s e   a l l   o v e r   a g a i n   f o r   t h e   n e x t   t e s t   h a n d l e r .  l     ��������  ��  ��    l     ����   � {{class:error info record, errorText:eText, errorNumber:eNumber, errorValue:eFrom, expectedType:eTo, partialResult:ePartial}    � � { c l a s s : e r r o r   i n f o   r e c o r d ,   e r r o r T e x t : e T e x t ,   e r r o r N u m b e r : e N u m b e r ,   e r r o r V a l u e : e F r o m ,   e x p e c t e d T y p e : e T o ,   p a r t i a l R e s u l t : e P a r t i a l }  j    ���� $0 _errorrecordrefs _errorRecordRefs J    ����    j     "���� 0 
_dataindex 
_dataIndex m     !����   !  j   # %��"�� 0 _datasubindex _dataSubIndex" m   # $���� ! #$# l     ��������  ��  ��  $ %&% i  & )'(' I      �������� 0 nextrawdata  ��  ��  ( l   )*+) k    ,, -.- l     ��/0��  / g a note: while most of these values can be dealt with natively, for now just toss them to formatter   0 �11 �   n o t e :   w h i l e   m o s t   o f   t h e s e   v a l u e s   c a n   b e   d e a l t   w i t h   n a t i v e l y ,   f o r   n o w   j u s t   t o s s   t h e m   t o   f o r m a t t e r. 232 l     ��45��  4 D > TO DO: need to see what happens when ocids/optrs are returned   5 �66 |   T O   D O :   n e e d   t o   s e e   w h a t   h a p p e n s   w h e n   o c i d s / o p t r s   a r e   r e t u r n e d3 787 Z    9:����9 B     ;<; o     ���� 0 
_dataindex 
_dataIndex< n   =>= 1   
 ��
�� 
leng> o    
���� 0 _testresults _testResults: k   ?? @A@ l   ��BC��  B 4 . currently working way through an error record   C �DD \   c u r r e n t l y   w o r k i n g   w a y   t h r o u g h   a n   e r r o r   r e c o r dA EFE Z    nGH����G >   IJI o    ���� $0 _errorrecordrefs _errorRecordRefsJ J    ����  H k    jKK LML r    'NON n    %PQP 1   # %��
�� 
pcntQ n    #RSR 4    #��T
�� 
cobjT m   ! "���� S o     ���� $0 _errorrecordrefs _errorRecordRefsO o      ���� 0 	erroritem 	errorItemM UVU Z   ( gWX����W =  ( /YZY o   ( )���� 0 	erroritem 	errorItemZ o   ) .���� 0 novalue NoValueX k   2 c[[ \]\ r   2 ?^_^ n   2 9`a` 1   7 9�
� 
resta o   2 7�~�~ $0 _errorrecordrefs _errorRecordRefs_ o      �}�} $0 _errorrecordrefs _errorRecordRefs] bcb Z  @ \de�|�{d =  @ Hfgf o   @ E�z�z $0 _errorrecordrefs _errorRecordRefsg J   E G�y�y  e r   K Xhih [   K Rjkj o   K P�x�x 0 _datasubindex _dataSubIndexk m   P Q�w�w i o      �v�v 0 _datasubindex _dataSubIndex�|  �{  c l�ul L   ] cmm I   ] b�t�s�r�t 0 nextrawdata  �s  �r  �u  ��  ��  V n�qn L   h joo o   h i�p�p 0 	erroritem 	errorItem�q  ��  ��  F pqp r   o rsr n   o }tut o   { }�o�o 0 testdata testDatau n   o {vwv 4   t {�nx
�n 
cobjx o   u z�m�m 0 
_dataindex 
_dataIndexw o   o t�l�l 0 _testresults _testResultss o      �k�k 0 datalist dataListq y�jy Z   �z{�i|z B   � �}~} o   � ��h�h 0 _datasubindex _dataSubIndex~ n  � �� 1   � ��g
�g 
leng� o   � ��f�f 0 datalist dataList{ k   � ��� ��� l  � ��e���e  � 4 .	log {"NEXT:", item _dataSubIndex of dataList}   � ��� \ 	 l o g   { " N E X T : " ,   i t e m   _ d a t a S u b I n d e x   o f   d a t a L i s t }� ��� r   � ���� n   � ���� 4   � ��d�
�d 
cobj� m   � ��c�c � n   � ���� 4   � ��b�
�b 
cobj� o   � ��a�a 0 _datasubindex _dataSubIndex� o   � ��`�` 0 datalist dataList� o      �_�_ 0 thedata theData� ��� Z   � ����^�]� F   � ���� I   � ��\��[�\ 0 istype isType� ��� o   � ��Z�Z 0 thedata theData� ��Y� m   � ��X
�X 
reco�Y  �[  � =  � ���� n  � ���� m   � ��W
�W 
pcls� o   � ��V�V 0 thedata theData� o   � ��U�U $0 _caughterrortype _CaughtErrorType� k   � ��� ��� r   � ���� J   � ��� ��� N   � ��� n   � ���� o   � ��T�T 0 	errortext 	errorText� o   � ��S�S 0 thedata theData� ��� l 	 � ���R�Q� N   � ��� n   � ���� o   � ��P�P 0 errornumber errorNumber� o   � ��O�O 0 thedata theData�R  �Q  � ��� N   � ��� n   � ���� o   � ��N�N 0 
errorvalue 
errorValue� o   � ��M�M 0 thedata theData� ��� l 	 � ���L�K� N   � ��� n   � ���� o   � ��J�J 0 expectedtype expectedType� o   � ��I�I 0 thedata theData�L  �K  � ��H� N   � ��� n   � ���� o   � ��G�G 0 partialresult partialResult� o   � ��F�F 0 thedata theData�H  � o      �E�E $0 _errorrecordrefs _errorRecordRefs� ��D� L   � ��� I   � ��C�B�A�C 0 nextrawdata  �B  �A  �D  �^  �]  � ��@� L   � ��� o   � ��?�? 0 thedata theData�@  �i  | k   ��� ��� r   � ��� J   � ��� ��� [   � ���� o   � ��>�> 0 
_dataindex 
_dataIndex� m   � ��=�= � ��<� m   � ��;�; �<  � J      �� ��� o      �:�: 0 
_dataindex 
_dataIndex� ��9� o      �8�8 0 _datasubindex _dataSubIndex�9  � ��7� L  �� I  �6�5�4�6 0 nextrawdata  �5  �4  �7  �j  ��  ��  8 ��3� l ���� R  �2�1�
�2 .ascrerr ****      � ****�1  � �0��/
�0 
errn� m  �.�.f�/  � 1 + `osatest` will check for this error number   � ��� V   ` o s a t e s t `   w i l l   c h e c k   f o r   t h i s   e r r o r   n u m b e r�3  * ~ x repeatedly called by `osatest` when converting test data to literal representations; once exhausted, returns error 6502   + ��� �   r e p e a t e d l y   c a l l e d   b y   ` o s a t e s t `   w h e n   c o n v e r t i n g   t e s t   d a t a   t o   l i t e r a l   r e p r e s e n t a t i o n s ;   o n c e   e x h a u s t e d ,   r e t u r n s   e r r o r   6 5 0 2& ��� l     �-�,�+�-  �,  �+  � ��� i  * -��� I      �*��)�* 0 updaterawdata  � ��(� o      �'�' 0 literaltext literalText�(  �)  � l    p���� k     p�� ��� Z     m���&�� =    ��� o     �%�% $0 _errorrecordrefs _errorRecordRefs� J    �$�$  � k    3�� ��� l   �#���#  � # log {"UPDATE:", _testResults}   � ��� : l o g   { " U P D A T E : " ,   _ t e s t R e s u l t s }� ��� r    %��� o    �"�" 0 literaltext literalText� n      ��� 4   ! $�!�
�! 
cobj� m   " #� �  � n    !��� 4    !��
� 
cobj� o     �� 0 _datasubindex _dataSubIndex� n    � � o    �� 0 testdata testData  n     4    �
� 
cobj o    �� 0 
_dataindex 
_dataIndex o    �� 0 _testresults _testResults� � r   & 3 [   & - o   & +�� 0 _datasubindex _dataSubIndex m   + ,��  o      �� 0 _datasubindex _dataSubIndex�  �&  � k   6 m		 

 r   6 B o   6 7�� 0 literaltext literalText n       1   ? A�
� 
pcnt n   7 ? 4  < ?�
� 
cobj m   = >��  o   7 <�� $0 _errorrecordrefs _errorRecordRefs  r   C P n   C J 1   H J�
� 
rest o   C H�� $0 _errorrecordrefs _errorRecordRefs o      �� $0 _errorrecordrefs _errorRecordRefs � Z  Q m�� =  Q Y o   Q V�
�
 $0 _errorrecordrefs _errorRecordRefs J   V X�	�	   r   \ i [   \ c !  o   \ a�� 0 _datasubindex _dataSubIndex! m   a b��  o      �� 0 _datasubindex _dataSubIndex�  �  �  � "�" L   n p��  �  �a[ called by `osatest` to reinsert the raw data's literal representation; must be called after each nextRawData() (if formatting fails for any reason, use a placeholder, e.g. "�object�") -- TO DO: might be better to pass a boolean parameter along with literalText that indicates if the conversion failed; that way, reporter can decide what to insert   � �##�   c a l l e d   b y   ` o s a t e s t `   t o   r e i n s e r t   t h e   r a w   d a t a ' s   l i t e r a l   r e p r e s e n t a t i o n ;   m u s t   b e   c a l l e d   a f t e r   e a c h   n e x t R a w D a t a ( )   ( i f   f o r m a t t i n g   f a i l s   f o r   a n y   r e a s o n ,   u s e   a   p l a c e h o l d e r ,   e . g .   " � o b j e c t � " )   - -   T O   D O :   m i g h t   b e   b e t t e r   t o   p a s s   a   b o o l e a n   p a r a m e t e r   a l o n g   w i t h   l i t e r a l T e x t   t h a t   i n d i c a t e s   i f   t h e   c o n v e r s i o n   f a i l e d ;   t h a t   w a y ,   r e p o r t e r   c a n   d e c i d e   w h a t   t o   i n s e r t� $%$ l     ����  �  �  % &'& l     � ()�   (  -----   ) �** 
 - - - - -' +,+ l     ��-.��  - y s once raw test data is converted to literal text, `osatest` calls `renderreport` to turn it all into printable text   . �// �   o n c e   r a w   t e s t   d a t a   i s   c o n v e r t e d   t o   l i t e r a l   t e x t ,   ` o s a t e s t `   c a l l s   ` r e n d e r r e p o r t `   t o   t u r n   i t   a l l   i n t o   p r i n t a b l e   t e x t, 010 l     ��������  ��  ��  1 232 i  . 1454 I      �������� 0 renderreport  ��  ��  5 l   U6786 k    U99 :;: r     <=< J     >> ?@? m     ����  @ A��A o    ���� 0 	_nostatus 	_NOSTATUS��  = J      BB CDC o      ���� 0 assertcount assertCountD E��E o      ���� 0 outcometype outcomeType��  ; FGF X    XH��IH l  , SJKLJ k   , SMM NON l  , ,��PQ��  P z t report record has form: {outcomeType:FLAG, fromHandler:NAME, problemSummary:TEXT, userNote:USERTEXT, testData:LIST}   Q �RR �   r e p o r t   r e c o r d   h a s   f o r m :   { o u t c o m e T y p e : F L A G ,   f r o m H a n d l e r : N A M E ,   p r o b l e m S u m m a r y : T E X T ,   u s e r N o t e : U S E R T E X T ,   t e s t D a t a : L I S T }O STS Z  , =UV����U C   , 1WXW n  , /YZY o   - /���� 0 fromhandler fromHandlerZ o   , -���� 0 	reportref 	reportRefX m   / 0[[ �\\  a s s e r t  V r   4 9]^] [   4 7_`_ o   4 5���� 0 assertcount assertCount` m   5 6���� ^ o      ���� 0 assertcount assertCount��  ��  T aba r   > Ccdc n  > Aefe o   ? A���� 0 outcometype outcomeTypef o   > ?���� 0 	reportref 	reportRefd o      ���� 0 outcometype outcomeTypeb g��g l  D Shijh Z  D Skl����k >  D Kmnm o   D E���� 0 outcometype outcomeTypen o   E J���� 0 _success _SUCCESSl  S   N O��  ��  i y s note: can't think of a reason individual asserts should ever skip (it's normally suites/tests that skip), so break   j �oo �   n o t e :   c a n ' t   t h i n k   o f   a   r e a s o n   i n d i v i d u a l   a s s e r t s   s h o u l d   e v e r   s k i p   ( i t ' s   n o r m a l l y   s u i t e s / t e s t s   t h a t   s k i p ) ,   s o   b r e a k��  K � � note: there may be more than one error report (e.g. if assert fails then tearDown fails as well); for now, just format and return the first and ignore any remaining reports   L �ppZ   n o t e :   t h e r e   m a y   b e   m o r e   t h a n   o n e   e r r o r   r e p o r t   ( e . g .   i f   a s s e r t   f a i l s   t h e n   t e a r D o w n   f a i l s   a s   w e l l ) ;   f o r   n o w ,   j u s t   f o r m a t   a n d   r e t u r n   t h e   f i r s t   a n d   i g n o r e   a n y   r e m a i n i n g   r e p o r t s�� 0 	reportref 	reportRefI o     ���� 0 _testresults _testResultsG qrq Z   YGstuvs =  Y `wxw o   Y Z���� 0 outcometype outcomeTypex o   Z _���� 0 _success _SUCCESSt r   c �yzy b   c �{|{ b   c ~}~} b   c v� b   c t��� b   c l��� n  c j��� o   h j���� 0 g  � o   c h���� 0 vtstyle vtStyle� m   j k�� ���  O K� n  l s��� o   q s���� 0 n  � o   l q���� 0 vtstyle vtStyle� m   t u�� ���    ( p e r f o r m e d  ~ n   v }��� 1   { }��
�� 
leng� o   v {���� 0 _testresults _testResults| m   ~ �� ���    a s s e r t i o n s )z o      ���� 0 
reporttext 
reportTextu ��� =  � ���� o   � ����� 0 outcometype outcomeType� o   � ����� 0 	_nostatus 	_NOSTATUS� ��� l  � ����� r   � ���� b   � ���� b   � ���� b   � ���� n  � ���� o   � ����� 0 e  � o   � ����� 0 vtstyle vtStyle� m   � ��� ���  S K I P P E D   T E S T� n  � ���� o   � ����� 0 n  � o   � ����� 0 vtstyle vtStyle� m   � ��� ��� 4   ( p e r f o r m e d   n o   a s s e r t i o n s )� o      ���� 0 
reporttext 
reportText� U O no asserts were performed, so test is marked as 'skipped' rather than 'passed'   � ��� �   n o   a s s e r t s   w e r e   p e r f o r m e d ,   s o   t e s t   i s   m a r k e d   a s   ' s k i p p e d '   r a t h e r   t h a n   ' p a s s e d '� ��� =  � ���� o   � ����� 0 outcometype outcomeType� o   � ����� 0 _skipped _SKIPPED� ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� n  � ���� o   � ����� 0 e  � o   � ����� 0 vtstyle vtStyle� m   � ��� ���  S K I P P E D   T E S T� n  � ���� o   � ����� 0 n  � o   � ����� 0 vtstyle vtStyle� m   � ��� ���    (� n  � ���� o   � ����� 0 usernote userNote� o   � ����� 0 	reportref 	reportRef� m   � ��� ���  )� o      ���� 0 
reporttext 
reportText� ��� =  � ���� o   � ����� 0 outcometype outcomeType� o   � ����� 0 
_skipsuite 
_SKIPSUITE� ���� r   ���� b   � ��� b   � ���� b   � ���� b   � ���� b   � ���� n  � ���� o   � ����� 0 e  � o   � ����� 0 vtstyle vtStyle� m   � ��� ���  S K I P P E D   S U I T E� n  � ���� o   � ����� 0 n  � o   � ����� 0 vtstyle vtStyle� m   � ��� ���    (� n  � ���� o   � ����� 0 usernote userNote� o   � ����� 0 	reportref 	reportRef� m   � ��� ���  )� o      ���� 0 
reporttext 
reportText��  v k  G�� ��� Z  .����� = ��� o  ���� 0 outcometype outcomeType� o  ���� 0 _failure _FAILURE� r  ��� m  �� ���  F A I L E D� o      ���� 0 
statustext 
statusText� ��� = ��� o  ���� 0 outcometype outcomeType� o  ���� 0 _broken _BROKEN� ���� r  !&��� m  !$�� ��� 
 B R O K E� o      ���� 0 
statustext 
statusText��  � r  ).��� m  ),�� ��� 
 O T H E R� o      ���� 0 
statustext 
statusText�    r  /> b  /< n /8 o  48���� 0 r   o  /4���� 0 vtstyle vtStyle m  8; �		  F A I L E D o      ���� 0 
reporttext 
reportText 

 Z  ?V���� C  ?F n ?B o  @B���� 0 fromhandler fromHandler o  ?@���� 0 	reportref 	reportRef m  BE �  a s s e r t   r  IR b  IP b  IN o  IJ���� 0 
reporttext 
reportText m  JM �    o n   a s s e r t i o n   o  NO���� 0 assertcount assertCount o      ���� 0 
reporttext 
reportText��  ��    r  Wj b  Wh !  b  Wd"#" b  W\$%$ o  WX���� 0 
reporttext 
reportText% m  X[&& �''  .# n \c()( o  ac���� 0 n  ) o  \a���� 0 vtstyle vtStyle! 1  dg��
�� 
lnfd o      ���� 0 
reporttext 
reportText *+* l kk��,-��  ,   explain the problem:   - �.. *   e x p l a i n   t h e   p r o b l e m :+ /0/ r  k�121 b  k�343 b  k�565 b  k~787 b  kz9:9 b  kv;<; b  kr=>= o  kl���� 0 
reporttext 
reportText> o  lq���� 0 indent1  < m  ru?? �@@  : n vyABA o  wy���� 0 fromhandler fromHandlerB o  vw���� 0 	reportref 	reportRef8 m  z}CC �DD    6 n ~�EFE o  �����  0 problemsummary problemSummaryF o  ~���� 0 	reportref 	reportRef4 m  ��GG �HH  :2 o      ���� 0 
reporttext 
reportText0 IJI l ����KL��  K � � TO DO: would it improve presentation in terminal if padding were added after each label so that listed values all align on left edge?   L �MM   T O   D O :   w o u l d   i t   i m p r o v e   p r e s e n t a t i o n   i n   t e r m i n a l   i f   p a d d i n g   w e r e   a d d e d   a f t e r   e a c h   l a b e l   s o   t h a t   l i s t e d   v a l u e s   a l l   a l i g n   o n   l e f t   e d g e ?J NON X  �!P��QP k  �RR STS l ��UVWU r  ��XYX o  ������ 0 aref aRefY J      ZZ [\[ o      ���� 0 k  \ ]��] o      ���� 0 v  ��  V D > note: v should always be either text or 'caught error' record   W �^^ |   n o t e :   v   s h o u l d   a l w a y s   b e   e i t h e r   t e x t   o r   ' c a u g h t   e r r o r '   r e c o r dT _`_ Z ��ab����a = ��cdc n ��efe m  ����
�� 
pclsf o  ������ 0 v  d o  ������ $0 _caughterrortype _CaughtErrorTypeb r  ��ghg I  ����i���� 20 formatcaughterrorrecord formatCaughtErrorRecordi jkj o  ������ 0 v  k l��l o  ������ 0 indent2  ��  ��  h o      ���� 0 v  ��  ��  ` mnm Z  �op��qo o  ������ 0 uselinewrap useLineWrapp r  ��rsr I  ����t���� 0 linewrap lineWrapt uvu o  ������ 0 v  v wxw I  ����y���� $0 formatinvisibles formatInvisiblesy z{z o  ������ 0 v  { |��| b  ��}~} 1  ����
�� 
lnfd~ o  ������ 0 indent2  ��  ��  x �� o  ������ 0 terminalwidth terminalWidth��  ��  s o      ���� 0 v  ��  q l ����� r  ���� I  � ���~� $0 formatinvisibles formatInvisibles� ��� o  ���}�} 0 v  � ��|� 1  ���{
�{ 
lnfd�|  �~  � o      �z�z 0 v  � @ : include linebreak after '\n'/'\r' escapes for readability   � ��� t   i n c l u d e   l i n e b r e a k   a f t e r   ' \ n ' / ' \ r '   e s c a p e s   f o r   r e a d a b i l i t yn ��y� l ���� r  ��� b  ��� b  ��� b  ��� b  ��� b  ��� b  ��� o  �x�x 0 
reporttext 
reportText� 1  �w
�w 
lnfd� o  �v�v 0 indent1  � m  �� ���  "  � o  �u�u 0 k  � m  �� ���  :  � o  �t�t 0 v  � o      �s�s 0 
reporttext 
reportText��� TO DO: need to replace any TAB, CR, and LF in strings with "\t", "\r", "\n" (specifically applies to AS string literals, though these chars ought not to appear elsewhere in data in which case it's simplest just to apply it to the lot); this should make differences in invisibles somewhat easier to spot in reports and may help avoid some confusion when text gets linewrapped for terminal display   � ���   T O   D O :   n e e d   t o   r e p l a c e   a n y   T A B ,   C R ,   a n d   L F   i n   s t r i n g s   w i t h   " \ t " ,   " \ r " ,   " \ n "   ( s p e c i f i c a l l y   a p p l i e s   t o   A S   s t r i n g   l i t e r a l s ,   t h o u g h   t h e s e   c h a r s   o u g h t   n o t   t o   a p p e a r   e l s e w h e r e   i n   d a t a   i n   w h i c h   c a s e   i t ' s   s i m p l e s t   j u s t   t o   a p p l y   i t   t o   t h e   l o t ) ;   t h i s   s h o u l d   m a k e   d i f f e r e n c e s   i n   i n v i s i b l e s   s o m e w h a t   e a s i e r   t o   s p o t   i n   r e p o r t s   a n d   m a y   h e l p   a v o i d   s o m e   c o n f u s i o n   w h e n   t e x t   g e t s   l i n e w r a p p e d   f o r   t e r m i n a l   d i s p l a y�y  �� 0 aref aRefQ n ����� o  ���r�r 0 testdata testData� o  ���q�q 0 	reportref 	reportRefO ��p� Z "G���o�n� > "+��� n "'��� o  #'�m�m 0 usernote userNote� o  "#�l�l 0 	reportref 	reportRef� m  '*�� ���  � r  .C��� b  .A��� b  .=��� b  .7��� b  .3��� o  ./�k�k 0 
reporttext 
reportText� 1  /2�j
�j 
lnfd� m  36�� ���  (� n 7<��� o  8<�i�i 0 usernote userNote� o  78�h�h 0 	reportref 	reportRef� m  =@�� ���  )� o      �g�g 0 
reporttext 
reportText�o  �n  �p  r ��f� L  HU�� K  HT�� �e��
�e 
Stat� o  KL�d�d 0 outcometype outcomeType� �c��b
�c 
Repo� o  OP�a�a 0 
reporttext 
reportText�b  �f  7 5 / construct final outcome status and report text   8 ��� ^   c o n s t r u c t   f i n a l   o u t c o m e   s t a t u s   a n d   r e p o r t   t e x t3 ��`� l     �_�^�]�_  �^  �]  �`  �0  � ��� l     �\�[�Z�\  �[  �Z  � ��Y� l     �X�W�V�X  �W  �V  �Y       �U���T�S�R�Q�P�O�N�������������U  � �M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=�<�;�:�M 0 novalue NoValue�L 0 	_nostatus 	_NOSTATUS�K 0 _success _SUCCESS�J 0 _failure _FAILURE�I 0 _broken _BROKEN�H 0 _skipped _SKIPPED�G 0 
_skipsuite 
_SKIPSUITE�F $0 _caughterrortype _CaughtErrorType�E .0 makecaughterrorrecord makeCaughtErrorRecord�D *0 _defaulterrorrecord _defaultErrorRecord�C <0 normalizeexpectederrorrecord normalizeExpectedErrorRecord�B 20 formatcaughterrorrecord formatCaughtErrorRecord�A 0 istype isType�@ (0 sanitizeidentifier sanitizeIdentifier�?  0 makecallobject makeCallObject�> 0 replacetext replaceText�= $0 formatinvisibles formatInvisibles�< 0 linewrap lineWrap�; 0 vt100 VT100�:  0 maketestreport makeTestReport� �9   ��9 0 novalue NoValue�  ��  �T���S �R �Q �P �O 	
�N 
����� �8 N�7�6���5�8 .0 makecaughterrorrecord makeCaughtErrorRecord�7 �4��4 �  �3�2�1�0�/�3 0 etext eText�2 0 enumber eNumber�1 0 efrom eFrom�0 
0 eto eTo�/ 0 epartial ePartial�6  � �.�-�,�+�*�. 0 etext eText�- 0 enumber eNumber�, 0 efrom eFrom�+ 
0 eto eTo�* 0 epartial ePartial� �)�(�'�&�%�$�#
�) 
pcls�( 0 	errortext 	errorText�' 0 errornumber errorNumber�& 0 
errorvalue 
errorValue�% 0 expectedtype expectedType�$ 0 partialresult partialResult�# �5 �b  ������� �"�!�
�" 
pcls
�! 
����� � ���  0 	errortext 	errorText� ���� 0 errornumber errorNumber� ���� 0 
errorvalue 
errorValue� ���� 0 expectedtype expectedType� ���� 0 partialresult partialResult�  � � ~������ <0 normalizeexpectederrorrecord normalizeExpectedErrorRecord� ��� �  �� 0 errorrecord errorRecord�  � ��� 0 errorrecord errorRecord� $0 normalizedrecord normalizedRecord� 	������� � �
� 
leng
� 
errn��Y
� 
erob
� 
errt
� 
reco� � A��,j  )�������Y hO�b  	%E�O��,b  	�, )�������Y hO�� � ��
�	���� 20 formatcaughterrorrecord formatCaughtErrorRecord�
 ��� �  ��� 0 errorrecord errorRecord� 0 
lineindent 
lineIndent�	  � ���� 0 errorrecord errorRecord� 0 
lineindent 
lineIndent� 0 	errortext 	errorText�  �� � �� ��������1� 0 errornumber errorNumber�  0 	errortext 	errorText�� 0 
errorvalue 
errorValue
�� 
lnfd�� 0 expectedtype expectedType�� 0 partialresult partialResult� ��E�O��,b    ��%��,%�%E�Y hO��,b    ���,%E�Y hO��,b    ��%�%�%��,%E�Y hO��,b    ��%�%�%��,%E�Y hO��,b    ��%�%�%��,%E�Y hO�� ��>���������� 0 istype isType�� ����� �  ������ 0 thevalue theValue�� 0 typename typeName��  � ������ 0 thevalue theValue�� 0 typename typeName� ����
�� 
kocl
�� .corecnte****       ****�� �kv�l j� ��_���������� (0 sanitizeidentifier sanitizeIdentifier�� ����� �  ���� 0 aname aName��  � ������������ 0 aname aName�� 0 res  �� 0 
legalchars 
legalChars�� 0 usepipes usePipes�� 0 charref charRef� cdlou{�������������
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt�� t�� p��  �Y hO�E�O�E�OfE�O @�[��l kh ���, eE�O��, 
�%E�Y hY hO��%E�O�E�[OY��O� ��%�%E�Y hO�V� �������������  0 makecallobject makeCallObject�� ����� �  ������ 0 handlername handlerName��  0 parametercount parameterCount��  � ���������� 0 handlername handlerName��  0 parametercount parameterCount�� 0 args  �� 0 i  � �����	����
�� 
ctxt�� (0 sanitizeidentifier sanitizeIdentifier
�� .sysodsct****        scpt�� ^�E�O�k  �E�Y 0�k ) k�kh ��%�%E�[OY��O�[�\[Zm\Zi2E�Y hO�*�%k+ %�%*�k+ %�%�%�%j 
� ��,���������� 0 replacetext replaceText�� ����� �  �������� 0 thetext theText�� 0 findtext findText�� 0 replacetext replaceText��  � ���������� 0 thetext theText�� 0 findtext findText�� 0 replacetext replaceText�� 0 	textitems 	textItems� ��������
�� 
ascr
�� 
txdl
�� 
citm
�� 
ctxt�� ���,FO��-E�O���,FO��&� ��Q���������� $0 formatinvisibles formatInvisibles�� ����� �  ������ 0 thetext theText�� 0 linewrap lineWrap��  � ������ 0 thetext theText�� 0 linewrap lineWrap� ��m����t��{
�� 
tab �� 0 replacetext replaceText
�� 
lnfd
�� 
ret �� ***���m+ ��%m+ ��%m+ � ������������� 0 linewrap lineWrap�� ����� �  ������ 0 thetext theText�� 0 towidth toWidth��  � ������ 0 thetext theText�� 0 towidth toWidth�  �� �� ������������� 0 vt100 VT100�� ����� �  ���� 0 
formatcode 
formatCode��  � ���� 0 
formatcode 
formatCode� ��������
�� 
cha �� 
�� kfrmID  �� )���0�%�%�%� �������������  0 maketestreport makeTestReport�� ����� �  �������� 0 testsuitename testSuiteName�� "0 testhandlername testHandlerName�� 0 terminalwidth terminalWidth��  � ������������������ 0 testsuitename testSuiteName�� "0 testhandlername testHandlerName�� 0 terminalwidth terminalWidth�� 0 indent1  �� 0 indent2  �� 0 vtstyle vtStyle�� 0 uselinewrap useLineWrap�� 0 
testreport 
TestReport� ������������������������������%�
�� 
cobj�� 0 n  �� 0 b  �� 0 u  �� 0 r  �� 0 g  �� 0 e  �� �� 0 vt100 VT100�� �� 0 
testreport 
TestReport� �������� ��
�� .ascrinit****      � ****� k     1 2 9 u � � � � 		 

   % � 2����  ��  ��  � ����������~�}�|�{�z�y�x�w�� 0 _testresults _testResults�� 0 
_addreport 
_addReport�� 0 
addsuccess 
addSuccess�� 0 
addskipped 
addSkipped� 0 	skipsuite 	skipSuite�~ 0 
addfailure 
addFailure�} 0 	addbroken 	addBroken�| $0 _errorrecordrefs _errorRecordRefs�{ 0 
_dataindex 
_dataIndex�z 0 _datasubindex _dataSubIndex�y 0 nextrawdata  �x 0 updaterawdata  �w 0 renderreport    �v�u�t�s�v 0 _testresults _testResults �r<�q�p�o�r 0 
_addreport 
_addReport�q �n�n   �m�l�k�j�i�m 0 outcometype outcomeType�l 0 fromhandler fromHandler�k  0 problemsummary problemSummary�j 0 usernote userNote�i 0 testdata testData�p   �h�g�f�e�d�h 0 outcometype outcomeType�g 0 fromhandler fromHandler�f  0 problemsummary problemSummary�e 0 usernote userNote�d 0 testdata testData �c�b�a�`�_�^�c 0 outcometype outcomeType�b 0 fromhandler fromHandler�a  0 problemsummary problemSummary�` 0 usernote userNote�_ 0 testdata testData�^ 
�o ������b   6FOP �]x�\�[�Z�] 0 
addsuccess 
addSuccess�\ �Y�Y   �X�W�V�X 0 fromhandler fromHandler�W 0 usernote userNote�V 0 testdata testData�[   �U�T�S�U 0 fromhandler fromHandler�T 0 usernote userNote�S 0 testdata testData ��R�Q�R �Q 0 
_addreport 
_addReport�Z *b  �ࡢ�+  �P��O�N�M�P 0 
addskipped 
addSkipped�O �L�L   �K�J�K 0 fromhandler fromHandler�J 0 usernote userNote�N   �I�H�I 0 fromhandler fromHandler�H 0 usernote userNote ����G�F�G �F 0 
_addreport 
_addReport�M ��  �E�Y hO*b  ��jv�+  �E��D�C !�B�E 0 	skipsuite 	skipSuite�D �A"�A "  �@�@ 0 usernote userNote�C    �?�? 0 usernote userNote! �����>�=�> �= 0 
_addreport 
_addReport�B ��  �E�Y hO*b  ��jv�+  �<��;�:#$�9�< 0 
addfailure 
addFailure�; �8%�8 %  �7�6�5�4�7 0 fromhandler fromHandler�6  0 problemsummary problemSummary�5 0 usernote userNote�4 0 testdata testData�:  # �3�2�1�0�3 0 fromhandler fromHandler�2  0 problemsummary problemSummary�1 0 usernote userNote�0 0 testdata testData$ �/�.�/ �. 0 
_addreport 
_addReport�9 *b  �����+  �-��,�+&'�*�- 0 	addbroken 	addBroken�, �)(�) (  �(�'�&�%�( 0 fromhandler fromHandler�'  0 problemsummary problemSummary�& 0 usernote userNote�% 0 testdata testData�+  & �$�#�"�!�$ 0 fromhandler fromHandler�#  0 problemsummary problemSummary�" 0 usernote userNote�! 0 testdata testData' � ��  � 0 
_addreport 
_addReport�* *b  �����+ �u $0 _errorrecordrefs _errorRecordRefs�t 0 
_dataindex 
_dataIndex�s 0 _datasubindex _dataSubIndex �(��)*�� 0 nextrawdata  �  �  ) ���� 0 	erroritem 	errorItem� 0 datalist dataList� 0 thedata theData* ��������������
�	���
� 
leng
� 
cobj
� 
pcnt
� 
rest� 0 nextrawdata  � 0 testdata testData
� 
reco� 0 istype isType
� 
pcls
� 
bool� 0 	errortext 	errorText� 0 errornumber errorNumber� 0 
errorvalue 
errorValue�
 0 expectedtype expectedType�	 0 partialresult partialResult� 
� 
errn�f�b  b   �, �b  jv Tb  �k/�,E�O�b     6b  �,Ec  Ob  jv  b  	kEc  	Y hO*j+ Y hO�Y hOb   �b  /�,E�Ob  	��, U��b  	/�l/E�O*��l+ 	 ��,b   �& (��,��,��,��,��,�vEc  O*j+ Y hO�Y *b  kklvE[�k/Ec  Z[�l/Ec  	ZO*j+ Y hO)a a lh ����+,�� 0 updaterawdata  � �-� -  � �  0 literaltext literalText�  + ���� 0 literaltext literalText, ��������
�� 
cobj�� 0 testdata testData
�� 
pcnt
�� 
rest� qb  jv  -�b   �b  /�,�b  	/�l/FOb  	kEc  	Y 9�b  �k/�,FOb  �,Ec  Ob  jv  b  	kEc  	Y hOh ��5����./���� 0 renderreport  ��  ��  . ������������������ 0 assertcount assertCount�� 0 outcometype outcomeType�� 0 	reportref 	reportRef�� 0 
reporttext 
reportText�� 0 
statustext 
statusText�� 0 aref aRef�� 0 k  �� 0 v  / 0��������[����������������������������&��?C��G���������������������
�� 
cobj
�� 
kocl
�� .corecnte****       ****�� 0 fromhandler fromHandler�� 0 outcometype outcomeType�� 0 g  �� 0 n  
�� 
leng�� 0 e  �� 0 usernote userNote�� 0 r  
�� 
lnfd��  0 problemsummary problemSummary�� 0 testdata testData
�� 
pcls�� 20 formatcaughterrorrecord formatCaughtErrorRecord�� $0 formatinvisibles formatInvisibles�� 0 linewrap lineWrap
�� 
Stat
�� 
Repo�� ��Vjb  lvE[�k/E�Z[�l/E�ZO ?b   [��l kh ��,� 
�kE�Y hO��,E�O�b   Y h[OY��O�b    $b  �,�%b  �,%�%b   �,%�%E�Yġb    b  �,�%b  �,%�%E�Y��b    &b  �,�%b  �,%a %�a ,%a %E�Yt�b    (b  �,a %b  �,%a %�a ,%a %E�YD�b    
a E�Y �b    
a E�Y a E�Ob  a ,a %E�O��,a  �a %�%E�Y hO�a %b  �,%_ %E�O�b  %a %��,%a  %�a !,%a "%E�O ��a #,[��l kh �E[�k/E�Z[�l/E�ZO�a $,b    *�b  l+ %E�Y hOb   !*�*�_ b  %l+ &b  m+ 'E�Y *�_ l+ &E�O�_ %b  %a (%�%a )%�%E�[OY�}O�a ,a * �_ %a +%�a ,%a ,%E�Y hOa -�a .�a /�� 2jv�OL OL OL OL OL OL Ojv�Ok�Ok�OL 
OL OL �� x��lvE[�k/E�Z[�l/E�ZO�i  �������������E�OfE�Y <�*jk+ �*kk+ �*a k+ �*a k+ �*a k+ �*a k+ �E�OeE�Oa a K S� ascr  ��ޭ