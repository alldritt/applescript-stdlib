FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� LibrarySupportLib -- various standardized handlers for coercing and checking parameters and throwing errors

Notes:

- Because AS errors don't include stack traces, a library's public handlers must trap and rethrow all errors, prefixing error string with library and handler name (and, in script object methods, the object's display/documentation name) so that user can identify the handler in which an error occurred. Special attention should also be paid to coercing and/or validating public handlers' parameters, and throwing descriptive errors if an inappropriate value is given.

- This library wouldn't be necessary if AppleScript had decent parameter type annotations and proper exception objects (with full stack trace support). But as it doesn't these handlers at least take some of the endless pain out of sanitizing user-supplied inputs and generating consistent error messages when those inputs are inappropriate, or anything else in the handler needs to throw an error (or just goes plain old wrong).

Caution:

- When checking if a string is empty in a library handler, it is *essential* either to check its length=0 or else wrap the string comparison (e.g. `aString is ""`) in a `considering hyphens, punctuation and white space block` to ensure that it really is empty and not a non-empty text value that contains only characters being ignored by the caller's current considering/ignoring settings. Similarly, when comparing for a non-empty string, the considering block *must* be used.

- When performing comparisons using <,�,>,� operators or concatenating values with & operator, it is *essential* to ensure the left operand is of the correct type (number/text/date/list) as AS will coerce the RH operand to the same type as the LH operand, and in some cases even casts *both* (e.g. `1&2`->`{1}&{2}`->`{1,2}`). Conversely, when using =/� operators, if the two operands are not the same type then this will almost always result in `false` (the obvious exception being integer/real comparisons, e.g. `1=1.0`->true), even though type-only differences are often ignored by other operators/commands (e.g. `1<"1"->false, `1<{1}`->false). Fully sanitizing all handler parameters before using them should generally avoid such problems subsequently manifesting in the handler, but eternal vigilance is still required to ensure extremely obscure/nasty/unpredictable/almost-impossible-to-troubleshoot bugs don't sneak in.

TO DO: 

- should asTextParameter() always throw an error if value is a list? (i.e. avoids inconsistent concatenation results due to TIDs); another option would be to whitelist some or all known 'safe' types (integer/real, text, date, alias/file/furl, etc) and reject everything else; this should ensure stable predictable behavior - even where additional custom coercion handlers are installed (users can still use other types of values, of course; they just have to explicitly coerce them first using `as` operator)

- should as<NumericType>Parameter() handlers explicitly check for and reject non-number-like values that AS would normally coerce to numbers? Probably, e.g. just because January..December and Monday..Sunday constants _can_ coerce doesn't mean they should, as if they're being passed to a handler that expects a regular number then it almost certainly indicates a mistake in the user's code that should be drawn to her attention. For example, using Standard Additions:

	random number from January to December --> 0.0-1.0 (wrong! this is a bug in `random number` osax handler where it silently ignores non-numeric parameter types instead of reporting coercion error)	random number from (January as integer) to (December as integer) --> 1-12

- how best to check if value is type class/constant as count doesn't seem to work for those (see TypesLib's `check type` and `actual type` handlers, which use process of elimination to exclude types whose `class` properties can't be trusted and then check it; alternatively, just cast and, where given, validate against a list of acceptable values - although, annoyingly, those can't be used in generating a helpful error message as type and constant symbols can't reliably coerce to text representations as that's dependent on availability/absence of original terminology resource at the time)

     � 	 	!�   L i b r a r y S u p p o r t L i b   - -   v a r i o u s   s t a n d a r d i z e d   h a n d l e r s   f o r   c o e r c i n g   a n d   c h e c k i n g   p a r a m e t e r s   a n d   t h r o w i n g   e r r o r s 
 
 N o t e s : 
 
 -   B e c a u s e   A S   e r r o r s   d o n ' t   i n c l u d e   s t a c k   t r a c e s ,   a   l i b r a r y ' s   p u b l i c   h a n d l e r s   m u s t   t r a p   a n d   r e t h r o w   a l l   e r r o r s ,   p r e f i x i n g   e r r o r   s t r i n g   w i t h   l i b r a r y   a n d   h a n d l e r   n a m e   ( a n d ,   i n   s c r i p t   o b j e c t   m e t h o d s ,   t h e   o b j e c t ' s   d i s p l a y / d o c u m e n t a t i o n   n a m e )   s o   t h a t   u s e r   c a n   i d e n t i f y   t h e   h a n d l e r   i n   w h i c h   a n   e r r o r   o c c u r r e d .   S p e c i a l   a t t e n t i o n   s h o u l d   a l s o   b e   p a i d   t o   c o e r c i n g   a n d / o r   v a l i d a t i n g   p u b l i c   h a n d l e r s '   p a r a m e t e r s ,   a n d   t h r o w i n g   d e s c r i p t i v e   e r r o r s   i f   a n   i n a p p r o p r i a t e   v a l u e   i s   g i v e n . 
 
 -   T h i s   l i b r a r y   w o u l d n ' t   b e   n e c e s s a r y   i f   A p p l e S c r i p t   h a d   d e c e n t   p a r a m e t e r   t y p e   a n n o t a t i o n s   a n d   p r o p e r   e x c e p t i o n   o b j e c t s   ( w i t h   f u l l   s t a c k   t r a c e   s u p p o r t ) .   B u t   a s   i t   d o e s n ' t   t h e s e   h a n d l e r s   a t   l e a s t   t a k e   s o m e   o f   t h e   e n d l e s s   p a i n   o u t   o f   s a n i t i z i n g   u s e r - s u p p l i e d   i n p u t s   a n d   g e n e r a t i n g   c o n s i s t e n t   e r r o r   m e s s a g e s   w h e n   t h o s e   i n p u t s   a r e   i n a p p r o p r i a t e ,   o r   a n y t h i n g   e l s e   i n   t h e   h a n d l e r   n e e d s   t o   t h r o w   a n   e r r o r   ( o r   j u s t   g o e s   p l a i n   o l d   w r o n g ) . 
 
 C a u t i o n : 
 
 -   W h e n   c h e c k i n g   i f   a   s t r i n g   i s   e m p t y   i n   a   l i b r a r y   h a n d l e r ,   i t   i s   * e s s e n t i a l *   e i t h e r   t o   c h e c k   i t s   l e n g t h = 0   o r   e l s e   w r a p   t h e   s t r i n g   c o m p a r i s o n   ( e . g .   ` a S t r i n g   i s   " " ` )   i n   a   ` c o n s i d e r i n g   h y p h e n s ,   p u n c t u a t i o n   a n d   w h i t e   s p a c e   b l o c k `   t o   e n s u r e   t h a t   i t   r e a l l y   i s   e m p t y   a n d   n o t   a   n o n - e m p t y   t e x t   v a l u e   t h a t   c o n t a i n s   o n l y   c h a r a c t e r s   b e i n g   i g n o r e d   b y   t h e   c a l l e r ' s   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s .   S i m i l a r l y ,   w h e n   c o m p a r i n g   f o r   a   n o n - e m p t y   s t r i n g ,   t h e   c o n s i d e r i n g   b l o c k   * m u s t *   b e   u s e d . 
 
 -   W h e n   p e r f o r m i n g   c o m p a r i s o n s   u s i n g   < ,"d , > ,"e   o p e r a t o r s   o r   c o n c a t e n a t i n g   v a l u e s   w i t h   &   o p e r a t o r ,   i t   i s   * e s s e n t i a l *   t o   e n s u r e   t h e   l e f t   o p e r a n d   i s   o f   t h e   c o r r e c t   t y p e   ( n u m b e r / t e x t / d a t e / l i s t )   a s   A S   w i l l   c o e r c e   t h e   R H   o p e r a n d   t o   t h e   s a m e   t y p e   a s   t h e   L H   o p e r a n d ,   a n d   i n   s o m e   c a s e s   e v e n   c a s t s   * b o t h *   ( e . g .   ` 1 & 2 ` - > ` { 1 } & { 2 } ` - > ` { 1 , 2 } ` ) .   C o n v e r s e l y ,   w h e n   u s i n g   = /"`   o p e r a t o r s ,   i f   t h e   t w o   o p e r a n d s   a r e   n o t   t h e   s a m e   t y p e   t h e n   t h i s   w i l l   a l m o s t   a l w a y s   r e s u l t   i n   ` f a l s e `   ( t h e   o b v i o u s   e x c e p t i o n   b e i n g   i n t e g e r / r e a l   c o m p a r i s o n s ,   e . g .   ` 1 = 1 . 0 ` - > t r u e ) ,   e v e n   t h o u g h   t y p e - o n l y   d i f f e r e n c e s   a r e   o f t e n   i g n o r e d   b y   o t h e r   o p e r a t o r s / c o m m a n d s   ( e . g .   ` 1 < " 1 " - > f a l s e ,   ` 1 < { 1 } ` - > f a l s e ) .   F u l l y   s a n i t i z i n g   a l l   h a n d l e r   p a r a m e t e r s   b e f o r e   u s i n g   t h e m   s h o u l d   g e n e r a l l y   a v o i d   s u c h   p r o b l e m s   s u b s e q u e n t l y   m a n i f e s t i n g   i n   t h e   h a n d l e r ,   b u t   e t e r n a l   v i g i l a n c e   i s   s t i l l   r e q u i r e d   t o   e n s u r e   e x t r e m e l y   o b s c u r e / n a s t y / u n p r e d i c t a b l e / a l m o s t - i m p o s s i b l e - t o - t r o u b l e s h o o t   b u g s   d o n ' t   s n e a k   i n . 
 
 T O   D O :   
 
 -   s h o u l d   a s T e x t P a r a m e t e r ( )   a l w a y s   t h r o w   a n   e r r o r   i f   v a l u e   i s   a   l i s t ?   ( i . e .   a v o i d s   i n c o n s i s t e n t   c o n c a t e n a t i o n   r e s u l t s   d u e   t o   T I D s ) ;   a n o t h e r   o p t i o n   w o u l d   b e   t o   w h i t e l i s t   s o m e   o r   a l l   k n o w n   ' s a f e '   t y p e s   ( i n t e g e r / r e a l ,   t e x t ,   d a t e ,   a l i a s / f i l e / f u r l ,   e t c )   a n d   r e j e c t   e v e r y t h i n g   e l s e ;   t h i s   s h o u l d   e n s u r e   s t a b l e   p r e d i c t a b l e   b e h a v i o r   -   e v e n   w h e r e   a d d i t i o n a l   c u s t o m   c o e r c i o n   h a n d l e r s   a r e   i n s t a l l e d   ( u s e r s   c a n   s t i l l   u s e   o t h e r   t y p e s   o f   v a l u e s ,   o f   c o u r s e ;   t h e y   j u s t   h a v e   t o   e x p l i c i t l y   c o e r c e   t h e m   f i r s t   u s i n g   ` a s `   o p e r a t o r )  
 
 -   s h o u l d   a s < N u m e r i c T y p e > P a r a m e t e r ( )   h a n d l e r s   e x p l i c i t l y   c h e c k   f o r   a n d   r e j e c t   n o n - n u m b e r - l i k e   v a l u e s   t h a t   A S   w o u l d   n o r m a l l y   c o e r c e   t o   n u m b e r s ?   P r o b a b l y ,   e . g .   j u s t   b e c a u s e   J a n u a r y . . D e c e m b e r   a n d   M o n d a y . . S u n d a y   c o n s t a n t s   _ c a n _   c o e r c e   d o e s n ' t   m e a n   t h e y   s h o u l d ,   a s   i f   t h e y ' r e   b e i n g   p a s s e d   t o   a   h a n d l e r   t h a t   e x p e c t s   a   r e g u l a r   n u m b e r   t h e n   i t   a l m o s t   c e r t a i n l y   i n d i c a t e s   a   m i s t a k e   i n   t h e   u s e r ' s   c o d e   t h a t   s h o u l d   b e   d r a w n   t o   h e r   a t t e n t i o n .   F o r   e x a m p l e ,   u s i n g   S t a n d a r d   A d d i t i o n s : 
 
 	 r a n d o m   n u m b e r   f r o m   J a n u a r y   t o   D e c e m b e r   - - >   0 . 0 - 1 . 0   ( w r o n g !   t h i s   i s   a   b u g   i n   ` r a n d o m   n u m b e r `   o s a x   h a n d l e r   w h e r e   i t   s i l e n t l y   i g n o r e s   n o n - n u m e r i c   p a r a m e t e r   t y p e s   i n s t e a d   o f   r e p o r t i n g   c o e r c i o n   e r r o r )   	 r a n d o m   n u m b e r   f r o m   ( J a n u a r y   a s   i n t e g e r )   t o   ( D e c e m b e r   a s   i n t e g e r )   - - >   1 - 1 2 
 
 -   h o w   b e s t   t o   c h e c k   i f   v a l u e   i s   t y p e   c l a s s / c o n s t a n t   a s   c o u n t   d o e s n ' t   s e e m   t o   w o r k   f o r   t h o s e   ( s e e   T y p e s L i b ' s   ` c h e c k   t y p e `   a n d   ` a c t u a l   t y p e `   h a n d l e r s ,   w h i c h   u s e   p r o c e s s   o f   e l i m i n a t i o n   t o   e x c l u d e   t y p e s   w h o s e   ` c l a s s `   p r o p e r t i e s   c a n ' t   b e   t r u s t e d   a n d   t h e n   c h e c k   i t ;   a l t e r n a t i v e l y ,   j u s t   c a s t   a n d ,   w h e r e   g i v e n ,   v a l i d a t e   a g a i n s t   a   l i s t   o f   a c c e p t a b l e   v a l u e s   -   a l t h o u g h ,   a n n o y i n g l y ,   t h o s e   c a n ' t   b e   u s e d   i n   g e n e r a t i n g   a   h e l p f u l   e r r o r   m e s s a g e   a s   t y p e   a n d   c o n s t a n t   s y m b o l s   c a n ' t   r e l i a b l y   c o e r c e   t o   t e x t   r e p r e s e n t a t i o n s   a s   t h a t ' s   d e p e n d e n t   o n   a v a i l a b i l i t y / a b s e n c e   o f   o r i g i n a l   t e r m i n o l o g y   r e s o u r c e   a t   t h e   t i m e )  
  
   
  
 l     ��������  ��  ��        l     ��������  ��  ��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��    � � convenience handlers for raising common errors; using these improves consistency, ensuring all error messages and parameters follow same general structure, and that all library handlers automatically benefit from any future improvements made here     �  �   c o n v e n i e n c e   h a n d l e r s   f o r   r a i s i n g   c o m m o n   e r r o r s ;   u s i n g   t h e s e   i m p r o v e s   c o n s i s t e n c y ,   e n s u r i n g   a l l   e r r o r   m e s s a g e s   a n d   p a r a m e t e r s   f o l l o w   s a m e   g e n e r a l   s t r u c t u r e ,   a n d   t h a t   a l l   l i b r a r y   h a n d l e r s   a u t o m a t i c a l l y   b e n e f i t   f r o m   a n y   f u t u r e   i m p r o v e m e n t s   m a d e   h e r e      l     ��������  ��  ��        i        I      ��  ���� 60 throwinvalidparametertype throwInvalidParameterType    ! " ! o      ���� 0 thevalue theValue "  # $ # o      ���� 0 parametername parameterName $  % & % o      ���� $0 expectedtypename expectedTypeName &  '�� ' o      ���� 0 expectedtype expectedType��  ��    k     ( ( (  ) * ) Z      + ,�� - + =      . / . n     0 1 0 1    ��
�� 
leng 1 o     ���� 0 parametername parameterName / m    ����   , r     2 3 2 m    	 4 4 � 5 5  d i r e c t 3 o      ���� 0 parametername parameterName��   - r     6 7 6 b     8 9 8 b     : ; : m     < < � = =   ; o    ���� 0 parametername parameterName 9 m     > > � ? ?   7 o      ���� 0 parametername parameterName *  @�� @ R    (�� A B
�� .ascrerr ****      � **** A b    ' C D C b    % E F E b    # G H G b    ! I J I m     K K � L L  I n v a l i d   J o     ���� 0 parametername parameterName H m   ! " M M � N N *   p a r a m e t e r   ( e x p e c t e d   F o   # $���� $0 expectedtypename expectedTypeName D m   % & O O � P P  ) . B �� Q R
�� 
errn Q m    �����Y R �� S T
�� 
erob S o    ���� 0 thevalue theValue T �� U��
�� 
errt U o    ���� 0 expectedtype expectedType��  ��     V W V l     ��������  ��  ��   W  X Y X l     ��������  ��  ��   Y  Z [ Z i    \ ] \ I      �� ^���� 0 rethrowerror rethrowError ^  _ ` _ o      ���� 0 libraryname libraryName `  a b a o      ���� 0 handlername handlerName b  c d c o      ���� 0 etext eText d  e f e o      ���� 0 enumber eNumber f  g h g o      ���� 0 efrom eFrom h  i j i o      ���� 
0 eto eTo j  k l k o      ���� $0 targetobjectname targetObjectName l  m�� m o      ���� 0 partialresult partialResult��  ��   ] l    = n o p n k     = q q  r s r r      t u t b     	 v w v b      x y x b      z { z b      | } | o     ���� 0 libraryname libraryName } m     ~ ~ �      c a n ' t   { o    ���� 0 handlername handlerName y m     � � � � �  :   w o    ���� 0 etext eText u o      ���� 0 etext eText s  � � � Z    � ����� � >    � � � o    ���� $0 targetobjectname targetObjectName � m    ��
�� 
msng � r     � � � b     � � � b     � � � o    ���� $0 targetobjectname targetObjectName � m     � � � � �    o f   � o    ���� 0 etext eText � o      ���� 0 etext eText��  ��   �  ��� � Z    = � ��� � � =   ! � � � o    ���� 0 partialresult partialResult � m     ��
�� 
msng � R   $ .�� � �
�� .ascrerr ****      � **** � o   , -���� 0 etext eText � �� � �
�� 
errn � o   & '���� 0 enumber eNumber � �� � �
�� 
erob � o   ( )���� 0 efrom eFrom � �� ���
�� 
errt � o   * +���� 
0 eto eTo��  ��   � R   1 =�� � �
�� .ascrerr ****      � **** � o   ; <���� 0 etext eText � �� � �
�� 
errn � o   3 4���� 0 enumber eNumber � �� � �
�� 
erob � o   5 6���� 0 efrom eFrom � �� � �
�� 
errt � o   7 8���� 
0 eto eTo � �� ���
�� 
ptlr � o   9 :���� 0 partialresult partialResult��  ��   o ~ x targetObjectName and partialResult should be `missing value` if unused; if eTo is unused, AS seems to be to pass `item`    p � � � �   t a r g e t O b j e c t N a m e   a n d   p a r t i a l R e s u l t   s h o u l d   b e   ` m i s s i n g   v a l u e `   i f   u n u s e d ;   i f   e T o   i s   u n u s e d ,   A S   s e e m s   t o   b e   t o   p a s s   ` i t e m ` [  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � q k convenience shortcuts for rethrowError() when targetObjectName and/or partialResult parameters aren't used    � � � � �   c o n v e n i e n c e   s h o r t c u t s   f o r   r e t h r o w E r r o r ( )   w h e n   t a r g e t O b j e c t N a m e   a n d / o r   p a r t i a l R e s u l t   p a r a m e t e r s   a r e n ' t   u s e d �  � � � l     ��������  ��  ��   �  � � � i    � � � I      �� ����� &0 throwcommanderror throwCommandError �  � � � o      ���� 0 libraryname libraryName �  � � � o      ���� 0 handlername handlerName �  � � � o      ���� 0 etext eText �  � � � o      ���� 0 enumber eNumber �  � � � o      ���� 0 efrom eFrom �  ��� � o      ���� 
0 eto eTo��  ��   � R     �� ���
�� .ascrerr ****      � **** � I    �� ����� 0 rethrowerror rethrowError �  � � � o    ���� 0 libraryname libraryName �  � � � o    ���� 0 handlername handlerName �  � � � o    ���� 0 etext eText �  � � � o    ���� 0 enumber eNumber �  � � � o    ���� 0 efrom eFrom �  � � � o    	���� 
0 eto eTo �  � � � m   	 
��
�� 
msng �  ��� � m   
 ��
�� 
msng��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     ��~�}�  �~  �}   �  � � � i    � � � I      �| ��{�| $0 throwmethoderror throwMethodError �  � � � o      �z�z 0 libraryname libraryName �  � � � o      �y�y $0 targetobjectname targetObjectName �  � � � o      �x�x 0 handlername handlerName �  � � � o      �w�w 0 etext eText �  � � � o      �v�v 0 enumber eNumber �  � � � o      �u�u 0 efrom eFrom �  ��t � o      �s�s 
0 eto eTo�t  �{   � R     �r ��q
�r .ascrerr ****      � **** � I    �p ��o�p 0 rethrowerror rethrowError �  � � � o    �n�n 0 libraryname libraryName �  � � � o    �m�m 0 handlername handlerName �  � � � o    �l�l 0 etext eText �  � � � o    �k�k 0 enumber eNumber �  � � � o    �j�j 0 efrom eFrom �  � � � o    	�i�i 
0 eto eTo �  � � � o   	 
�h�h $0 targetobjectname targetObjectName �  ��g � m   
 �f
�f 
msng�g  �o  �q   �  � � � l     �e�d�c�e  �d  �c   �  � � � l     �b�a�`�b  �a  �`   �  � � � l     �_ �_    J D--------------------------------------------------------------------    � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  l     �^�^  f` convenience handlers for coercing parameters to commonly-used types, throwing a descriptive error if the coercion fails; use these to ensure parameters to library handlers are of the correct type (while AS handlers allow parameters to be directly annotated with `as TYPE` clauses, these are limited in capability and do not produce descriptive errors)    ��   c o n v e n i e n c e   h a n d l e r s   f o r   c o e r c i n g   p a r a m e t e r s   t o   c o m m o n l y - u s e d   t y p e s ,   t h r o w i n g   a   d e s c r i p t i v e   e r r o r   i f   t h e   c o e r c i o n   f a i l s ;   u s e   t h e s e   t o   e n s u r e   p a r a m e t e r s   t o   l i b r a r y   h a n d l e r s   a r e   o f   t h e   c o r r e c t   t y p e   ( w h i l e   A S   h a n d l e r s   a l l o w   p a r a m e t e r s   t o   b e   d i r e c t l y   a n n o t a t e d   w i t h   ` a s   T Y P E `   c l a u s e s ,   t h e s e   a r e   l i m i t e d   i n   c a p a b i l i t y   a n d   d o   n o t   p r o d u c e   d e s c r i p t i v e   e r r o r s ) 	 l     �]�\�[�]  �\  �[  	 

 l     �Z�Y�X�Z  �Y  �X    i    I      �W�V�W (0 asbooleanparameter asBooleanParameter  o      �U�U 0 thevalue theValue �T o      �S�S 0 parametername parameterName�T  �V   Q      L     c     o    �R�R 0 thevalue theValue m    �Q
�Q 
bool R      �P�O
�P .ascrerr ****      � ****�O   �N�M
�N 
errn d       m      �L�L��M   I    �K�J�K 60 throwinvalidparametertype throwInvalidParameterType  o    �I�I 0 thevalue theValue  !  o    �H�H 0 parametername parameterName! "#" m    $$ �%%  b o o l e a n# &�G& m    �F
�F 
bool�G  �J   '(' l     �E�D�C�E  �D  �C  ( )*) l     �B�A�@�B  �A  �@  * +,+ i   -.- I      �?/�>�? (0 asintegerparameter asIntegerParameter/ 010 o      �=�= 0 thevalue theValue1 2�<2 o      �;�; 0 parametername parameterName�<  �>  . Q     3453 L    66 c    787 o    �:�: 0 thevalue theValue8 m    �9
�9 
long4 R      �8�79
�8 .ascrerr ****      � ****�7  9 �6:�5
�6 
errn: d      ;; m      �4�4��5  5 I    �3<�2�3 60 throwinvalidparametertype throwInvalidParameterType< =>= o    �1�1 0 thevalue theValue> ?@? o    �0�0 0 parametername parameterName@ ABA m    CC �DD  i n t e g e rB E�/E m    �.
�. 
long�/  �2  , FGF l     �-�,�+�-  �,  �+  G HIH l     �*�)�(�*  �)  �(  I JKJ i   LML I      �'N�&�' "0 asrealparameter asRealParameterN OPO o      �%�% 0 thevalue theValueP Q�$Q o      �#�# 0 parametername parameterName�$  �&  M Q     RSTR L    UU c    VWV o    �"�" 0 thevalue theValueW m    �!
�! 
doubS R      � �X
�  .ascrerr ****      � ****�  X �Y�
� 
errnY d      ZZ m      ����  T I    �[�� 60 throwinvalidparametertype throwInvalidParameterType[ \]\ o    �� 0 thevalue theValue] ^_^ o    �� 0 parametername parameterName_ `a` m    bb �cc  r e a la d�d m    �
� 
doub�  �  K efe l     ����  �  �  f ghg l     ����  �  �  h iji i   klk I      �m�� &0 asnumberparameter asNumberParameterm non o      �� 0 thevalue theValueo p�p o      �� 0 parametername parameterName�  �  l Q     qrsq L    tt c    uvu o    �
�
 0 thevalue theValuev m    �	
�	 
nmbrr R      ��w
� .ascrerr ****      � ****�  w �x�
� 
errnx d      yy m      ����  s I    �z�� 60 throwinvalidparametertype throwInvalidParameterTypez {|{ o    �� 0 thevalue theValue| }~} o    � �  0 parametername parameterName~ � m    �� ���  n u m b e r� ���� m    ��
�� 
nmbr��  �  j ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i    #��� I      ������� "0 astextparameter asTextParameter� ��� o      ���� 0 thevalue theValue� ���� o      ���� 0 parametername parameterName��  ��  � Q     ���� l   ���� L    �� c    ��� o    ���� 0 thevalue theValue� m    ��
�� 
ctxt� � � note: AS requires `as` operator's RH operand to be literal type name, so can't be parameterized; instead, a separate as...Parameter() handler must be defined for each type   � ���X   n o t e :   A S   r e q u i r e s   ` a s `   o p e r a t o r ' s   R H   o p e r a n d   t o   b e   l i t e r a l   t y p e   n a m e ,   s o   c a n ' t   b e   p a r a m e t e r i z e d ;   i n s t e a d ,   a   s e p a r a t e   a s . . . P a r a m e t e r ( )   h a n d l e r   m u s t   b e   d e f i n e d   f o r   e a c h   t y p e� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 thevalue theValue� ��� o    ���� 0 parametername parameterName� ��� m    �� ���  t e x t� ���� m    ��
�� 
ctxt��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  $ '��� I      ������� "0 asdateparameter asDateParameter� ��� o      ���� 0 thevalue theValue� ���� o      ���� 0 parametername parameterName��  ��  � Q     ���� L    �� c    ��� o    ���� 0 thevalue theValue� m    ��
�� 
ldt � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 thevalue theValue� ��� o    ���� 0 parametername parameterName� ��� m    �� ���  d a t e� ���� m    ��
�� 
ldt ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  ( +��� I      ������� "0 aslistparameter asListParameter� ���� o      ���� 0 thevalue theValue��  ��  � k     �� ��� l     ������  �VP a more robust alternative to `theValue as list` that handles records correctly (e.g. `asListParameter({a:1,b:2})` returns `{{a:1,b:2}}` instead of `{1,2}`); note that unlike other as...Parameter handlers this doesn't take a parameterName parameter as it should never fail as *any* value can be successfully converted to a one-item list   � ����   a   m o r e   r o b u s t   a l t e r n a t i v e   t o   ` t h e V a l u e   a s   l i s t `   t h a t   h a n d l e s   r e c o r d s   c o r r e c t l y   ( e . g .   ` a s L i s t P a r a m e t e r ( { a : 1 , b : 2 } ) `   r e t u r n s   ` { { a : 1 , b : 2 } } `   i n s t e a d   o f   ` { 1 , 2 } ` ) ;   n o t e   t h a t   u n l i k e   o t h e r   a s . . . P a r a m e t e r   h a n d l e r s   t h i s   d o e s n ' t   t a k e   a   p a r a m e t e r N a m e   p a r a m e t e r   a s   i t   s h o u l d   n e v e r   f a i l   a s   * a n y *   v a l u e   c a n   b e   s u c c e s s f u l l y   c o n v e r t e d   t o   a   o n e - i t e m   l i s t� ���� Z     ������ ?     ��� l    	������ I    	����
�� .corecnte****       ****� J     �� ���� o     ���� 0 thevalue theValue��  � �����
�� 
kocl� m    ��
�� 
list��  ��  ��  � m   	 
����  � L    �� o    ���� 0 thevalue theValue��  � L    �� J    �� ���� o    ���� 0 thevalue theValue��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  , /��� I      ������� &0 asrecordparameter asRecordParameter� ��� o      ���� 0 thevalue theValue� ���� o      ���� 0 parametername parameterName��  ��  � Q     ���� L    �� c    ��� o    ���� 0 thevalue theValue� m    ��
�� 
reco� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 thevalue theValue� ��� o    ���� 0 parametername parameterName�    m     �  r e c o r d �� m    ��
�� 
reco��  ��  �  l     ��������  ��  ��    l     ��������  ��  ��   	
	 i  0 3 I      ������ &0 asscriptparameter asScriptParameter  o      ���� 0 thevalue theValue �� o      ���� 0 parametername parameterName��  ��   Q      L     c     o    ���� 0 thevalue theValue m    ��
�� 
scpt R      ����
�� .ascrerr ****      � ****��   ����
�� 
errn d       m      �������   I    ������ 60 throwinvalidparametertype throwInvalidParameterType  o    ���� 0 thevalue theValue  o    ���� 0 parametername parameterName   m    !! �""  s c r i p t  #��# m    ��
�� 
scpt��  ��  
 $%$ l     ��������  ��  ��  % &'& l     �������  ��  �  ' (�~( l     �}�|�{�}  �|  �{  �~       �z)*+,-./0123456�z  ) �y�x�w�v�u�t�s�r�q�p�o�n�m�y 60 throwinvalidparametertype throwInvalidParameterType�x 0 rethrowerror rethrowError�w &0 throwcommanderror throwCommandError�v $0 throwmethoderror throwMethodError�u (0 asbooleanparameter asBooleanParameter�t (0 asintegerparameter asIntegerParameter�s "0 asrealparameter asRealParameter�r &0 asnumberparameter asNumberParameter�q "0 astextparameter asTextParameter�p "0 asdateparameter asDateParameter�o "0 aslistparameter asListParameter�n &0 asrecordparameter asRecordParameter�m &0 asscriptparameter asScriptParameter* �l �k�j78�i�l 60 throwinvalidparametertype throwInvalidParameterType�k �h9�h 9  �g�f�e�d�g 0 thevalue theValue�f 0 parametername parameterName�e $0 expectedtypename expectedTypeName�d 0 expectedtype expectedType�j  7 �c�b�a�`�c 0 thevalue theValue�b 0 parametername parameterName�a $0 expectedtypename expectedTypeName�` 0 expectedtype expectedType8 �_ 4 < >�^�]�\�[�Z K M O
�_ 
leng
�^ 
errn�]�Y
�\ 
erob
�[ 
errt�Z �i )��,j  �E�Y 	�%�%E�O)������%�%�%�%+ �Y ]�X�W:;�V�Y 0 rethrowerror rethrowError�X �U<�U <  �T�S�R�Q�P�O�N�M�T 0 libraryname libraryName�S 0 handlername handlerName�R 0 etext eText�Q 0 enumber eNumber�P 0 efrom eFrom�O 
0 eto eTo�N $0 targetobjectname targetObjectName�M 0 partialresult partialResult�W  : �L�K�J�I�H�G�F�E�L 0 libraryname libraryName�K 0 handlername handlerName�J 0 etext eText�I 0 enumber eNumber�H 0 efrom eFrom�G 
0 eto eTo�F $0 targetobjectname targetObjectName�E 0 partialresult partialResult; 
 ~ ��D ��C�B�A�@�?�>
�D 
msng
�C 
errn
�B 
erob
�A 
errt�@ 
�? 
ptlr�> �V >��%�%�%�%E�O�� ��%�%E�Y hO��  )����Y )�����, �= ��<�;=>�:�= &0 throwcommanderror throwCommandError�< �9?�9 ?  �8�7�6�5�4�3�8 0 libraryname libraryName�7 0 handlername handlerName�6 0 etext eText�5 0 enumber eNumber�4 0 efrom eFrom�3 
0 eto eTo�;  = �2�1�0�/�.�-�2 0 libraryname libraryName�1 0 handlername handlerName�0 0 etext eText�/ 0 enumber eNumber�. 0 efrom eFrom�- 
0 eto eTo> �,�+�*
�, 
msng�+ �* 0 rethrowerror rethrowError�: )j*���������+ - �) ��(�'@A�&�) $0 throwmethoderror throwMethodError�( �%B�% B  �$�#�"�!� ���$ 0 libraryname libraryName�# $0 targetobjectname targetObjectName�" 0 handlername handlerName�! 0 etext eText�  0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�'  @ �������� 0 libraryname libraryName� $0 targetobjectname targetObjectName� 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToA ���
� 
msng� � 0 rethrowerror rethrowError�& )j*���������+ . ���CD�� (0 asbooleanparameter asBooleanParameter� �E� E  ��� 0 thevalue theValue� 0 parametername parameterName�  C ��� 0 thevalue theValue� 0 parametername parameterNameD �
�	F$��
�
 
bool�	  F ���
� 
errn��\�  � � 60 throwinvalidparametertype throwInvalidParameterType�  	��&W X  *�����+ / �.��GH� � (0 asintegerparameter asIntegerParameter� ��I�� I  ������ 0 thevalue theValue�� 0 parametername parameterName�  G ������ 0 thevalue theValue�� 0 parametername parameterNameH ����JC����
�� 
long��  J ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType�   	��&W X  *�����+ 0 ��M����KL���� "0 asrealparameter asRealParameter�� ��M�� M  ������ 0 thevalue theValue�� 0 parametername parameterName��  K ������ 0 thevalue theValue�� 0 parametername parameterNameL ����Nb����
�� 
doub��  N ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType��  	��&W X  *�����+ 1 ��l����OP���� &0 asnumberparameter asNumberParameter�� ��Q�� Q  ������ 0 thevalue theValue�� 0 parametername parameterName��  O ������ 0 thevalue theValue�� 0 parametername parameterNameP ����R�����
�� 
nmbr��  R ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType��  	��&W X  *�����+ 2 �������ST���� "0 astextparameter asTextParameter�� ��U�� U  ������ 0 thevalue theValue�� 0 parametername parameterName��  S ������ 0 thevalue theValue�� 0 parametername parameterNameT ����V�����
�� 
ctxt��  V ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType��  	��&W X  *�����+ 3 �������WX���� "0 asdateparameter asDateParameter�� ��Y�� Y  ������ 0 thevalue theValue�� 0 parametername parameterName��  W ������ 0 thevalue theValue�� 0 parametername parameterNameX ����Z�����
�� 
ldt ��  Z ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType��  	��&W X  *�����+ 4 �������[\���� "0 aslistparameter asListParameter�� ��]�� ]  ���� 0 thevalue theValue��  [ ���� 0 thevalue theValue\ ������
�� 
kocl
�� 
list
�� .corecnte****       ****�� �kv��l j �Y �kv5 �������^_���� &0 asrecordparameter asRecordParameter�� ��`�� `  ������ 0 thevalue theValue�� 0 parametername parameterName��  ^ ������ 0 thevalue theValue�� 0 parametername parameterName_ ����a����
�� 
reco��  a ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType��  	��&W X  *�����+ 6 ������bc���� &0 asscriptparameter asScriptParameter�� ��d�� d  ������ 0 thevalue theValue�� 0 parametername parameterName��  b ������ 0 thevalue theValue�� 0 parametername parameterNamec ����e!����
�� 
scpt��  e ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType��  	��&W X  *�����+ ascr  ��ޭ