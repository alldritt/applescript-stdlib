FasdUAS 1.101.10   ��   ��    k             l      ��  ��    Text -- commonly-used text processing commands

Notes: 

- When matching text item delimiters in text value, AppleScript uses the current scope's existing considering/ignoring case, diacriticals, hyphens, punctuation, white space and numeric strings settings; thus, wrapping a `search text` command in different considering/ignoring blocks can produce different results. For example, `search text "fud" for "F" will normally match the first character since AppleScript uses case-insensitive matching by default, whereas enclosing it in a `considering case` block will cause the same command to return zero matches. Conversely, `search text "f ud" for "fu"` will normally return zero matches as AppleScript considers white space by default, but when enclosed in an `ignoring white space` block will match the first three characters: "f u". This is how AppleScript is designed to work, but users need to be reminded of this as considering/ignoring blocks affect ALL script handlers called within that block, including nested calls (and all to any osax and application handlers that understand considering/ignoring attributes).

- Unlike AS text values, which preserve original Unicode normalization but ignore differences in form when comparing and counting, NSString and NSRegularExpression don't ignore normalization differences when comparing for equality. Therefore, handlers such as `search text`, `split text`, etc. that perform comparison operations on/using these Cocoa classes must normalize their input and pattern text first. (Be aware that this means that these commands may output text that uses different normalization form to input text; this shouldn't affect AppleScript itself, but might be a consideration when using that text elsewhere, e.g. in text files or scriptable apps.)

- Useful summary of NSString and Unicode: https://www.objc.io/issues/9-strings/unicode/


TO DO:

- decide if predefined considering/ignoring options in `search text`, etc. should consider or ignore diacriticals and numeric strings; once decided, use same combinations for List library's text comparator for consistency? (currently Text library's `case [in]sensitivity` options consider diacriticals for equality whereas List library ignores them for ordering)


- should `format text`'s `using` parameter also accept ASOC objects (ocid specifiers) that implement objectForKey:? (A. no: users should just use a script object as shim; similarly, a script object could be used to wrap a list or DictionaryObject if a default value should be inserted when a key isn't found)

- extended backreference syntax should really allow backslash-escaped �}� and �\� characters to appear within braces (currently these two characters are disallowed by _tokens pattern)

- fix inconsistency: `search text`'s `for` parameter doesn't allow list of text but `split text`'s `using` parameter does, even though both commands are supposed to support same matching options for consistency

- should line break normalization (in `normalize text` and `join paragraphs`) also recognize `Unicode line break`, `Unicode paragraph break` constants?

- need to decide exactly what constitutes a line break in `transform text`, and make sure both paragraph element and pattern based splitting are consistent (e.g. what about form feeds and Unicode line/paragraph breaks?)

- might be better if replacePattern passed list of text rather than list of records; indexes are of little practical use here and slow it down considerably (the rationale is that Python's re.sub(patt,func,str) passes match objects to func, allowing the function to use whatever info it likes, but it has the luxury of not being slow as molasses)


- 10.11 provides NSString method:

	-(nullable NSString)stringByApplyingTransform:(NSString)transform reverse:(BOOL)reverse;

with following transforms (though note that any ICU transform name(s) can be used, concatenated as semicolon-delimited text):

NSStringTransformLatinToKatakana
NSStringTransformLatinToHiragana
NSStringTransformLatinToHangul
NSStringTransformLatinToArabic
NSStringTransformLatinToHebrew
NSStringTransformLatinToThai
NSStringTransformLatinToCyrillic
NSStringTransformLatinToGreek
NSStringTransformToLatin
NSStringTransformMandarinToLatin
NSStringTransformHiraganaToKatakana
NSStringTransformFullwidthToHalfwidth
NSStringTransformToXMLHex
NSStringTransformToUnicodeName
NSStringTransformStripCombiningMarks
NSStringTransformStripDiacritics

- e.g. could add `smart punctuation` and `ASCII punctuation` options to `transform text`

- use `standardized case`, etc rather than `normalized case` in `transform text`? 

     � 	 	$$   T e x t   - -   c o m m o n l y - u s e d   t e x t   p r o c e s s i n g   c o m m a n d s 
 
 N o t e s :   
 
 -   W h e n   m a t c h i n g   t e x t   i t e m   d e l i m i t e r s   i n   t e x t   v a l u e ,   A p p l e S c r i p t   u s e s   t h e   c u r r e n t   s c o p e ' s   e x i s t i n g   c o n s i d e r i n g / i g n o r i n g   c a s e ,   d i a c r i t i c a l s ,   h y p h e n s ,   p u n c t u a t i o n ,   w h i t e   s p a c e   a n d   n u m e r i c   s t r i n g s   s e t t i n g s ;   t h u s ,   w r a p p i n g   a   ` s e a r c h   t e x t `   c o m m a n d   i n   d i f f e r e n t   c o n s i d e r i n g / i g n o r i n g   b l o c k s   c a n   p r o d u c e   d i f f e r e n t   r e s u l t s .   F o r   e x a m p l e ,   ` s e a r c h   t e x t   " f u d "   f o r   " F "   w i l l   n o r m a l l y   m a t c h   t h e   f i r s t   c h a r a c t e r   s i n c e   A p p l e S c r i p t   u s e s   c a s e - i n s e n s i t i v e   m a t c h i n g   b y   d e f a u l t ,   w h e r e a s   e n c l o s i n g   i t   i n   a   ` c o n s i d e r i n g   c a s e `   b l o c k   w i l l   c a u s e   t h e   s a m e   c o m m a n d   t o   r e t u r n   z e r o   m a t c h e s .   C o n v e r s e l y ,   ` s e a r c h   t e x t   " f   u d "   f o r   " f u " `   w i l l   n o r m a l l y   r e t u r n   z e r o   m a t c h e s   a s   A p p l e S c r i p t   c o n s i d e r s   w h i t e   s p a c e   b y   d e f a u l t ,   b u t   w h e n   e n c l o s e d   i n   a n   ` i g n o r i n g   w h i t e   s p a c e `   b l o c k   w i l l   m a t c h   t h e   f i r s t   t h r e e   c h a r a c t e r s :   " f   u " .   T h i s   i s   h o w   A p p l e S c r i p t   i s   d e s i g n e d   t o   w o r k ,   b u t   u s e r s   n e e d   t o   b e   r e m i n d e d   o f   t h i s   a s   c o n s i d e r i n g / i g n o r i n g   b l o c k s   a f f e c t   A L L   s c r i p t   h a n d l e r s   c a l l e d   w i t h i n   t h a t   b l o c k ,   i n c l u d i n g   n e s t e d   c a l l s   ( a n d   a l l   t o   a n y   o s a x   a n d   a p p l i c a t i o n   h a n d l e r s   t h a t   u n d e r s t a n d   c o n s i d e r i n g / i g n o r i n g   a t t r i b u t e s ) . 
 
 -   U n l i k e   A S   t e x t   v a l u e s ,   w h i c h   p r e s e r v e   o r i g i n a l   U n i c o d e   n o r m a l i z a t i o n   b u t   i g n o r e   d i f f e r e n c e s   i n   f o r m   w h e n   c o m p a r i n g   a n d   c o u n t i n g ,   N S S t r i n g   a n d   N S R e g u l a r E x p r e s s i o n   d o n ' t   i g n o r e   n o r m a l i z a t i o n   d i f f e r e n c e s   w h e n   c o m p a r i n g   f o r   e q u a l i t y .   T h e r e f o r e ,   h a n d l e r s   s u c h   a s   ` s e a r c h   t e x t ` ,   ` s p l i t   t e x t ` ,   e t c .   t h a t   p e r f o r m   c o m p a r i s o n   o p e r a t i o n s   o n / u s i n g   t h e s e   C o c o a   c l a s s e s   m u s t   n o r m a l i z e   t h e i r   i n p u t   a n d   p a t t e r n   t e x t   f i r s t .   ( B e   a w a r e   t h a t   t h i s   m e a n s   t h a t   t h e s e   c o m m a n d s   m a y   o u t p u t   t e x t   t h a t   u s e s   d i f f e r e n t   n o r m a l i z a t i o n   f o r m   t o   i n p u t   t e x t ;   t h i s   s h o u l d n ' t   a f f e c t   A p p l e S c r i p t   i t s e l f ,   b u t   m i g h t   b e   a   c o n s i d e r a t i o n   w h e n   u s i n g   t h a t   t e x t   e l s e w h e r e ,   e . g .   i n   t e x t   f i l e s   o r   s c r i p t a b l e   a p p s . ) 
 
 -   U s e f u l   s u m m a r y   o f   N S S t r i n g   a n d   U n i c o d e :   h t t p s : / / w w w . o b j c . i o / i s s u e s / 9 - s t r i n g s / u n i c o d e / 
 
 
 T O   D O : 
 
 -   d e c i d e   i f   p r e d e f i n e d   c o n s i d e r i n g / i g n o r i n g   o p t i o n s   i n   ` s e a r c h   t e x t ` ,   e t c .   s h o u l d   c o n s i d e r   o r   i g n o r e   d i a c r i t i c a l s   a n d   n u m e r i c   s t r i n g s ;   o n c e   d e c i d e d ,   u s e   s a m e   c o m b i n a t i o n s   f o r   L i s t   l i b r a r y ' s   t e x t   c o m p a r a t o r   f o r   c o n s i s t e n c y ?   ( c u r r e n t l y   T e x t   l i b r a r y ' s   ` c a s e   [ i n ] s e n s i t i v i t y `   o p t i o n s   c o n s i d e r   d i a c r i t i c a l s   f o r   e q u a l i t y   w h e r e a s   L i s t   l i b r a r y   i g n o r e s   t h e m   f o r   o r d e r i n g ) 
 
 
 -   s h o u l d   ` f o r m a t   t e x t ` ' s   ` u s i n g `   p a r a m e t e r   a l s o   a c c e p t   A S O C   o b j e c t s   ( o c i d   s p e c i f i e r s )   t h a t   i m p l e m e n t   o b j e c t F o r K e y : ?   ( A .   n o :   u s e r s   s h o u l d   j u s t   u s e   a   s c r i p t   o b j e c t   a s   s h i m ;   s i m i l a r l y ,   a   s c r i p t   o b j e c t   c o u l d   b e   u s e d   t o   w r a p   a   l i s t   o r   D i c t i o n a r y O b j e c t   i f   a   d e f a u l t   v a l u e   s h o u l d   b e   i n s e r t e d   w h e n   a   k e y   i s n ' t   f o u n d ) 
 
 -   e x t e n d e d   b a c k r e f e r e n c e   s y n t a x   s h o u l d   r e a l l y   a l l o w   b a c k s l a s h - e s c a p e d    }    a n d    \    c h a r a c t e r s   t o   a p p e a r   w i t h i n   b r a c e s   ( c u r r e n t l y   t h e s e   t w o   c h a r a c t e r s   a r e   d i s a l l o w e d   b y   _ t o k e n s   p a t t e r n ) 
 
 -   f i x   i n c o n s i s t e n c y :   ` s e a r c h   t e x t ` ' s   ` f o r `   p a r a m e t e r   d o e s n ' t   a l l o w   l i s t   o f   t e x t   b u t   ` s p l i t   t e x t ` ' s   ` u s i n g `   p a r a m e t e r   d o e s ,   e v e n   t h o u g h   b o t h   c o m m a n d s   a r e   s u p p o s e d   t o   s u p p o r t   s a m e   m a t c h i n g   o p t i o n s   f o r   c o n s i s t e n c y 
 
 -   s h o u l d   l i n e   b r e a k   n o r m a l i z a t i o n   ( i n   ` n o r m a l i z e   t e x t `   a n d   ` j o i n   p a r a g r a p h s ` )   a l s o   r e c o g n i z e   ` U n i c o d e   l i n e   b r e a k ` ,   ` U n i c o d e   p a r a g r a p h   b r e a k `   c o n s t a n t s ? 
 
 -   n e e d   t o   d e c i d e   e x a c t l y   w h a t   c o n s t i t u t e s   a   l i n e   b r e a k   i n   ` t r a n s f o r m   t e x t ` ,   a n d   m a k e   s u r e   b o t h   p a r a g r a p h   e l e m e n t   a n d   p a t t e r n   b a s e d   s p l i t t i n g   a r e   c o n s i s t e n t   ( e . g .   w h a t   a b o u t   f o r m   f e e d s   a n d   U n i c o d e   l i n e / p a r a g r a p h   b r e a k s ? ) 
 
 -   m i g h t   b e   b e t t e r   i f   r e p l a c e P a t t e r n   p a s s e d   l i s t   o f   t e x t   r a t h e r   t h a n   l i s t   o f   r e c o r d s ;   i n d e x e s   a r e   o f   l i t t l e   p r a c t i c a l   u s e   h e r e   a n d   s l o w   i t   d o w n   c o n s i d e r a b l y   ( t h e   r a t i o n a l e   i s   t h a t   P y t h o n ' s   r e . s u b ( p a t t , f u n c , s t r )   p a s s e s   m a t c h   o b j e c t s   t o   f u n c ,   a l l o w i n g   t h e   f u n c t i o n   t o   u s e   w h a t e v e r   i n f o   i t   l i k e s ,   b u t   i t   h a s   t h e   l u x u r y   o f   n o t   b e i n g   s l o w   a s   m o l a s s e s ) 
 
 
 -   1 0 . 1 1   p r o v i d e s   N S S t r i n g   m e t h o d : 
 
 	 - ( n u l l a b l e   N S S t r i n g ) s t r i n g B y A p p l y i n g T r a n s f o r m : ( N S S t r i n g ) t r a n s f o r m   r e v e r s e : ( B O O L ) r e v e r s e ; 
 
 w i t h   f o l l o w i n g   t r a n s f o r m s   ( t h o u g h   n o t e   t h a t   a n y   I C U   t r a n s f o r m   n a m e ( s )   c a n   b e   u s e d ,   c o n c a t e n a t e d   a s   s e m i c o l o n - d e l i m i t e d   t e x t ) : 
 
 N S S t r i n g T r a n s f o r m L a t i n T o K a t a k a n a 
 N S S t r i n g T r a n s f o r m L a t i n T o H i r a g a n a 
 N S S t r i n g T r a n s f o r m L a t i n T o H a n g u l 
 N S S t r i n g T r a n s f o r m L a t i n T o A r a b i c 
 N S S t r i n g T r a n s f o r m L a t i n T o H e b r e w 
 N S S t r i n g T r a n s f o r m L a t i n T o T h a i 
 N S S t r i n g T r a n s f o r m L a t i n T o C y r i l l i c 
 N S S t r i n g T r a n s f o r m L a t i n T o G r e e k 
 N S S t r i n g T r a n s f o r m T o L a t i n 
 N S S t r i n g T r a n s f o r m M a n d a r i n T o L a t i n 
 N S S t r i n g T r a n s f o r m H i r a g a n a T o K a t a k a n a 
 N S S t r i n g T r a n s f o r m F u l l w i d t h T o H a l f w i d t h 
 N S S t r i n g T r a n s f o r m T o X M L H e x 
 N S S t r i n g T r a n s f o r m T o U n i c o d e N a m e 
 N S S t r i n g T r a n s f o r m S t r i p C o m b i n i n g M a r k s 
 N S S t r i n g T r a n s f o r m S t r i p D i a c r i t i c s 
 
 -   e . g .   c o u l d   a d d   ` s m a r t   p u n c t u a t i o n `   a n d   ` A S C I I   p u n c t u a t i o n `   o p t i o n s   t o   ` t r a n s f o r m   t e x t ` 
 
 -   u s e   ` s t a n d a r d i z e d   c a s e ` ,   e t c   r a t h e r   t h a n   ` n o r m a l i z e d   c a s e `   i n   ` t r a n s f o r m   t e x t ` ?   
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      record types     �        r e c o r d   t y p e s   ! " ! l     ��������  ��  ��   "  # $ # j    �� %�� (0 _unmatchedtexttype _UnmatchedTextType % m    ��
�� 
TxtU $  & ' & j    �� (�� $0 _matchedtexttype _MatchedTextType ( m    ��
�� 
TxtM '  ) * ) j    �� +�� &0 _matchedgrouptype _MatchedGroupType + m    ��
�� 
TxtG *  , - , l     ��������  ��  ��   -  . / . l     ��������  ��  ��   /  0 1 0 l     �� 2 3��   2 J D--------------------------------------------------------------------    3 � 4 4 � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 1  5 6 5 l     �� 7 8��   7   support    8 � 9 9    s u p p o r t 6  : ; : l     ��������  ��  ��   ;  < = < l      > ? @ > j     &�� A�� 0 _support   A N     % B B 4     $�� C
�� 
scpt C m   " # D D � E E  T y p e S u p p o r t ? "  used for parameter checking    @ � F F 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g =  G H G l     ��������  ��  ��   H  I J I l     ��������  ��  ��   J  K L K i  ' * M N M I      �� O���� 
0 _error   O  P Q P o      ���� 0 handlername handlerName Q  R S R o      ���� 0 etext eText S  T U T o      ���� 0 enumber eNumber U  V W V o      ���� 0 efrom eFrom W  X�� X o      ���� 
0 eto eTo��  ��   N n     Y Z Y I    �� [���� &0 throwcommanderror throwCommandError [  \ ] \ m     ^ ^ � _ _  T e x t ]  ` a ` o    ���� 0 handlername handlerName a  b c b o    ���� 0 etext eText c  d e d o    	���� 0 enumber eNumber e  f g f o   	 
���� 0 efrom eFrom g  h�� h o   
 ���� 
0 eto eTo��  ��   Z o     ���� 0 _support   L  i j i l     ��������  ��  ��   j  k l k l     ��������  ��  ��   l  m n m l     �� o p��   o J D--------------------------------------------------------------------    p � q q � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - n  r s r l     ��������  ��  ��   s  t u t i  + . v w v I      �� x���� B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter x  y z y o      ���� 0 patterntext patternText z  {�� { o      ���� 0 parametername parameterName��  ��   w l     | } ~ | L        n     � � � I    �� ����� @0 asnsregularexpressionparameter asNSRegularExpressionParameter �  � � � o    ���� 0 patterntext patternText �  � � � l 	   ����� � l    ����� � [     � � � [     � � � [     � � � l   
 ����� � e    
 � � n   
 � � � o    	���� H0 "nsregularexpressioncaseinsensitive "NSRegularExpressionCaseInsensitive � m    ��
�� misccura��  ��   � l 	 
  ����� � l  
  ����� � e   
  � � n  
  � � � o    ���� L0 $nsregularexpressionanchorsmatchlines $NSRegularExpressionAnchorsMatchLines � m   
 ��
�� misccura��  ��  ��  ��   � l 	   ����� � l    ����� � e     � � n    � � � o    ���� Z0 +nsregularexpressiondotmatcheslineseparators +NSRegularExpressionDotMatchesLineSeparators � m    ��
�� misccura��  ��  ��  ��   � l 	   ����� � l    ����� � e     � � n    � � � o    ���� Z0 +nsregularexpressionuseunicodewordboundaries +NSRegularExpressionUseUnicodeWordBoundaries � m    ��
�� misccura��  ��  ��  ��  ��  ��  ��  ��   �  ��� � o    ���� 0 parametername parameterName��  ��   � o     ���� 0 _support   } H B returns a regexp object with `(?imsw)` options enabled by default    ~ � � � �   r e t u r n s   a   r e g e x p   o b j e c t   w i t h   ` ( ? i m s w ) `   o p t i o n s   e n a b l e d   b y   d e f a u l t u  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l      � � � � j   / 1�� ��� 0 _tokens   � m   / 0 � � � � �" 
 \ \ 	 	 	 	 	 	 	 	 #   m a t c h   a   b a c k s l a s h   e s c a p e ,   f o l l o w e d   b y   o n e   o f : 
           ( ? : ( n | r | t | \ \ ) 	 	 	 #   n e w l i n e ,   r e t u r n ,   t a b   o r   b a c k s l a s h   c h a r a c t e r 
       |   (   [ 0 - 9 ]   ) 	 	 	 	 	 #   b a c k s l a s h   +   s i n g l e   d i g i t   ( i n s e r t i o n   i n d e x ) 
       |   \ {   ( [ ^ } { \ \ ] * )   \ } 	 	 #   b a c k s l a s h   +   a n y   t e x t   i n   b r a c e s   ( i n s e r t i o n   i n d e x   o r   n a m e ) 
 ) � � � note: \N{...}, \u1234, and \U00123456 escape sequences are processed separately (via ICU transforms); any other backslash sequences are unrecognized and left unchanged    � � � �P   n o t e :   \ N { . . . } ,   \ u 1 2 3 4 ,   a n d   \ U 0 0 1 2 3 4 5 6   e s c a p e   s e q u e n c e s   a r e   p r o c e s s e d   s e p a r a t e l y   ( v i a   I C U   t r a n s f o r m s ) ;   a n y   o t h e r   b a c k s l a s h   s e q u e n c e s   a r e   u n r e c o g n i z e d   a n d   l e f t   u n c h a n g e d �  � � � l     ��������  ��  ��   �  � � � i  2 5 � � � I      �� ����� (0 _parsetemplatetext _parseTemplateText �  ��� � o      ���� 0 templatetext templateText��  ��   � l   c � � � � k    c � �  � � � r     
 � � � n     � � � I    �� ����� &0 stringwithstring_ stringWithString_ �  ��� � o    �� 0 templatetext templateText��  ��   � n     � � � o    �~�~ 0 nsstring NSString � m     �}
�} misccura � o      �|�| 0 
asocstring 
asocString �  � � � r     � � � n    � � � I    �{ ��z�{ Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_ �  � � � l 
   ��y�x � o    �w�w 0 _tokens  �y  �x   �  � � � l    ��v�u � e     � � n    � � � o    �t�t ^0 -nsregularexpressionallowcommentsandwhitespace -NSRegularExpressionAllowCommentsAndWhitespace � m    �s
�s misccura�v  �u   �  ��r � l    ��q�p � m    �o
�o 
msng�q  �p  �r  �z   � n    � � � o    �n�n *0 nsregularexpression NSRegularExpression � m    �m
�m misccura � o      �l�l 0 asocpattern asocPattern �  � � � r    " � � � m     �k�k   � o      �j�j &0 asocnonmatchstart asocNonMatchStart �  � � � r   # ' � � � J   # %�i�i   � o      �h�h 0 
resultlist 
resultList �  � � � r   ( 9 � � � n  ( 7 � � � I   ) 7�g ��f�g @0 matchesinstring_options_range_ matchesInString_options_range_ �  � � � o   ) *�e�e 0 
asocstring 
asocString �  � � � m   * +�d�d   �  ��c � J   + 3 � �  � � � m   + ,�b�b   �  ��a � n  , 1 � � � I   - 1�`�_�^�` 
0 length  �_  �^   � o   , -�]�] 0 
asocstring 
asocString�a  �c  �f   � o   ( )�\�\ 0 asocpattern asocPattern � o      �[�[  0 asocmatcharray asocMatchArray �  � � � r   : = � � � m   : ;�Z
�Z boovfals � o      �Y�Y 0 
concatnext 
concatNext �  � � � Y   >0 ��X � ��W � k   N+    r   N V l  N T�V�U n  N T I   O T�T�S�T  0 objectatindex_ objectAtIndex_ 	�R	 o   O P�Q�Q 0 i  �R  �S   o   N O�P�P  0 asocmatcharray asocMatchArray�V  �U   o      �O�O 0 	asocmatch 	asocMatch 

 r   W _ l  W ]�N�M n  W ] I   X ]�L�K�L 0 rangeatindex_ rangeAtIndex_ �J m   X Y�I�I  �J  �K   o   W X�H�H 0 	asocmatch 	asocMatch�N  �M   o      �G�G  0 asocmatchrange asocMatchRange  l  ` `�F�F   T N get text before match, convert entities to characters, and add to result list    � �   g e t   t e x t   b e f o r e   m a t c h ,   c o n v e r t   e n t i t i e s   t o   c h a r a c t e r s ,   a n d   a d d   t o   r e s u l t   l i s t  r   ` g n  ` e I   a e�E�D�C�E 0 location  �D  �C   o   ` a�B�B  0 asocmatchrange asocMatchRange o      �A�A  0 asocmatchstart asocMatchStart  l  h  !"  r   h #$# c   h }%&% l  h y'�@�?' n  h y()( I   s y�>*�=�> H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_* +,+ l  s t-�<�;- m   s t.. �// $ H e x - A n y / C ; N a m e - A n y�<  �;  , 0�:0 m   t u�9
�9 boovfals�:  �=  ) l  h s1�8�71 n  h s232 I   i s�64�5�6 *0 substringwithrange_ substringWithRange_4 5�45 J   i o66 787 o   i j�3�3 &0 asocnonmatchstart asocNonMatchStart8 9�29 l  j m:�1�0: \   j m;<; o   j k�/�/  0 asocmatchstart asocMatchStart< o   k l�.�. &0 asocnonmatchstart asocNonMatchStart�1  �0  �2  �4  �5  3 o   h i�-�- 0 
asocstring 
asocString�8  �7  �@  �?  & m   y |�,
�, 
ctxt$ o      �+�+ 0 nonmatchtext nonMatchText! O I convert \u1234, \U00123456, \N{CHARNAME} escapes to specified characters   " �== �   c o n v e r t   \ u 1 2 3 4 ,   \ U 0 0 1 2 3 4 5 6 ,   \ N { C H A R N A M E }   e s c a p e s   t o   s p e c i f i e d   c h a r a c t e r s >?> Z   � �@A�*B@ o   � ��)�) 0 
concatnext 
concatNextA l  � �CDEC k   � �FF GHG r   � �IJI b   � �KLK n   � �MNM 4  � ��(O
�( 
cobjO m   � ��'�'��N o   � ��&�& 0 
resultlist 
resultListL o   � ��%�% 0 nonmatchtext nonMatchTextJ n      PQP 4  � ��$R
�$ 
cobjR m   � ��#�#��Q o   � ��"�" 0 
resultlist 
resultListH S�!S r   � �TUT m   � �� 
�  boovfalsU o      �� 0 
concatnext 
concatNext�!  D 8 2 only item indexes/names should be at even indexes   E �VV d   o n l y   i t e m   i n d e x e s / n a m e s   s h o u l d   b e   a t   e v e n   i n d e x e s�*  B r   � �WXW o   � ��� 0 nonmatchtext nonMatchTextX n      YZY  ;   � �Z o   � ��� 0 
resultlist 
resultList? [\[ r   � �]^] [   � �_`_ o   � ���  0 asocmatchstart asocMatchStart` l  � �a��a n  � �bcb I   � ����� 
0 length  �  �  c o   � ���  0 asocmatchrange asocMatchRange�  �  ^ o      �� &0 asocnonmatchstart asocNonMatchStart\ ded l  � ��fg�  f L F get the matched text (escaped linefeed, etc. or insertion index/name)   g �hh �   g e t   t h e   m a t c h e d   t e x t   ( e s c a p e d   l i n e f e e d ,   e t c .   o r   i n s e r t i o n   i n d e x / n a m e )e i�i Y   �+j�kl�j l  �&mnom k   �&pp qrq r   � �sts l  � �u��u n  � �vwv I   � ��x�� 0 rangeatindex_ rangeAtIndex_x y�y o   � ��� 0 j  �  �  w o   � ��
�
 0 	asocmatch 	asocMatch�  �  t o      �	�	  0 asocgrouprange asocGroupRanger z�z Z   �&{|��{ ?   � �}~} n  � �� I   � ����� 
0 length  �  �  � o   � ���  0 asocgrouprange asocGroupRange~ m   � ���  | k   �"�� ��� r   � ���� l  � ��� ��� n  � ���� I   � �������� *0 substringwithrange_ substringWithRange_� ���� o   � �����  0 asocgrouprange asocGroupRange��  ��  � o   � ����� 0 
asocstring 
asocString�   ��  � o      ���� "0 asocmatchstring asocMatchString� ��� r   � ���� c   � ���� o   � ����� "0 asocmatchstring asocMatchString� m   � ���
�� 
ctxt� o      ���� 0 itemtext itemText� ��� Z   � ������ =   � ���� o   � ����� 0 j  � m   � ����� � k   ��� ��� r   ���� b   ���� n   � ���� 4  � ����
�� 
cobj� m   � �������� o   � ����� 0 
resultlist 
resultList� l  ������� n   ���� 4   ����
�� 
cobj� l  ������� I  ������ z����
�� .sysooffslong    ��� null
�� misccura��  � ����
�� 
psof� o   � ����� 0 itemtext itemText� �����
�� 
psin� m  �� ���  n r t \��  ��  ��  � J   � ��� ��� 1   � ���
�� 
lnfd� ��� o   � ���
�� 
ret � ��� 1   � ���
�� 
tab � ���� m   � ��� ���  \��  ��  ��  � n      ��� 4 ���
�� 
cobj� m  ������� o  ���� 0 
resultlist 
resultList� ���� r  ��� m  ��
�� boovtrue� o      ���� 0 
concatnext 
concatNext��  ��  � r   ��� o  ���� 0 itemtext itemText� n      ���  ;  � o  ���� 0 
resultlist 
resultList� ����  S  !"��  �  �  �  n G A _tokens defines 3 groups (index 0 is full match, so ignore that)   o ��� �   _ t o k e n s   d e f i n e s   3   g r o u p s   ( i n d e x   0   i s   f u l l   m a t c h ,   s o   i g n o r e   t h a t )� 0 j  k m   � ����� l m   � ����� �  �  �X 0 i   � m   A B����   � \   B I��� l  B G������ n  B G��� I   C G�������� 	0 count  ��  ��  � o   B C����  0 asocmatcharray asocMatchArray��  ��  � m   G H���� �W   � ��� l 1E���� r  1E��� c  1C��� l 1?������ n 1?��� I  7?������� H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_� ��� l 7:������ m  7:�� ��� $ H e x - A n y / C ; N a m e - A n y��  ��  � ���� m  :;��
�� boovfals��  ��  � l 17������ n 17��� I  27������� *0 substringfromindex_ substringFromIndex_� ���� o  23���� &0 asocnonmatchstart asocNonMatchStart��  ��  � o  12���� 0 
asocstring 
asocString��  ��  ��  ��  � m  ?B��
�� 
ctxt� o      ���� 0 itemtext itemText� ( " trailing text; convert and append   � ��� D   t r a i l i n g   t e x t ;   c o n v e r t   a n d   a p p e n d� ��� Z  F`������ o  FG���� 0 
concatnext 
concatNext� r  JY��� b  JR��� n  JP��� 4 KP���
�� 
cobj� m  NO������� o  JK���� 0 
resultlist 
resultList� o  PQ���� 0 itemtext itemText� n      ��� 4 SX���
�� 
cobj� m  VW������� o  RS���� 0 
resultlist 
resultList��  � r  \`��� o  \]���� 0 itemtext itemText� n      ���  ;  ^_� o  ]^���� 0 
resultlist 
resultList� ���� L  ac�� o  ab���� 0 
resultlist 
resultList��   � convert template text containing backslashed special characters (\t, \u1234, \3, etc.) to a list of text items of form {text, index or name, ..., text}, where every 2nd item is an unprocessed back reference; used by the _parseSearchTemplate and _parseFormatTemplate handlers    � ���&   c o n v e r t   t e m p l a t e   t e x t   c o n t a i n i n g   b a c k s l a s h e d   s p e c i a l   c h a r a c t e r s   ( \ t ,   \ u 1 2 3 4 ,   \ 3 ,   e t c . )   t o   a   l i s t   o f   t e x t   i t e m s   o f   f o r m   { t e x t ,   i n d e x   o r   n a m e ,   . . . ,   t e x t } ,   w h e r e   e v e r y   2 n d   i t e m   i s   a n   u n p r o c e s s e d   b a c k   r e f e r e n c e ;   u s e d   b y   t h e   _ p a r s e S e a r c h T e m p l a t e   a n d   _ p a r s e F o r m a t T e m p l a t e   h a n d l e r s � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� � � l     ����   B < parse template text used in `search text` and `format text`    � x   p a r s e   t e m p l a t e   t e x t   u s e d   i n   ` s e a r c h   t e x t `   a n d   ` f o r m a t   t e x t `   l     ����   F @ (note: last parsed template is cached for more efficient reuse)    � �   ( n o t e :   l a s t   p a r s e d   t e m p l a t e   i s   c a c h e d   f o r   m o r e   e f f i c i e n t   r e u s e ) 	
	 l     ��������  ��  ��  
  j   6 :���� :0 _previoussearchtemplatetext _previousSearchTemplateText m   6 9 �    j   ; ?���� F0 !_previoussearchtemplateparsedtext !_previousSearchTemplateParsedText m   ; > �    l     ��������  ��  ��    i  @ C I      ������ ,0 _parsesearchtemplate _parseSearchTemplate �� o      ���� 0 templatetext templateText��  ��   P     � k    �   !"! Z    �#$����# >   %&% o    ���� 0 templatetext templateText& o    ���� :0 _previoussearchtemplatetext _previousSearchTemplateText$ k    �'' ()( r    *+* I    ��,���� (0 _parsetemplatetext _parseTemplateText, -��- o    ���� 0 templatetext templateText��  ��  + o      ���� 0 templateitems templateItems) ./. Y    �0��12��0 k   % �33 454 r   % +676 n   % )898 4   & )��:
�� 
cobj: o   ' (���� 0 i  9 o   % &���� 0 templateitems templateItems7 o      ���� 0 itemtext itemText5 ;��; Z   , �<=��>< =   , 1?@? `   , /ABA o   , -���� 0 i  B m   - .���� @ m   / 0����  = l  4 hCDEC k   4 hFF GHG r   4 ;IJI b   4 9KLK m   4 5MM �NN  $L l  5 8O����O c   5 8PQP o   5 6���� 0 itemtext itemTextQ m   6 7��
�� 
long��  ��  J o      ���� 0 itemtext itemTextH RSR r   < DTUT n   < BVWV 4   = B��X
�� 
cobjX l  > AY����Y [   > AZ[Z o   > ?���� 0 i  [ m   ? @�� ��  ��  W o   < =�~�~ 0 templateitems templateItemsU o      �}�} 0 nextitem nextItemS \]\ l  E a^_`^ Z  E aab�|�{a F   E Ucdc ?   E Jefe n  E Hghg 1   F H�z
�z 
lengh o   E F�y�y 0 nextitem nextItemf m   H I�x�x  d E  M Siji m   M Nkk �ll  1 2 3 4 5 6 7 8 9 0j n  N Rmnm 4   O R�wo
�w 
cha o m   P Q�v�v n o   N O�u�u 0 nextitem nextItemb r   X ]pqp b   X [rsr o   X Y�t�t 0 itemtext itemTexts m   Y Ztt �uu  \q o      �s�s 0 itemtext itemText�|  �{  _ 8 2 make sure ICT template doesn't consume next digit   ` �vv d   m a k e   s u r e   I C T   t e m p l a t e   d o e s n ' t   c o n s u m e   n e x t   d i g i t] w�rw r   b hxyx o   b c�q�q 0 itemtext itemTexty n      z{z 4   d g�p|
�p 
cobj| o   e f�o�o 0 i  { o   c d�n�n 0 templateitems templateItems�r  D #  substitute integer N with $N   E �}} :   s u b s t i t u t e   i n t e g e r   N   w i t h   $ N��  > l  k �~�~ k   k ��� ��� r   k w��� n  k u��� I   p u�m��l�m 0 
asnsstring 
asNSString� ��k� o   p q�j�j 0 itemtext itemText�k  �l  � o   k p�i�i 0 _support  � o      �h�h 0 
asocstring 
asocString� ��g� r   x ���� c   x ���� l  x ���f�e� n  x ���� I   y ��d��c�d �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_� ��� m   y z�� ���  ( [ \ $ ] )� ��� m   z {�� ���  \ \ $ 1� ��� l  { ~��b�a� n  { ~��� o   | ~�`�` 60 nsregularexpressionsearch NSRegularExpressionSearch� m   { |�_
�_ misccura�b  �a  � ��^� J   ~ ��� ��� m   ~ �]�]  � ��\� n   ���� I   � ��[�Z�Y�[ 
0 length  �Z  �Y  � o    ��X�X 0 
asocstring 
asocString�\  �^  �c  � o   x y�W�W 0 
asocstring 
asocString�f  �e  � m   � ��V
�V 
ctxt� n      ��� 4   � ��U�
�U 
cobj� o   � ��T�T 0 i  � o   � ��S�S 0 templateitems templateItems�g     re-escape '/' and '$'   � ��� ,   r e - e s c a p e   ' / '   a n d   ' $ '��  �� 0 i  1 m    �R�R 2 n    ��� 1    �Q
�Q 
leng� o    �P�P 0 templateitems templateItems��  / ��� r   � ���� I   � ��O��N�O 0 	_jointext 	_joinText� ��� o   � ��M�M 0 templateitems templateItems� ��L� m   � ��� ���  �L  �N  � o      �K�K F0 !_previoussearchtemplateparsedtext !_previousSearchTemplateParsedText� ��J� r   � ���� o   � ��I�I 0 templatetext templateText� o      �H�H :0 _previoussearchtemplatetext _previousSearchTemplateText�J  ��  ��  " ��G� L   � ��� o   � ��F�F F0 !_previoussearchtemplateparsedtext !_previousSearchTemplateParsedText�G   �E�
�E conscase� �D�
�D consdiac� �C�
�C conshyph� �B�
�B conspunc� �A�@
�A conswhit�@   �?�>
�? consnume�>   ��� l     �=�<�;�=  �<  �;  � ��� l     �:�9�8�:  �9  �8  � ��� j   D H�7��7 :0 _previousformattemplatetext _previousFormatTemplateText� m   D G�� ���  � ��� l     ���� j   I M�6��6 H0 "_previousformattemplateparseditems "_previousFormatTemplateParsedItems� m   I L�� ���  � 4 . list of form {text, index or name, ..., text}   � ��� \   l i s t   o f   f o r m   { t e x t ,   i n d e x   o r   n a m e ,   . . . ,   t e x t }� ��� l     �5�4�3�5  �4  �3  � ��� i  N Q��� I      �2��1�2 ,0 _parseformattemplate _parseFormatTemplate� ��0� o      �/�/ 0 templatetext templateText�0  �1  � P     /���� k    .�� ��� Z    '���.�-� >   ��� o    �,�, 0 templatetext templateText� o    �+�+ :0 _previousformattemplatetext _previousFormatTemplateText� k    #�� ��� r    ��� I    �*��)�* (0 _parsetemplatetext _parseTemplateText� ��(� o    �'�' 0 templatetext templateText�(  �)  � o      �&�& H0 "_previousformattemplateparseditems "_previousFormatTemplateParsedItems� ��%� r    #��� o    �$�$ 0 templatetext templateText� o      �#�# :0 _previousformattemplatetext _previousFormatTemplateText�%  �.  �-  � ��"� L   ( .�� o   ( -�!�! H0 "_previousformattemplateparseditems "_previousFormatTemplateParsedItems�"  � � �
�  conscase� ��
� consdiac� ��
� conshyph� ��
� conspunc� ��
� conswhit�  � ��
� consnume�  � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ����  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �� �  �   Find and Replace Suite     � .   F i n d   a n d   R e p l a c e   S u i t e�  l     ����  �  �    l     ��     find pattern    �    f i n d   p a t t e r n 	
	 l     ���
�  �  �
  
  i  R U I      �	��	 $0 _matchinforecord _matchInfoRecord  o      �� 0 
asocstring 
asocString  o      ��  0 asocmatchrange asocMatchRange  o      �� 0 
textoffset 
textOffset � o      �� 0 
recordtype 
recordType�  �   k     #  r     
 c      l    �� n      I    � !���  *0 substringwithrange_ substringWithRange_! "��" o    ����  0 asocmatchrange asocMatchRange��  ��    o     ���� 0 
asocstring 
asocString�  �   m    ��
�� 
ctxt o      ���� 0 	foundtext 	foundText #$# l   %&'% r    ()( [    *+* o    ���� 0 
textoffset 
textOffset+ l   ,����, n    -.- 1    ��
�� 
leng. o    ���� 0 	foundtext 	foundText��  ��  ) o      ����  0 nexttextoffset nextTextOffset& : 4 calculate the start index of the next AS text range   ' �// h   c a l c u l a t e   t h e   s t a r t   i n d e x   o f   t h e   n e x t   A S   t e x t   r a n g e$ 010 l   ��23��  2
 note: record keys are identifiers, not keywords, as 1. library-defined keywords are a huge pain to use outside of `tell script...` blocks and 2. importing the library's terminology into the global namespace via `use script...` is an excellent way to create keyword conflicts; only the class value is a keyword since Script Editor/OSAKit don't correctly handle records that use non-typename values (e.g. `{class:"matched text",...}`), but this shouldn't impact usability as it's really only used for informational purposes   3 �44   n o t e :   r e c o r d   k e y s   a r e   i d e n t i f i e r s ,   n o t   k e y w o r d s ,   a s   1 .   l i b r a r y - d e f i n e d   k e y w o r d s   a r e   a   h u g e   p a i n   t o   u s e   o u t s i d e   o f   ` t e l l   s c r i p t . . . `   b l o c k s   a n d   2 .   i m p o r t i n g   t h e   l i b r a r y ' s   t e r m i n o l o g y   i n t o   t h e   g l o b a l   n a m e s p a c e   v i a   ` u s e   s c r i p t . . . `   i s   a n   e x c e l l e n t   w a y   t o   c r e a t e   k e y w o r d   c o n f l i c t s ;   o n l y   t h e   c l a s s   v a l u e   i s   a   k e y w o r d   s i n c e   S c r i p t   E d i t o r / O S A K i t   d o n ' t   c o r r e c t l y   h a n d l e   r e c o r d s   t h a t   u s e   n o n - t y p e n a m e   v a l u e s   ( e . g .   ` { c l a s s : " m a t c h e d   t e x t " , . . . } ` ) ,   b u t   t h i s   s h o u l d n ' t   i m p a c t   u s a b i l i t y   a s   i t ' s   r e a l l y   o n l y   u s e d   f o r   i n f o r m a t i o n a l   p u r p o s e s1 5��5 L    #66 J    "77 898 K    :: ��;<
�� 
pcls; o    ���� 0 
recordtype 
recordType< ��=>�� 0 
startindex 
startIndex= o    ���� 0 
textoffset 
textOffset> ��?@�� 0 endindex endIndex? \    ABA o    ����  0 nexttextoffset nextTextOffsetB m    ���� @ ��C���� 0 	foundtext 	foundTextC o    ���� 0 	foundtext 	foundText��  9 D��D o     ����  0 nexttextoffset nextTextOffset��  ��   EFE l     ��������  ��  ��  F GHG l     ��������  ��  ��  H IJI i  V YKLK I      ��M���� 0 _matchrecords _matchRecordsM NON o      ���� 0 
asocstring 
asocStringO PQP o      ����  0 asocmatchrange asocMatchRangeQ RSR o      ����  0 asocstartindex asocStartIndexS TUT o      ���� 0 
textoffset 
textOffsetU VWV o      ���� (0 nonmatchrecordtype nonMatchRecordTypeW X��X o      ���� "0 matchrecordtype matchRecordType��  ��  L k     VYY Z[Z l     ��\]��  \TN important: NSString character indexes aren't guaranteed to be same as AS character indexes (AS sensibly counts glyphs but NSString only counts UTF16 codepoints, and a glyph may be composed of more than one codepoint), so reconstruct both non-matching and matching AS text values, and calculate accurate AS character ranges from those   ] �^^�   i m p o r t a n t :   N S S t r i n g   c h a r a c t e r   i n d e x e s   a r e n ' t   g u a r a n t e e d   t o   b e   s a m e   a s   A S   c h a r a c t e r   i n d e x e s   ( A S   s e n s i b l y   c o u n t s   g l y p h s   b u t   N S S t r i n g   o n l y   c o u n t s   U T F 1 6   c o d e p o i n t s ,   a n d   a   g l y p h   m a y   b e   c o m p o s e d   o f   m o r e   t h a n   o n e   c o d e p o i n t ) ,   s o   r e c o n s t r u c t   b o t h   n o n - m a t c h i n g   a n d   m a t c h i n g   A S   t e x t   v a l u e s ,   a n d   c a l c u l a t e   a c c u r a t e   A S   c h a r a c t e r   r a n g e s   f r o m   t h o s e[ _`_ r     aba n    cdc I    �������� 0 location  ��  ��  d o     ����  0 asocmatchrange asocMatchRangeb o      ����  0 asocmatchstart asocMatchStart` efe r    ghg [    iji o    	����  0 asocmatchstart asocMatchStartj l  	 k����k n  	 lml I   
 �������� 
0 length  ��  ��  m o   	 
����  0 asocmatchrange asocMatchRange��  ��  h o      ���� 0 asocmatchend asocMatchEndf non r    pqp K    rr ��st�� 0 location  s o    ����  0 asocstartindex asocStartIndext ��u���� 
0 length  u \    vwv o    ����  0 asocmatchstart asocMatchStartw o    ����  0 asocstartindex asocStartIndex��  q o      ���� &0 asocnonmatchrange asocNonMatchRangeo xyx r    5z{z I      ��|���� $0 _matchinforecord _matchInfoRecord| }~} o    ���� 0 
asocstring 
asocString~ � o     ���� &0 asocnonmatchrange asocNonMatchRange� ��� o     !���� 0 
textoffset 
textOffset� ���� o   ! "���� (0 nonmatchrecordtype nonMatchRecordType��  ��  { J      �� ��� o      ���� 0 nonmatchinfo nonMatchInfo� ���� o      ���� 0 
textoffset 
textOffset��  y ��� r   6 N��� I      ������� $0 _matchinforecord _matchInfoRecord� ��� o   7 8���� 0 
asocstring 
asocString� ��� o   8 9����  0 asocmatchrange asocMatchRange� ��� o   9 :���� 0 
textoffset 
textOffset� ���� o   : ;���� "0 matchrecordtype matchRecordType��  ��  � J      �� ��� o      ���� 0 	matchinfo 	matchInfo� ���� o      ���� 0 
textoffset 
textOffset��  � ���� L   O V�� J   O U�� ��� o   O P���� 0 nonmatchinfo nonMatchInfo� ��� o   P Q���� 0 	matchinfo 	matchInfo� ��� o   Q R���� 0 asocmatchend asocMatchEnd� ���� o   R S���� 0 
textoffset 
textOffset��  ��  J ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  Z ]��� I      ������� &0 _matchedgrouplist _matchedGroupList� ��� o      ���� 0 
asocstring 
asocString� ��� o      ���� 0 	asocmatch 	asocMatch� ��� o      ���� 0 
textoffset 
textOffset� ���� o      ���� &0 includenonmatches includeNonMatches��  ��  � k     ��� ��� r     ��� J     ����  � o      ���� "0 submatchresults subMatchResults� ��� r    ��� \    ��� l   
������ n   
��� I    
��������  0 numberofranges numberOfRanges��  ��  � o    ���� 0 	asocmatch 	asocMatch��  ��  � m   
 ���� � o      ���� 0 groupindexes groupIndexes� ��� Z    �������� ?    ��� o    ���� 0 groupindexes groupIndexes� m    ����  � k    ��� ��� r    ��� n   ��� I    ������� 0 rangeatindex_ rangeAtIndex_� ���� m    ����  ��  ��  � o    ���� 0 	asocmatch 	asocMatch� o      ���� (0 asocfullmatchrange asocFullMatchRange� ��� r    %��� n   #��� I    #�������� 0 location  ��  ��  � o    ���� (0 asocfullmatchrange asocFullMatchRange� o      ���� &0 asocnonmatchstart asocNonMatchStart� ��� r   & /��� [   & -��� o   & '���� &0 asocnonmatchstart asocNonMatchStart� l  ' ,����� n  ' ,��� I   ( ,�~�}�|�~ 
0 length  �}  �|  � o   ' (�{�{ (0 asocfullmatchrange asocFullMatchRange��  �  � o      �z�z $0 asocfullmatchend asocFullMatchEnd� ��� Y   0 ���y���x� k   : ��� ��� r   : o��� I      �w��v�w 0 _matchrecords _matchRecords� ��� o   ; <�u�u 0 
asocstring 
asocString� ��� n  < B��� I   = B�t��s�t 0 rangeatindex_ rangeAtIndex_� ��r� o   = >�q�q 0 i  �r  �s  � o   < =�p�p 0 	asocmatch 	asocMatch� ��� o   B C�o�o &0 asocnonmatchstart asocNonMatchStart� ��� o   C D�n�n 0 
textoffset 
textOffset� ��� o   D I�m�m (0 _unmatchedtexttype _UnmatchedTextType� ��l� o   I N�k�k &0 _matchedgrouptype _MatchedGroupType�l  �v  � J      �� ��� o      �j�j 0 nonmatchinfo nonMatchInfo� ��� o      �i�i 0 	matchinfo 	matchInfo� ��� o      �h�h &0 asocnonmatchstart asocNonMatchStart� ��g� o      �f�f 0 
textoffset 
textOffset�g  �    Z  p |�e�d o   p q�c�c &0 includenonmatches includeNonMatches r   t x o   t u�b�b 0 nonmatchinfo nonMatchInfo n        ;   v w o   u v�a�a "0 submatchresults subMatchResults�e  �d   �` r   } �	
	 o   } ~�_�_ 0 	matchinfo 	matchInfo
 n        ;    � o   ~ �^�^ "0 submatchresults subMatchResults�`  �y 0 i  � m   3 4�]�] � o   4 5�\�\ 0 groupindexes groupIndexes�x  � �[ Z   � ��Z�Y o   � ��X�X &0 includenonmatches includeNonMatches k   � �  r   � � K   � � �W�W 0 location   o   � ��V�V &0 asocnonmatchstart asocNonMatchStart �U�T�U 
0 length   \   � � o   � ��S�S $0 asocfullmatchend asocFullMatchEnd o   � ��R�R &0 asocnonmatchstart asocNonMatchStart�T   o      �Q�Q &0 asocnonmatchrange asocNonMatchRange �P r   � � n   � � 4   � ��O 
�O 
cobj  m   � ��N�N  I   � ��M!�L�M $0 _matchinforecord _matchInfoRecord! "#" o   � ��K�K 0 
asocstring 
asocString# $%$ o   � ��J�J &0 asocnonmatchrange asocNonMatchRange% &'& o   � ��I�I 0 
textoffset 
textOffset' (�H( o   � ��G�G (0 _unmatchedtexttype _UnmatchedTextType�H  �L   n      )*)  ;   � �* o   � ��F�F "0 submatchresults subMatchResults�P  �Z  �Y  �[  ��  ��  � +�E+ L   � �,, o   � ��D�D "0 submatchresults subMatchResults�E  � -.- l     �C�B�A�C  �B  �A  . /0/ l     �@�?�>�@  �?  �>  0 121 l     �=�<�;�=  �<  �;  2 343 i  ^ a565 I      �:7�9�: 0 _findpattern _findPattern7 898 o      �8�8 0 thetext theText9 :;: o      �7�7 0 patterntext patternText; <=< o      �6�6 &0 includenonmatches includeNonMatches= >�5> o      �4�4  0 includematches includeMatches�5  �9  6 k    ?? @A@ r     BCB n    DED I    �3F�2�3 (0 asbooleanparameter asBooleanParameterF GHG o    �1�1 &0 includenonmatches includeNonMatchesH I�0I m    JJ �KK  u n m a t c h e d   t e x t�0  �2  E o     �/�/ 0 _support  C o      �.�. &0 includenonmatches includeNonMatchesA LML r    NON n   PQP I    �-R�,�- (0 asbooleanparameter asBooleanParameterR STS o    �+�+  0 includematches includeMatchesT U�*U m    VV �WW  m a t c h e d   t e x t�*  �,  Q o    �)�) 0 _support  O o      �(�(  0 includematches includeMatchesM XYX r    %Z[Z I    #�'\�&�' B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter\ ]^] o    �%�% 0 patterntext patternText^ _�$_ m    `` �aa  f o r�$  �&  [ o      �#�# 0 asocpattern asocPatternY bcb r   & 2ded n  & 0fgf I   + 0�"h�!�" ,0 asnormalizednsstring asNormalizedNSStringh i� i o   + ,�� 0 thetext theText�   �!  g o   & +�� 0 _support  e o      �� 0 
asocstring 
asocStringc jkj l  3 6lmnl r   3 6opo m   3 4��  p o      �� &0 asocnonmatchstart asocNonMatchStartm G A used to calculate NSRanges for non-matching portions of NSString   n �qq �   u s e d   t o   c a l c u l a t e   N S R a n g e s   f o r   n o n - m a t c h i n g   p o r t i o n s   o f   N S S t r i n gk rsr l  7 :tuvt r   7 :wxw m   7 8�� x o      �� 0 
textoffset 
textOffsetu B < used to calculate correct AppleScript start and end indexes   v �yy x   u s e d   t o   c a l c u l a t e   c o r r e c t   A p p l e S c r i p t   s t a r t   a n d   e n d   i n d e x e ss z{z r   ; ?|}| J   ; =��  } o      �� 0 
resultlist 
resultList{ ~~ l  @ @����  � @ : iterate over each non-matched + matched range in NSString   � ��� t   i t e r a t e   o v e r   e a c h   n o n - m a t c h e d   +   m a t c h e d   r a n g e   i n   N S S t r i n g ��� r   @ Q��� n  @ O��� I   A O���� @0 matchesinstring_options_range_ matchesInString_options_range_� ��� o   A B�� 0 
asocstring 
asocString� ��� m   B C��  � ��� J   C K�� ��� m   C D��  � ��� n  D I��� I   E I���� 
0 length  �  �  � o   D E�� 0 
asocstring 
asocString�  �  �  � o   @ A�
�
 0 asocpattern asocPattern� o      �	�	  0 asocmatcharray asocMatchArray� ��� Y   R ������� k   b ��� ��� r   b j��� l  b h���� n  b h��� I   c h����  0 objectatindex_ objectAtIndex_� ��� o   c d�� 0 i  �  �  � o   b c� �   0 asocmatcharray asocMatchArray�  �  � o      ���� 0 	asocmatch 	asocMatch� ��� l  k k������  � � � the first range in match identifies the text matched by the entire pattern, so generate records for full match and its preceding (unmatched) text   � ���$   t h e   f i r s t   r a n g e   i n   m a t c h   i d e n t i f i e s   t h e   t e x t   m a t c h e d   b y   t h e   e n t i r e   p a t t e r n ,   s o   g e n e r a t e   r e c o r d s   f o r   f u l l   m a t c h   a n d   i t s   p r e c e d i n g   ( u n m a t c h e d )   t e x t� ��� r   k ���� I      ������� 0 _matchrecords _matchRecords� ��� o   l m���� 0 
asocstring 
asocString� ��� n  m s��� I   n s������� 0 rangeatindex_ rangeAtIndex_� ���� m   n o����  ��  ��  � o   m n���� 0 	asocmatch 	asocMatch� ��� o   s t���� &0 asocnonmatchstart asocNonMatchStart� ��� o   t u���� 0 
textoffset 
textOffset� ��� o   u z���� (0 _unmatchedtexttype _UnmatchedTextType� ���� o   z ���� $0 _matchedtexttype _MatchedTextType��  ��  � J      �� ��� o      ���� 0 nonmatchinfo nonMatchInfo� ��� o      ���� 0 	matchinfo 	matchInfo� ��� o      ���� &0 asocnonmatchstart asocNonMatchStart� ���� o      ���� 0 
textoffset 
textOffset��  � ��� Z  � �������� o   � ����� &0 includenonmatches includeNonMatches� r   � ���� o   � ����� 0 nonmatchinfo nonMatchInfo� n      ���  ;   � �� o   � ����� 0 
resultlist 
resultList��  ��  � ���� Z   � �������� o   � �����  0 includematches includeMatches� k   � ��� ��� l  � �������  � any additional ranges in match identify text matched by group references within regexp pattern, e.g. "([0-9]{4})-([0-9]{2})-([0-9]{2})" will match `YYYY-MM-DD` style date strings, returning the entire text match, plus sub-matches representing year, month and day text   � ���   a n y   a d d i t i o n a l   r a n g e s   i n   m a t c h   i d e n t i f y   t e x t   m a t c h e d   b y   g r o u p   r e f e r e n c e s   w i t h i n   r e g e x p   p a t t e r n ,   e . g .   " ( [ 0 - 9 ] { 4 } ) - ( [ 0 - 9 ] { 2 } ) - ( [ 0 - 9 ] { 2 } ) "   w i l l   m a t c h   ` Y Y Y Y - M M - D D `   s t y l e   d a t e   s t r i n g s ,   r e t u r n i n g   t h e   e n t i r e   t e x t   m a t c h ,   p l u s   s u b - m a t c h e s   r e p r e s e n t i n g   y e a r ,   m o n t h   a n d   d a y   t e x t� ���� r   � ���� b   � ���� o   � ����� 0 	matchinfo 	matchInfo� K   � ��� ������� 0 foundgroups foundGroups� I   � �������� &0 _matchedgrouplist _matchedGroupList� ��� o   � ����� 0 
asocstring 
asocString� ��� o   � ����� 0 	asocmatch 	asocMatch� ��� n  � ���� o   � ����� 0 
startindex 
startIndex� o   � ����� 0 	matchinfo 	matchInfo� ���� o   � ����� &0 includenonmatches includeNonMatches��  ��  ��  � n      ���  ;   � �� o   � ����� 0 
resultlist 
resultList��  ��  ��  ��  � 0 i  � m   U V����  � \   V ]��� l  V [������ n  V [��� I   W [�������� 	0 count  ��  ��  � o   V W����  0 asocmatcharray asocMatchArray��  ��  � m   [ \���� �  � ��� l  � �������  � "  add final non-matched range   � ��� 8   a d d   f i n a l   n o n - m a t c h e d   r a n g e� ��� Z   �������� o   � ����� &0 includenonmatches includeNonMatches� k   ��� ��� r   � ���� c   � ���� l  � ������� n  � �� � I   � ������� *0 substringfromindex_ substringFromIndex_ �� o   � ����� &0 asocnonmatchstart asocNonMatchStart��  ��    o   � ����� 0 
asocstring 
asocString��  ��  � m   � ���
�� 
ctxt� o      ���� 0 	foundtext 	foundText� �� r   � K   � � ��
�� 
pcls o   � ����� (0 _unmatchedtexttype _UnmatchedTextType ��	
�� 0 
startindex 
startIndex	 o   � ����� 0 
textoffset 
textOffset
 ���� 0 endindex endIndex n   � � 1   � ���
�� 
leng o   � ����� 0 thetext theText ������ 0 	foundtext 	foundText o   � ����� 0 	foundtext 	foundText��   n        ;   �  o   � ����� 0 
resultlist 
resultList��  ��  ��  � �� L   o  ���� 0 
resultlist 
resultList��  4  l     ��������  ��  ��    l     ��������  ��  ��    l     ����    -----    � 
 - - - - -  l     �� ��     replace pattern     �!!     r e p l a c e   p a t t e r n "#" l     ��������  ��  ��  # $%$ i  b e&'& I      ��(���� "0 _replacepattern _replacePattern( )*) o      ���� 0 thetext theText* +,+ o      ���� 0 patterntext patternText, -��- o      ���� 0 templatetext templateText��  ��  ' k    t.. /0/ r     121 n    
343 I    
��5���� ,0 asnormalizednsstring asNormalizedNSString5 6��6 o    ���� 0 thetext theText��  ��  4 o     ���� 0 _support  2 o      ���� 0 
asocstring 
asocString0 787 r    9:9 I    ��;���� B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter; <=< o    ���� 0 patterntext patternText= >��> m    ?? �@@  f o r��  ��  : o      ���� 0 asocpattern asocPattern8 A��A Z   tBC��DB =    "EFE l    G����G I    ��HI
�� .corecnte****       ****H J    JJ K��K o    ���� 0 templatetext templateText��  I ��L��
�� 
koclL m    ��
�� 
scpt��  ��  ��  F m     !���� C k   %WMM NON h   % ,��P�� 0 
resultlist 
resultListP j     ��Q�� 
0 _list_  Q J     ����  O RSR r   - 0TUT m   - .����  U o      ���� &0 asocnonmatchstart asocNonMatchStartS VWV r   1 BXYX n  1 @Z[Z I   2 @��\���� @0 matchesinstring_options_range_ matchesInString_options_range_\ ]^] o   2 3���� 0 
asocstring 
asocString^ _`_ m   3 4����  ` a��a J   4 <bb cdc m   4 5����  d e�e n  5 :fgf I   6 :�~�}�|�~ 
0 length  �}  �|  g o   5 6�{�{ 0 
asocstring 
asocString�  ��  ��  [ o   1 2�z�z 0 asocpattern asocPatternY o      �y�y  0 asocmatcharray asocMatchArrayW hih Y   Cj�xkl�wj k   S	mm non l  S [pqrp r   S [sts l  S Yu�v�uu n  S Yvwv I   T Y�tx�s�t  0 objectatindex_ objectAtIndex_x y�ry o   T U�q�q 0 i  �r  �s  w o   S T�p�p  0 asocmatcharray asocMatchArray�v  �u  t o      �o�o 0 	asocmatch 	asocMatchq   a single match   r �zz    a   s i n g l e   m a t c ho {|{ l  \ d}~} r   \ d��� l  \ b��n�m� n  \ b��� I   ] b�l��k�l 0 rangeatindex_ rangeAtIndex_� ��j� m   ] ^�i�i  �j  �k  � o   \ ]�h�h 0 	asocmatch 	asocMatch�n  �m  � o      �g�g  0 asocmatchrange asocMatchRange~ "  the full range of the match    ��� 8   t h e   f u l l   r a n g e   o f   t h e   m a t c h| ��� r   e l��� n  e j��� I   f j�f�e�d�f 0 location  �e  �d  � o   e f�c�c  0 asocmatchrange asocMatchRange� o      �b�b  0 asocmatchstart asocMatchStart� ��� r   m w��� K   m u�� �a���a 0 location  � o   n o�`�` &0 asocnonmatchstart asocNonMatchStart� �_��^�_ 
0 length  � \   p s��� o   p q�]�]  0 asocmatchstart asocMatchStart� o   q r�\�\ &0 asocnonmatchstart asocNonMatchStart�^  � o      �[�[ &0 asocnonmatchrange asocNonMatchRange� ��� l  x ����� r   x ���� c   x ���� l  x ~��Z�Y� n  x ~��� I   y ~�X��W�X *0 substringwithrange_ substringWithRange_� ��V� o   y z�U�U &0 asocnonmatchrange asocNonMatchRange�V  �W  � o   x y�T�T 0 
asocstring 
asocString�Z  �Y  � m   ~ ��S
�S 
ctxt� n      ���  ;   � �� n  � ���� o   � ��R�R 
0 _list_  � o   � ��Q�Q 0 
resultlist 
resultList�   interstitial text   � ��� $   i n t e r s t i t i a l   t e x t� ��� l  � ����� r   � ���� c   � ���� l  � ���P�O� n  � ���� I   � ��N��M�N *0 substringwithrange_ substringWithRange_� ��L� o   � ��K�K  0 asocmatchrange asocMatchRange�L  �M  � o   � ��J�J 0 
asocstring 
asocString�P  �O  � m   � ��I
�I 
ctxt� o      �H�H 0 	foundtext 	foundText�   range 0 is full match   � ��� ,   r a n g e   0   i s   f u l l   m a t c h� ��� r   � ���� J   � ��G�G  � o      �F�F 0 foundgroups foundGroups� ��� Y   � ���E���D� l  � ����� r   � ���� c   � ���� l  � ���C�B� n  � ���� I   � ��A��@�A *0 substringwithrange_ substringWithRange_� ��?� l  � ���>�=� n  � ���� I   � ��<��;�< 0 rangeatindex_ rangeAtIndex_� ��:� o   � ��9�9 0 j  �:  �;  � o   � ��8�8 0 	asocmatch 	asocMatch�>  �=  �?  �@  � o   � ��7�7 0 
asocstring 
asocString�C  �B  � m   � ��6
�6 
ctxt� n      ���  ;   � �� o   � ��5�5 0 foundgroups foundGroups� ' ! ranges above 0 are group matches   � ��� B   r a n g e s   a b o v e   0   a r e   g r o u p   m a t c h e s�E 0 j  � m   � ��4�4 � \   � ���� l  � ���3�2� n  � ���� I   � ��1�0�/�1  0 numberofranges numberOfRanges�0  �/  � o   � ��.�. 0 	asocmatch 	asocMatch�3  �2  � m   � ��-�- �D  � ��� Q   � ����� r   � ���� c   � ���� n  � ���� I   � ��,��+�,  0 replacepattern replacePattern� ��� o   � ��*�* 0 	foundtext 	foundText� ��)� o   � ��(�( 0 foundgroups foundGroups�)  �+  � o   � ��'�' 0 templatetext templateText� m   � ��&
�& 
ctxt� n      ���  ;   � �� n  � ���� o   � ��%�% 
0 _list_  � o   � ��$�$ 0 
resultlist 
resultList� R      �#��
�# .ascrerr ****      � ****� o      �"�" 0 etext eText� �!��
�! 
errn� o      � �  0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � R   � ����
� .ascrerr ****      � ****� b   � ���� m   � ��� ��� � A n   e r r o r   o c c u r r e d   w h e n   c a l l i n g   t h e    r e p l a c i n g   w i t h    p a r a m e t e r  s    r e p l a c e P a t t e r n    h a n d l e r :  � o   � ��� 0 etext eText� ���
� 
errn� o   � ��� 0 enumber eNumber� ���
� 
erob� o   � ��� 0 efrom eFrom� � �
� 
errt  o   � ��� 
0 eto eTo�  � � l  	 r   	 [    o   ��  0 asocmatchstart asocMatchStart l 	��	 n 

 I  ���� 
0 length  �  �   o  �
�
  0 asocmatchrange asocMatchRange�  �   o      �	�	 &0 asocnonmatchstart asocNonMatchStart   asocMatchEnd    �    a s o c M a t c h E n d�  �x 0 i  k m   F G��  l \   G N l  G L�� n  G L I   H L���� 	0 count  �  �   o   G H��  0 asocmatcharray asocMatchArray�  �   m   L M�� �w  i  l � �    "  add final non-matched range    � 8   a d d   f i n a l   n o n - m a t c h e d   r a n g e  l   r    c   l  ����  n !"! I  ��#���� *0 substringfromindex_ substringFromIndex_# $��$ o  ���� &0 asocnonmatchstart asocNonMatchStart��  ��  " o  ���� 0 
asocstring 
asocString��  ��   m  ��
�� 
ctxt n      %&%  ;  & n '(' o  ���� 
0 _list_  ( o  ���� 0 
resultlist 
resultList   last interstitial    �)) $   l a s t   i n t e r s t i t i a l *+* r  !,,-, n !(./. 1  $(��
�� 
txdl/ 1  !$��
�� 
ascr- o      ���� 0 oldtids oldTIDs+ 010 r  -8232 m  -044 �55  3 n     676 1  37��
�� 
txdl7 1  03��
�� 
ascr1 898 r  9F:;: c  9B<=< n 9>>?> o  :>���� 
0 _list_  ? o  9:���� 0 
resultlist 
resultList= m  >A��
�� 
ctxt; o      ���� 0 
resulttext 
resultText9 @A@ r  GRBCB o  GJ���� 0 oldtids oldTIDsC n     DED 1  MQ��
�� 
txdlE 1  JM��
�� 
ascrA F��F L  SWGG o  SV���� 0 
resulttext 
resultText��  ��  D L  ZtHH c  ZsIJI l ZoK����K n ZoLML I  [o��N���� |0 <stringbyreplacingmatchesinstring_options_range_withtemplate_ <stringByReplacingMatchesInString_options_range_withTemplate_N OPO l 
[\Q����Q o  [\���� 0 
asocstring 
asocString��  ��  P RSR m  \]����  S TUT J  ]eVV WXW m  ]^����  X Y��Y n ^cZ[Z I  _c�������� 
0 length  ��  ��  [ o  ^_���� 0 
asocstring 
asocString��  U \��\ I  ek��]���� ,0 _parsesearchtemplate _parseSearchTemplate] ^��^ o  fg���� 0 templatetext templateText��  ��  ��  ��  M o  Z[���� 0 asocpattern asocPattern��  ��  J m  or��
�� 
ctxt��  % _`_ l     ��������  ��  ��  ` aba l     ��������  ��  ��  b cdc l     ��ef��  e  -----   f �gg 
 - - - - -d hih l     ��jk��  j  
 find text   k �ll    f i n d   t e x ti mnm l     ��������  ��  ��  n opo i  f iqrq I      ��s���� 0 	_findtext 	_findTexts tut o      ���� 0 thetext theTextu vwv o      ���� 0 fortext forTextw xyx o      ���� &0 includenonmatches includeNonMatchesy z��z o      ����  0 includematches includeMatches��  ��  r k    	{{ |}| r     ~~ J     ����   o      ���� 0 
resultlist 
resultList} ��� r    
��� n   ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� o      ���� 0 oldtids oldTIDs� ��� r    ��� o    ���� 0 fortext forText� n     ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� ��� r    ��� m    ���� � o      ���� 0 
startindex 
startIndex� ��� r    ��� n    ��� 1    ��
�� 
leng� n    ��� 4    ���
�� 
citm� m    ���� � o    ���� 0 thetext theText� o      ���� 0 endindex endIndex� ��� Z    Q������� o    ���� &0 includenonmatches includeNonMatches� k   " M�� ��� Z   " ;������ B   " %��� o   " #���� 0 
startindex 
startIndex� o   # $���� 0 endindex endIndex� r   ( 5��� n   ( 3��� 7  ) 3����
�� 
ctxt� o   - /���� 0 
startindex 
startIndex� o   0 2���� 0 endindex endIndex� o   ( )���� 0 thetext theText� o      ���� 0 	foundtext 	foundText��  � r   8 ;��� m   8 9�� ���  � o      ���� 0 	foundtext 	foundText� ���� r   < M��� K   < J�� ����
�� 
pcls� o   = B���� (0 _unmatchedtexttype _UnmatchedTextType� ������ 0 
startindex 
startIndex� o   C D���� 0 
startindex 
startIndex� ������ 0 endindex endIndex� o   E F���� 0 endindex endIndex� ������� 0 	foundtext 	foundText� o   G H���� 0 	foundtext 	foundText��  � n      ���  ;   K L� o   J K���� 0 
resultlist 
resultList��  ��  ��  � ��� Y   R �������� k   b ��� ��� r   b g��� [   b e��� o   b c���� 0 endindex endIndex� m   c d���� � o      ���� 0 
startindex 
startIndex� ��� r   h }��� \   h {��� l  h k������ n   h k��� 1   i k��
�� 
leng� o   h i���� 0 thetext theText��  ��  � l  k z������ n   k z��� 1   x z��
�� 
leng� n   k x��� 7  l x����
�� 
ctxt� l  p s������ 4   p s���
�� 
citm� o   q r���� 0 i  ��  ��  � l  t w������ 4   t w���
�� 
citm� m   u v��������  ��  � o   k l���� 0 thetext theText��  ��  � o      ���� 0 endindex endIndex� ��� Z   ~ �������� o   ~ ����  0 includematches includeMatches� k   � ��� ��� Z   � ������� B   � ���� o   � ��� 0 
startindex 
startIndex� o   � ��~�~ 0 endindex endIndex� r   � ���� n   � ���� 7  � ��}��
�} 
ctxt� o   � ��|�| 0 
startindex 
startIndex� o   � ��{�{ 0 endindex endIndex� o   � ��z�z 0 thetext theText� o      �y�y 0 	foundtext 	foundText��  � r   � ���� m   � ��� ���  � o      �x�x 0 	foundtext 	foundText� ��w� r   � ���� K   � ��� �v��
�v 
pcls� o   � ��u�u $0 _matchedtexttype _MatchedTextType� �t���t 0 
startindex 
startIndex� o   � ��s�s 0 
startindex 
startIndex� �r���r 0 endindex endIndex� o   � ��q�q 0 endindex endIndex� �p���p 0 	foundtext 	foundText� o   � ��o�o 0 	foundtext 	foundText� �n��m�n 0 foundgroups foundGroups� J   � ��l�l  �m  � n      � �  ;   � �  o   � ��k�k 0 
resultlist 
resultList�w  ��  ��  �  r   � � [   � � o   � ��j�j 0 endindex endIndex m   � ��i�i  o      �h�h 0 
startindex 
startIndex  r   � �	
	 \   � � [   � � o   � ��g�g 0 
startindex 
startIndex l  � ��f�e n   � � 1   � ��d
�d 
leng n   � � 4   � ��c
�c 
citm o   � ��b�b 0 i   o   � ��a�a 0 thetext theText�f  �e   m   � ��`�` 
 o      �_�_ 0 endindex endIndex �^ Z   � ��]�\ o   � ��[�[ &0 includenonmatches includeNonMatches k   � �  Z   � ��Z B   � � o   � ��Y�Y 0 
startindex 
startIndex o   � ��X�X 0 endindex endIndex r   � � !  n   � �"#" 7  � ��W$%
�W 
ctxt$ o   � ��V�V 0 
startindex 
startIndex% o   � ��U�U 0 endindex endIndex# o   � ��T�T 0 thetext theText! o      �S�S 0 	foundtext 	foundText�Z   r   � �&'& m   � �(( �))  ' o      �R�R 0 	foundtext 	foundText *�Q* r   � �+,+ K   � �-- �P./
�P 
pcls. o   � ��O�O (0 _unmatchedtexttype _UnmatchedTextType/ �N01�N 0 
startindex 
startIndex0 o   � ��M�M 0 
startindex 
startIndex1 �L23�L 0 endindex endIndex2 o   � ��K�K 0 endindex endIndex3 �J4�I�J 0 	foundtext 	foundText4 o   � ��H�H 0 	foundtext 	foundText�I  , n      565  ;   � �6 o   � ��G�G 0 
resultlist 
resultList�Q  �]  �\  �^  �� 0 i  � m   U V�F�F � I  V ]�E7�D
�E .corecnte****       ****7 n   V Y898 2  W Y�C
�C 
citm9 o   V W�B�B 0 thetext theText�D  ��  � :;: r  <=< o  �A�A 0 oldtids oldTIDs= n     >?> 1  �@
�@ 
txdl? 1  �?
�? 
ascr; @�>@ L  	AA o  �=�= 0 
resultlist 
resultList�>  p BCB l     �<�;�:�<  �;  �:  C DED l     �9�8�7�9  �8  �7  E FGF l     �6HI�6  H  -----   I �JJ 
 - - - - -G KLK l     �5MN�5  M   replace text   N �OO    r e p l a c e   t e x tL PQP l     �4�3�2�4  �3  �2  Q RSR i  j mTUT I      �1V�0�1 0 _replacetext _replaceTextV WXW o      �/�/ 0 thetext theTextX YZY o      �.�. 0 fortext forTextZ [�-[ o      �,�, 0 newtext newText�-  �0  U k    '\\ ]^] r     _`_ n    aba 1    �+
�+ 
txdlb 1     �*
�* 
ascr` o      �)�) 0 oldtids oldTIDs^ cdc r    efe o    �(�( 0 fortext forTextf n     ghg 1    
�'
�' 
txdlh 1    �&
�& 
ascrd iji Z   kl�%mk >    non l   p�$�#p I   �"qr
�" .corecnte****       ****q J    ss t�!t o    � �  0 newtext newText�!  r �u�
� 
koclu m    �
� 
scpt�  �$  �#  o m    ��  l k    �vv wxw r    ;yzy J    %{{ |}| J    ��  } ~~ m    ��  ��� n    #��� 1   ! #�
� 
leng� n    !��� 4    !��
� 
citm� m     �� � o    �� 0 thetext theText�  z J      �� ��� o      �� 0 
resultlist 
resultList� ��� o      �� 0 
startindex 
startIndex� ��� o      �� 0 endindex endIndex�  x ��� Z  < T����� B   < ?��� o   < =�� 0 
startindex 
startIndex� o   = >�� 0 endindex endIndex� r   B P��� n   B M��� 7  C M���
� 
ctxt� o   G I�� 0 
startindex 
startIndex� o   J L�
�
 0 endindex endIndex� o   B C�	�	 0 thetext theText� n      ���  ;   N O� o   M N�� 0 
resultlist 
resultList�  �  � ��� Y   U ������� k   e ��� ��� r   e j��� [   e h��� o   e f�� 0 endindex endIndex� m   f g�� � o      �� 0 
startindex 
startIndex� ��� r   k ���� \   k ~��� l  k n���� n   k n��� 1   l n� 
�  
leng� o   k l���� 0 thetext theText�  �  � l  n }������ n   n }��� 1   { }��
�� 
leng� n   n {��� 7  o {����
�� 
ctxt� l  s v������ 4   s v���
�� 
citm� o   t u���� 0 i  ��  ��  � l  w z������ 4   w z���
�� 
citm� m   x y��������  ��  � o   n o���� 0 thetext theText��  ��  � o      ���� 0 endindex endIndex� ��� Z   � ������� B   � ���� o   � ����� 0 
startindex 
startIndex� o   � ����� 0 endindex endIndex� r   � ���� n   � ���� 7  � �����
�� 
ctxt� o   � ����� 0 
startindex 
startIndex� o   � ����� 0 endindex endIndex� o   � ����� 0 thetext theText� o      ���� 0 	foundtext 	foundText��  � r   � ���� m   � ��� ���  � o      ���� 0 	foundtext 	foundText� ��� Q   � ����� r   � ���� c   � ���� n  � ���� I   � �������� 0 replacetext replaceText� ���� o   � ����� 0 	foundtext 	foundText��  ��  � o   � ����� 0 newtext newText� m   � ���
�� 
ctxt� n      ���  ;   � �� o   � ����� 0 
resultlist 
resultList� R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � R   � �����
�� .ascrerr ****      � ****� b   � ���� m   � ��� ��� � A n   e r r o r   o c c u r r e d   w h e n   c a l l i n g   t h e    r e p l a c i n g   w i t h    p a r a m e t e r  s    r e p l a c e T e x t    h a n d l e r :  � o   � ����� 0 etext eText� ����
�� 
errn� o   � ����� 0 enumber eNumber� ����
�� 
erob� o   � ����� 0 efrom eFrom� �����
�� 
errt� o   � ����� 
0 eto eTo��  � ��� r   � ���� [   � ���� o   � ����� 0 endindex endIndex� m   � ����� � o      ���� 0 
startindex 
startIndex� ��� r   � ���� \   � ���� [   � ���� o   � ����� 0 
startindex 
startIndex� l  � ������� n   � ���� 1   � ���
�� 
leng� n   � ���� 4   � ����
�� 
citm� o   � ����� 0 i  � o   � ����� 0 thetext theText��  ��  � m   � ����� � o      ���� 0 endindex endIndex�  ��  Z  � ����� B   � � o   � ����� 0 
startindex 
startIndex o   � ����� 0 endindex endIndex r   � � n   � � 7  � ���	

�� 
ctxt	 o   � ����� 0 
startindex 
startIndex
 o   � ����� 0 endindex endIndex o   � ����� 0 thetext theText n        ;   � � o   � ����� 0 
resultlist 
resultList��  ��  ��  � 0 i  � m   X Y���� � I  Y `����
�� .corecnte****       **** n   Y \ 2  Z \��
�� 
citm o   Y Z���� 0 thetext theText��  �  � �� r   � � m   � � �   n      1   � ���
�� 
txdl 1   � ���
�� 
ascr��  �%  m l  � k   �  l  � �����     replace with text    � $   r e p l a c e   w i t h   t e x t  !  r   �"#" n  �
$%$ I  
��&���� "0 astextparameter asTextParameter& '(' o  ���� 0 newtext newText( )��) m  ** �++  r e p l a c i n g   w i t h��  ��  % o   ����� 0 _support  # o      ���� 0 newtext newText! ,-, l ./0. r  121 n 343 2 ��
�� 
citm4 o  ���� 0 thetext theText2 o      ���� 0 
resultlist 
resultList/ J D note: TID-based matching uses current considering/ignoring settings   0 �55 �   n o t e :   T I D - b a s e d   m a t c h i n g   u s e s   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s- 6��6 r  787 o  ���� 0 newtext newText8 n     9:9 1  ��
�� 
txdl: 1  ��
�� 
ascr��   * $ replace with callback-supplied text    �;; H   r e p l a c e   w i t h   c a l l b a c k - s u p p l i e d   t e x tj <=< r  >?> c  @A@ o  ���� 0 
resultlist 
resultListA m  ��
�� 
ctxt? o      ���� 0 
resulttext 
resultText= BCB r  $DED o   ���� 0 oldtids oldTIDsE n     FGF 1  !#��
�� 
txdlG 1   !��
�� 
ascrC H��H L  %'II o  %&���� 0 
resulttext 
resultText��  S JKJ l     ��������  ��  ��  K LML l     ��������  ��  ��  M NON l     ��PQ��  P  -----   Q �RR 
 - - - - -O STS l     ��������  ��  ��  T UVU i  n qWXW I     ��YZ
�� .Txt:Srchnull���     ctxtY o      ���� 0 thetext theTextZ ��[\
�� 
For_[ o      ���� 0 fortext forText\ ��]^
�� 
Usin] |����_��`��  ��  _ o      ���� 0 matchformat matchFormat��  ` l 
    a����a l     b����b m      ��
�� SerECmpI��  ��  ��  ��  ^ ��cd
�� 
Replc |����e�f��  ��  e o      �~�~ 0 newtext newText�  f l     g�}�|g m      �{
�{ 
msng�}  �|  d �zh�y
�z 
Retuh |�x�wi�vj�x  �w  i o      �u�u 0 resultformat resultFormat�v  j l     k�t�sk m      �r
�r RetEMatT�t  �s  �y  X Q    blmnl k   Loo pqp r    rsr n   tut I    �qv�p�q "0 astextparameter asTextParameterv wxw o    	�o�o 0 thetext theTextx y�ny m   	 
zz �{{  �n  �p  u o    �m�m 0 _support  s o      �l�l 0 thetext theTextq |}| r    ~~ n   ��� I    �k��j�k "0 astextparameter asTextParameter� ��� o    �i�i 0 fortext forText� ��h� m    �� ���  f o r�h  �j  � o    �g�g 0 _support   o      �f�f 0 fortext forText} ��� Z   8���e�d� =    $��� n   "��� 1     "�c
�c 
leng� o     �b�b 0 fortext forText� m   " #�a�a  � n  ' 4��� I   , 4�`��_�` .0 throwinvalidparameter throwInvalidParameter� ��� o   , -�^�^ 0 fortext forText� ��� m   - .�� ���  f o r� ��� m   . /�]
�] 
ctxt� ��\� m   / 0�� ��� ( C a n  t   b e   e m p t y   t e x t .�\  �_  � o   ' ,�[�[ 0 _support  �e  �d  � ��Z� Z   9L���Y�� =  9 <��� o   9 :�X�X 0 newtext newText� m   : ;�W
�W 
msng� l  ?����� k   ?��� ��� Z   ? j���V�U� =   ? D��� n  ? B��� 1   @ B�T
�T 
leng� o   ? @�S�S 0 thetext theText� m   B C�R�R  � Z   G f���Q�� =  G J��� o   G H�P�P 0 resultformat resultFormat� m   H I�O
�O RetEMatT� L   M P�� J   M O�N�N  �Q  � L   S f�� J   S e�� ��M� K   S c�� �L��
�L 
pcls� o   T Y�K�K (0 _unmatchedtexttype _UnmatchedTextType� �J���J 0 
startindex 
startIndex� m   Z [�I�I � �H���H 0 endindex endIndex� m   \ ]�G�G  � �F��E�F 0 	foundtext 	foundText� m   ^ _�� ���  �E  �M  �V  �U  � ��� Z   k ������ =  k n��� o   k l�D�D 0 resultformat resultFormat� m   l m�C
�C RetEMatT� r   q ���� J   q u�� ��� m   q r�B
�B boovfals� ��A� m   r s�@
�@ boovtrue�A  � J      �� ��� o      �?�? &0 includenonmatches includeNonMatches� ��>� o      �=�=  0 includematches includeMatches�>  � ��� =  � ���� o   � ��<�< 0 resultformat resultFormat� m   � ��;
�; RetEUmaT� ��� r   � ���� J   � ��� ��� m   � ��:
�: boovtrue� ��9� m   � ��8
�8 boovfals�9  � J      �� ��� o      �7�7 &0 includenonmatches includeNonMatches� ��6� o      �5�5  0 includematches includeMatches�6  � ��� =  � ���� o   � ��4�4 0 resultformat resultFormat� m   � ��3
�3 RetEAllT� ��2� r   � ���� J   � ��� ��� m   � ��1
�1 boovtrue� ��0� m   � ��/
�/ boovtrue�0  � J      �� ��� o      �.�. &0 includenonmatches includeNonMatches� ��-� o      �,�,  0 includematches includeMatches�-  �2  � n  � ���� I   � ��+��*�+ >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   � ��)�) 0 resultformat resultFormat� ��(� m   � ��� ���  r e t u r n i n g�(  �*  � o   � ��'�' 0 _support  � ��&� Z   �����	 � =  � �			 o   � ��%�% 0 matchformat matchFormat	 m   � ��$
�$ SerECmpI� P   � �				 L   � �		 I   � ��#	�"�# 0 	_findtext 	_findText	 				 o   � ��!�! 0 thetext theText		 	
		
 o   � �� �  0 fortext forText	 			 o   � ��� &0 includenonmatches includeNonMatches	 	�	 o   � ���  0 includematches includeMatches�  �"  	 �	
� consdiac	 �	
� conshyph	 �	
� conspunc	 �	
� conswhit	 ��
� consnume�  	 ��
� conscase�  � 			 =  �			 o   � ��� 0 matchformat matchFormat	 m   � �
� SerECmpP	 			 L  		 I  �	�� 0 _findpattern _findPattern	 			 o  �� 0 thetext theText	 			 o  �� 0 fortext forText	 		 	 o  �� &0 includenonmatches includeNonMatches	  	!�	! o  	��  0 includematches includeMatches�  �  	 	"	#	" = 	$	%	$ o  �� 0 matchformat matchFormat	% m  �

�
 SerECmpC	# 	&	'	& P  +	(	)�		( L   *	*	* I   )�	+�� 0 	_findtext 	_findText	+ 	,	-	, o  !"�� 0 thetext theText	- 	.	/	. o  "#�� 0 fortext forText	/ 	0	1	0 o  #$�� &0 includenonmatches includeNonMatches	1 	2�	2 o  $%��  0 includematches includeMatches�  �  	) �	3
� conscase	3 � 	4
�  consdiac	4 ��	5
�� conshyph	5 ��	6
�� conspunc	6 ��	7
�� conswhit	7 ����
�� consnume��  �	  	' 	8	9	8 = .3	:	;	: o  ./���� 0 matchformat matchFormat	; m  /2��
�� SerECmpE	9 	<	=	< P  6J	>	?	@	> L  ?I	A	A I  ?H��	B���� 0 	_findtext 	_findText	B 	C	D	C o  @A���� 0 thetext theText	D 	E	F	E o  AB���� 0 fortext forText	F 	G	H	G o  BC���� &0 includenonmatches includeNonMatches	H 	I��	I o  CD����  0 includematches includeMatches��  ��  	? ��	J
�� conscase	J ��	K
�� consdiac	K ��	L
�� conshyph	L ��	M
�� conspunc	M ����
�� conswhit��  	@ ����
�� consnume��  	= 	N	O	N = MR	P	Q	P o  MN���� 0 matchformat matchFormat	Q m  NQ��
�� SerECmpD	O 	R��	R k  U}	S	S 	T	U	T l Ur	V	W	X	V Z Ur	Y	Z����	Y = UZ	[	\	[ o  UV���� 0 fortext forText	\ m  VY	]	] �	^	^  	Z n ]n	_	`	_ I  bn��	a���� .0 throwinvalidparameter throwInvalidParameter	a 	b	c	b o  bc���� 0 fortext forText	c 	d	e	d m  cf	f	f �	g	g  f o r	e 	h	i	h m  fg��
�� 
ctxt	i 	j��	j m  gj	k	k �	l	l ~ O n l y   c o n t a i n s   c h a r a c t e r s   i g n o r e d   b y   t h e   c u r r e n t   c o n s i d e r a t i o n s .��  ��  	` o  ]b���� 0 _support  ��  ��  	W�� checks if all characters in forText are ignored by current considering/ignoring settings (the alternative would be to return each character as a non-match separated by a zero-length match, but that's probably not what the user intended); note that unlike `aString's length = 0`, which is what library code normally uses to check for empty text, on this occasion we do want to take into account the current considering/ignoring settings so deliberately use `forText is ""` here. For example, when ignoring punctuation, searching for the TID `"!?"` is no different to searching for `""`, because all of its characters are being ignored when comparing the text being searched against the text being searched for. Thus, a simple `forText is ""` test can be used to check in advance if the text contains any matchable characters under the current considering/ignoring settings, and report a meaningful error if not.   	X �	m	m   c h e c k s   i f   a l l   c h a r a c t e r s   i n   f o r T e x t   a r e   i g n o r e d   b y   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s   ( t h e   a l t e r n a t i v e   w o u l d   b e   t o   r e t u r n   e a c h   c h a r a c t e r   a s   a   n o n - m a t c h   s e p a r a t e d   b y   a   z e r o - l e n g t h   m a t c h ,   b u t   t h a t ' s   p r o b a b l y   n o t   w h a t   t h e   u s e r   i n t e n d e d ) ;   n o t e   t h a t   u n l i k e   ` a S t r i n g ' s   l e n g t h   =   0 ` ,   w h i c h   i s   w h a t   l i b r a r y   c o d e   n o r m a l l y   u s e s   t o   c h e c k   f o r   e m p t y   t e x t ,   o n   t h i s   o c c a s i o n   w e   d o   w a n t   t o   t a k e   i n t o   a c c o u n t   t h e   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s   s o   d e l i b e r a t e l y   u s e   ` f o r T e x t   i s   " " `   h e r e .   F o r   e x a m p l e ,   w h e n   i g n o r i n g   p u n c t u a t i o n ,   s e a r c h i n g   f o r   t h e   T I D   ` " ! ? " `   i s   n o   d i f f e r e n t   t o   s e a r c h i n g   f o r   ` " " ` ,   b e c a u s e   a l l   o f   i t s   c h a r a c t e r s   a r e   b e i n g   i g n o r e d   w h e n   c o m p a r i n g   t h e   t e x t   b e i n g   s e a r c h e d   a g a i n s t   t h e   t e x t   b e i n g   s e a r c h e d   f o r .   T h u s ,   a   s i m p l e   ` f o r T e x t   i s   " " `   t e s t   c a n   b e   u s e d   t o   c h e c k   i n   a d v a n c e   i f   t h e   t e x t   c o n t a i n s   a n y   m a t c h a b l e   c h a r a c t e r s   u n d e r   t h e   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s ,   a n d   r e p o r t   a   m e a n i n g f u l   e r r o r   i f   n o t .	U 	n��	n L  s}	o	o I  s|��	p���� 0 	_findtext 	_findText	p 	q	r	q o  tu���� 0 thetext theText	r 	s	t	s o  uv���� 0 fortext forText	t 	u	v	u o  vw���� &0 includenonmatches includeNonMatches	v 	w��	w o  wx����  0 includematches includeMatches��  ��  ��  ��  	  n ��	x	y	x I  ����	z���� >0 throwinvalidconstantparameter throwInvalidConstantParameter	z 	{	|	{ o  ������ 0 matchformat matchFormat	| 	}��	} m  ��	~	~ �		 
 u s i n g��  ��  	y o  ������ 0 _support  �&  �   find matches   � �	�	�    f i n d   m a t c h e s�Y  � l �L	�	�	�	� k  �L	�	� 	�	�	� Z ��	�	�����	� =  ��	�	�	� n ��	�	�	� 1  ����
�� 
leng	� o  ������ 0 thetext theText	� m  ������  	� L  ��	�	� m  ��	�	� �	�	�  ��  ��  	� 	���	� Z  �L	�	�	�	�	� = ��	�	�	� o  ������ 0 matchformat matchFormat	� m  ����
�� SerECmpI	� P  ��	�	�	�	� L  ��	�	� I  ����	����� 0 _replacetext _replaceText	� 	�	�	� o  ������ 0 thetext theText	� 	�	�	� o  ������ 0 fortext forText	� 	���	� o  ������ 0 newtext newText��  ��  	� ��	�
�� consdiac	� ��	�
�� conshyph	� ��	�
�� conspunc	� ��	�
�� conswhit	� ����
�� consnume��  	� ����
�� conscase��  	� 	�	�	� = ��	�	�	� o  ������ 0 matchformat matchFormat	� m  ����
�� SerECmpP	� 	�	�	� L  ��	�	� I  ����	����� "0 _replacepattern _replacePattern	� 	�	�	� o  ������ 0 thetext theText	� 	�	�	� o  ������ 0 fortext forText	� 	���	� o  ������ 0 newtext newText��  ��  	� 	�	�	� = ��	�	�	� o  ������ 0 matchformat matchFormat	� m  ����
�� SerECmpE	� 	�	�	� P  ��	�	�	�	� L  ��	�	� I  ����	����� 0 _replacetext _replaceText	� 	�	�	� o  ������ 0 thetext theText	� 	�	�	� o  ������ 0 fortext forText	� 	���	� o  ������ 0 newtext newText��  ��  	� ��	�
�� conscase	� ��	�
�� consdiac	� ��	�
�� conshyph	� ��	�
�� conspunc	� ����
�� conswhit��  	� ����
�� consnume��  	� 	�	�	� = ��	�	�	� o  ������ 0 matchformat matchFormat	� m  ����
�� SerECmpC	� 	�	�	� P  �
	�	���	� L   		�	� I   ��	����� 0 _replacetext _replaceText	� 	�	�	� o  ���� 0 thetext theText	� 	�	�	� o  ���� 0 fortext forText	� 	���	� o  ���� 0 newtext newText��  ��  	� ��	�
�� conscase	� ��	�
�� consdiac	� ��	�
�� conshyph	� ��	�
�� conspunc	� ��	�
�� conswhit	� ����
�� consnume��  ��  	� 	�	�	� = 	�	�	� o  ���� 0 matchformat matchFormat	� m  ��
�� SerECmpD	� 	���	� k  <	�	� 	�	�	� Z 2	�	�����	� = 	�	�	� o  ���� 0 fortext forText	� m  	�	� �	�	�  	� n .	�	�	� I  ".��	����� .0 throwinvalidparameter throwInvalidParameter	� 	�	�	� o  "#���� 0 fortext forText	� 	�	�	� m  #&	�	� �	�	�  f o r	� 	�	�	� m  &'��
�� 
ctxt	� 	���	� m  '*	�	� �	�	� ~ O n l y   c o n t a i n s   c h a r a c t e r s   i g n o r e d   b y   t h e   c u r r e n t   c o n s i d e r a t i o n s .��  ��  	� o  "���� 0 _support  ��  ��  	� 	���	� L  3<	�	� I  3;��	����� 0 _replacetext _replaceText	� 	�	�	� o  45���� 0 thetext theText	� 	�	�	� o  56���� 0 fortext forText	� 	���	� o  67���� 0 newtext newText��  ��  ��  ��  	� n ?L	�	�	� I  DL�
 �~� >0 throwinvalidconstantparameter throwInvalidConstantParameter
  


 o  DE�}�} 0 matchformat matchFormat
 
�|
 m  EH

 �

 
 u s i n g�|  �~  	� o  ?D�{�{ 0 _support  ��  	�   replace matches   	� �

     r e p l a c e   m a t c h e s�Z  m R      �z


�z .ascrerr ****      � ****
 o      �y�y 0 etext eText
 �x
	


�x 
errn
	 o      �w�w 0 enumber eNumber

 �v


�v 
erob
 o      �u�u 0 efrom eFrom
 �t
�s
�t 
errt
 o      �r�r 
0 eto eTo�s  n I  Tb�q
�p�q 
0 _error  
 


 m  UX

 �

  s e a r c h   t e x t
 


 o  XY�o�o 0 etext eText
 


 o  YZ�n�n 0 enumber eNumber
 


 o  Z[�m�m 0 efrom eFrom
 
�l
 o  [\�k�k 
0 eto eTo�l  �p  V 


 l     �j�i�h�j  �i  �h  
 


 l     �g�f�e�g  �f  �e  
 


 i  r u
 
!
  I     �d
"�c
�d .Txt:EPatnull���     ctxt
" o      �b�b 0 thetext theText�c  
! Q     *
#
$
%
# L    
&
& c    
'
(
' l   
)�a�`
) n   
*
+
* I    �_
,�^�_ 40 escapedpatternforstring_ escapedPatternForString_
, 
-�]
- l   
.�\�[
. n   
/
0
/ I    �Z
1�Y�Z "0 astextparameter asTextParameter
1 
2
3
2 o    �X�X 0 thetext theText
3 
4�W
4 m    
5
5 �
6
6  �W  �Y  
0 o    �V�V 0 _support  �\  �[  �]  �^  
+ n   
7
8
7 o    �U�U *0 nsregularexpression NSRegularExpression
8 m    �T
�T misccura�a  �`  
( m    �S
�S 
ctxt
$ R      �R
9
:
�R .ascrerr ****      � ****
9 o      �Q�Q 0 etext eText
: �P
;
<
�P 
errn
; o      �O�O 0 enumber eNumber
< �N
=
>
�N 
erob
= o      �M�M 0 efrom eFrom
> �L
?�K
�L 
errt
? o      �J�J 
0 eto eTo�K  
% I     *�I
@�H�I 
0 _error  
@ 
A
B
A m   ! "
C
C �
D
D  e s c a p e   p a t t e r n
B 
E
F
E o   " #�G�G 0 etext eText
F 
G
H
G o   # $�F�F 0 enumber eNumber
H 
I
J
I o   $ %�E�E 0 efrom eFrom
J 
K�D
K o   % &�C�C 
0 eto eTo�D  �H  
 
L
M
L l     �B�A�@�B  �A  �@  
M 
N
O
N l     �?�>�=�?  �>  �=  
O 
P
Q
P i  v y
R
S
R I     �<
T�;
�< .Txt:ETemnull���     ctxt
T o      �:�: 0 thetext theText�;  
S Q     -
U
V
W
U L    
X
X I    �9
Y�8�9 0 	_jointext 	_joinText
Y 
Z
[
Z I    �7
\�6�7 0 
_splittext 
_splitText
\ 
]
^
] n   
_
`
_ I   
 �5
a�4�5 "0 astextparameter asTextParameter
a 
b
c
b o   
 �3�3 0 thetext theText
c 
d�2
d m    
e
e �
f
f  �2  �4  
` o    
�1�1 0 _support  
^ 
g�0
g m    
h
h �
i
i  \�0  �6  
[ 
j�/
j m    
k
k �
l
l  \ \�/  �8  
V R      �.
m
n
�. .ascrerr ****      � ****
m o      �-�- 0 etext eText
n �,
o
p
�, 
errn
o o      �+�+ 0 enumber eNumber
p �*
q
r
�* 
erob
q o      �)�) 0 efrom eFrom
r �(
s�'
�( 
errt
s o      �&�& 
0 eto eTo�'  
W I   # -�%
t�$�% 
0 _error  
t 
u
v
u m   $ %
w
w �
x
x  e s c a p e   t e m p l a t e
v 
y
z
y o   % &�#�# 0 etext eText
z 
{
|
{ o   & '�"�" 0 enumber eNumber
| 
}
~
} o   ' (�!�! 0 efrom eFrom
~ 
� 
 o   ( )�� 
0 eto eTo�   �$  
Q 
�
�
� l     ����  �  �  
� 
�
�
� l     ����  �  �  
� 
�
�
� l     �
�
��  
� J D--------------------------------------------------------------------   
� �
�
� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
� 
�
�
� l     �
�
��  
�   Conversion Suite   
� �
�
� "   C o n v e r s i o n   S u i t e
� 
�
�
� l     ����  �  �  
� 
�
�
� i  z }
�
�
� I     �
�
�
� .Txt:UppTnull���     ctxt
� o      �� 0 thetext theText
� �
��
� 
Loca
� |��
��
��  �  
� o      �� 0 
localecode 
localeCode�  
� m      �
� 
msng�  
� Q     P
�
�
�
� k    >
�
� 
�
�
� r    
�
�
� n   
�
�
� I    �

��	�
 0 
asnsstring 
asNSString
� 
��
� n   
�
�
� I    �
��� "0 astextparameter asTextParameter
� 
�
�
� o    �� 0 thetext theText
� 
��
� m    
�
� �
�
�  �  �  
� o    �� 0 _support  �  �	  
� o    �� 0 _support  
� o      �� 0 
asocstring 
asocString
� 
�� 
� Z    >
�
���
�
� =   
�
�
� o    ���� 0 
localecode 
localeCode
� m    ��
�� 
msng
� L     (
�
� c     '
�
�
� l    %
�����
� n    %
�
�
� I   ! %�������� "0 uppercasestring uppercaseString��  ��  
� o     !���� 0 
asocstring 
asocString��  ��  
� m   % &��
�� 
ctxt��  
� L   + >
�
� c   + =
�
�
� l  + ;
�����
� n  + ;
�
�
� I   , ;��
����� 80 uppercasestringwithlocale_ uppercaseStringWithLocale_
� 
���
� l  , 7
�����
� n  , 7
�
�
� I   1 7��
����� *0 asnslocaleparameter asNSLocaleParameter
� 
�
�
� o   1 2���� 0 
localecode 
localeCode
� 
���
� m   2 3
�
� �
�
�  f o r   l o c a l e��  ��  
� o   , 1���� 0 _support  ��  ��  ��  ��  
� o   + ,���� 0 
asocstring 
asocString��  ��  
� m   ; <��
�� 
ctxt�   
� R      ��
�
�
�� .ascrerr ****      � ****
� o      ���� 0 etext eText
� ��
�
�
�� 
errn
� o      ���� 0 enumber eNumber
� ��
�
�
�� 
erob
� o      ���� 0 efrom eFrom
� ��
���
�� 
errt
� o      ���� 
0 eto eTo��  
� I   F P��
����� 
0 _error  
� 
�
�
� m   G H
�
� �
�
�  u p p e r c a s e   t e x t
� 
�
�
� o   H I���� 0 etext eText
� 
�
�
� o   I J���� 0 enumber eNumber
� 
�
�
� o   J K���� 0 efrom eFrom
� 
���
� o   K L���� 
0 eto eTo��  ��  
� 
�
�
� l     ��������  ��  ��  
� 
�
�
� l     ��������  ��  ��  
� 
�
�
� i  ~ �
�
�
� I     ��
�
�
�� .Txt:CapTnull���     ctxt
� o      ���� 0 thetext theText
� ��
���
�� 
Loca
� |����
���
���  ��  
� o      ���� 0 
localecode 
localeCode��  
� m      ��
�� 
msng��  
� Q     P
�
�
�
� k    >
�
� 
�
�
� r    
�
�
� n   
�
�
� I    ��
����� 0 
asnsstring 
asNSString
� 
���
� n   
�
�
� I    ��
����� "0 astextparameter asTextParameter
� 
�
�
� o    ���� 0 thetext theText
� 
���
� m    
�
� �
�
�  ��  ��  
� o    ���� 0 _support  ��  ��  
� o    ���� 0 _support  
� o      ���� 0 
asocstring 
asocString
� 
���
� Z    >
� ��
� =    o    ���� 0 
localecode 
localeCode m    ��
�� 
msng  L     ( c     ' l    %���� n    %	 I   ! %�������� &0 capitalizedstring capitalizedString��  ��  	 o     !���� 0 
asocstring 
asocString��  ��   m   % &��
�� 
ctxt��   L   + >

 c   + = l  + ;���� n  + ; I   , ;������ <0 capitalizedstringwithlocale_ capitalizedStringWithLocale_ �� l  , 7���� n  , 7 I   1 7������ *0 asnslocaleparameter asNSLocaleParameter  o   1 2���� 0 
localecode 
localeCode �� m   2 3 �  f o r   l o c a l e��  ��   o   , 1���� 0 _support  ��  ��  ��  ��   o   + ,���� 0 
asocstring 
asocString��  ��   m   ; <��
�� 
ctxt��  
� R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber �� 
�� 
erob o      ���� 0 efrom eFrom  ��!��
�� 
errt! o      ���� 
0 eto eTo��  
� I   F P��"���� 
0 _error  " #$# m   G H%% �&&  c a p i t a l i z e   t e x t$ '(' o   H I���� 0 etext eText( )*) o   I J���� 0 enumber eNumber* +,+ o   J K���� 0 efrom eFrom, -��- o   K L���� 
0 eto eTo��  ��  
� ./. l     ��������  ��  ��  / 010 l     ��������  ��  ��  1 232 i  � �454 I     ��67
�� .Txt:LowTnull���     ctxt6 o      ���� 0 thetext theText7 ��8��
�� 
Loca8 |����9��:��  ��  9 o      ���� 0 
localecode 
localeCode��  : m      ��
�� 
msng��  5 Q     P;<=; k    >>> ?@? r    ABA n   CDC I    ��E���� 0 
asnsstring 
asNSStringE F��F n   GHG I    ��I���� "0 astextparameter asTextParameterI JKJ o    ���� 0 thetext theTextK L��L m    MM �NN  ��  ��  H o    �� 0 _support  ��  ��  D o    �~�~ 0 _support  B o      �}�} 0 
asocstring 
asocString@ O�|O Z    >PQ�{RP =   STS o    �z�z 0 
localecode 
localeCodeT m    �y
�y 
msngQ L     (UU c     'VWV l    %X�x�wX n    %YZY I   ! %�v�u�t�v "0 lowercasestring lowercaseString�u  �t  Z o     !�s�s 0 
asocstring 
asocString�x  �w  W m   % &�r
�r 
ctxt�{  R L   + >[[ c   + =\]\ l  + ;^�q�p^ n  + ;_`_ I   , ;�oa�n�o 80 lowercasestringwithlocale_ lowercaseStringWithLocale_a b�mb l  , 7c�l�kc n  , 7ded I   1 7�jf�i�j *0 asnslocaleparameter asNSLocaleParameterf ghg o   1 2�h�h 0 
localecode 
localeCodeh i�gi m   2 3jj �kk  f o r   l o c a l e�g  �i  e o   , 1�f�f 0 _support  �l  �k  �m  �n  ` o   + ,�e�e 0 
asocstring 
asocString�q  �p  ] m   ; <�d
�d 
ctxt�|  < R      �clm
�c .ascrerr ****      � ****l o      �b�b 0 etext eTextm �ano
�a 
errnn o      �`�` 0 enumber eNumbero �_pq
�_ 
erobp o      �^�^ 0 efrom eFromq �]r�\
�] 
errtr o      �[�[ 
0 eto eTo�\  = I   F P�Zs�Y�Z 
0 _error  s tut m   G Hvv �ww  l o w e r c a s e   t e x tu xyx o   H I�X�X 0 etext eTexty z{z o   I J�W�W 0 enumber eNumber{ |}| o   J K�V�V 0 efrom eFrom} ~�U~ o   K L�T�T 
0 eto eTo�U  �Y  3 � l     �S�R�Q�S  �R  �Q  � ��� l     �P�O�N�P  �O  �N  � ��� i  � ���� I     �M��
�M .Txt:FTxtnull���     ctxt� o      �L�L 0 templatetext templateText� �K��J
�K 
Usin� |�I�H��G��I  �H  � o      �F�F 0 	thevalues 	theValues�G  � J      �E�E  �J  � Q     ����� P    ����� k    ��� ��� r    ��� I    �D��C�D ,0 _parseformattemplate _parseFormatTemplate� ��B� n  	 ��� I    �A��@�A "0 astextparameter asTextParameter� ��� o    �?�? 0 templatetext templateText� ��>� m    �� ���  �>  �@  � o   	 �=�= 0 _support  �B  �C  � o      �<�< 0 templateitems templateItems� ��� r    ��� m    �;�; � o      �:�: 0 i  � ��� Q    ����� Z   " ����9�� =   " -��� l  " +��8�7� I  " +�6��
�6 .corecnte****       ****� J   " %�� ��5� o   " #�4�4 0 	thevalues 	theValues�5  � �3��2
�3 
kocl� m   & '�1
�1 
scpt�2  �8  �7  � m   + ,�0�0 � l  0 S���� Y   0 S��/���� r   = N��� c   = I��� n  = G��� I   > G�.��-�. 0 getitem getItem� ��,� e   > C�� n   > C��� 4   ? B�+�
�+ 
cobj� o   @ A�*�* 0 i  � o   > ?�)�) 0 templateitems templateItems�,  �-  � o   = >�(�( 0 	thevalues 	theValues� m   G H�'
�' 
ctxt� n      ��� 4   J M�&�
�& 
cobj� o   K L�%�% 0 i  � o   I J�$�$ 0 templateitems templateItems�/ 0 i  � m   3 4�#�# � n  4 8��� 1   5 7�"
�" 
leng� o   4 5�!�! 0 templateitems templateItems� m   8 9� �  � S M assume it's a script object with getItem handler (e.g. DictionaryCollection)   � ��� �   a s s u m e   i t ' s   a   s c r i p t   o b j e c t   w i t h   g e t I t e m   h a n d l e r   ( e . g .   D i c t i o n a r y C o l l e c t i o n )�9  � l  V ����� k   V ��� ��� r   V c��� n  V a��� I   [ a���� "0 aslistparameter asListParameter� ��� o   [ \�� 0 	thevalues 	theValues� ��� m   \ ]�� ��� 
 u s i n g�  �  � o   V [�� 0 _support  � o      �� 0 	thevalues 	theValues� ��� Y   d ������� r   q ���� c   q ~��� l  q |���� e   q |�� n  q |��� 4   r {��
� 
cobj� l  s z���� c   s z��� l  s x���� e   s x�� n   s x��� 4   t w��
� 
cobj� o   u v�� 0 i  � o   s t�� 0 templateitems templateItems�  �  � m   x y�
� 
long�  �  � o   q r�� 0 	thevalues 	theValues�  �  � m   | }�
� 
ctxt� n      ��� 4    ��
�
�
 
cobj� o   � ��	�	 0 i  � o   ~ �� 0 templateitems templateItems� 0 i  � m   g h�� � n  h l��� 1   i k�
� 
leng� o   h i�� 0 templateitems templateItems� m   l m�� �  � * $ it's a list (or a single-item list)   � ��� H   i t ' s   a   l i s t   ( o r   a   s i n g l e - i t e m   l i s t )� R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      � �  0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �� ��
�� 
errt  o      ���� 
0 eto eTo��  � R   � ���
�� .ascrerr ****      � **** b   � � b   � � b   � � m   � �		 �

 : C a n  t   s u b s i t u t e   p l a c e h o l d e r    n   � � 4   � ���
�� 
cobj o   � ����� 0 i   o   � ����� 0 templateitems templateItems m   � � �   :   o   � ����� 0 etext eText ��
�� 
errn o   � ����� 0 enumber eNumber ��
�� 
erob o   � ����� 0 efrom eFrom ����
�� 
errt o   � ����� 
0 eto eTo��  � �� L   � � I   � ������� 0 	_jointext 	_joinText  o   � ����� 0 templateitems templateItems �� m   � � �  ��  ��  ��  � ��
�� conscase ��
�� consdiac ��
�� conshyph �� 
�� conspunc  ����
�� conswhit��  � ����
�� consnume��  � R      ��!"
�� .ascrerr ****      � ****! o      ���� 0 etext eText" ��#$
�� 
errn# o      ���� 0 enumber eNumber$ ��%&
�� 
erob% o      ���� 0 efrom eFrom& ��'��
�� 
errt' o      ���� 
0 eto eTo��  � I   � ���(���� 
0 _error  ( )*) m   � �++ �,,  f o r m a t   t e x t* -.- o   � ����� 0 etext eText. /0/ o   � ����� 0 enumber eNumber0 121 o   � ����� 0 efrom eFrom2 3��3 o   � ����� 
0 eto eTo��  ��  � 454 l     ��������  ��  ��  5 676 l     ��������  ��  ��  7 898 i  � �:;: I     ��<=
�� .Txt:Normnull���     ctxt< o      ���� 0 thetext theText= ��>?
�� 
NoFo> |����@��A��  ��  @ o      ���� 0 nopts nOpts��  A J      BB C��C m      ��
�� LiBrLiOX��  ? ��D��
�� 
LocaD |����E��F��  ��  E o      ���� 0 
localecode 
localeCode��  F l     G����G m      HH �II  n o n e��  ��  ��  ; Q    JKLJ k   iMM NON r    PQP n   RSR I    ��T���� "0 astextparameter asTextParameterT UVU o    	���� 0 thetext theTextV W��W m   	 
XX �YY  ��  ��  S o    ���� 0 _support  Q o      ���� 0 thetext theTextO Z[Z r    \]\ n   ^_^ I    ��`���� "0 aslistparameter asListParameter` aba o    ���� 0 nopts nOptsb c��c m    dd �ee 
 u s i n g��  ��  _ o    ���� 0 _support  ] o      ���� 0 nopts nOpts[ fgf l   ��hi��  h   common case shortcuts   i �jj ,   c o m m o n   c a s e   s h o r t c u t sg klk Z   -mn����m =    $opo n   "qrq 1     "��
�� 
lengr o     ���� 0 thetext theTextp m   " #����  n L   ' )ss m   ' (tt �uu  ��  ��  l vwv Z  . Dxy����x =  . 3z{z o   . /���� 0 nopts nOpts{ J   / 2|| }��} m   / 0��
�� LiBrLiOX��  y L   6 @~~ I   6 ?������ 0 	_jointext 	_joinText ��� n  7 :��� 2  8 :��
�� 
cpar� o   7 8���� 0 thetext theText� ���� 1   : ;��
�� 
lnfd��  ��  ��  ��  w ��� Z  E R������� =  E I��� o   E F���� 0 nopts nOpts� J   F H����  � L   L N�� o   L M���� 0 thetext theText��  ��  � ��� l  S S������  � &   else fully process options list   � ��� @   e l s e   f u l l y   p r o c e s s   o p t i o n s   l i s t� ��� Q   Sb���� k   VG�� ��� Z   V g������ E  V [��� o   V W���� 0 nopts nOpts� J   W Z�� ���� m   W X��
�� LiBrLiOX��  � r   ^ a��� 1   ^ _��
�� 
lnfd� o      ���� 0 	linebreak 	lineBreak��  � r   d g��� m   d e��
�� 
msng� o      ���� 0 	linebreak 	lineBreak� ��� Z   h �������� E  h m��� o   h i���� 0 nopts nOpts� J   i l�� ���� m   i j��
�� LiBrLiCM��  � k   p ��� ��� Z  p �������� >  p s��� o   p q���� 0 	linebreak 	lineBreak� m   q r��
�� 
msng� R   v |����
�� .ascrerr ****      � ****� m   z {�� ��� > C o n f l i c t i n g   l i n e   b r e a k   o p t i o n s .� �����
�� 
errn� m   x y����f��  ��  ��  � ��� Z  � �������� =   � ���� n  � ���� 1   � ���
�� 
leng� o   � ��� 0 nopts nOpts� m   � ��~�~ � L   � ��� I   � ��}��|�} 0 	_jointext 	_joinText� ��� n  � ���� 2  � ��{
�{ 
cpar� o   � ��z�z 0 thetext theText� ��y� o   � ��x
�x 
ret �y  �|  ��  ��  � ��w� r   � ���� o   � ��v
�v 
ret � o      �u�u 0 	linebreak 	lineBreak�w  ��  ��  � ��� Z   � ����t�s� E  � ���� o   � ��r�r 0 nopts nOpts� J   � ��� ��q� m   � ��p
�p LiBrLiWi�q  � k   � ��� ��� Z  � ����o�n� >  � ���� o   � ��m�m 0 	linebreak 	lineBreak� m   � ��l
�l 
msng� R   � ��k��
�k .ascrerr ****      � ****� m   � ��� ��� > C o n f l i c t i n g   l i n e   b r e a k   o p t i o n s .� �j��i
�j 
errn� m   � ��h�hf�i  �o  �n  � ��� Z  � ����g�f� =   � ���� n  � ���� 1   � ��e
�e 
leng� o   � ��d�d 0 nopts nOpts� m   � ��c�c � L   � ��� I   � ��b��a�b 0 	_jointext 	_joinText� ��� n  � ���� 2  � ��`
�` 
cpar� o   � ��_�_ 0 thetext theText� ��^� b   � ���� o   � ��]
�] 
ret � 1   � ��\
�\ 
lnfd�^  �a  �g  �f  � ��[� r   � ���� b   � ���� o   � ��Z
�Z 
ret � 1   � ��Y
�Y 
lnfd� o      �X�X 0 	linebreak 	lineBreak�[  �t  �s  � ��� r   � ���� n  � ���� I   � ��W��V�W 0 
asnsstring 
asNSString� ��U� o   � ��T�T 0 thetext theText�U  �V  � o   � ��S�S 0 _support  � o      �R�R 0 
asocstring 
asocString� ��� l  � ��Q���Q  � , & fold case, diacriticals, and/or width   � �   L   f o l d   c a s e ,   d i a c r i t i c a l s ,   a n d / o r   w i d t h�  r   � � m   � ��P�P   o      �O�O 0 foldingflags foldingFlags  Z  ��N�M E  � �	
	 o   � ��L�L 0 nopts nOpts
 J   � � �K m   � ��J
�J NoFoNoCa�K   r   �  [   � � o   � ��I�I 0 foldingflags foldingFlags m   � ��H�H  o      �G�G 0 foldingflags foldingFlags�N  �M    Z �F�E E  o  �D�D 0 nopts nOpts J   �C m  	�B
�B NoFoNoDi�C   r   [   o  �A�A 0 foldingflags foldingFlags m  �@�@ � o      �?�? 0 foldingflags foldingFlags�F  �E    Z 0 �>�= E "!"! o  �<�< 0 nopts nOpts" J  !## $�;$ m  �:
�: NoFoNoWi�;    r  %,%&% [  %*'(' o  %&�9�9 0 foldingflags foldingFlags( m  &)�8�8 & o      �7�7 0 foldingflags foldingFlags�>  �=   )*) Z 1P+,�6�5+ >  14-.- o  12�4�4 0 foldingflags foldingFlags. m  23�3�3  , r  7L/0/ n 7J121 I  8J�23�1�2 H0 "stringbyfoldingwithoptions_locale_ "stringByFoldingWithOptions_locale_3 454 o  89�0�0 0 foldingflags foldingFlags5 6�/6 l 9F7�.�-7 n 9F898 I  >F�,:�+�, *0 asnslocaleparameter asNSLocaleParameter: ;<; o  >?�*�* 0 
localecode 
localeCode< =�)= m  ?B>> �??  f o r   l o c a l e�)  �+  9 o  9>�(�( 0 _support  �.  �-  �/  �1  2 o  78�'�' 0 
asocstring 
asocString0 o      �&�& 0 
asocstring 
asocString�6  �5  * @A@ l QQ�%BC�%  B !  normalize white space runs   C �DD 6   n o r m a l i z e   w h i t e   s p a c e   r u n sA EFE Z  QGHI�$G E QXJKJ o  QR�#�# 0 nopts nOptsK J  RWLL M�"M m  RU�!
�! NoFoNoSp�"  H k  [�NN OPO l [yQRSQ r  [yTUT n [wVWV I  \w� X��  �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_X YZY m  \_[[ �\\ ^ \ A ( ? : \ u 2 0 2 8 | \ u 2 0 2 9 | \ s ) + | ( ? : \ u 2 0 2 8 | \ u 2 0 2 9 | \ s ) + \ zZ ]^] m  _b__ �``  ^ aba l bic��c n bided o  ei�� 60 nsregularexpressionsearch NSRegularExpressionSearche m  be�
� misccura�  �  b f�f J  iqgg hih m  ij��  i j�j n joklk I  ko���� 
0 length  �  �  l o  jk�� 0 
asocstring 
asocString�  �  �  W o  [\�� 0 
asocstring 
asocStringU o      �� 0 
asocstring 
asocStringR ( " trim leading/trailing white space   S �mm D   t r i m   l e a d i n g / t r a i l i n g   w h i t e   s p a c eP n�n Z  z�op�qo = z}rsr o  z{�� 0 	linebreak 	lineBreaks m  {|�
� 
msngp l ��tuvt r  ��wxw n ��yzy I  ���{�� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_{ |}| m  ��~~ � @ ( ? : \ r \ n | \ r | \ n | \ u 2 0 2 8 | \ u 2 0 2 9 | \ s ) +} ��� 1  ���
� 
spac� ��� l ����
�	� n ����� o  ���� 60 nsregularexpressionsearch NSRegularExpressionSearch� m  ���
� misccura�
  �	  � ��� J  ���� ��� m  ����  � ��� n ����� I  ������ 
0 length  �  �  � o  ��� �  0 
asocstring 
asocString�  �  �  z o  ������ 0 
asocstring 
asocStringx o      ���� 0 
asocstring 
asocStringu b \ also convert line breaks (including Unicode line and paragraph separators) to single spaces   v ��� �   a l s o   c o n v e r t   l i n e   b r e a k s   ( i n c l u d i n g   U n i c o d e   l i n e   a n d   p a r a g r a p h   s e p a r a t o r s )   t o   s i n g l e   s p a c e s�  q l ������ k  ���� ��� r  ����� n ����� I  ��������� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_� ��� m  ���� ��� N ( ? : \ s * ( ? : \ r \ n | \ r | \ n | \ u 2 0 2 8 | \ u 2 0 2 9 ) ) + \ s *� ��� o  ������ 0 	linebreak 	lineBreak� ��� l �������� n ����� o  ������ 60 nsregularexpressionsearch NSRegularExpressionSearch� m  ����
�� misccura��  ��  � ���� J  ���� ��� m  ������  � ���� n ����� I  ���������� 
0 length  ��  ��  � o  ������ 0 
asocstring 
asocString��  ��  ��  � o  ������ 0 
asocstring 
asocString� o      ���� 0 
asocstring 
asocString� ���� r  ����� n ����� I  ��������� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_� ��� m  ���� ���  [ \ f \ t \ p { Z } ] +� ��� 1  ����
�� 
spac� ��� l �������� n ����� o  ������ 60 nsregularexpressionsearch NSRegularExpressionSearch� m  ����
�� misccura��  ��  � ���� J  ���� ��� m  ������  � ���� n ����� I  ���������� 
0 length  ��  ��  � o  ������ 0 
asocstring 
asocString��  ��  ��  � o  ������ 0 
asocstring 
asocString� o      ���� 0 
asocstring 
asocString��  � � � convert line break runs (including any other white space) to single `lineBreak`, and any other white space runs (tabs, spaces, etc) to single spaces   � ���*   c o n v e r t   l i n e   b r e a k   r u n s   ( i n c l u d i n g   a n y   o t h e r   w h i t e   s p a c e )   t o   s i n g l e   ` l i n e B r e a k ` ,   a n d   a n y   o t h e r   w h i t e   s p a c e   r u n s   ( t a b s ,   s p a c e s ,   e t c )   t o   s i n g l e   s p a c e s�  I ��� > ����� o  ������ 0 	linebreak 	lineBreak� m  ����
�� 
msng� ���� l ����� r  ���� n ����� I  ��������� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_� ��� m  ���� ��� 0 \ r \ n | \ r | \ n | \ u 2 0 2 8 | \ u 2 0 2 9� ��� o  ������ 0 	linebreak 	lineBreak� ��� l �������� n ����� o  ������ 60 nsregularexpressionsearch NSRegularExpressionSearch� m  ����
�� misccura��  ��  � ���� J  ���� ��� m  ������  � ���� n ����� I  ���������� 
0 length  ��  ��  � o  ������ 0 
asocstring 
asocString��  ��  ��  � o  ������ 0 
asocstring 
asocString� o      ���� 0 
asocstring 
asocString�   standardize line breaks   � ��� 0   s t a n d a r d i z e   l i n e   b r e a k s��  �$  F ��� l ������  � 8 2 apply punctuation, ASCII-only transforms (10.11+)   � ��� d   a p p l y   p u n c t u a t i o n ,   A S C I I - o n l y   t r a n s f o r m s   ( 1 0 . 1 1 + )� ��� Z  ������� E ��� o  ���� 0 nopts nOpts� J  �� ���� m  
��
�� NoFoNoSP��  � k  @�� ��� Z 4������� G  %��� E ��� o  ���� 0 nopts nOpts� J  �� ���� m  ��
�� NoFoNoTP��  � E !��� o  ���� 0 nopts nOpts� J      �� m  ��
�� NoFoNoAO��  � R  (0��
�� .ascrerr ****      � **** m  ,/ � J C o n f l i c t i n g   p u n c t u a t i o n / A S C I I   o p t i o n s ����
�� 
errn m  *+����f��  ��  ��  � �� r  5@	 n 5>

 I  6>������ H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_  l 69���� m  69 �  A n y - P u b l i s h i n g��  ��   �� m  9:��
�� boovfals��  ��   o  56���� 0 
asocstring 
asocString	 o      ���� 0 
asocstring 
asocString��  �  E CJ o  CD���� 0 nopts nOpts J  DI �� m  DG��
�� NoFoNoTP��    k  Mo  Z Mc���� E MT !  o  MN���� 0 nopts nOpts! J  NS"" #��# m  NQ��
�� NoFoNoAO��   R  W_��$%
�� .ascrerr ****      � ****$ m  [^&& �'' L C o n f l i c t i n g   p u n c t u a t i o n / A S C I I   o p t i o n s .% ��(��
�� 
errn( m  YZ����f��  ��  ��   )��) r  do*+* n dm,-, I  em��.���� H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_. /0/ l eh1����1 m  eh22 �33  P u b l i s h i n g - A n y��  ��  0 4��4 m  hi��
�� boovfals��  ��  - o  de���� 0 
asocstring 
asocString+ o      ���� 0 
asocstring 
asocString��   565 E ry787 o  rs���� 0 nopts nOpts8 J  sx99 :��: m  sv��
�� NoFoNoAO��  6 ;��; k  |�<< =>= r  |�?@? n |�ABA I  }���C���� H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_C DED l }�F����F m  }�GG �HH * A n y - L a t i n ; L a t i n - A S C I I��  ��  E I��I m  ����
�� boovfals��  ��  B o  |}���� 0 
asocstring 
asocString@ o      ���� 0 
asocstring 
asocString> J��J r  ��KLK n ��MNM I  ����O���� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_O PQP m  ��RR �SS , [ ^ \ r \ n \ t \ u 0 0 2 0 - \ u 0 0 7 e ]Q TUT m  ��VV �WW  ?U XYX l ��Z����Z n ��[\[ o  ������ 60 nsregularexpressionsearch NSRegularExpressionSearch\ m  ����
�� misccura��  ��  Y ]��] J  ��^^ _`_ m  ������  ` a��a n ��bcb I  ���������� 
0 length  ��  ��  c o  ������ 0 
asocstring 
asocString��  ��  ��  N o  ������ 0 
asocstring 
asocStringL o      �� 0 
asocstring 
asocString��  ��  ��  � ded l ���~fg�~  f 6 0 convert to specified Unicode normalization form   g �hh `   c o n v e r t   t o   s p e c i f i e d   U n i c o d e   n o r m a l i z a t i o n   f o r me iji Z  ��kl�}mk E ��non o  ���|�| 0 nopts nOptso J  ��pp q�{q m  ���z
�z NoFoNo_C�{  l k  ��rr sts r  ��uvu n ��wxw I  ���y�x�w�y N0 %precomposedstringwithcanonicalmapping %precomposedStringWithCanonicalMapping�x  �w  x o  ���v�v 0 
asocstring 
asocStringv o      �u�u 0 
asocstring 
asocStringt y�ty r  ��z{z m  ���s
�s boovtrue{ o      �r�r 0 didnormalize didNormalize�t  �}  m r  ��|}| m  ���q
�q boovfals} o      �p�p 0 didnormalize didNormalizej ~~ Z  �����o�n� E ����� o  ���m�m 0 nopts nOpts� J  ���� ��l� m  ���k
�k NoFoNo_D�l  � k  ���� ��� Z �����j�i� o  ���h�h 0 didnormalize didNormalize� R  ���g��
�g .ascrerr ****      � ****� m  ���� ��� 8 C o n f l i c t i n g   U n i c o d e   o p t i o n s .� �f��e
�f 
errn� m  ���d�df�e  �j  �i  � ��� r  ����� n ����� I  ���c�b�a�c L0 $decomposedstringwithcanonicalmapping $decomposedStringWithCanonicalMapping�b  �a  � o  ���`�` 0 
asocstring 
asocString� o      �_�_ 0 
asocstring 
asocString� ��^� r  ����� m  ���]
�] boovtrue� o      �\�\ 0 didnormalize didNormalize�^  �o  �n   ��� Z  ����[�Z� E ����� o  ���Y�Y 0 nopts nOpts� J  ���� ��X� m  ���W
�W NoFoNoKC�X  � k  ��� ��� Z ����V�U� o  ���T�T 0 didnormalize didNormalize� R   �S��
�S .ascrerr ****      � ****� m  �� ��� 8 C o n f l i c t i n g   U n i c o d e   o p t i o n s .� �R��Q
�R 
errn� m  �P�Pf�Q  �V  �U  � ��� r  ��� n ��� I  �O�N�M�O V0 )precomposedstringwithcompatibilitymapping )precomposedStringWithCompatibilityMapping�N  �M  � o  �L�L 0 
asocstring 
asocString� o      �K�K 0 
asocstring 
asocString� ��J� r  ��� m  �I
�I boovtrue� o      �H�H 0 didnormalize didNormalize�J  �[  �Z  � ��G� Z  G���F�E� E $��� o  �D�D 0 nopts nOpts� J  #�� ��C� m  !�B
�B NoFoNoKD�C  � k  'C�� ��� Z '7���A�@� o  '(�?�? 0 didnormalize didNormalize� R  +3�>��
�> .ascrerr ****      � ****� m  /2�� ��� 8 C o n f l i c t i n g   U n i c o d e   o p t i o n s .� �=��<
�= 
errn� m  -.�;�;f�<  �A  �@  � ��� r  8?��� n 8=��� I  9=�:�9�8�: T0 (decomposedstringwithcompatibilitymapping (decomposedStringWithCompatibilityMapping�9  �8  � o  89�7�7 0 
asocstring 
asocString� o      �6�6 0 
asocstring 
asocString� ��5� r  @C��� m  @A�4
�4 boovtrue� o      �3�3 0 didnormalize didNormalize�5  �F  �E  �G  � R      �2��
�2 .ascrerr ****      � ****� o      �1�1 0 etext eText� �0��/
�0 
errn� m      �.�.f�/  � n Ob��� I  Tb�-��,�- .0 throwinvalidparameter throwInvalidParameter� ��� o  TU�+�+ 0 nopts nOpts� ��� m  UX�� ��� 
 u s i n g� ��� m  X[�*
�* 
list� ��)� o  [\�(�( 0 etext eText�)  �,  � o  OT�'�' 0 _support  � ��&� L  ci�� c  ch��� o  cd�%�% 0 
asocstring 
asocString� m  dg�$
�$ 
ctxt�&  K R      �#��
�# .ascrerr ****      � ****� o      �"�" 0 etext eText� �!��
�! 
errn� o      � �  0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  L I  q���� 
0 _error  � ��� m  ru�� ���  n o r m a l i z e   t e x t� ��� o  uv�� 0 etext eText� ��� o  vw�� 0 enumber eNumber� ��� o  wx�� 0 efrom eFrom� ��� o  xy�� 
0 eto eTo�  �  9 ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  � ���� I     ���
� .Txt:PadTnull���     ctxt� o      �� 0 thetext theText� ���
� 
toPl� o      �
�
 0 	textwidth 	textWidth� �	 
�	 
Char  |����  �   o      �� 0 padtext padText�   l     �� m       �                                  �  �   ��
� 
From |� ����	�   ��   o      ���� 0 whichend whichEnd��  	 l     
����
 m      ��
�� LeTrLCha��  ��  �  � Q     k     r     n    I    ������ "0 astextparameter asTextParameter  o    	���� 0 thetext theText �� m   	 
 �  ��  ��   o    ���� 0 _support   o      ���� 0 thetext theText  r     n     I    ��!���� (0 asintegerparameter asIntegerParameter! "#" o    ���� 0 	textwidth 	textWidth# $��$ m    %% �&&  t o   p l a c e s��  ��    o    ���� 0 _support   o      ���� 0 	textwidth 	textWidth '(' r    &)*) \    $+,+ o     ���� 0 	textwidth 	textWidth, l    #-����- n    #./. 1   ! #��
�� 
leng/ o     !���� 0 thetext theText��  ��  * o      ���� 0 
widthtoadd 
widthToAdd( 010 Z  ' 323����2 B   ' *454 o   ' (���� 0 
widthtoadd 
widthToAdd5 m   ( )����  3 L   - /66 o   - .���� 0 thetext theText��  ��  1 787 r   4 A9:9 n  4 ?;<; I   9 ?��=���� "0 astextparameter asTextParameter= >?> o   9 :���� 0 padtext padText? @��@ m   : ;AA �BB 
 u s i n g��  ��  < o   4 9���� 0 _support  : o      ���� 0 padtext padText8 CDC r   B GEFE n  B EGHG 1   C E��
�� 
lengH o   B C���� 0 padtext padTextF o      ���� 0 padsize padSizeD IJI Z  H aKL����K =   H MMNM n  H KOPO 1   I K��
�� 
lengP o   H I���� 0 padtext padTextN m   K L����  L n  P ]QRQ I   U ]��S���� .0 throwinvalidparameter throwInvalidParameterS TUT o   U V���� 0 padtext padTextU VWV m   V WXX �YY 
 u s i n gW Z[Z m   W X��
�� 
ctxt[ \��\ m   X Y]] �^^ ( C a n  t   b e   e m p t y   t e x t .��  ��  R o   P U���� 0 _support  ��  ��  J _`_ V   b xaba r   n scdc b   n qefe o   n o���� 0 padtext padTextf o   o p���� 0 padtext padTextd o      ���� 0 padtext padTextb A   f mghg n  f iiji 1   g i��
�� 
lengj o   f g���� 0 padtext padTexth l  i lk����k [   i llml o   i j���� 0 
widthtoadd 
widthToAddm o   j k���� 0 padsize padSize��  ��  ` n��n Z   yopqro =  y |sts o   y z���� 0 whichend whichEndt m   z {��
�� LeTrLChap L    �uu b    �vwv l   �x����x n   �yzy 7  � ���{|
�� 
ctxt{ m   � ����� | o   � ����� 0 
widthtoadd 
widthToAddz o    ����� 0 padtext padText��  ��  w o   � ����� 0 thetext theTextq }~} =  � �� o   � ����� 0 whichend whichEnd� m   � ���
�� LeTrTCha~ ��� k   � ��� ��� r   � ���� `   � ���� l  � ������� n  � ���� 1   � ���
�� 
leng� o   � ����� 0 thetext theText��  ��  � o   � ����� 0 padsize padSize� o      ���� 0 	padoffset 	padOffset� ���� L   � ��� b   � ���� o   � ����� 0 thetext theText� l  � ������� n  � ���� 7  � �����
�� 
ctxt� l  � ������� [   � ���� m   � ����� � o   � ����� 0 	padoffset 	padOffset��  ��  � l  � ������� [   � ���� o   � ����� 0 	padoffset 	padOffset� o   � ����� 0 
widthtoadd 
widthToAdd��  ��  � o   � ����� 0 padtext padText��  ��  ��  � ��� =  � ���� o   � ����� 0 whichend whichEnd� m   � ���
�� LeTrBCha� ���� k   � ��� ��� Z  � �������� ?   � ���� o   � ����� 0 
widthtoadd 
widthToAdd� m   � ����� � r   � ���� b   � ���� n  � ���� 7  � �����
�� 
ctxt� m   � ����� � l  � ������� _   � ���� o   � ����� 0 
widthtoadd 
widthToAdd� m   � ����� ��  ��  � o   � ����� 0 padtext padText� o   � ����� 0 thetext theText� o      ���� 0 thetext theText��  ��  � ��� r   � ���� `   � ���� l  � ������� n  � ���� 1   � ���
�� 
leng� o   � ����� 0 thetext theText��  ��  � o   � ����� 0 padsize padSize� o      ���� 0 	padoffset 	padOffset� ���� L   � ��� b   � ���� o   � ����� 0 thetext theText� l  � ������� n  � ���� 7  � �����
�� 
ctxt� l  � ������� [   � ���� m   � ����� � o   � ����� 0 	padoffset 	padOffset��  ��  � l  � ������� [   � ���� o   � ����� 0 	padoffset 	padOffset� _   � ���� l  � ������� [   � ���� o   � ����� 0 
widthtoadd 
widthToAdd� m   � ����� ��  ��  � m   � ��� ��  ��  � o   � ��~�~ 0 padtext padText��  ��  ��  ��  r n  ���� I   ��}��|�} >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   � ��{�{ 0 whichend whichEnd� ��z� m   � ��� ���  a d d i n g�z  �|  � o   � ��y�y 0 _support  ��   R      �x��
�x .ascrerr ****      � ****� o      �w�w 0 etext eText� �v��
�v 
errn� o      �u�u 0 enumber eNumber� �t��
�t 
erob� o      �s�s 0 efrom eFrom� �r��q
�r 
errt� o      �p�p 
0 eto eTo�q   I  	�o��n�o 
0 _error  � ��� m  
�� ���  p a d   t e x t� ��� o  �m�m 0 etext eText� ��� o  �l�l 0 enumber eNumber� ��� o  �k�k 0 efrom eFrom� ��j� o  �i�i 
0 eto eTo�j  �n  � ��� l     �h�g�f�h  �g  �f  � ��� l     �e�d�c�e  �d  �c  � ��� i  � ���� I     �b��
�b .Txt:SliTnull���     ctxt� o      �a�a 0 thetext theText� �`��
�` 
FIdx� |�_�^��]��_  �^  � o      �\�\ 0 
startindex 
startIndex�]  � l     ��[�Z� m      �Y
�Y 
msng�[  �Z  � �X��W
�X 
TIdx� |�V�U��T��V  �U  � o      �S�S 0 endindex endIndex�T  � l     ��R�Q� m      �P
�P 
msng�R  �Q  �W  � Q    ��� � k   �  r     n    I    �O�N�O "0 astextparameter asTextParameter 	
	 o    	�M�M 0 thetext theText
 �L m   	 
 �  �L  �N   o    �K�K 0 _support   o      �J�J 0 thetext theText  r     n    1    �I
�I 
leng o    �H�H 0 thetext theText o      �G�G 0 	thelength 	theLength  Z    S�F�E =     o    �D�D 0 	thelength 	theLength m    �C�C   k    O  l   �B�B   � � note: index 0 is always disallowed as its position is ambiguous, being both before index 1 at start of text and after index -1 at end of text    �   n o t e :   i n d e x   0   i s   a l w a y s   d i s a l l o w e d   a s   i t s   p o s i t i o n   i s   a m b i g u o u s ,   b e i n g   b o t h   b e f o r e   i n d e x   1   a t   s t a r t   o f   t e x t   a n d   a f t e r   i n d e x   - 1   a t   e n d   o f   t e x t  !  Z   4"#�A�@" =     $%$ o    �?�? 0 
startindex 
startIndex% m    �>�>  # n  # 0&'& I   ( 0�=(�<�= .0 throwinvalidparameter throwInvalidParameter( )*) o   ( )�;�; 0 
startindex 
startIndex* +,+ m   ) *-- �..  f r o m, /0/ m   * +�:
�: 
long0 1�91 m   + ,22 �33 " I n d e x   c a n  t   b e   0 .�9  �<  ' o   # (�8�8 0 _support  �A  �@  ! 454 Z  5 L67�7�66 =   5 8898 o   5 6�5�5 0 endindex endIndex9 m   6 7�4�4  7 n  ; H:;: I   @ H�3<�2�3 .0 throwinvalidparameter throwInvalidParameter< =>= o   @ A�1�1 0 endindex endIndex> ?@? m   A BAA �BB  t o@ CDC m   B C�0
�0 
longD E�/E m   C DFF �GG " I n d e x   c a n  t   b e   0 .�/  �2  ; o   ; @�.�. 0 _support  �7  �6  5 H�-H L   M OII m   M NJJ �KK  �-  �F  �E   LML Z   T �NOP�,N >  T WQRQ o   T U�+�+ 0 
startindex 
startIndexR m   U V�*
�* 
msngO k   Z �SS TUT r   Z gVWV n  Z eXYX I   _ e�)Z�(�) (0 asintegerparameter asIntegerParameterZ [\[ o   _ `�'�' 0 
startindex 
startIndex\ ]�&] m   ` a^^ �__  f r o m�&  �(  Y o   Z _�%�% 0 _support  W o      �$�$ 0 
startindex 
startIndexU `a` Z  h bc�#�"b =   h kded o   h i�!�! 0 
startindex 
startIndexe m   i j� �   c n  n {fgf I   s {�h�� .0 throwinvalidparameter throwInvalidParameterh iji o   s t�� 0 
startindex 
startIndexj klk m   t umm �nn  f r o ml opo m   u v�
� 
longp q�q m   v wrr �ss " I n d e x   c a n  t   b e   0 .�  �  g o   n s�� 0 _support  �#  �"  a t�t Z   � �uv��u =  � �wxw o   � ��� 0 endindex endIndexx m   � ��
� 
msngv Z   � �yz{|y A   � �}~} o   � ��� 0 
startindex 
startIndex~ d   � � o   � ��� 0 	thelength 	theLengthz L   � ��� o   � ��� 0 thetext theText{ ��� ?   � ���� o   � ��� 0 
startindex 
startIndex� o   � ��� 0 	thelength 	theLength� ��� L   � ��� m   � ��� ���  �  | L   � ��� n  � ���� 7  � ����
� 
ctxt� o   � ��� 0 
startindex 
startIndex� m   � ������ o   � ��� 0 thetext theText�  �  �  P ��� =  � ���� o   � ��
�
 0 endindex endIndex� m   � ��	
�	 
msng� ��� R   � ����
� .ascrerr ****      � ****� m   � ��� ��� v E x p e c t e d    f r o m    a n d / o r    t o    p a r a m e t e r   b u t   r e c e i v e d   n e i t h e r .� ���
� 
errn� m   � ����[�  �  �,  M ��� Z   �4����� >  � ���� o   � ��� 0 endindex endIndex� m   � �� 
�  
msng� k   �0�� ��� r   � ���� n  � ���� I   � �������� (0 asintegerparameter asIntegerParameter� ��� o   � ����� 0 endindex endIndex� ���� m   � ��� ���  t o��  ��  � o   � ����� 0 _support  � o      ���� 0 endindex endIndex� ��� Z  � �������� =   � ���� o   � ����� 0 endindex endIndex� m   � �����  � n  � ���� I   � �������� .0 throwinvalidparameter throwInvalidParameter� ��� o   � ����� 0 endindex endIndex� ��� m   � ��� ���  t o� ��� m   � ���
�� 
long� ���� m   � ��� ��� " I n d e x   c a n  t   b e   0 .��  ��  � o   � ����� 0 _support  ��  ��  � ���� Z   �0������� =  ���� o   � ����� 0 
startindex 
startIndex� m   � ��
�� 
msng� Z  ,����� A  ��� o  ���� 0 endindex endIndex� d  �� o  ���� 0 	thelength 	theLength� L  �� m  �� ���  � ��� ?  ��� o  ���� 0 endindex endIndex� o  ���� 0 	thelength 	theLength� ���� L  �� o  ���� 0 thetext theText��  � L  ,�� n +��� 7 *����
�� 
ctxt� m  $&���� � o  ')���� 0 endindex endIndex� o  ���� 0 thetext theText��  ��  ��  �  �  � ��� l 55������  � + % both start and end indexes are given   � ��� J   b o t h   s t a r t   a n d   e n d   i n d e x e s   a r e   g i v e n� ��� Z 5F������� A  58��� o  56���� 0 
startindex 
startIndex� m  67����  � r  ;B��� [  ;@��� [  ;>��� o  ;<���� 0 	thelength 	theLength� m  <=���� � o  >?���� 0 
startindex 
startIndex� o      ���� 0 
startindex 
startIndex��  ��  � ��� Z GX������� A  GJ��� o  GH���� 0 endindex endIndex� m  HI����  � r  MT��� [  MR��� [  MP��� o  MN���� 0 	thelength 	theLength� m  NO���� � o  PQ���� 0 endindex endIndex� o      ���� 0 endindex endIndex��  ��  � ��� Z Y�������� G  Y���� G  Yp��� ?  Y\��� o  YZ���� 0 
startindex 
startIndex� o  Z[���� 0 endindex endIndex� F  _l   A  _b o  _`���� 0 
startindex 
startIndex m  `a����  A  eh o  ef���� 0 endindex endIndex l 
fg���� m  fg���� ��  ��  � F  s� ?  sv	
	 o  st���� 0 
startindex 
startIndex
 o  tu���� 0 	thelength 	theLength ?  y| o  yz���� 0 endindex endIndex o  z{���� 0 	thelength 	theLength� L  �� m  �� �  ��  ��  �  Z  ���� A  �� o  ������ 0 
startindex 
startIndex m  ������  r  �� m  ������  o      ���� 0 
startindex 
startIndex  ?  �� o  ������ 0 
startindex 
startIndex o  ������ 0 	thelength 	theLength �� r  �� o  ������ 0 	thelength 	theLength o      ���� 0 
startindex 
startIndex��  ��    !  Z  ��"#$��" A  ��%&% o  ������ 0 endindex endIndex& m  ������ # r  ��'(' m  ������ ( o      ���� 0 endindex endIndex$ )*) ?  ��+,+ o  ������ 0 endindex endIndex, o  ������ 0 	thelength 	theLength* -��- r  ��./. o  ������ 0 	thelength 	theLength/ o      ���� 0 endindex endIndex��  ��  ! 0��0 L  ��11 n  ��232 7 ����45
�� 
ctxt4 o  ������ 0 
startindex 
startIndex5 o  ������ 0 endindex endIndex3 o  ������ 0 thetext theText��  � R      ��67
�� .ascrerr ****      � ****6 o      ���� 0 etext eText7 ��89
�� 
errn8 o      ���� 0 enumber eNumber9 ��:;
�� 
erob: o      ���� 0 efrom eFrom; ��<��
�� 
errt< o      ���� 
0 eto eTo��    I  ����=���� 
0 _error  = >?> m  ��@@ �AA  s l i c e   t e x t? BCB o  ������ 0 etext eTextC DED o  ������ 0 enumber eNumberE FGF o  ������ 0 efrom eFromG H��H o  ������ 
0 eto eTo��  ��  � IJI l     ��������  ��  ��  J KLK l     ��������  ��  ��  L MNM i  � �OPO I     ��QR
�� .Txt:TrmTnull���     ctxtQ o      ���� 0 thetext theTextR ��S�
�� 
FromS |��T�U�  �  T o      �� 0 whichend whichEnd�  U l     V��V m      �
� LeTrBCha�  �  �  P Q     �WXYW k    �ZZ [\[ r    ]^] n   _`_ I    �a�� "0 astextparameter asTextParametera bcb o    	�� 0 thetext theTextc d�d m   	 
ee �ff  �  �  ` o    �� 0 _support  ^ o      �� 0 thetext theText\ ghg Z    -ij��i H    kk E   lml J    nn opo m    �
� LeTrLChap qrq m    �~
�~ LeTrTChar s�}s m    �|
�| LeTrBCha�}  m J    tt u�{u o    �z�z 0 whichend whichEnd�{  j n   )vwv I   # )�yx�x�y >0 throwinvalidconstantparameter throwInvalidConstantParameterx yzy o   # $�w�w 0 whichend whichEndz {�v{ m   $ %|| �}}  r e m o v i n g�v  �x  w o    #�u�u 0 _support  �  �  h ~�t~ P   . ��� k   3 ��� ��� l  3 ?���� Z  3 ?���s�r� =  3 6��� o   3 4�q�q 0 thetext theText� m   4 5�� ���  � L   9 ;�� m   9 :�� ���  �s  �r  � H B check if theText is empty or contains white space characters only   � ��� �   c h e c k   i f   t h e T e x t   i s   e m p t y   o r   c o n t a i n s   w h i t e   s p a c e   c h a r a c t e r s   o n l y� ��� r   @ S��� J   @ D�� ��� m   @ A�p�p � ��o� m   A B�n�n���o  � J      �� ��� o      �m�m 0 
startindex 
startIndex� ��l� o      �k�k 0 endindex endIndex�l  � ��� Z   T x���j�i� E  T \��� J   T X�� ��� m   T U�h
�h LeTrLCha� ��g� m   U V�f
�f LeTrBCha�g  � J   X [�� ��e� o   X Y�d�d 0 whichend whichEnd�e  � V   _ t��� r   j o��� [   j m��� o   j k�c�c 0 
startindex 
startIndex� m   k l�b�b � o      �a�a 0 
startindex 
startIndex� =  c i��� n   c g��� 4   d g�`�
�` 
cha � o   e f�_�_ 0 
startindex 
startIndex� o   c d�^�^ 0 thetext theText� m   g h�� ���  �j  �i  � ��� Z   y ����]�\� E  y ���� J   y }�� ��� m   y z�[
�[ LeTrTCha� ��Z� m   z {�Y
�Y LeTrBCha�Z  � J   } ��� ��X� o   } ~�W�W 0 whichend whichEnd�X  � V   � ���� r   � ���� \   � ���� o   � ��V�V 0 endindex endIndex� m   � ��U�U � o      �T�T 0 endindex endIndex� =  � ���� n   � ���� 4   � ��S�
�S 
cha � o   � ��R�R 0 endindex endIndex� o   � ��Q�Q 0 thetext theText� m   � ��� ���  �]  �\  � ��P� L   � ��� n   � ���� 7  � ��O��
�O 
ctxt� o   � ��N�N 0 
startindex 
startIndex� o   � ��M�M 0 endindex endIndex� o   � ��L�L 0 thetext theText�P  � �K�
�K conscase� �J�
�J consdiac� �I�
�I conshyph� �H�G
�H conspunc�G  � �F�
�F consnume� �E�D
�E conswhit�D  �t  X R      �C��
�C .ascrerr ****      � ****� o      �B�B 0 etext eText� �A��
�A 
errn� o      �@�@ 0 enumber eNumber� �?��
�? 
erob� o      �>�> 0 efrom eFrom� �=��<
�= 
errt� o      �;�; 
0 eto eTo�<  Y I   � ��:��9�: 
0 _error  � ��� m   � ��� ���  t r i m   t e x t� ��� o   � ��8�8 0 etext eText� ��� o   � ��7�7 0 enumber eNumber� ��� o   � ��6�6 0 efrom eFrom� ��5� o   � ��4�4 
0 eto eTo�5  �9  N ��� l     �3�2�1�3  �2  �1  � ��� l     �0�/�.�0  �/  �.  � ��� l     �-���-  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �,���,  �   Split and Join Suite   � ��� *   S p l i t   a n d   J o i n   S u i t e� ��� l     �+�*�)�+  �*  �)  � ��� i  � �� � I      �(�'�( .0 _aslinebreakparameter _asLineBreakParameter  o      �&�& 0 linebreaktype lineBreakType �% o      �$�$ 0 parametername parameterName�%  �'    l    / Z     /	
 =     o     �#�# 0 linebreaktype lineBreakType m    �"
�" LiBrLiOX	 L    	 1    �!
�! 
lnfd
  =    o    � �  0 linebreaktype lineBreakType m    �
� LiBrLiCM  L     o    �
� 
ret   =    o    �� 0 linebreaktype lineBreakType m    �
� LiBrLiWi � L    ! b      o    �
� 
ret  1    �
� 
lnfd�   n  $ / I   ) /� �� >0 throwinvalidconstantparameter throwInvalidConstantParameter  !"! o   ) *�� 0 linebreaktype lineBreakType" #�# o   * +�� 0 parametername parameterName�  �   o   $ )�� 0 _support   < 6 used by `join paragraphs` and `normalize line breaks`    �$$ l   u s e d   b y   ` j o i n   p a r a g r a p h s `   a n d   ` n o r m a l i z e   l i n e   b r e a k s `� %&% l     ����  �  �  & '(' l     ����  �  �  ( )*) i  � �+,+ I      �-�� 0 
_splittext 
_splitText- ./. o      �
�
 0 thetext theText/ 0�	0 o      �� 0 theseparator theSeparator�	  �  , l    ^1231 k     ^44 565 r     787 n    
9:9 I    
�;�� 0 aslist asList; <�< o    �� 0 theseparator theSeparator�  �  : o     �� 0 _support  8 o      �� 0 delimiterlist delimiterList6 =>= X    C?�@? Q    >ABCA l    )DEFD r     )GHG c     %IJI n     #KLK 1   ! #� 
�  
pcntL o     !���� 0 aref aRefJ m   # $��
�� 
ctxtH n      MNM 1   & (��
�� 
pcntN o   % &���� 0 aref aRefE�� caution: AS silently ignores invalid TID values, so separator items must be explicitly validated to catch any user errors; for now, just coerce to text and catch errors, but might want to make it more rigorous in future (e.g. if a list of lists is given, should sublist be treated as an error instead of just coercing it to text, which is itself TIDs sensitive); see also existing TODO on TypeSupport's asTextParameter handler   F �OOV   c a u t i o n :   A S   s i l e n t l y   i g n o r e s   i n v a l i d   T I D   v a l u e s ,   s o   s e p a r a t o r   i t e m s   m u s t   b e   e x p l i c i t l y   v a l i d a t e d   t o   c a t c h   a n y   u s e r   e r r o r s ;   f o r   n o w ,   j u s t   c o e r c e   t o   t e x t   a n d   c a t c h   e r r o r s ,   b u t   m i g h t   w a n t   t o   m a k e   i t   m o r e   r i g o r o u s   i n   f u t u r e   ( e . g .   i f   a   l i s t   o f   l i s t s   i s   g i v e n ,   s h o u l d   s u b l i s t   b e   t r e a t e d   a s   a n   e r r o r   i n s t e a d   o f   j u s t   c o e r c i n g   i t   t o   t e x t ,   w h i c h   i s   i t s e l f   T I D s   s e n s i t i v e ) ;   s e e   a l s o   e x i s t i n g   T O D O   o n   T y p e S u p p o r t ' s   a s T e x t P a r a m e t e r   h a n d l e rB R      ����P
�� .ascrerr ****      � ****��  P ��Q��
�� 
errnQ d      RR m      �������  C n  1 >STS I   6 >��U���� 60 throwinvalidparametertype throwInvalidParameterTypeU VWV o   6 7���� 0 aref aRefW XYX m   7 8ZZ �[[ 
 u s i n gY \]\ m   8 9��
�� 
ctxt] ^��^ m   9 :__ �``  l i s t   o f   t e x t��  ��  T o   1 6���� 0 _support  � 0 aref aRef@ o    ���� 0 delimiterlist delimiterList> aba r   D Icdc n  D Gefe 1   E G��
�� 
txdlf 1   D E��
�� 
ascrd o      ���� 0 oldtids oldTIDsb ghg r   J Oiji o   J K���� 0 delimiterlist delimiterListj n     klk 1   L N��
�� 
txdll 1   K L��
�� 
ascrh mnm r   P Uopo n   P Sqrq 2  Q S��
�� 
citmr o   P Q���� 0 thetext theTextp o      ���� 0 
resultlist 
resultListn sts r   V [uvu o   V W���� 0 oldtids oldTIDsv n     wxw 1   X Z��
�� 
txdlx 1   W X��
�� 
ascrt y��y L   \ ^zz o   \ ]���� 0 
resultlist 
resultList��  2 � � used by `split text` to split text using one or more text item delimiters and current or predefined considering/ignoring settings   3 �{{   u s e d   b y   ` s p l i t   t e x t `   t o   s p l i t   t e x t   u s i n g   o n e   o r   m o r e   t e x t   i t e m   d e l i m i t e r s   a n d   c u r r e n t   o r   p r e d e f i n e d   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s* |}| l     ��������  ��  ��  } ~~ l     ��������  ��  ��   ��� i  � ���� I      ������� 0 _splitpattern _splitPattern� ��� o      ���� 0 thetext theText� ���� o      ���� 0 patterntext patternText��  ��  � l    ����� k     ��� ��� Z    ������� =     ��� l    	������ I    	����
�� .corecnte****       ****� J     �� ���� o     ���� 0 patterntext patternText��  � �����
�� 
kocl� m    ��
�� 
list��  ��  ��  � m   	 
���� � r    ��� I   ����
�� .Txt:JoiTnull���     ****� o    ���� 0 patterntext patternText� �����
�� 
Sepa� m    �� ���  |��  � o      ���� 0 patterntext patternText��  ��  � ��� r    %��� I    #������� B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter� ��� o    ���� 0 patterntext patternText� ���� m    �� ���  a t��  ��  � o      ���� 0 asocpattern asocPattern� ��� r   & 2��� n  & 0��� I   + 0������� ,0 asnormalizednsstring asNormalizedNSString� ��� o   + ,�� 0 thetext theText�  ��  � o   & +�� 0 _support  � o      �� 0 
asocstring 
asocString� ��� l  3 6���� r   3 6��� m   3 4��  � o      �� &0 asocnonmatchstart asocNonMatchStart� G A used to calculate NSRanges for non-matching portions of NSString   � ��� �   u s e d   t o   c a l c u l a t e   N S R a n g e s   f o r   n o n - m a t c h i n g   p o r t i o n s   o f   N S S t r i n g� ��� r   7 ;��� J   7 9��  � o      �� 0 
resultlist 
resultList� ��� l  < <����  � @ : iterate over each non-matched + matched range in NSString   � ��� t   i t e r a t e   o v e r   e a c h   n o n - m a t c h e d   +   m a t c h e d   r a n g e   i n   N S S t r i n g� ��� r   < M��� n  < K��� I   = K���� @0 matchesinstring_options_range_ matchesInString_options_range_� ��� o   = >�� 0 
asocstring 
asocString� ��� m   > ?��  � ��� J   ? G�� ��� m   ? @��  � ��� n  @ E��� I   A E���� 
0 length  �  �  � o   @ A�� 0 
asocstring 
asocString�  �  �  � o   < =�� 0 asocpattern asocPattern� o      ��  0 asocmatcharray asocMatchArray� ��� Y   N ������� k   ^ ��� ��� r   ^ k��� l  ^ i���� n  ^ i��� I   d i���� 0 rangeatindex_ rangeAtIndex_� ��� m   d e��  �  �  � l  ^ d���� n  ^ d��� I   _ d����  0 objectatindex_ objectAtIndex_� ��� o   _ `�� 0 i  �  �  � o   ^ _��  0 asocmatcharray asocMatchArray�  �  �  �  � o      ��  0 asocmatchrange asocMatchRange� ��� r   l s��� n  l q��� I   m q���� 0 location  �  �  � o   l m��  0 asocmatchrange asocMatchRange� o      ��  0 asocmatchstart asocMatchStart� ��� r   t ���� c   t ���� l  t ����� n  t ���� I   u ����� *0 substringwithrange_ substringWithRange_� ��� K   u }�� ���� 0 location  � o   v w�� &0 asocnonmatchstart asocNonMatchStart� ���� 
0 length  � \   x {��� o   x y��  0 asocmatchstart asocMatchStart� o   y z�� &0 asocnonmatchstart asocNonMatchStart�  �  �  � o   t u�� 0 
asocstring 
asocString�  �  � m   � ��
� 
ctxt� n      � �  ;   � �  o   � ��� 0 
resultlist 
resultList� � r   � � [   � � o   � ���  0 asocmatchstart asocMatchStart l  � ��� n  � � I   � ����� 
0 length  �  �   o   � ���  0 asocmatchrange asocMatchRange�  �   o      �~�~ &0 asocnonmatchstart asocNonMatchStart�  � 0 i  � m   Q R�}�}  � \   R Y	
	 l  R W�|�{ n  R W I   S W�z�y�x�z 	0 count  �y  �x   o   R S�w�w  0 asocmatcharray asocMatchArray�|  �{  
 m   W X�v�v �  �  l  � ��u�u   "  add final non-matched range    � 8   a d d   f i n a l   n o n - m a t c h e d   r a n g e  r   � � c   � � l  � ��t�s n  � � I   � ��r�q�r *0 substringfromindex_ substringFromIndex_ �p o   � ��o�o &0 asocnonmatchstart asocNonMatchStart�p  �q   o   � ��n�n 0 
asocstring 
asocString�t  �s   m   � ��m
�m 
ctxt n        ;   � � o   � ��l�l 0 
resultlist 
resultList  !  l  � �"#$" Z  � �%&�k�j% F   � �'(' =   � �)*) n  � �+,+ 1   � ��i
�i 
leng, o   � ��h�h 0 
resultlist 
resultList* m   � ��g�g ( =   � �-.- n  � �/0/ 1   � ��f
�f 
leng0 n  � �121 4   � ��e3
�e 
cobj3 m   � ��d�d 2 o   � ��c�c 0 
resultlist 
resultList. m   � ��b�b  & L   � �44 J   � ��a�a  �k  �j  # U O for consistency with _splitText(), where `text items of ""` returns empty list   $ �55 �   f o r   c o n s i s t e n c y   w i t h   _ s p l i t T e x t ( ) ,   w h e r e   ` t e x t   i t e m s   o f   " " `   r e t u r n s   e m p t y   l i s t! 6�`6 L   � �77 o   � ��_�_ 0 
resultlist 
resultList�`  � Q K used by `split text` to split text using a regular expression as separator   � �88 �   u s e d   b y   ` s p l i t   t e x t `   t o   s p l i t   t e x t   u s i n g   a   r e g u l a r   e x p r e s s i o n   a s   s e p a r a t o r� 9:9 l     �^�]�\�^  �]  �\  : ;<; l     �[�Z�Y�[  �Z  �Y  < =>= i  � �?@? I      �XA�W�X 0 	_jointext 	_joinTextA BCB o      �V�V 0 thelist theListC D�UD o      �T�T 0 separatortext separatorText�U  �W  @ k     8EE FGF r     HIH n    JKJ 1    �S
�S 
txdlK 1     �R
�R 
ascrI o      �Q�Q 0 oldtids oldTIDsG LML r    NON o    �P�P 0 separatortext separatorTextO n     PQP 1    
�O
�O 
txdlQ 1    �N
�N 
ascrM RSR Q    /TUVT r    WXW c    YZY o    �M�M 0 thelist theListZ m    �L
�L 
ctxtX o      �K�K 0 
resulttext 
resultTextU R      �J�I[
�J .ascrerr ****      � ****�I  [ �H\�G
�H 
errn\ d      ]] m      �F�F��G  V k    /^^ _`_ r    !aba o    �E�E 0 oldtids oldTIDsb n     cdc 1     �D
�D 
txdld 1    �C
�C 
ascr` e�Be n  " /fgf I   ' /�Ah�@�A .0 throwinvalidparameter throwInvalidParameterh iji o   ' (�?�? 0 thelist theListj klk m   ( )mm �nn  l opo m   ) *�>
�> 
listp q�=q m   * +rr �ss , E x p e c t e d   l i s t   o f   t e x t .�=  �@  g o   " '�<�< 0 _support  �B  S tut r   0 5vwv o   0 1�;�; 0 oldtids oldTIDsw n     xyx 1   2 4�:
�: 
txdly 1   1 2�9
�9 
ascru z�8z L   6 8{{ o   6 7�7�7 0 
resulttext 
resultText�8  > |}| l     �6�5�4�6  �5  �4  } ~~ l     �3�2�1�3  �2  �1   ��� l     �0���0  �  -----   � ��� 
 - - - - -� ��� l     �/�.�-�/  �.  �-  � ��� i  � ���� I     �,��
�, .Txt:SplTnull���     ctxt� o      �+�+ 0 thetext theText� �*��
�* 
Sepa� |�)�(��'��)  �(  � o      �&�& 0 theseparator theSeparator�'  � l     ��%�$� m      �#
�# 
msng�%  �$  � �"��!
�" 
Usin� |� �����   �  � o      �� 0 matchformat matchFormat�  � l     ���� m      �
� SerECmpI�  �  �!  � k     ��� ��� l     ����  � � � convenience handler for splitting text using TIDs that can also use a regular expression pattern as separator; similar to Python's str.split()   � ���   c o n v e n i e n c e   h a n d l e r   f o r   s p l i t t i n g   t e x t   u s i n g   T I D s   t h a t   c a n   a l s o   u s e   a   r e g u l a r   e x p r e s s i o n   p a t t e r n   a s   s e p a r a t o r ;   s i m i l a r   t o   P y t h o n ' s   s t r . s p l i t ( )� ��� Q     ����� k    ��� ��� r    ��� n   ��� I    ���� "0 astextparameter asTextParameter� ��� o    	�� 0 thetext theText� ��� m   	 
�� ���  �  �  � o    �� 0 _support  � o      �� 0 thetext theText� ��� Z    ����� =    ��� n   ��� 1    �
� 
leng� o    �� 0 thetext theText� m    ��  � L    �� J    ��  �  �  � ��� Z   ! ������ =  ! $��� o   ! "�
�
 0 theseparator theSeparator� m   " #�	
�	 
msng� l  ' 3���� L   ' 3�� I   ' 2���� 0 _splitpattern _splitPattern� ��� I  ( -���
� .Txt:TrmTnull���     ctxt� o   ( )�� 0 thetext theText�  � ��� m   - .�� ���  \ s +�  �  � � � if `at` parameter is omitted, trim ends then then split on whitespace runs, same as Python's str.split() default behavior (any `using` options are ignored)   � ���8   i f   ` a t `   p a r a m e t e r   i s   o m i t t e d ,   t r i m   e n d s   t h e n   t h e n   s p l i t   o n   w h i t e s p a c e   r u n s ,   s a m e   a s   P y t h o n ' s   s t r . s p l i t ( )   d e f a u l t   b e h a v i o r   ( a n y   ` u s i n g `   o p t i o n s   a r e   i g n o r e d )� ��� =  6 9��� o   6 7�� 0 matchformat matchFormat� m   7 8�
� SerECmpI� ��� P   < J���� L   A I�� I   A H� ����  0 
_splittext 
_splitText� ��� o   B C���� 0 thetext theText� ���� o   C D���� 0 theseparator theSeparator��  ��  � ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ���
�� conswhit� ����
�� consnume��  � ����
�� conscase��  � ��� =  M P��� o   M N���� 0 matchformat matchFormat� m   N O��
�� SerECmpP� ��� L   S [�� I   S Z������� 0 _splitpattern _splitPattern� ��� o   T U���� 0 thetext theText� ���� o   U V���� 0 theseparator theSeparator��  ��  � ��� =  ^ a��� o   ^ _���� 0 matchformat matchFormat� m   _ `��
�� SerECmpC� ��� P   d r����� L   i q�� I   i p������� 0 
_splittext 
_splitText� ��� o   j k���� 0 thetext theText� ���� o   k l���� 0 theseparator theSeparator��  ��  � ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ���
�� conswhit� ����
�� consnume��  ��  � ��� =  u x��� o   u v���� 0 matchformat matchFormat� m   v w��
�� SerECmpE� ��� P   { ��� � L   � � I   � ������� 0 
_splittext 
_splitText  o   � ����� 0 thetext theText �� o   � ����� 0 theseparator theSeparator��  ��  � ��
�� conscase ��
�� consdiac ��
�� conshyph ��	
�� conspunc	 ����
�� conswhit��    ����
�� consnume��  � 

 =  � � o   � ����� 0 matchformat matchFormat m   � ���
�� SerECmpD �� L   � � I   � ������� 0 
_splittext 
_splitText  o   � ����� 0 thetext theText �� o   � ����� 0 theseparator theSeparator��  ��  ��  � n  � � I   � ������� >0 throwinvalidconstantparameter throwInvalidConstantParameter  o   � ����� 0 matchformat matchFormat �� m   � � � 
 u s i n g��  ��   o   � ����� 0 _support  �  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText �
� 
errn o      �� 0 enumber eNumber � !
� 
erob  o      �� 0 efrom eFrom! �"�
� 
errt" o      �� 
0 eto eTo�  � I   � ��#�� 
0 _error  # $%$ m   � �&& �''  s p l i t   t e x t% ()( o   � ��� 0 etext eText) *+* o   � ��� 0 enumber eNumber+ ,-, o   � ��� 0 efrom eFrom- .�. o   � ��� 
0 eto eTo�  �  �  � /0/ l     ����  �  �  0 121 l     ����  �  �  2 343 i  � �565 I     �78
� .Txt:JoiTnull���     ****7 o      �� 0 thelist theList8 �9�
� 
Sepa9 |��:�;�  �  : o      �� 0 separatortext separatorText�  ; m      << �==  �  6 Q     1>?@> L    AA I    �B�� 0 	_jointext 	_joinTextB CDC n   EFE I   	 �G�� "0 aslistparameter asListParameterG HIH o   	 
�� 0 thelist theListI J�J m   
 KK �LL  �  �  F o    	�� 0 _support  D M�M n   NON I    �P�� "0 astextparameter asTextParameterP QRQ o    �� 0 separatortext separatorTextR S�S m    TT �UU 
 u s i n g�  �  O o    �� 0 _support  �  �  ? R      �VW
� .ascrerr ****      � ****V o      �� 0 etext eTextW �XY
� 
errnX o      �� 0 enumber eNumberY �Z[
� 
erobZ o      �� 0 efrom eFrom[ �\�
� 
errt\ o      �� 
0 eto eTo�  @ I   ' 1�]�� 
0 _error  ] ^_^ m   ( )`` �aa  j o i n   t e x t_ bcb o   ) *�� 0 etext eTextc ded o   * +�� 0 enumber eNumbere fgf o   + ,�� 0 efrom eFromg h�h o   , -�� 
0 eto eTo�  �  4 iji l     ����  �  �  j klk l     ����  �  �  l mnm i  � �opo I     �q�
� .Txt:SplPnull���     ctxtq o      �~�~ 0 thetext theText�  p Q     $rstr L    uu n    vwv 2   �}
�} 
cparw n   xyx I    �|z�{�| "0 astextparameter asTextParameterz {|{ o    	�z�z 0 thetext theText| }�y} m   	 
~~ �  �y  �{  y o    �x�x 0 _support  s R      �w��
�w .ascrerr ****      � ****� o      �v�v 0 etext eText� �u��
�u 
errn� o      �t�t 0 enumber eNumber� �s��
�s 
erob� o      �r�r 0 efrom eFrom� �q��p
�q 
errt� o      �o�o 
0 eto eTo�p  t I    $�n��m�n 
0 _error  � ��� m    �� ���   s p l i t   p a r a g r a p h s� ��� o    �l�l 0 etext eText� ��� o    �k�k 0 enumber eNumber� ��� o    �j�j 0 efrom eFrom� ��i� o     �h�h 
0 eto eTo�i  �m  n ��� l     �g�f�e�g  �f  �e  � ��� l     �d�c�b�d  �c  �b  � ��� i  � ���� I     �a��
�a .Txt:JoiPnull���     ****� o      �`�` 0 thelist theList� �_��^
�_ 
LiBr� |�]�\��[��]  �\  � o      �Z�Z 0 linebreaktype lineBreakType�[  � l     ��Y�X� m      �W
�W LiBrLiOX�Y  �X  �^  � Q     -���� L    �� I    �V��U�V 0 	_jointext 	_joinText� ��� n   ��� I   	 �T��S�T "0 aslistparameter asListParameter� ��� o   	 
�R�R 0 thelist theList� ��Q� m   
 �� ���  �Q  �S  � o    	�P�P 0 _support  � ��O� I    �N��M�N .0 _aslinebreakparameter _asLineBreakParameter� ��� o    �L�L 0 linebreaktype lineBreakType� ��K� m    �� ��� 
 u s i n g�K  �M  �O  �U  � R      �J��
�J .ascrerr ****      � ****� o      �I�I 0 etext eText� �H��
�H 
errn� o      �G�G 0 enumber eNumber� �F��
�F 
erob� o      �E�E 0 efrom eFrom� �D��C
�D 
errt� o      �B�B 
0 eto eTo�C  � I   # -�A��@�A 
0 _error  � ��� m   $ %�� ���  j o i n   p a r a g r a p h s� ��� o   % &�?�? 0 etext eText� ��� o   & '�>�> 0 enumber eNumber� ��� o   ' (�=�= 0 efrom eFrom� ��<� o   ( )�;�; 
0 eto eTo�<  �@  � ��� l     �:�9�8�:  �9  �8  � ��7� l     �6�5�4�6  �5  �4  �7       +�3���2�1�0��� ���������������������������������3  � )�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� ����������������������
�	��
�/ 
pimr�. (0 _unmatchedtexttype _UnmatchedTextType�- $0 _matchedtexttype _MatchedTextType�, &0 _matchedgrouptype _MatchedGroupType�+ 0 _support  �* 
0 _error  �) B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter�( 0 _tokens  �' (0 _parsetemplatetext _parseTemplateText�& :0 _previoussearchtemplatetext _previousSearchTemplateText�% F0 !_previoussearchtemplateparsedtext !_previousSearchTemplateParsedText�$ ,0 _parsesearchtemplate _parseSearchTemplate�# :0 _previousformattemplatetext _previousFormatTemplateText�" H0 "_previousformattemplateparseditems "_previousFormatTemplateParsedItems�! ,0 _parseformattemplate _parseFormatTemplate�  $0 _matchinforecord _matchInfoRecord� 0 _matchrecords _matchRecords� &0 _matchedgrouplist _matchedGroupList� 0 _findpattern _findPattern� "0 _replacepattern _replacePattern� 0 	_findtext 	_findText� 0 _replacetext _replaceText
� .Txt:Srchnull���     ctxt
� .Txt:EPatnull���     ctxt
� .Txt:ETemnull���     ctxt
� .Txt:UppTnull���     ctxt
� .Txt:CapTnull���     ctxt
� .Txt:LowTnull���     ctxt
� .Txt:FTxtnull���     ctxt
� .Txt:Normnull���     ctxt
� .Txt:PadTnull���     ctxt
� .Txt:SliTnull���     ctxt
� .Txt:TrmTnull���     ctxt� .0 _aslinebreakparameter _asLineBreakParameter� 0 
_splittext 
_splitText� 0 _splitpattern _splitPattern� 0 	_jointext 	_joinText
�
 .Txt:SplTnull���     ctxt
�	 .Txt:JoiTnull���     ****
� .Txt:SplPnull���     ctxt
� .Txt:JoiPnull���     ****� ��� �  ��� ���
� 
cobj� ��   � 
� 
frmk�  � ���
� 
cobj� ��   � 
�  
osax�  
�2 
TxtU
�1 
TxtM
�0 
TxtG� ��   �� D
�� 
scpt� �� N���������� 
0 _error  �� ����� �  ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo��  � ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�  ^������ �� &0 throwcommanderror throwCommandError�� b  ࠡ����+ � �� w���������� B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter�� ����� �  ������ 0 patterntext patternText�� 0 parametername parameterName��  � ������ 0 patterntext patternText�� 0 parametername parameterName� ������������
�� misccura�� H0 "nsregularexpressioncaseinsensitive "NSRegularExpressionCaseInsensitive�� L0 $nsregularexpressionanchorsmatchlines $NSRegularExpressionAnchorsMatchLines�� Z0 +nsregularexpressiondotmatcheslineseparators +NSRegularExpressionDotMatchesLineSeparators�� Z0 +nsregularexpressionuseunicodewordboundaries +NSRegularExpressionUseUnicodeWordBoundaries�� @0 asnsregularexpressionparameter asNSRegularExpressionParameter��  b  ���,E��,E��,E��,E�m+ � �� ����������� (0 _parsetemplatetext _parseTemplateText�� ����� �  ���� 0 templatetext templateText��  � ���������������������������������� 0 templatetext templateText�� 0 
asocstring 
asocString�� 0 asocpattern asocPattern�� &0 asocnonmatchstart asocNonMatchStart�� 0 
resultlist 
resultList��  0 asocmatcharray asocMatchArray�� 0 
concatnext 
concatNext�� 0 i  �� 0 	asocmatch 	asocMatch��  0 asocmatchrange asocMatchRange��  0 asocmatchstart asocMatchStart�� 0 nonmatchtext nonMatchText�� 0 j  ��  0 asocgrouprange asocGroupRange�� "0 asocmatchstring asocMatchString�� 0 itemtext itemText� �����������������������.��������������
�� misccura�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� *0 nsregularexpression NSRegularExpression�� ^0 -nsregularexpressionallowcommentsandwhitespace -NSRegularExpressionAllowCommentsAndWhitespace
�� 
msng�� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_�� 
0 length  �� @0 matchesinstring_options_range_ matchesInString_options_range_� 	0 count  �  0 objectatindex_ objectAtIndex_� 0 rangeatindex_ rangeAtIndex_� 0 location  � *0 substringwithrange_ substringWithRange_� H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_
� 
ctxt
� 
cobj
� 
lnfd
� 
ret 
� 
tab � 
� 
psof
� 
psin
� .sysooffslong    ��� null� *0 substringfromindex_ substringFromIndex_��d��,�k+ E�O��,b  ��,E�m+ E�OjE�OjvE�O��jj�j+ lvm+ E�OfE�O �j�j+ 	kkh ��k+ 
E�O�jk+ E�O�j+ E�O����lvk+ �fl+ a &E�O� �a i/�%�a i/FOfE�Y ��6FO��j+ E�O �kmkh ��k+ E�O�j+ j a��k+ E�O�a &E�O�k  A�a i/_ _ _ a a va � *a �a a a  U/%�a i/FOeE�Y ��6FOY h[OY��[OY�O��k+ a fl+ a &E�O� �a i/�%�a i/FY ��6FO�� ��� �� ,0 _parsesearchtemplate _parseSearchTemplate� ��   �� 0 templatetext templateText�    ������� 0 templatetext templateText� 0 templateitems templateItems� 0 i  � 0 itemtext itemText� 0 nextitem nextItem� 0 
asocstring 
asocString ���M�k��t������������ (0 _parsetemplatetext _parseTemplateText
� 
leng
� 
cobj
� 
long
� 
cha 
� 
bool� 0 
asnsstring 
asNSString
� misccura� 60 nsregularexpressionsearch NSRegularExpressionSearch� 
0 length  � � �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_
� 
ctxt� 0 	_jointext 	_joinText� ��� ��b  	 �*�k+ E�O �k��,Ekh ��/E�O�l#j  9��&%E�O��k/E�O��,j	 
��k/�& 
��%E�Y hO���/FY ,b  �k+ E�O�����,j�j+ lva + a &��/F[OY��O*�a l+ Ec  
O�Ec  	Y hOb  
V� ������ ,0 _parseformattemplate _parseFormatTemplate� ��   �� 0 templatetext templateText�   �� 0 templatetext templateText ���� (0 _parsetemplatetext _parseTemplateText� 0�� ,�b   *�k+ Ec  O�Ec  Y hOb  V� ����� $0 _matchinforecord _matchInfoRecord� ��   ����� 0 
asocstring 
asocString�  0 asocmatchrange asocMatchRange� 0 
textoffset 
textOffset� 0 
recordtype 
recordType�   ������� 0 
asocstring 
asocString�  0 asocmatchrange asocMatchRange� 0 
textoffset 
textOffset� 0 
recordtype 
recordType� 0 	foundtext 	foundText�  0 nexttextoffset nextTextOffset �~�}�|�{�z�y�x�w�~ *0 substringwithrange_ substringWithRange_
�} 
ctxt
�| 
leng
�{ 
pcls�z 0 
startindex 
startIndex�y 0 endindex endIndex�x 0 	foundtext 	foundText�w � $��k+  �&E�O���,E�O���k���lv� �vL�u�t	
�s�v 0 _matchrecords _matchRecords�u �r�r   �q�p�o�n�m�l�q 0 
asocstring 
asocString�p  0 asocmatchrange asocMatchRange�o  0 asocstartindex asocStartIndex�n 0 
textoffset 
textOffset�m (0 nonmatchrecordtype nonMatchRecordType�l "0 matchrecordtype matchRecordType�t  	 �k�j�i�h�g�f�e�d�c�b�a�k 0 
asocstring 
asocString�j  0 asocmatchrange asocMatchRange�i  0 asocstartindex asocStartIndex�h 0 
textoffset 
textOffset�g (0 nonmatchrecordtype nonMatchRecordType�f "0 matchrecordtype matchRecordType�e  0 asocmatchstart asocMatchStart�d 0 asocmatchend asocMatchEnd�c &0 asocnonmatchrange asocNonMatchRange�b 0 nonmatchinfo nonMatchInfo�a 0 	matchinfo 	matchInfo
 �`�_�^�]�\�` 0 location  �_ 
0 length  �^ �] $0 _matchinforecord _matchInfoRecord
�\ 
cobj�s W�j+  E�O��j+ E�O�ᦢ�E�O*�����+ E[�k/E�Z[�l/E�ZO*�����+ E[�k/E�Z[�l/E�ZO�����v� �[��Z�Y�X�[ &0 _matchedgrouplist _matchedGroupList�Z �W�W   �V�U�T�S�V 0 
asocstring 
asocString�U 0 	asocmatch 	asocMatch�T 0 
textoffset 
textOffset�S &0 includenonmatches includeNonMatches�Y   �R�Q�P�O�N�M�L�K�J�I�H�G�F�R 0 
asocstring 
asocString�Q 0 	asocmatch 	asocMatch�P 0 
textoffset 
textOffset�O &0 includenonmatches includeNonMatches�N "0 submatchresults subMatchResults�M 0 groupindexes groupIndexes�L (0 asocfullmatchrange asocFullMatchRange�K &0 asocnonmatchstart asocNonMatchStart�J $0 asocfullmatchend asocFullMatchEnd�I 0 i  �H 0 nonmatchinfo nonMatchInfo�G 0 	matchinfo 	matchInfo�F &0 asocnonmatchrange asocNonMatchRange 	�E�D�C�B�A�@�?�>�=�E  0 numberofranges numberOfRanges�D 0 rangeatindex_ rangeAtIndex_�C 0 location  �B 
0 length  �A �@ 0 _matchrecords _matchRecords
�? 
cobj�> �= $0 _matchinforecord _matchInfoRecord�X �jvE�O�j+  kE�O�j ��jk+ E�O�j+ E�O��j+ E�O Uk�kh 	*���k+ ��b  b  �+ E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO� 	��6FY hO��6F[OY��O� #�㨧�E�O*���b  �+ �k/�6FY hY hO�� �<6�;�:�9�< 0 _findpattern _findPattern�; �8�8   �7�6�5�4�7 0 thetext theText�6 0 patterntext patternText�5 &0 includenonmatches includeNonMatches�4  0 includematches includeMatches�:   �3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�3 0 thetext theText�2 0 patterntext patternText�1 &0 includenonmatches includeNonMatches�0  0 includematches includeMatches�/ 0 asocpattern asocPattern�. 0 
asocstring 
asocString�- &0 asocnonmatchstart asocNonMatchStart�, 0 
textoffset 
textOffset�+ 0 
resultlist 
resultList�*  0 asocmatcharray asocMatchArray�) 0 i  �( 0 	asocmatch 	asocMatch�' 0 nonmatchinfo nonMatchInfo�& 0 	matchinfo 	matchInfo�% 0 	foundtext 	foundText J�$V`�#�"�!� ������������������$ (0 asbooleanparameter asBooleanParameter�# B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter�" ,0 asnormalizednsstring asNormalizedNSString�! 
0 length  �  @0 matchesinstring_options_range_ matchesInString_options_range_� 	0 count  �  0 objectatindex_ objectAtIndex_� 0 rangeatindex_ rangeAtIndex_� � 0 _matchrecords _matchRecords
� 
cobj� � 0 foundgroups foundGroups� 0 
startindex 
startIndex� &0 _matchedgrouplist _matchedGroupList� *0 substringfromindex_ substringFromIndex_
� 
ctxt
� 
pcls� 0 endindex endIndex
� 
leng� 0 	foundtext 	foundText� �9	b  ��l+ E�Ob  ��l+ E�O*��l+ E�Ob  �k+ E�OjE�OkE�OjvE�O��jj�j+ lvm+ E�O }j�j+ kkh 
��k+ 	E�O*��jk+ 
��b  b  �+ E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO� 	��6FY hO� ��*���a ,��+ l%�6FY h[OY��O� 1��k+ a &E�Oa b  a �a �a ,a �a �6FY hO�� �'���� "0 _replacepattern _replacePattern� �
�
   �	���	 0 thetext theText� 0 patterntext patternText� 0 templatetext templateText�   ������� ������������������������������� 0 thetext theText� 0 patterntext patternText� 0 templatetext templateText� 0 
asocstring 
asocString� 0 asocpattern asocPattern� 0 
resultlist 
resultList�  &0 asocnonmatchstart asocNonMatchStart��  0 asocmatcharray asocMatchArray�� 0 i  �� 0 	asocmatch 	asocMatch��  0 asocmatchrange asocMatchRange��  0 asocmatchstart asocMatchStart�� &0 asocnonmatchrange asocNonMatchRange�� 0 	foundtext 	foundText�� 0 foundgroups foundGroups�� 0 j  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�� 0 oldtids oldTIDs�� 0 
resulttext 
resultText "��?����������P�����������������������������������������4������ ,0 asnormalizednsstring asNormalizedNSString�� B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter
�� 
kocl
�� 
scpt
�� .corecnte****       ****�� 0 
resultlist 
resultList ��������
�� .ascrinit****      � **** k      P����  ��  ��   ���� 
0 _list_   ���� 
0 _list_  �� jv��� 
0 length  �� @0 matchesinstring_options_range_ matchesInString_options_range_�� 	0 count  ��  0 objectatindex_ objectAtIndex_�� 0 rangeatindex_ rangeAtIndex_�� 0 location  �� �� *0 substringwithrange_ substringWithRange_
�� 
ctxt�� 
0 _list_  ��  0 numberofranges numberOfRanges��  0 replacepattern replacePattern�� 0 etext eText ����
�� 
errn�� 0 enumber eNumber ����
�� 
erob�� 0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  
�� 
errn
�� 
erob
�� 
errt�� �� *0 substringfromindex_ substringFromIndex_
�� 
ascr
�� 
txdl�� ,0 _parsesearchtemplate _parseSearchTemplate�� |0 <stringbyreplacingmatchesinstring_options_range_withtemplate_ <stringByReplacingMatchesInString_options_range_withTemplate_�ub  �k+  E�O*��l+ E�O�kv��l k 7��K S�OjE�O��jj�j+ 	lvm+ 
E�O �j�j+ kkh ��k+ E�O�jk+ E�O�j+ E�O�髦�E�O��k+ a &�a ,6FO��k+ a &E�OjvE�O &k�j+ kkh ���k+ k+ a &�6F[OY��O ���l+ a &�a ,6FW %X  )a ] a ] a ] a a ] %O��j+ 	E�[OY�DO��k+ a &�a ,6FO_ a ,E^ Oa _ a ,FO�a ,a &E^ O] _ a ,FO] Y ��jj�j+ 	lv*�k+  �+ !a &� ��r�������� 0 	_findtext 	_findText�� ����   �������� 0 thetext theText�� 0 fortext forText� &0 includenonmatches includeNonMatches�  0 includematches includeMatches��   
����������� 0 thetext theText� 0 fortext forText� &0 includenonmatches includeNonMatches�  0 includematches includeMatches� 0 
resultlist 
resultList� 0 oldtids oldTIDs� 0 
startindex 
startIndex� 0 endindex endIndex� 0 	foundtext 	foundText� 0 i   ���������������(
� 
ascr
� 
txdl
� 
citm
� 
leng
� 
ctxt
� 
pcls� 0 
startindex 
startIndex� 0 endindex endIndex� 0 	foundtext 	foundText� 
� .corecnte****       ****� 0 foundgroups foundGroups� 
��
jvE�O��,E�O���,FOkE�O��k/�,E�O� 0�� �[�\[Z�\Z�2E�Y �E�O�b  �����6FY hO �l��-j kh 	�kE�O��,�[�\[�/\�i/2�,E�O� 3�� �[�\[Z�\Z�2E�Y �E�O�b  ����jv��6FY hO�kE�O���/�,kE�O� 0�� �[�\[Z�\Z�2E�Y �E�O�b  �����6FY h[OY�aO���,FO�� �U�� !�� 0 _replacetext _replaceText� �"� "  ���� 0 thetext theText� 0 fortext forText� 0 newtext newText�    ��������������� 0 thetext theText� 0 fortext forText� 0 newtext newText� 0 oldtids oldTIDs� 0 
resultlist 
resultList� 0 
startindex 
startIndex� 0 endindex endIndex� 0 i  � 0 	foundtext 	foundText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� 0 
resulttext 
resultText! ����������������������#���������*��
� 
ascr
�� 
txdl
�� 
kocl
�� 
scpt
�� .corecnte****       ****
�� 
citm
�� 
leng
�� 
cobj
�� 
ctxt�� 0 replacetext replaceText�� 0 etext eText# ���$
�� 
errn� 0 enumber eNumber$ �~�}%
�~ 
erob�} 0 efrom eFrom% �|�{�z
�| 
errt�{ 
0 eto eTo�z  
�� 
errn
�� 
erob
�� 
errt�� �� "0 astextparameter asTextParameter�(��,E�O���,FO�kv��l j �jvk��k/�,mvE[�k/E�Z[�l/E�Z[�m/E�ZO�� �[�\[Z�\Z�2�6FY hO �l��-j kh �kE�O��,�[�\[�/\�i/2�,E�O�� �[�\[Z�\Z�2E�Y �E�O ��k+ 
�&�6FW X  )����a a �%O�kE�O���/�,kE�O�� �[�\[Z�\Z�2�6FY h[OY�rOa ��,FY b  �a l+ E�O��-E�O���,FO��&E�O���,FO�� �yX�x�w&'�v
�y .Txt:Srchnull���     ctxt�x 0 thetext theText�w �u�t(
�u 
For_�t 0 fortext forText( �s)*
�s 
Usin) {�r�q�p�r 0 matchformat matchFormat�q  
�p SerECmpI* �o+,
�o 
Repl+ {�n�m�l�n 0 newtext newText�m  
�l 
msng, �k-�j
�k 
Retu- {�i�h�g�i 0 resultformat resultFormat�h  
�g RetEMatT�j  & �f�e�d�c�b�a�`�_�^�]�\�f 0 thetext theText�e 0 fortext forText�d 0 matchformat matchFormat�c 0 newtext newText�b 0 resultformat resultFormat�a &0 includenonmatches includeNonMatches�`  0 includematches includeMatches�_ 0 etext eText�^ 0 enumber eNumber�] 0 efrom eFrom�\ 
0 eto eTo' 2z�[��Z��Y��X�W�V�U�T�S�R�Q��P�O�N�M��L�K		�J�I�H�G	)�F	?	@�E	]	f	k	~	��D�C	�	�	�
�B.
�A�@�[ "0 astextparameter asTextParameter
�Z 
leng
�Y 
ctxt�X �W .0 throwinvalidparameter throwInvalidParameter
�V 
msng
�U RetEMatT
�T 
pcls�S 0 
startindex 
startIndex�R 0 endindex endIndex�Q 0 	foundtext 	foundText�P 
�O 
cobj
�N RetEUmaT
�M RetEAllT�L >0 throwinvalidconstantparameter throwInvalidConstantParameter
�K SerECmpI�J 0 	_findtext 	_findText
�I SerECmpP�H 0 _findpattern _findPattern
�G SerECmpC
�F SerECmpE
�E SerECmpD�D 0 _replacetext _replaceText�C "0 _replacepattern _replacePattern�B 0 etext eText. �?�>/
�? 
errn�> 0 enumber eNumber/ �=�<0
�= 
erob�< 0 efrom eFrom0 �;�:�9
�; 
errt�: 
0 eto eTo�9  �A �@ 
0 _error  �vcNb  ��l+ E�Ob  ��l+ E�O��,j  b  �����+ Y hO�� S��,j  $��  jvY �b  �k�j��a kvY hO��  felvE[a k/E�Z[a l/E�ZY S�a   eflvE[a k/E�Z[a l/E�ZY 1�a   eelvE[a k/E�Z[a l/E�ZY b  �a l+ O�a   a a  *�����+ VY ��a   *�����+ Y ~�a   a g *�����+ VY a�a   a a   *�����+ VY B�a !  -�a "  b  �a #�a $�+ Y hO*�����+ Y b  �a %l+ Y ���,j  	a &Y hO�a   a a  *���m+ 'VY ��a   *���m+ (Y {�a   a a   *���m+ 'VY ]�a   a g *���m+ 'VY A�a !  ,�a )  b  �a *�a +�+ Y hO*���m+ 'Y b  �a ,l+ W X - .*a /����a 0+ 1� �8
!�7�612�5
�8 .Txt:EPatnull���     ctxt�7 0 thetext theText�6  1 �4�3�2�1�0�4 0 thetext theText�3 0 etext eText�2 0 enumber eNumber�1 0 efrom eFrom�0 
0 eto eTo2 �/�.
5�-�,�+�*3
C�)�(
�/ misccura�. *0 nsregularexpression NSRegularExpression�- "0 astextparameter asTextParameter�, 40 escapedpatternforstring_ escapedPatternForString_
�+ 
ctxt�* 0 etext eText3 �'�&4
�' 
errn�& 0 enumber eNumber4 �%�$5
�% 
erob�$ 0 efrom eFrom5 �#�"�!
�# 
errt�" 
0 eto eTo�!  �) �( 
0 _error  �5 + ��,b  ��l+ k+ �&W X  *衢���+ 
� � 
S��67�
�  .Txt:ETemnull���     ctxt� 0 thetext theText�  6 ������ 0 thetext theText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo7 
e�
h�
k��8
w��� "0 astextparameter asTextParameter� 0 
_splittext 
_splitText� 0 	_jointext 	_joinText� 0 etext eText8 ��9
� 
errn� 0 enumber eNumber9 ��:
� 
erob� 0 efrom eFrom: ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � . **b  ��l+ �l+ �l+ W X  *衢���+ 
� �

��	�;<�
�
 .Txt:UppTnull���     ctxt�	 0 thetext theText� �=�
� 
Loca= {���� 0 
localecode 
localeCode�  
� 
msng�  ; �� ����������� 0 thetext theText�  0 
localecode 
localeCode�� 0 
asocstring 
asocString�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo< 
�����������
�������>
������� "0 astextparameter asTextParameter�� 0 
asnsstring 
asNSString
�� 
msng�� "0 uppercasestring uppercaseString
�� 
ctxt�� *0 asnslocaleparameter asNSLocaleParameter�� 80 uppercasestringwithlocale_ uppercaseStringWithLocale_�� 0 etext eText> ����?
�� 
errn�� 0 enumber eNumber? ����@
�� 
erob�� 0 efrom eFrom@ ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+ � ��
�����AB��
�� .Txt:CapTnull���     ctxt�� 0 thetext theText�� ��C��
�� 
LocaC {�������� 0 
localecode 
localeCode��  
�� 
msng��  A ���������������� 0 thetext theText�� 0 
localecode 
localeCode�� 0 
asocstring 
asocString�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToB 
�����������������D%������ "0 astextparameter asTextParameter�� 0 
asnsstring 
asNSString
�� 
msng�� &0 capitalizedstring capitalizedString
�� 
ctxt�� *0 asnslocaleparameter asNSLocaleParameter�� <0 capitalizedstringwithlocale_ capitalizedStringWithLocale_�� 0 etext eTextD ����E
�� 
errn�� 0 enumber eNumberE ����F
�� 
erob�� 0 efrom eFromF ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+ � ��5����GH��
�� .Txt:LowTnull���     ctxt�� 0 thetext theText�� ��I��
�� 
LocaI {�������� 0 
localecode 
localeCode��  
�� 
msng��  G �������� 0 thetext theText� 0 
localecode 
localeCode� 0 
asocstring 
asocString� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToH M�����j���Jv��� "0 astextparameter asTextParameter� 0 
asnsstring 
asNSString
� 
msng� "0 lowercasestring lowercaseString
� 
ctxt� *0 asnslocaleparameter asNSLocaleParameter� 80 lowercasestringwithlocale_ lowercaseStringWithLocale_� 0 etext eTextJ ��K
� 
errn� 0 enumber eNumberK ��L
� 
erob� 0 efrom eFromL ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+ � ����MN�
� .Txt:FTxtnull���     ctxt� 0 templatetext templateText� �O�
� 
UsinO {���� 0 	thevalues 	theValues�  �  �  M ��������� 0 templatetext templateText� 0 	thevalues 	theValues� 0 templateitems templateItems� 0 i  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToN ����������������P����	�+��� "0 astextparameter asTextParameter� ,0 _parseformattemplate _parseFormatTemplate
� 
kocl
� 
scpt
� .corecnte****       ****
� 
leng
� 
cobj� 0 getitem getItem
� 
ctxt� "0 aslistparameter asListParameter
� 
long� 0 etext eTextP ��Q
� 
errn� 0 enumber eNumberQ ��R
� 
erob� 0 efrom eFromR ��~�}
� 
errt�~ 
0 eto eTo�}  
� 
errn
� 
erob
� 
errt� � 0 	_jointext 	_joinText� � 
0 _error  � � ��� �*b  ��l+ k+ E�OlE�O k�kv��l k  ( "l��,Elh ���/Ek+ 
�&��/F[OY��Y 4b  ��l+ E�O #l��,Elh ���/E�&/E�&��/F[OY��W &X  )a �a �a �a a ��/%a %�%O*�a l+ VW X  *a ����a + � �|;�{�zST�y
�| .Txt:Normnull���     ctxt�{ 0 thetext theText�z �xUV
�x 
NoFoU {�w�vW�w 0 nopts nOpts�v  W �uX�u X  �t
�t LiBrLiOXV �sY�r
�s 
LocaY {�q�pH�q 0 
localecode 
localeCode�p  �r  S �o�n�m�l�k�j�i�h�g�f�e�o 0 thetext theText�n 0 nopts nOpts�m 0 
localecode 
localeCode�l 0 	linebreak 	lineBreak�k 0 
asocstring 
asocString�j 0 foldingflags foldingFlags�i 0 didnormalize didNormalize�h 0 etext eText�g 0 enumber eNumber�f 0 efrom eFrom�e 
0 eto eToT IX�dd�c�bt�a�`�_�^�]�\�[�Z��Y�X��W�V�U�T�S�R>�Q�P�O[_�N�M�L�K�J~�I����H�G�F�E�D&2GRV�C�B�A��@�?��>�=��<�;Z��:�9�8[��7�6�d "0 astextparameter asTextParameter�c "0 aslistparameter asListParameter
�b 
leng
�a LiBrLiOX
�` 
cpar
�_ 
lnfd�^ 0 	_jointext 	_joinText
�] 
msng
�\ LiBrLiCM
�[ 
errn�Zf
�Y 
ret 
�X LiBrLiWi�W 0 
asnsstring 
asNSString
�V NoFoNoCa
�U NoFoNoDi�T �
�S NoFoNoWi�R �Q *0 asnslocaleparameter asNSLocaleParameter�P H0 "stringbyfoldingwithoptions_locale_ "stringByFoldingWithOptions_locale_
�O NoFoNoSp
�N misccura�M 60 nsregularexpressionsearch NSRegularExpressionSearch�L 
0 length  �K �J �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_
�I 
spac
�H NoFoNoSP
�G NoFoNoTP
�F NoFoNoAO
�E 
bool�D H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_
�C NoFoNo_C�B N0 %precomposedstringwithcanonicalmapping %precomposedStringWithCanonicalMapping
�A NoFoNo_D�@ L0 $decomposedstringwithcanonicalmapping $decomposedStringWithCanonicalMapping
�? NoFoNoKC�> V0 )precomposedstringwithcompatibilitymapping )precomposedStringWithCompatibilityMapping
�= NoFoNoKD�< T0 (decomposedstringwithcompatibilitymapping (decomposedStringWithCompatibilityMapping�; 0 etext eTextZ �5�4�3
�5 
errn�4f�3  
�: 
list�9 .0 throwinvalidparameter throwInvalidParameter
�8 
ctxt[ �2�1\
�2 
errn�1 0 enumber eNumber\ �0�/]
�0 
erob�/ 0 efrom eFrom] �.�-�,
�. 
errt�- 
0 eto eTo�,  �7 �6 
0 _error  �y�kb  ��l+ E�Ob  ��l+ E�O��,j  �Y hO��kv  *��-�l+ 	Y hO�jv  �Y hO���kv �E�Y �E�O��kv 0�� )��l�Y hO��,k  *��-�l+ 	Y hO�E�Y hO�a kv 6�� )��la Y hO��,k  *��-��%l+ 	Y hO��%E�Y hOb  �k+ E�OjE�O�a kv 
�kE�Y hO�a kv �a E�Y hO�a kv �a E�Y hO�j ��b  �a l+ l+ E�Y hO�a kv ��a a a a ,j�j+  lva !+ "E�O��  #�a #_ $a a ,j�j+  lva !+ "E�Y =�a %�a a ,j�j+  lva !+ "E�O�a &_ $a a ,j�j+  lva !+ "E�Y (�� !�a '�a a ,j�j+  lva !+ "E�Y hO�a (kv 5�a )kv
 �a *kva +& )��la ,Y hO�a -fl+ .E�Y i�a )kv '�a *kv )��la /Y hO�a 0fl+ .E�Y :�a *kv /�a 1fl+ .E�O�a 2a 3a a ,j�j+  lva !+ "E�Y hO�a 4kv �j+ 5E�OeE�Y fE�O�a 6kv !� )��la 7Y hO�j+ 8E�OeE�Y hO�a 9kv !� )��la :Y hO�j+ ;E�OeE�Y hO�a <kv !� )��la =Y hO�j+ >E�OeE�Y hW X ? @b  �a Aa B�a !+ CO�a D&W X ? E*a F����a G+ H� �+��*�)^_�(
�+ .Txt:PadTnull���     ctxt�* 0 thetext theText�) �'�&`
�' 
toPl�& 0 	textwidth 	textWidth` �%ab
�% 
Chara {�$�#�$ 0 padtext padText�#  b �"c�!
�" 
Fromc {� ���  0 whichend whichEnd�  
� LeTrLCha�!  ^ ������������ 0 thetext theText� 0 	textwidth 	textWidth� 0 padtext padText� 0 whichend whichEnd� 0 
widthtoadd 
widthToAdd� 0 padsize padSize� 0 	padoffset 	padOffset� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo_ �%��AX�]�����
��	�d���� "0 astextparameter asTextParameter� (0 asintegerparameter asIntegerParameter
� 
leng
� 
ctxt� � .0 throwinvalidparameter throwInvalidParameter
� LeTrLCha
� LeTrTCha
�
 LeTrBCha�	 >0 throwinvalidconstantparameter throwInvalidConstantParameter� 0 etext eTextd ��e
� 
errn� 0 enumber eNumbere ��f
� 
erob� 0 efrom eFromf �� ��
� 
errt�  
0 eto eTo��  � � 
0 _error  �(b  ��l+ E�Ob  ��l+ E�O���,E�O�j �Y hOb  ��l+ E�O��,E�O��,j  b  �����+ 
Y hO h��,����%E�[OY��O��  �[�\[Zk\Z�2�%Y s��  ��,�#E�O��[�\[Zk�\Z��2%Y P��  ?�k �[�\[Zk\Z�l"2�%E�Y hO��,�#E�O��[�\[Zk�\Z��kl"2%Y b  ��l+ W X  *a ����a + � �������gh��
�� .Txt:SliTnull���     ctxt�� 0 thetext theText�� ��ij
�� 
FIdxi {�������� 0 
startindex 
startIndex��  
�� 
msngj ��k��
�� 
TIdxk {�������� 0 endindex endIndex��  
�� 
msng��  g ������������������ 0 thetext theText�� 0 
startindex 
startIndex�� 0 endindex endIndex�� 0 	thelength 	theLength�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToh  ����-��2����AFJ��^��mr����������������l@������ "0 astextparameter asTextParameter
�� 
leng
�� 
long�� �� .0 throwinvalidparameter throwInvalidParameter
�� 
msng�� (0 asintegerparameter asIntegerParameter
�� 
ctxt
�� 
errn���[
�� 
bool�� 0 etext eTextl ����m
�� 
errn�� 0 enumber eNumberm ����n
�� 
erob�� 0 efrom eFromn ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ����b  ��l+ E�O��,E�O�j  7�j  b  �����+ Y hO�j  b  �����+ Y hO�Y hO�� ]b  ��l+ E�O�j  b  �����+ Y hO��  -��' �Y �� 	a Y �[a \[Z�\Zi2EY hY ��  )a a la Y hO�� cb  �a l+ E�O�j  b  �a �a �+ Y hO��  -��' 	a Y �� �Y �[a \[Zk\Z�2EY hY hO�j �k�E�Y hO�j �k�E�Y hO��
 �k	 	�ka &a &
 ��	 	��a &a & 	a Y hO�k kE�Y �� �E�Y hO�k kE�Y �� �E�Y hO�[a \[Z�\Z�2EW X  *a ����a + � ��P����op��
�� .Txt:TrmTnull���     ctxt�� 0 thetext theText�� ��q��
�� 
Fromq {�������� 0 whichend whichEnd��  
�� LeTrBCha��  o ������������������ 0 thetext theText�� 0 whichend whichEnd�� 0 
startindex 
startIndex�� 0 endindex endIndex�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTop e��������|�����������r����� "0 astextparameter asTextParameter
�� LeTrLCha
�� LeTrTCha
�� LeTrBCha� >0 throwinvalidconstantparameter throwInvalidConstantParameter
� 
cobj
� 
cha 
� 
ctxt� 0 etext eTextr ��s
� 
errn� 0 enumber eNumbers ��t
� 
erob� 0 efrom eFromt ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� � �b  ��l+ E�O���mv�kv b  ��l+ Y hO�� {��  �Y hOkilvE[�k/E�Z[�l/E�ZO��lv�kv  h��/� �kE�[OY��Y hO��lv�kv  h��/� �kE�[OY��Y hO�[�\[Z�\Z�2EVW X  *a ����a + � � ��uv�� .0 _aslinebreakparameter _asLineBreakParameter� �w� w  ��� 0 linebreaktype lineBreakType� 0 parametername parameterName�  u ��� 0 linebreaktype lineBreakType� 0 parametername parameterNamev ������
� LiBrLiOX
� 
lnfd
� LiBrLiCM
� 
ret 
� LiBrLiWi� >0 throwinvalidconstantparameter throwInvalidConstantParameter� 0��  �EY %��  �Y ��  	��%Y b  ��l+ � �,��xy�� 0 
_splittext 
_splitText� �z� z  ��� 0 thetext theText� 0 theseparator theSeparator�  x ������� 0 thetext theText� 0 theseparator theSeparator� 0 delimiterlist delimiterList� 0 aref aRef� 0 oldtids oldTIDs� 0 
resultlist 
resultListy �������{Z_������ 0 aslist asList
� 
kocl
� 
cobj
� .corecnte****       ****
� 
pcnt
� 
ctxt�  { ���
� 
errn��\�  � � 60 throwinvalidparametertype throwInvalidParameterType
� 
ascr
� 
txdl
� 
citm� _b  �k+  E�O 5�[��l kh  ��,�&��,FW X  b  �����+ [OY��O��,E�O���,FO��-E�O���,FO�� ����|}�� 0 _splitpattern _splitPattern� �~� ~  ��� 0 thetext theText� 0 patterntext patternText�  | 
��~�}�|�{�z�y�x�w�v� 0 thetext theText�~ 0 patterntext patternText�} 0 asocpattern asocPattern�| 0 
asocstring 
asocString�{ &0 asocnonmatchstart asocNonMatchStart�z 0 
resultlist 
resultList�y  0 asocmatcharray asocMatchArray�x 0 i  �w  0 asocmatchrange asocMatchRange�v  0 asocmatchstart asocMatchStart} �u�t�s�r��q��p�o�n�m�l�k�j�i�h�g�f�e�d�c�b
�u 
kocl
�t 
list
�s .corecnte****       ****
�r 
Sepa
�q .Txt:JoiTnull���     ****�p B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter�o ,0 asnormalizednsstring asNormalizedNSString�n 
0 length  �m @0 matchesinstring_options_range_ matchesInString_options_range_�l 	0 count  �k  0 objectatindex_ objectAtIndex_�j 0 rangeatindex_ rangeAtIndex_�i 0 location  �h �g *0 substringwithrange_ substringWithRange_
�f 
ctxt�e *0 substringfromindex_ substringFromIndex_
�d 
leng
�c 
cobj
�b 
bool� Ρkv��l k  ���l E�Y hO*��l+ E�Ob  �k+ E�OjE�OjvE�O��jj�j+ 	lvm+ 
E�O Hj�j+ kkh ��k+ jk+ E�O�j+ E�O��驤�k+ a &�6FO��j+ 	E�[OY��O��k+ a &�6FO�a ,k 	 �a k/a ,j a & jvY hO�� �a@�`�_��^�a 0 	_jointext 	_joinText�` �]��] �  �\�[�\ 0 thelist theList�[ 0 separatortext separatorText�_   �Z�Y�X�W�Z 0 thelist theList�Y 0 separatortext separatorText�X 0 oldtids oldTIDs�W 0 
resulttext 
resultText� 
�V�U�T�S�m�Rr�Q�P
�V 
ascr
�U 
txdl
�T 
ctxt�S  � �O�N�M
�O 
errn�N�\�M  
�R 
list�Q �P .0 throwinvalidparameter throwInvalidParameter�^ 9��,E�O���,FO 
��&E�W X  ���,FOb  �����+ 	O���,FO�� �L��K�J���I
�L .Txt:SplTnull���     ctxt�K 0 thetext theText�J �H��
�H 
Sepa� {�G�F�E�G 0 theseparator theSeparator�F  
�E 
msng� �D��C
�D 
Usin� {�B�A�@�B 0 matchformat matchFormat�A  
�@ SerECmpI�C  � �?�>�=�<�;�:�9�? 0 thetext theText�> 0 theseparator theSeparator�= 0 matchformat matchFormat�< 0 etext eText�; 0 enumber eNumber�: 0 efrom eFrom�9 
0 eto eTo� ��8�7�6�5��4�3���2�1�0��/� �.�-�,�&�+�*�8 "0 astextparameter asTextParameter
�7 
leng
�6 
msng
�5 .Txt:TrmTnull���     ctxt�4 0 _splitpattern _splitPattern
�3 SerECmpI�2 0 
_splittext 
_splitText
�1 SerECmpP
�0 SerECmpC
�/ SerECmpE
�. SerECmpD�- >0 throwinvalidconstantparameter throwInvalidConstantParameter�, 0 etext eText� �)�(�
�) 
errn�( 0 enumber eNumber� �'�&�
�' 
erob�& 0 efrom eFrom� �%�$�#
�% 
errt�$ 
0 eto eTo�#  �+ �* 
0 _error  �I � �b  ��l+ E�O��,j  jvY hO��  *�j �l+ Y z��  �� *��l+ 
VY c��  *��l+ Y R��  �g *��l+ 
VY ;��  �a  *��l+ 
VY "�a   *��l+ 
Y b  �a l+ W X  *a ����a + � �"6�!� ���
�" .Txt:JoiTnull���     ****�! 0 thelist theList�  ���
� 
Sepa� {��<� 0 separatortext separatorText�  �  � ������� 0 thelist theList� 0 separatortext separatorText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� 
K�T����`��� "0 aslistparameter asListParameter� "0 astextparameter asTextParameter� 0 	_jointext 	_joinText� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� �
�	�
�
 
errt�	 
0 eto eTo�  � � 
0 _error  � 2 !*b  ��l+ b  ��l+ l+ W X  *碣���+ 	� �p�����
� .Txt:SplPnull���     ctxt� 0 thetext theText�  � ���� ��� 0 thetext theText� 0 etext eText� 0 enumber eNumber�  0 efrom eFrom�� 
0 eto eTo� ~�������������� "0 astextparameter asTextParameter
�� 
cpar�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � % b  ��l+ �-EW X  *塢���+ � �����������
�� .Txt:JoiPnull���     ****�� 0 thelist theList�� �����
�� 
LiBr� {�������� 0 linebreaktype lineBreakType��  
�� LiBrLiOX��  � �������������� 0 thelist theList�� 0 linebreaktype lineBreakType�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� 
������������������ "0 aslistparameter asListParameter�� .0 _aslinebreakparameter _asLineBreakParameter�� 0 	_jointext 	_joinText�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� . *b  ��l+ *��l+ l+ W X  *碣���+ 	 ascr  ��ޭ