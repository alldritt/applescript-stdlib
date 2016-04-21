FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� Web -- commands for manipulating URLs and sending HTTP requests

TO DO:

- add `normalize URL` handler? see NSURL's standardizedURL(); need to decide if it's worth putting in for users to call directly (note that `split URL` and anything else that uses TypeSupport's asNSURLParameter() already normalizes URLs automatically; OTOH, `join URL` does not)


- what about `split/join URL parameter string`? (see also below)

- how to split path components from parameter strings? RFC2396 allows parameters on all path portions (NSURL only allows parameters after final path portion), so probably also need to rework/rewrite `split/join URL` handlers to support this newer form as standard; see also Python's urllib.parse.urlsplit(), which unlike its older NSURL-like urlparse() function doesn't split parameters from path (although Python doesn't provide a parse function for such paths either, presumably leaving it to users to deal with themselves as needed).

   3.3. Path Component

   The path component contains data, specific to the authority (or the
   scheme if there is no authority component), identifying the resource
   within the scope of that scheme and authority.

      --path          = [ abs_path | opaque_part ]

      --path_segments = segment *( "/" segment )
      --segment       = *pchar *( ";" param )
      --param         = *pchar

      --pchar         = unreserved | escaped | ":" | "@" | "&" | "=" | "+" | "$" | ","

   The path may consist of a sequence of path segments separated by a
   single slash "/" character.  Within a path segment, the characters
   "/", ";", "=", and "?" are reserved.  Each path segment may include a
   sequence of parameters, indicated by the semicolon ";" character.
   The parameters are not significant to the parsing of relative
   references.


- NSURL's component properties don't appear to support generic resource locators, e.g. given "mailto:foo@example.org", NSURL.path returns nil; may be the case that a vanilla parser implemented according to RFC3986 would be a better solution than using NSURL


- `send HTTP request` -- urllib.request.Request(url, data=None, headers={}, origin_req_host=None, unverifiable=False, method=None) [method=GET/POST/PUT/etc]

	- see -[NSURLSession dataTaskWithRequest:] (10.9+) plus NSMutableURLRequest, and NSURL[Data]SessionTask plus NSURLResponse -- main question is whether to make it pure synchronous handler which blocks until completion, or a constructor that returns a script wrapper around NSURLDataSessionTask instance, allowing scripts to monitor progress in their own loops if they wish. The downside of the latter is that persistent NSObjects break SE autosave and AS serialization, but HTTP transfer is relatively specialized compared to, say, dictionary and set objects, so it won't be an everyday task for most users, and may be worth the tradeoff for those that do use it as long as documentation makes this issue clear.

	- Q. need to give some thought to encoding/decoding HTTP request/response body: simplest might be for message body to be either text (i.e. UTF8-encoded text data, where request/response headers concur) or raw data (cRawData='rdat', i.e. �data rdat...�), and leave other encoding/decoding to TextLib (which currently doesn't include transcoding commands, but could provide them if there's a use case)


- commands for converting HTML entities? (&amp;/&lt;/&gt;/&quot;); what about &apos;? what about non-ASCII entities? (decode command would need to handle all entities; encode command could probably just do required entities which is sufficient for use in Unicode [UTF8] encoded documents, possibly providing a Boolean option to encode all non-ASCII entities should users have to produce non-Unicode documents [though this shouldn't be encouraged]); OTOH, one might argue that if users are dealing with HTML content they should use a proper library that understands and processes HTML correctly, and providing commands here for encoding/decoding HTML entities is just encouraging them to hack it (something a stdlib really shouldn't do); given what a mess of complexity it is, might be wisest to leave HTML processing for other libraries to deal with

	- see NSString's stringByApplyingTransform:reverse:, using "Any-Hex/XML;Any-Hex/XML10" to convert "&#x10FFFF;" and "&1114111;" (what about HTML entity names?)

- worth including `encode/decode Base64` commands? (see NSData's base64EncodedStringWithOptions:)

- any other commands needed?

     � 	 	#   W e b   - -   c o m m a n d s   f o r   m a n i p u l a t i n g   U R L s   a n d   s e n d i n g   H T T P   r e q u e s t s 
 
 T O   D O : 
 
 -   a d d   ` n o r m a l i z e   U R L `   h a n d l e r ?   s e e   N S U R L ' s   s t a n d a r d i z e d U R L ( ) ;   n e e d   t o   d e c i d e   i f   i t ' s   w o r t h   p u t t i n g   i n   f o r   u s e r s   t o   c a l l   d i r e c t l y   ( n o t e   t h a t   ` s p l i t   U R L `   a n d   a n y t h i n g   e l s e   t h a t   u s e s   T y p e S u p p o r t ' s   a s N S U R L P a r a m e t e r ( )   a l r e a d y   n o r m a l i z e s   U R L s   a u t o m a t i c a l l y ;   O T O H ,   ` j o i n   U R L `   d o e s   n o t ) 
 
 
 -   w h a t   a b o u t   ` s p l i t / j o i n   U R L   p a r a m e t e r   s t r i n g ` ?   ( s e e   a l s o   b e l o w ) 
 
 -   h o w   t o   s p l i t   p a t h   c o m p o n e n t s   f r o m   p a r a m e t e r   s t r i n g s ?   R F C 2 3 9 6   a l l o w s   p a r a m e t e r s   o n   a l l   p a t h   p o r t i o n s   ( N S U R L   o n l y   a l l o w s   p a r a m e t e r s   a f t e r   f i n a l   p a t h   p o r t i o n ) ,   s o   p r o b a b l y   a l s o   n e e d   t o   r e w o r k / r e w r i t e   ` s p l i t / j o i n   U R L `   h a n d l e r s   t o   s u p p o r t   t h i s   n e w e r   f o r m   a s   s t a n d a r d ;   s e e   a l s o   P y t h o n ' s   u r l l i b . p a r s e . u r l s p l i t ( ) ,   w h i c h   u n l i k e   i t s   o l d e r   N S U R L - l i k e   u r l p a r s e ( )   f u n c t i o n   d o e s n ' t   s p l i t   p a r a m e t e r s   f r o m   p a t h   ( a l t h o u g h   P y t h o n   d o e s n ' t   p r o v i d e   a   p a r s e   f u n c t i o n   f o r   s u c h   p a t h s   e i t h e r ,   p r e s u m a b l y   l e a v i n g   i t   t o   u s e r s   t o   d e a l   w i t h   t h e m s e l v e s   a s   n e e d e d ) . 
 
       3 . 3 .   P a t h   C o m p o n e n t 
 
       T h e   p a t h   c o m p o n e n t   c o n t a i n s   d a t a ,   s p e c i f i c   t o   t h e   a u t h o r i t y   ( o r   t h e 
       s c h e m e   i f   t h e r e   i s   n o   a u t h o r i t y   c o m p o n e n t ) ,   i d e n t i f y i n g   t h e   r e s o u r c e 
       w i t h i n   t h e   s c o p e   o f   t h a t   s c h e m e   a n d   a u t h o r i t y . 
 
             - - p a t h                     =   [   a b s _ p a t h   |   o p a q u e _ p a r t   ] 
 
             - - p a t h _ s e g m e n t s   =   s e g m e n t   * (   " / "   s e g m e n t   ) 
             - - s e g m e n t               =   * p c h a r   * (   " ; "   p a r a m   ) 
             - - p a r a m                   =   * p c h a r 
 
             - - p c h a r                   =   u n r e s e r v e d   |   e s c a p e d   |   " : "   |   " @ "   |   " & "   |   " = "   |   " + "   |   " $ "   |   " , " 
 
       T h e   p a t h   m a y   c o n s i s t   o f   a   s e q u e n c e   o f   p a t h   s e g m e n t s   s e p a r a t e d   b y   a 
       s i n g l e   s l a s h   " / "   c h a r a c t e r .     W i t h i n   a   p a t h   s e g m e n t ,   t h e   c h a r a c t e r s 
       " / " ,   " ; " ,   " = " ,   a n d   " ? "   a r e   r e s e r v e d .     E a c h   p a t h   s e g m e n t   m a y   i n c l u d e   a 
       s e q u e n c e   o f   p a r a m e t e r s ,   i n d i c a t e d   b y   t h e   s e m i c o l o n   " ; "   c h a r a c t e r . 
       T h e   p a r a m e t e r s   a r e   n o t   s i g n i f i c a n t   t o   t h e   p a r s i n g   o f   r e l a t i v e 
       r e f e r e n c e s . 
 
 
 -   N S U R L ' s   c o m p o n e n t   p r o p e r t i e s   d o n ' t   a p p e a r   t o   s u p p o r t   g e n e r i c   r e s o u r c e   l o c a t o r s ,   e . g .   g i v e n   " m a i l t o : f o o @ e x a m p l e . o r g " ,   N S U R L . p a t h   r e t u r n s   n i l ;   m a y   b e   t h e   c a s e   t h a t   a   v a n i l l a   p a r s e r   i m p l e m e n t e d   a c c o r d i n g   t o   R F C 3 9 8 6   w o u l d   b e   a   b e t t e r   s o l u t i o n   t h a n   u s i n g   N S U R L 
 
 
 -   ` s e n d   H T T P   r e q u e s t `   - -   u r l l i b . r e q u e s t . R e q u e s t ( u r l ,   d a t a = N o n e ,   h e a d e r s = { } ,   o r i g i n _ r e q _ h o s t = N o n e ,   u n v e r i f i a b l e = F a l s e ,   m e t h o d = N o n e )   [ m e t h o d = G E T / P O S T / P U T / e t c ] 
 
 	 -   s e e   - [ N S U R L S e s s i o n   d a t a T a s k W i t h R e q u e s t : ]   ( 1 0 . 9 + )   p l u s   N S M u t a b l e U R L R e q u e s t ,   a n d   N S U R L [ D a t a ] S e s s i o n T a s k   p l u s   N S U R L R e s p o n s e   - -   m a i n   q u e s t i o n   i s   w h e t h e r   t o   m a k e   i t   p u r e   s y n c h r o n o u s   h a n d l e r   w h i c h   b l o c k s   u n t i l   c o m p l e t i o n ,   o r   a   c o n s t r u c t o r   t h a t   r e t u r n s   a   s c r i p t   w r a p p e r   a r o u n d   N S U R L D a t a S e s s i o n T a s k   i n s t a n c e ,   a l l o w i n g   s c r i p t s   t o   m o n i t o r   p r o g r e s s   i n   t h e i r   o w n   l o o p s   i f   t h e y   w i s h .   T h e   d o w n s i d e   o f   t h e   l a t t e r   i s   t h a t   p e r s i s t e n t   N S O b j e c t s   b r e a k   S E   a u t o s a v e   a n d   A S   s e r i a l i z a t i o n ,   b u t   H T T P   t r a n s f e r   i s   r e l a t i v e l y   s p e c i a l i z e d   c o m p a r e d   t o ,   s a y ,   d i c t i o n a r y   a n d   s e t   o b j e c t s ,   s o   i t   w o n ' t   b e   a n   e v e r y d a y   t a s k   f o r   m o s t   u s e r s ,   a n d   m a y   b e   w o r t h   t h e   t r a d e o f f   f o r   t h o s e   t h a t   d o   u s e   i t   a s   l o n g   a s   d o c u m e n t a t i o n   m a k e s   t h i s   i s s u e   c l e a r . 
 
 	 -   Q .   n e e d   t o   g i v e   s o m e   t h o u g h t   t o   e n c o d i n g / d e c o d i n g   H T T P   r e q u e s t / r e s p o n s e   b o d y :   s i m p l e s t   m i g h t   b e   f o r   m e s s a g e   b o d y   t o   b e   e i t h e r   t e x t   ( i . e .   U T F 8 - e n c o d e d   t e x t   d a t a ,   w h e r e   r e q u e s t / r e s p o n s e   h e a d e r s   c o n c u r )   o r   r a w   d a t a   ( c R a w D a t a = ' r d a t ' ,   i . e .   � d a t a   r d a t . . . � ) ,   a n d   l e a v e   o t h e r   e n c o d i n g / d e c o d i n g   t o   T e x t L i b   ( w h i c h   c u r r e n t l y   d o e s n ' t   i n c l u d e   t r a n s c o d i n g   c o m m a n d s ,   b u t   c o u l d   p r o v i d e   t h e m   i f   t h e r e ' s   a   u s e   c a s e ) 
 
 
 -   c o m m a n d s   f o r   c o n v e r t i n g   H T M L   e n t i t i e s ?   ( & a m p ; / & l t ; / & g t ; / & q u o t ; ) ;   w h a t   a b o u t   & a p o s ; ?   w h a t   a b o u t   n o n - A S C I I   e n t i t i e s ?   ( d e c o d e   c o m m a n d   w o u l d   n e e d   t o   h a n d l e   a l l   e n t i t i e s ;   e n c o d e   c o m m a n d   c o u l d   p r o b a b l y   j u s t   d o   r e q u i r e d   e n t i t i e s   w h i c h   i s   s u f f i c i e n t   f o r   u s e   i n   U n i c o d e   [ U T F 8 ]   e n c o d e d   d o c u m e n t s ,   p o s s i b l y   p r o v i d i n g   a   B o o l e a n   o p t i o n   t o   e n c o d e   a l l   n o n - A S C I I   e n t i t i e s   s h o u l d   u s e r s   h a v e   t o   p r o d u c e   n o n - U n i c o d e   d o c u m e n t s   [ t h o u g h   t h i s   s h o u l d n ' t   b e   e n c o u r a g e d ] ) ;   O T O H ,   o n e   m i g h t   a r g u e   t h a t   i f   u s e r s   a r e   d e a l i n g   w i t h   H T M L   c o n t e n t   t h e y   s h o u l d   u s e   a   p r o p e r   l i b r a r y   t h a t   u n d e r s t a n d s   a n d   p r o c e s s e s   H T M L   c o r r e c t l y ,   a n d   p r o v i d i n g   c o m m a n d s   h e r e   f o r   e n c o d i n g / d e c o d i n g   H T M L   e n t i t i e s   i s   j u s t   e n c o u r a g i n g   t h e m   t o   h a c k   i t   ( s o m e t h i n g   a   s t d l i b   r e a l l y   s h o u l d n ' t   d o ) ;   g i v e n   w h a t   a   m e s s   o f   c o m p l e x i t y   i t   i s ,   m i g h t   b e   w i s e s t   t o   l e a v e   H T M L   p r o c e s s i n g   f o r   o t h e r   l i b r a r i e s   t o   d e a l   w i t h 
 
 	 -   s e e   N S S t r i n g ' s   s t r i n g B y A p p l y i n g T r a n s f o r m : r e v e r s e : ,   u s i n g   " A n y - H e x / X M L ; A n y - H e x / X M L 1 0 "   t o   c o n v e r t   " & # x 1 0 F F F F ; "   a n d   " & 1 1 1 4 1 1 1 ; "   ( w h a t   a b o u t   H T M L   e n t i t y   n a m e s ? ) 
 
 -   w o r t h   i n c l u d i n g   ` e n c o d e / d e c o d e   B a s e 6 4 `   c o m m a n d s ?   ( s e e   N S D a t a ' s   b a s e 6 4 E n c o d e d S t r i n g W i t h O p t i o n s : ) 
 
 -   a n y   o t h e r   c o m m a n d s   n e e d e d ? 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        l     ��������  ��  ��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �      s u p p o r t     !   l     ��������  ��  ��   !  " # " l      $ % & $ j    �� '�� 0 _support   ' N     ( ( 4    �� )
�� 
scpt ) m     * * � + +  T y p e S u p p o r t % "  used for parameter checking    & � , , 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g #  - . - l     ��������  ��  ��   .  / 0 / l     ��������  ��  ��   0  1 2 1 i    3 4 3 I      �� 5���� 
0 _error   5  6 7 6 o      ���� 0 handlername handlerName 7  8 9 8 o      ���� 0 etext eText 9  : ; : o      ���� 0 enumber eNumber ;  < = < o      ���� 0 efrom eFrom =  >�� > o      ���� 
0 eto eTo��  ��   4 n     ? @ ? I    �� A���� &0 throwcommanderror throwCommandError A  B C B m     D D � E E  W e b C  F G F o    ���� 0 handlername handlerName G  H I H o    ���� 0 etext eText I  J K J o    	���� 0 enumber eNumber K  L M L o   	 
���� 0 efrom eFrom M  N�� N o   
 ���� 
0 eto eTo��  ��   @ o     ���� 0 _support   2  O P O l     ��������  ��  ��   P  Q R Q l     ��������  ��  ��   R  S T S l     �� U V��   U J D--------------------------------------------------------------------    V � W W � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - T  X Y X l     �� Z [��   Z   URL conversion    [ � \ \    U R L   c o n v e r s i o n Y  ] ^ ] l     ��������  ��  ��   ^  _ ` _ l     �� a b��   a copied from Python's urllib.parse module (hardcoded blacklists/whitelists are always problematic as they need to be manually maintained and updated as new protocols arise, but this one seems unavoidable); used to determine when `join URL` should insert "//"    b � c c   c o p i e d   f r o m   P y t h o n ' s   u r l l i b . p a r s e   m o d u l e   ( h a r d c o d e d   b l a c k l i s t s / w h i t e l i s t s   a r e   a l w a y s   p r o b l e m a t i c   a s   t h e y   n e e d   t o   b e   m a n u a l l y   m a i n t a i n e d   a n d   u p d a t e d   a s   n e w   p r o t o c o l s   a r i s e ,   b u t   t h i s   o n e   s e e m s   u n a v o i d a b l e ) ;   u s e d   t o   d e t e r m i n e   w h e n   ` j o i n   U R L `   s h o u l d   i n s e r t   " / / " `  d e d j    N�� f�� 0 _usesnetloc _usesNetLoc f J    M g g  h i h m     j j � k k  f t p i  l m l m     n n � o o  h t t p m  p q p m     r r � s s  g o p h e r q  t u t m     v v � w w  n n t p u  x y x m     z z � { {  t e l n e t y  | } | m     ~ ~ �    i m a p }  � � � m     � � � � �  w a i s �  � � � m     � � � � �  f i l e �  � � � m     � � � � �  m m s �  � � � m    " � � � � � 
 h t t p s �  � � � m   " % � � � � � 
 s h t t p �  � � � m   % ( � � � � � 
 s n e w s �  � � � m   ( + � � � � �  p r o s p e r o �  � � � m   + . � � � � �  r t s p �  � � � m   . 1 � � � � � 
 r t s p u �  � � � m   1 4 � � � � � 
 r s y n c �  � � � m   4 7 � � � � �   �  � � � m   7 : � � � � �  s v n �  � � � m   : = � � � � �  s v n + s s h �  � � � m   = @ � � � � �  s f t p �  � � � m   @ C � � � � �  n f s �  � � � m   C F � � � � �  g i t �  ��� � m   F I � � � � �  g i t + s s h��   e  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  O R � � � I      �� ����� 0 _ascomponent _asComponent �  ��� � o      ���� 0 
asocstring 
asocString��  ��   � k      � �  � � � Z     � ����� � =     � � � o     ���� 0 
asocstring 
asocString � m    ��
�� 
msng � L     � � m     � � � � �  ��  ��   �  ��� � L     � � c     � � � o    ���� 0 
asocstring 
asocString � m    ��
�� 
ctxt��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  S V � � � I      �� ����� ,0 _joinnetworklocation _joinNetworkLocation �  ��� � o      ���� .0 networklocationrecord networkLocationRecord��  ��   � k    $ � �  � � � r      � � � n     � � � I    �� ����� 60 asoptionalrecordparameter asOptionalRecordParameter �  � � � o    ���� .0 networklocationrecord networkLocationRecord �  � � � K     � � �� � ��� 0 username userName � m     � � � � �   � �� � ��� 0 userpassword userPassword � m   	 
 � � � � �   � �� � ��� 0 hostname hostName � m     � � � � �   � �� ����� 0 
portnumber 
portNumber � m     � � �    ��   � �� m     �  ��  ��   � o     ���� 0 _support   � o      ���� $0 fullnetlocrecord fullNetLocRecord �  r    . n    ,	 J    ,

  o    ���� 0 username userName  o     ���� 0 userpassword userPassword  o   " $���� 0 hostname hostName �� o   & (���� 0 
portnumber 
portNumber��  	 o    ���� $0 fullnetlocrecord fullNetLocRecord o      ���� 0 urlcomponents urlComponents  X   / ��� Q   ? � r   B M c   B I n  B E 1   C E��
�� 
pcnt o   B C���� 0 aref aRef m   E H��
�� 
ctxt n       1   J L��
�� 
pcnt  o   I J���� 0 aref aRef R      ����!
�� .ascrerr ****      � ****��  ! ��"��
�� 
errn" d      ## m      �������   R   U ���$%
�� .ascrerr ****      � ****$ b   a �&'& b   a |()( m   a d** �++ D I n v a l i d   n e t w o r k   l o c a t i o n   r e c o r d   ( ) l  d {,����, n   d {-.- 4   r {��/
�� 
cobj/ l  s z0����0 [   s z121 l  s x3����3 n   s x454 1   t x��
�� 
leng5 o   s t���� 0 urlcomponents urlComponents��  ��  2 m   x y���� ��  ��  . J   d r66 787 m   d g99 �::  u s e r N a m e8 ;<; m   g j== �>>  u s e r P a s s w o r d< ?@? m   j mAA �BB  h o s t N a m e@ C��C m   m pDD �EE  p o r t N u m b e r��  ��  ��  ' m   | FF �GG 0    p r o p e r t y   i s   n o t   t e x t ) .% ��HI
�� 
errnH m   Y \�����YI �J�~
� 
erobJ o   _ `�}�} 0 	urlrecord 	urlRecord�~  �� 0 aref aRef o   2 3�|�| 0 urlcomponents urlComponents KLK r   � �MNM o   � ��{�{ 0 urlcomponents urlComponentsN J      OO PQP o      �z�z 0 username userNameQ RSR o      �y�y 0 userpassword userPasswordS TUT o      �x�x 0 hostname hostNameU V�wV o      �v�v 0 
portnumber 
portNumber�w  L WXW l  � ��uYZ�u  Y F @ TO DO: if userName is "" and userPassword is not "" then error?   Z �[[ �   T O   D O :   i f   u s e r N a m e   i s   " "   a n d   u s e r P a s s w o r d   i s   n o t   " "   t h e n   e r r o r ?X \]\ Z  � �^_�t�s^ >  � �`a` o   � ��r�r 0 userpassword userPassworda m   � �bb �cc  _ r   � �ded b   � �fgf b   � �hih o   � ��q�q 0 username userNamei m   � �jj �kk  :g o   � ��p�p 0 userpassword userPassworde o      �o�o 0 username userName�t  �s  ] lml Z  � �no�n�mn >  � �pqp o   � ��l�l 0 username userNameq m   � �rr �ss  o r   � �tut b   � �vwv o   � ��k�k 0 username userNamew m   � �xx �yy  @u o      �j�j 0 username userName�n  �m  m z{z Z  �|}�i�h| F   � �~~ =  � ���� o   � ��g�g 0 hostname hostName� m   � ��� ���   H   � ��� l  � ���f�e� F   � ���� =  � ���� o   � ��d�d 0 username userName� m   � ��� ���  � =  � ���� o   � ��c�c 0 
portnumber 
portNumber� m   � ��� ���  �f  �e  } R   ��b��
�b .ascrerr ****      � ****� m   � �� ��� | I n v a l i d   n e t w o r k   l o c a t i o n   r e c o r d   ( m i s s i n g    h o s t N a m e    p r o p e r t y ) .� �a��
�a 
errn� m   � ��`�`�Y� �_��^
�_ 
erob� o   � ��]�] 0 	urlrecord 	urlRecord�^  �i  �h  { ��� r  ��� b  	��� o  �\�\ 0 username userName� o  �[�[ 0 hostname hostName� o      �Z�Z 0 hostname hostName� ��� Z !���Y�X� > ��� o  �W�W 0 
portnumber 
portNumber� m  �� ���  � r  ��� b  ��� b  ��� o  �V�V 0 hostname hostName� m  �� ���  :� o  �U�U 0 
portnumber 
portNumber� o      �T�T 0 hostname hostName�Y  �X  � ��S� L  "$�� o  "#�R�R 0 hostname hostName�S   � ��� l     �Q�P�O�Q  �P  �O  � ��� l     �N�M�L�N  �M  �L  � ��� l     �K���K  �  -----   � ��� 
 - - - - -� ��� l     �J�I�H�J  �I  �H  � ��� i  W Z��� I     �G��
�G .Web:SplUnull���     ctxt� o      �F�F 0 urltext urlText� �E��D
�E 
NeLo� |�C�B��A��C  �B  � o      �@�@ ,0 splitnetworklocation splitNetworkLocation�A  � l     ��?�>� m      �=
�= boovfals�?  �>  �D  � Q     ����� k    ��� ��� r    ��� n   ��� I    �<��;�< $0 asnsurlparameter asNSURLParameter� ��� o    	�:�: 0 urltext urlText� ��9� m   	 
�� ���  �9  �;  � o    �8�8 0 _support  � o      �7�7 0 asocurl asocURL� ��� l   �6���6  �+% TO DO: NSURL doesn't seem to support newer RFC2396 which allows parameters on all path components, so probably have to rework this to re-join resourcePath with parameterString (eliminating parameterString property), or else replace with vanilla URL parser (which might be simpler in practice)   � ���J   T O   D O :   N S U R L   d o e s n ' t   s e e m   t o   s u p p o r t   n e w e r   R F C 2 3 9 6   w h i c h   a l l o w s   p a r a m e t e r s   o n   a l l   p a t h   c o m p o n e n t s ,   s o   p r o b a b l y   h a v e   t o   r e w o r k   t h i s   t o   r e - j o i n   r e s o u r c e P a t h   w i t h   p a r a m e t e r S t r i n g   ( e l i m i n a t i n g   p a r a m e t e r S t r i n g   p r o p e r t y ) ,   o r   e l s e   r e p l a c e   w i t h   v a n i l l a   U R L   p a r s e r   ( w h i c h   m i g h t   b e   s i m p l e r   i n   p r a c t i c e )� ��� r    A��� K    ?�� �5���5 0 username userName� I    �4��3�4 0 _ascomponent _asComponent� ��2� n   ��� I    �1�0�/�1 0 user  �0  �/  � o    �.�. 0 asocurl asocURL�2  �3  � �-���- 0 userpassword userPassword� I    '�,��+�, 0 _ascomponent _asComponent� ��*� n   #��� I    #�)�(�'�) 0 password  �(  �'  � o    �&�& 0 asocurl asocURL�*  �+  � �%���% 0 hostname hostName� I   ( 2�$��#�$ 0 _ascomponent _asComponent� ��"� n  ) .��� I   * .�!� ��! 0 host  �   �  � o   ) *�� 0 asocurl asocURL�"  �#  � ���� 0 
portnumber 
portNumber� I   3 =���� 0 _ascomponent _asComponent� ��� n  4 9��� I   5 9���� 0 port  �  �  � o   4 5�� 0 asocurl asocURL�  �  �  � o      �� "0 networklocation networkLocation� ��� Z   B ]����� H   B N�� n  B M��� I   G M���� (0 asbooleanparameter asBooleanParameter� ��� o   G H�� ,0 splitnetworklocation splitNetworkLocation� ��� m   H I   � . n e t w o r k   l o c a t i o n   r e c o r d�  �  � o   B G�� 0 _support  � r   Q Y I   Q W��� ,0 _joinnetworklocation _joinNetworkLocation �
 o   R S�	�	 "0 networklocation networkLocation�
  �   o      �� "0 networklocation networkLocation�  �  � � L   ^ � K   ^ � �	
� 0 	urlscheme 	urlScheme	 I   _ i��� 0 _ascomponent _asComponent � n  ` e I   a e��� � 
0 scheme  �  �    o   ` a���� 0 asocurl asocURL�  �  
 ���� "0 networklocation networkLocation o   l m���� "0 networklocation networkLocation ���� 0 resourcepath resourcePath I   p z������ 0 _ascomponent _asComponent �� n  q v I   r v�������� 0 path  ��  ��   o   q r���� 0 asocurl asocURL��  ��   ���� "0 parameterstring parameterString I   } ������� 0 _ascomponent _asComponent �� n  ~ � I    ��������� "0 parameterstring parameterString��  ��   o   ~ ���� 0 asocurl asocURL��  ��   ���� 0 querystring queryString I   � ������� 0 _ascomponent _asComponent  ��  n  � �!"! I   � ��������� 	0 query  ��  ��  " o   � ����� 0 asocurl asocURL��  ��   ��#���� (0 fragmentidentifier fragmentIdentifier# I   � ���$���� 0 _ascomponent _asComponent$ %��% n  � �&'& I   � ��������� 0 fragment  ��  ��  ' o   � ����� 0 asocurl asocURL��  ��  ��  �  � R      ��()
�� .ascrerr ****      � ****( o      ���� 0 etext eText) ��*+
�� 
errn* o      ���� 0 enumber eNumber+ ��,-
�� 
erob, o      ���� 0 efrom eFrom- ��.��
�� 
errt. o      ���� 
0 eto eTo��  � I   � ���/���� 
0 _error  / 010 m   � �22 �33  s p l i t   U R L1 454 o   � ����� 0 etext eText5 676 o   � ����� 0 enumber eNumber7 898 o   � ����� 0 efrom eFrom9 :��: o   � ����� 
0 eto eTo��  ��  � ;<; l     ��������  ��  ��  < =>= l     ��������  ��  ��  > ?@? l     ��������  ��  ��  @ ABA i  [ ^CDC I     ��EF
�� .Web:JoiUnull���     WebCE o      ���� 0 	urlrecord 	urlRecordF ��G��
�� 
BaseG |����H��I��  ��  H o      ���� 0 baseurl baseURL��  I l     J����J m      KK �LL  ��  ��  ��  D l   |MNOM Q    |PQRP P   dSTUS k   cVV WXW Z   YZ��[Y >    \]\ l   ^����^ I   ��_`
�� .corecnte****       ****_ J    aa b��b o    	���� 0 	urlrecord 	urlRecord��  ` ��c��
�� 
koclc m    ��
�� 
reco��  ��  ��  ] m    ����  Z k   �dd efe l   ��gh��  g 0 * TO DO: see above TODO re. parameterString   h �ii T   T O   D O :   s e e   a b o v e   T O D O   r e .   p a r a m e t e r S t r i n gf jkj r    7lml n   5non I    5��p���� 60 asoptionalrecordparameter asOptionalRecordParameterp qrq o    ���� 0 	urlrecord 	urlRecordr sts K    .uu ��vw�� 0 	urlscheme 	urlSchemev m    xx �yy  w ��z{�� "0 networklocation networkLocationz m     || �}}  { ��~�� 0 resourcepath resourcePath~ m   ! "�� ���   ������ "0 parameterstring parameterString� m   # $�� ���  � ������ 0 querystring queryString� m   % &�� ���  � ������� (0 fragmentidentifier fragmentIdentifier� m   ' *�� ���  ��  t ���� m   . 1�� ���  ��  ��  o o    ���� 0 _support  m o      ���� 0 fullurlrecord fullURLRecordk ��� r   8 T��� n   8 R��� J   9 R�� ��� o   : <���� 0 	urlscheme 	urlScheme� ��� o   > @���� 0 resourcepath resourcePath� ��� o   B D���� "0 parameterstring parameterString� ��� o   F H���� 0 querystring queryString� ���� o   J L���� (0 fragmentidentifier fragmentIdentifier��  � o   8 9���� 0 fullurlrecord fullURLRecord� o      ���� 0 urlcomponents urlComponents� ��� X   U ������ Q   g ����� r   j y��� c   j s��� n  j o��� 1   k o��
�� 
pcnt� o   j k���� 0 aref aRef� m   o r��
�� 
ctxt� n     ��� 1   t x��
�� 
pcnt� o   s t���� 0 aref aRef� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � n  � ���� I   � �������� .0 throwinvalidparameter throwInvalidParameter� ��� o   � ����� 0 	urlrecord 	urlRecord� ��� m   � ��� ���  � ��� m   � ���
�� 
reco� ���� b   � ���� b   � ���� m   � ��� ��� 2 U R L   c o m p o n e n t s   r e c o r d  s   � l  � ������� n   � ���� 4   � ����
�� 
cobj� l  � ������� [   � ���� l  � ������� n   � ���� 1   � ���
�� 
leng� o   � ����� 0 urlcomponents urlComponents��  ��  � m   � ��� ��  ��  � J   � ��� ��� m   � ��� ���  u r l S c h e m e� ��� m   � ��� ���  r e s o u r c e P a t h� ��� m   � ��� ���  p a r a m e t e r S t r i n g� ��� m   � ��� ���  q u e r y S t r i n g� ��~� m   � ��� ��� $ f r a g m e n t I d e n t i f i e r�~  ��  ��  � m   � ��� ��� .    p r o p e r t y   i s   n o t   t e x t .��  ��  � o   � ��}�} 0 _support  �� 0 aref aRef� o   X Y�|�| 0 urlcomponents urlComponents� ��� r   � ���� o   � ��{�{ 0 urlcomponents urlComponents� J      �� ��� o      �z�z 0 	urlscheme 	urlScheme� ��� o      �y�y 0 resourcepath resourcePath� ��� o      �x�x "0 parameterstring parameterString� ��� o      �w�w 0 querystring queryString� ��v� o      �u�u (0 fragmentidentifier fragmentIdentifier�v  � ��� Z   �5���t�� >   � ���� l  � ���s�r� I  � ��q��
�q .corecnte****       ****� J   � ��� ��p� n  � ���� o   � ��o�o "0 networklocation networkLocation� o   � ��n�n 0 fullurlrecord fullURLRecord�p  � �m �l
�m 
kocl  m   � ��k
�k 
reco�l  �s  �r  � m   � ��j�j  � r   I  	�i�h�i ,0 _joinnetworklocation _joinNetworkLocation �g n  o  �f�f "0 networklocation networkLocation o  �e�e 0 fullurlrecord fullURLRecord�g  �h   o      �d�d "0 networklocation networkLocation�t  � Q  5	 r  

 c   n  o  �c�c "0 networklocation networkLocation o  �b�b 0 fullurlrecord fullURLRecord m  �a
�a 
ctxt o      �`�` "0 networklocation networkLocation R      �_�^
�_ .ascrerr ****      � ****�^   �]�\
�] 
errn d       m      �[�[��\  	 n "5 I  '5�Z�Y�Z .0 throwinvalidparameter throwInvalidParameter  o  '(�X�X 0 	urlrecord 	urlRecord  m  (+ �    m  +,�W
�W 
reco �V m  ,/ �   ~ U R L   c o m p o n e n t s   r e c o r d  s    n e t w o r k L o c a t i o n    p r o p e r t y   i s   n o t   t e x t .�V  �Y   o  "'�U�U 0 _support  � !"! l 6C#$%# r  6C&'& I 6A�T()
�T .Web:EscUnull���     ctxt( o  67�S�S 0 resourcepath resourcePath) �R*�Q
�R 
Safe* m  :=++ �,,  /�Q  ' o      �P�P 0 resourcepath resourcePath$ s m `split URL` (i.e. NSURL) automatically decodes % escapes in resource path, so automatically encode them here   % �-- �   ` s p l i t   U R L `   ( i . e .   N S U R L )   a u t o m a t i c a l l y   d e c o d e s   %   e s c a p e s   i n   r e s o u r c e   p a t h ,   s o   a u t o m a t i c a l l y   e n c o d e   t h e m   h e r e" ./. Z  D�01�O20 G  Dp343 > DI565 o  DE�N�N "0 networklocation networkLocation6 m  EH77 �88  4 l Ll9�M�L9 F  Ll:;: F  L_<=< > LQ>?> o  LM�K�K 0 	urlscheme 	urlScheme? m  MP@@ �AA  = E T[BCB o  TY�J�J 0 _usesnetloc _usesNetLocC o  YZ�I�I 0 	urlscheme 	urlScheme; H  bhDD C  bgEFE o  bc�H�H 0 resourcepath resourcePathF m  cfGG �HH  / /�M  �L  1 l s�IJKI k  s�LL MNM Z s�OP�G�FO F  s�QRQ > sxSTS o  st�E�E 0 resourcepath resourcePathT m  twUU �VV  R H  {�WW C  {�XYX o  {|�D�D 0 resourcepath resourcePathY m  |ZZ �[[  /P r  ��\]\ b  ��^_^ m  ��`` �aa  /_ o  ���C�C 0 resourcepath resourcePath] o      �B�B 0 resourcepath resourcePath�G  �F  N b�Ab r  ��cdc b  ��efe b  ��ghg m  ��ii �jj  / /h o  ���@�@ "0 networklocation networkLocationf o  ���?�? 0 resourcepath resourcePathd o      �>�> 0 urltext urlText�A  J / ) copied from Python's urllib.parse module   K �kk R   c o p i e d   f r o m   P y t h o n ' s   u r l l i b . p a r s e   m o d u l e�O  2 r  ��lml o  ���=�= 0 resourcepath resourcePathm o      �<�< 0 urltext urlText/ non Z ��pq�;�:p > ��rsr o  ���9�9 0 	urlscheme 	urlSchemes m  ��tt �uu  q r  ��vwv b  ��xyx b  ��z{z o  ���8�8 0 	urlscheme 	urlScheme{ m  ��|| �}}  :y o  ���7�7 0 urltext urlTextw o      �6�6 0 urltext urlText�;  �:  o ~~ Z �����5�4� > ����� o  ���3�3 "0 parameterstring parameterString� m  ���� ���  � r  ����� b  ����� b  ����� o  ���2�2 0 urltext urlText� m  ���� ���  ;� o  ���1�1 "0 parameterstring parameterString� o      �0�0 0 urltext urlText�5  �4   ��� Z �����/�.� > ����� o  ���-�- 0 querystring queryString� m  ���� ���  � r  ����� b  ����� b  ����� o  ���,�, 0 urltext urlText� m  ���� ���  ?� o  ���+�+ 0 querystring queryString� o      �*�* 0 urltext urlText�/  �.  � ��)� Z �����(�'� > ����� o  ���&�& (0 fragmentidentifier fragmentIdentifier� m  ���� ���  � r  ����� b  ����� b  ����� o  ���%�% 0 urltext urlText� m  ���� ���  #� o  ���$�$ (0 fragmentidentifier fragmentIdentifier� o      �#�# 0 urltext urlText�(  �'  �)  ��  [ l ����� r  ���� n ���� I  �"��!�" "0 astextparameter asTextParameter� ��� o  � �  0 	urlrecord 	urlRecord� ��� m  �� ���  �  �!  � o  ��� 0 _support  � o      �� 0 urltext urlText� M G assume it's a relative URL string that's going to be joined to baseURL   � ��� �   a s s u m e   i t ' s   a   r e l a t i v e   U R L   s t r i n g   t h a t ' s   g o i n g   t o   b e   j o i n e d   t o   b a s e U R LX ��� Z  `����� > ��� o  �� 0 baseurl baseURL� m  �� ���  � k  \�� ��� r  %��� n #��� I  #���� $0 asnsurlparameter asNSURLParameter� ��� o  �� 0 baseurl baseURL� ��� m  �� ���  u s i n g   b a s e   U R L�  �  � o  �� 0 _support  � o      �� 0 baseurl baseURL� ��� r  &5��� n &3��� I  -3���� <0 urlwithstring_relativetourl_ URLWithString_relativeToURL_� ��� o  -.�� 0 urltext urlText� ��� o  ./�� 0 baseurl baseURL�  �  � n &-��� o  )-�� 0 nsurl NSURL� m  &)�
� misccura� o      �� 0 asocurl asocURL� ��� Z 6T����
� = 6;��� o  67�	�	 0 asocurl asocURL� m  7:�
� 
msng� R  >P���
� .ascrerr ****      � ****� m  LO�� ���   N o t   a   v a l i d   U R L .� ���
� 
errn� m  BE���Y� ���
� 
erob� o  HI�� 0 urltext urlText�  �  �
  � ��� r  U\��� c  UZ��� o  UV� �  0 asocurl asocURL� m  VY��
�� 
ctxt� o      ���� 0 urltext urlText�  �  �  � ���� L  ac�� o  ab���� 0 urltext urlText��  T ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  U ����
�� consnume��  Q R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  R I  l|������� 
0 _error  � ��� m  mp�� ���  j o i n   U R L�    o  pq���� 0 etext eText  o  qr���� 0 enumber eNumber  o  rs���� 0 efrom eFrom �� o  sv���� 
0 eto eTo��  ��  N S M TO DO: if baseURL is given, direct parameter should be either record or text   O � �   T O   D O :   i f   b a s e U R L   i s   g i v e n ,   d i r e c t   p a r a m e t e r   s h o u l d   b e   e i t h e r   r e c o r d   o r   t e x tB 	 l     ��������  ��  ��  	 

 l     ��������  ��  ��    l     ����   J D--------------------------------------------------------------------    � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ����   7 1 encode/decode '%XX' escapes (UTF8 encoding only)    � b   e n c o d e / d e c o d e   ' % X X '   e s c a p e s   ( U T F 8   e n c o d i n g   o n l y )  l     ��������  ��  ��    l      ����  `Z From RFC2396:
	
   2.3. Unreserved Characters

   Data characters that are allowed in a URI but do not have a reserved
   purpose are called unreserved.  These include upper and lower case
   letters, decimal digits, and a limited set of punctuation marks and
   symbols.

      --unreserved  = alphanum | mark

      --mark        = "-" | "_" | "." | "!" | "~" | "*" | "'" | "(" | ")"

   Unreserved characters can be escaped without changing the semantics
   of the URI, but this should not be done unless the URI is being used
   in a context that does not allow the unescaped character to appear.
    ��   F r o m   R F C 2 3 9 6 : 
 	 
       2 . 3 .   U n r e s e r v e d   C h a r a c t e r s 
 
       D a t a   c h a r a c t e r s   t h a t   a r e   a l l o w e d   i n   a   U R I   b u t   d o   n o t   h a v e   a   r e s e r v e d 
       p u r p o s e   a r e   c a l l e d   u n r e s e r v e d .     T h e s e   i n c l u d e   u p p e r   a n d   l o w e r   c a s e 
       l e t t e r s ,   d e c i m a l   d i g i t s ,   a n d   a   l i m i t e d   s e t   o f   p u n c t u a t i o n   m a r k s   a n d 
       s y m b o l s . 
 
             - - u n r e s e r v e d     =   a l p h a n u m   |   m a r k 
 
             - - m a r k                 =   " - "   |   " _ "   |   " . "   |   " ! "   |   " ~ "   |   " * "   |   " ' "   |   " ( "   |   " ) " 
 
       U n r e s e r v e d   c h a r a c t e r s   c a n   b e   e s c a p e d   w i t h o u t   c h a n g i n g   t h e   s e m a n t i c s 
       o f   t h e   U R I ,   b u t   t h i s   s h o u l d   n o t   b e   d o n e   u n l e s s   t h e   U R I   i s   b e i n g   u s e d 
       i n   a   c o n t e x t   t h a t   d o e s   n o t   a l l o w   t h e   u n e s c a p e d   c h a r a c t e r   t o   a p p e a r . 
  l     ��������  ��  ��     l     ��!"��  ! � � set of characters that never need encoded (copied from Python's urllib.parse module); used by escape URL characters as base character set -- TO DO: any reason why urllib doesn't allow all of the above punctuation chars   " �##�   s e t   o f   c h a r a c t e r s   t h a t   n e v e r   n e e d   e n c o d e d   ( c o p i e d   f r o m   P y t h o n ' s   u r l l i b . p a r s e   m o d u l e ) ;   u s e d   b y   e s c a p e   U R L   c h a r a c t e r s   a s   b a s e   c h a r a c t e r   s e t   - -   T O   D O :   a n y   r e a s o n   w h y   u r l l i b   d o e s n ' t   a l l o w   a l l   o f   t h e   a b o v e   p u n c t u a t i o n   c h a r s  $%$ j   _ c��&�� "0 _safecharacters _safeCharacters& m   _ b'' �(( � a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9 - _ .% )*) l     ��������  ��  ��  * +,+ l     ��������  ��  ��  , -.- i  d g/0/ I      ��1���� 0 _replacetext _replaceText1 232 o      ���� 0 thetext theText3 454 o      ���� 0 fromtext fromText5 6��6 o      ���� 0 totext toText��  ��  0 k     77 898 r     :;: m     << �==  +; n     >?> 1    ��
�� 
txdl? 1    ��
�� 
ascr9 @A@ r    BCB n   	DED 2   	��
�� 
citmE o    ���� 0 thetext theTextC o      ���� 0 thelist theListA FGF r    HIH 1    ��
�� 
spacI n     JKJ 1    ��
�� 
txdlK 1    ��
�� 
ascrG L��L L    MM c    NON o    ���� 0 thelist theListO m    ��
�� 
ctxt��  . PQP l     ��������  ��  ��  Q RSR l     ��������  ��  ��  S TUT l     ��VW��  V  -----   W �XX 
 - - - - -U YZY l     ��������  ��  ��  Z [\[ i  h k]^] I     ��_`
�� .Web:EscUnull���     ctxt_ o      ���� 0 thetext theText` ��a��
�� 
Safea |����b��c��  ��  b o      ���� &0 allowedcharacters allowedCharacters��  c l     d����d m      ee �ff  ��  ��  ��  ^ Q     oghig k    Yjj klk r    mnm n   opo I    ��q���� "0 astextparameter asTextParameterq rsr o    	���� 0 thetext theTexts t��t m   	 
uu �vv  ��  ��  p o    ���� 0 _support  n o      ���� 0 thetext theTextl wxw r    $yzy b    "{|{ o    ���� "0 _safecharacters _safeCharacters| n   !}~} I    !������ "0 astextparameter asTextParameter ��� o    ���� &0 allowedcharacters allowedCharacters� ���� m    �� ���  p r e s e r v i n g��  ��  ~ o    ���� 0 _support  z o      ���� &0 allowedcharacters allowedCharactersx ��� r   % /��� n  % -��� I   ( -������� J0 #charactersetwithcharactersinstring_ #characterSetWithCharactersInString_� ���� o   ( )���� &0 allowedcharacters allowedCharacters��  ��  � n  % (��� o   & (����  0 nscharacterset NSCharacterSet� m   % &��
�� misccura� o      ���� $0 asocallowedchars asocAllowedChars� ��� l  0 A���� r   0 A��� n  0 ?��� I   : ?������� j0 3stringbyaddingpercentencodingwithallowedcharacters_ 3stringByAddingPercentEncodingWithAllowedCharacters_� ���� o   : ;���� $0 asocallowedchars asocAllowedChars��  ��  � n  0 :��� I   5 :������� 0 
asnsstring 
asNSString� ���� o   5 6���� 0 thetext theText��  ��  � o   0 5���� 0 _support  � o      ���� 0 
asocresult 
asocResult��� Returns a new string made from the receiver by replacing all characters not in the allowedCharacters set with percent encoded characters. UTF-8 encoding is used to determine the correct percent encoded characters. Entire URL strings cannot be percent-encoded. This method is intended to percent-encode an URL component or subcomponent string, NOT the entire URL string. Any characters in allowedCharacters outside of the 7-bit ASCII range are ignored.   � ����   R e t u r n s   a   n e w   s t r i n g   m a d e   f r o m   t h e   r e c e i v e r   b y   r e p l a c i n g   a l l   c h a r a c t e r s   n o t   i n   t h e   a l l o w e d C h a r a c t e r s   s e t   w i t h   p e r c e n t   e n c o d e d   c h a r a c t e r s .   U T F - 8   e n c o d i n g   i s   u s e d   t o   d e t e r m i n e   t h e   c o r r e c t   p e r c e n t   e n c o d e d   c h a r a c t e r s .   E n t i r e   U R L   s t r i n g s   c a n n o t   b e   p e r c e n t - e n c o d e d .   T h i s   m e t h o d   i s   i n t e n d e d   t o   p e r c e n t - e n c o d e   a n   U R L   c o m p o n e n t   o r   s u b c o m p o n e n t   s t r i n g ,   N O T   t h e   e n t i r e   U R L   s t r i n g .   A n y   c h a r a c t e r s   i n   a l l o w e d C h a r a c t e r s   o u t s i d e   o f   t h e   7 - b i t   A S C I I   r a n g e   a r e   i g n o r e d .� ��� l  B T���� Z  B T������� =  B E��� o   B C���� 0 
asocresult 
asocResult� m   C D��
�� 
msng� R   H P����
�� .ascrerr ****      � ****� m   N O�� ��� ^ C o u l d n ' t   c o n v e r t   c h a r a c t e r s   t o   p e r c e n t   e s c a p e s .� ����
�� 
errn� m   J K�����Y� �����
�� 
erob� o   L M���� 0 thetext theText��  ��  ��  � , & NSString docs are hopeless on details   � ��� L   N S S t r i n g   d o c s   a r e   h o p e l e s s   o n   d e t a i l s� ��� L   U Y�� c   U X��� o   U V�~�~ 0 
asocresult 
asocResult� m   V W�}
�} 
ctxt�  h R      �|��
�| .ascrerr ****      � ****� o      �{�{ 0 etext eText� �z��
�z 
errn� o      �y�y 0 enumber eNumber� �x��
�x 
erob� o      �w�w 0 efrom eFrom� �v��u
�v 
errt� o      �t�t 
0 eto eTo�u  i I   a o�s��r�s 
0 _error  � ��� m   b e�� ��� * e s c a p e   U R L   c h a r a c t e r s� ��� o   e f�q�q 0 etext eText� ��� o   f g�p�p 0 enumber eNumber� ��� o   g h�o�o 0 efrom eFrom� ��n� o   h i�m�m 
0 eto eTo�n  �r  \ ��� l     �l�k�j�l  �k  �j  � ��� l     �i�h�g�i  �h  �g  � ��� i  l o��� I     �f��e
�f .Web:UneUnull���     ctxt� o      �d�d 0 thetext theText�e  � Q     K���� k    9�� ��� r    ��� n   ��� I    �c��b�c "0 astextparameter asTextParameter� ��� o    	�a�a 0 thetext theText� ��`� m   	 
�� ���  �`  �b  � o    �_�_ 0 _support  � o      �^�^ 0 thetext theText� ��� l   !���� r    !��� n   ��� I    �]�\�[�] B0 stringbyremovingpercentencoding stringByRemovingPercentEncoding�\  �[  � n   ��� I    �Z��Y�Z 0 
asnsstring 
asNSString� ��X� o    �W�W 0 thetext theText�X  �Y  � o    �V�V 0 _support  � o      �U�U 0 
asocresult 
asocResult� � � Returns a new string made from the receiver by replacing all percent encoded sequences with the matching UTF-8 characters. (NSURLUtilites, 10.9+)   � ���$   R e t u r n s   a   n e w   s t r i n g   m a d e   f r o m   t h e   r e c e i v e r   b y   r e p l a c i n g   a l l   p e r c e n t   e n c o d e d   s e q u e n c e s   w i t h   t h e   m a t c h i n g   U T F - 8   c h a r a c t e r s .   ( N S U R L U t i l i t e s ,   1 0 . 9 + )� ��� Z  " 4���T�S� =  " %��� o   " #�R�R 0 
asocresult 
asocResult� m   # $�Q
�Q 
msng� R   ( 0�P��
�P .ascrerr ****      � ****� m   . /�� ��� � C o u l d n ' t   c o n v e r t   p e r c e n t   e s c a p e s   t o   c h a r a c t e r s   ( e . g .   n o t   v a l i d   U T F 8 ) .� �O��
�O 
errn� m   * +�N�N�Y� �M��L
�M 
erob� o   , -�K�K 0 thetext theText�L  �T  �S  � ��J� L   5 9�� c   5 8��� o   5 6�I�I 0 
asocresult 
asocResult� m   6 7�H
�H 
ctxt�J  � R      �G� 
�G .ascrerr ****      � ****� o      �F�F 0 etext eText  �E
�E 
errn o      �D�D 0 enumber eNumber �C
�C 
erob o      �B�B 0 efrom eFrom �A�@
�A 
errt o      �?�? 
0 eto eTo�@  � I   A K�>�=�> 
0 _error    m   B C		 �

 . u n e s c a p e   U R L   c h a r a c t e r s  o   C D�<�< 0 etext eText  o   D E�;�; 0 enumber eNumber  o   E F�:�: 0 efrom eFrom �9 o   F G�8�8 
0 eto eTo�9  �=  �  l     �7�6�5�7  �6  �5    l     �4�3�2�4  �3  �2    l     �1�1   J D--------------------------------------------------------------------    � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     �0�0   � � parse and format "key1=value1&key2=value2&..." query strings or 'application/x-www-form-urlencoded' data as {{"KEY","VALUE"},...} list    �   p a r s e   a n d   f o r m a t   " k e y 1 = v a l u e 1 & k e y 2 = v a l u e 2 & . . . "   q u e r y   s t r i n g s   o r   ' a p p l i c a t i o n / x - w w w - f o r m - u r l e n c o d e d '   d a t a   a s   { { " K E Y " , " V A L U E " } , . . . }   l i s t  !  l     �/�.�-�/  �.  �-  ! "#" i  p s$%$ I     �,&�+
�, .Web:SplQnull���     ctxt& o      �*�* 0 	querytext 	queryText�+  % P     �'()' k    �** +,+ r    
-.- n   /0/ 1    �)
�) 
txdl0 1    �(
�( 
ascr. o      �'�' 0 oldtids oldTIDs, 1�&1 Q    �2342 k    �55 676 r    "898 I     �%:�$�% 0 _replacetext _replaceText: ;<; n   =>= I    �#?�"�# "0 astextparameter asTextParameter? @A@ o    �!�! 0 	querytext 	queryTextA B� B m    CC �DD  �   �"  > o    �� 0 _support  < EFE m    GG �HH  +F I�I 1    �
� 
spac�  �$  9 o      �� 0 	querytext 	queryText7 JKJ r   # (LML m   # $NN �OO  &M n     PQP 1   % '�
� 
txdlQ 1   $ %�
� 
ascrK RSR r   ) .TUT n  ) ,VWV 2  * ,�
� 
citmW o   ) *�� 0 	querytext 	queryTextU o      �� 0 	querylist 	queryListS XYX r   / 4Z[Z m   / 0\\ �]]  =[ n     ^_^ 1   1 3�
� 
txdl_ 1   0 1�
� 
ascrY `a` X   5 �b�cb k   E �dd efe r   E Mghg n   E Kiji 2  I K�
� 
citmj l  E Ik��k e   E Ill n  E Imnm 1   F H�
� 
pcntn o   E F�� 0 aref aRef�  �  h o      �� 0 
queryparts 
queryPartsf opo l  N nqrsq Z  N ntu��t >   N Uvwv n   N Sxyx 1   O S�
� 
lengy o   N O�
�
 0 
queryparts 
queryPartsw m   S T�	�	 u R   X j�z{
� .ascrerr ****      � ****z m   f i|| �}} * I n v a l i d   q u e r y   s t r i n g .{ �~
� 
errn~ m   \ _���Y ���
� 
erob� o   b c�� 0 	querytext 	queryText�  �  �  r h b TO DO: implement 'without strict parsing' option, in which case missing `=` wouldn't throw error?   s ��� �   T O   D O :   i m p l e m e n t   ' w i t h o u t   s t r i c t   p a r s i n g '   o p t i o n ,   i n   w h i c h   c a s e   m i s s i n g   ` = `   w o u l d n ' t   t h r o w   e r r o r ?p ��� l  o o����  � N H TO DO: what if key is empty string? error here, or leave it for caller?   � ��� �   T O   D O :   w h a t   i f   k e y   i s   e m p t y   s t r i n g ?   e r r o r   h e r e ,   o r   l e a v e   i t   f o r   c a l l e r ?� ��� r   o ���� J   o ��� ��� I  o w� ���
�  .Web:UneUnull���     ctxt� l  o s������ n   o s��� 4   p s���
�� 
cobj� m   q r���� � o   o p���� 0 
queryparts 
queryParts��  ��  ��  � ���� I  w �����
�� .Web:UneUnull���     ctxt� l  w {������ n   w {��� 4   x {���
�� 
cobj� m   y z���� � o   w x���� 0 
queryparts 
queryParts��  ��  ��  ��  � n     ��� 1   � ���
�� 
pcnt� o   � ����� 0 aref aRef�  � 0 aref aRefc o   8 9���� 0 	querylist 	queryLista ��� r   � ���� o   � ����� 0 oldtids oldTIDs� n     ��� 1   � ���
�� 
txdl� 1   � ���
�� 
ascr� ���� L   � ��� o   � ����� 0 	querylist 	queryList��  3 R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  4 k   � ��� ��� r   � ���� o   � ����� 0 oldtids oldTIDs� n     ��� 1   � ���
�� 
txdl� 1   � ���
�� 
ascr� ���� I   � �������� 
0 _error  � ��� m   � ��� ��� , s p l i t   U R L   q u e r y   s t r i n g� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  ��  �&  ( ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  ) ����
�� consnume��  # ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  t w��� I     �����
�� .Web:JoiQnull���     ****� o      ���� 0 	querylist 	queryList��  � k     ��� ��� r     ��� n    ��� 1    ��
�� 
txdl� 1     ��
�� 
ascr� o      ���� 0 oldtids oldTIDs� ���� Q    ����� k   	 ��� ��� r   	 ��� n  	 ��� 2   ��
�� 
cobj� n  	 ��� I    ������� 0 aslist asList� ��� o    ���� 0 	querylist 	queryList� ���� m    �� ���  ��  ��  � o   	 ���� 0 _support  � o      ���� 0 	querylist 	queryList� ��� X    ������ k   ) ��� ��� r   ) .��� n  ) ,��� 1   * ,��
�� 
pcnt� o   ) *���� 0 aref aRef� o      ���� 0 kvpair kvPair� ��� Z  / T������� F   / E��� H   / ;�� =   / :��� l  / 8������ I  / 8����
�� .corecnte****       ****� J   / 2�� ���� o   / 0���� 0 kvpair kvPair��  � �����
�� 
kocl� m   3 4��
�� 
list��  ��  ��  � m   8 9���� � =   > C��� n  > A   1   ? A��
�� 
leng o   > ?���� 0 kvpair kvPair� m   A B���� � R   H P��
�� .ascrerr ****      � **** m   N O � l I n v a l i d   q u e r y   l i s t   ( n o t   a   l i s t   o f   k e y - v a l u e   s u b l i s t s ) . ��
�� 
errn m   J K�����Y ����
�� 
erob o   L M���� 0 aref aRef��  ��  ��  � 	
	 Z   U r���� H   U a =   U ` l  U ^���� I  U ^��
�� .corecnte****       **** o   U V���� 0 kvpair kvPair ����
�� 
kocl m   W Z��
�� 
ctxt��  ��  ��   m   ^ _����  R   d n��
�� .ascrerr ****      � **** m   j m � d I n v a l i d   q u e r y   l i s t   ( k e y s   a n d   v a l u e s   m u s t   b e   t e x t ) . ��
�� 
errn m   f g�����Y ����
�� 
erob o   h i���� 0 aref aRef��  ��  ��  
 �� r   s � I   s ������� 0 _replacetext _replaceText   b   t �!"! b   t �#$# l  t �%����% I  t ���&'
�� .Web:EscUnull���     ctxt& l  t x(����( n  t x)*) 4   u x��+
�� 
cobj+ m   v w���� * o   t u���� 0 kvpair kvPair��  ��  ' ��,��
�� 
Safe, 1   { ~��
�� 
spac��  ��  ��  $ m   � �-- �..  =" l  � �/����/ I  � ���01
�� .Web:EscUnull���     ctxt0 l  � �2���2 n  � �343 4   � ��~5
�~ 
cobj5 m   � ��}�} 4 o   � ��|�| 0 kvpair kvPair��  �  1 �{6�z
�{ 
Safe6 1   � ��y
�y 
spac�z  ��  ��    787 1   � ��x
�x 
spac8 9�w9 m   � �:: �;;  +�w  ��   n     <=< 1   � ��v
�v 
pcnt= o   � ��u�u 0 	querylist 	queryList��  �� 0 aref aRef� o    �t�t 0 	querylist 	queryList� >?> r   � �@A@ m   � �BB �CC  &A n     DED 1   � ��s
�s 
txdlE 1   � ��r
�r 
ascr? FGF r   � �HIH c   � �JKJ o   � ��q�q 0 	querylist 	queryListK m   � ��p
�p 
ctxtI o      �o�o 0 	querytext 	queryTextG LML r   � �NON o   � ��n�n 0 oldtids oldTIDsO n     PQP 1   � ��m
�m 
txdlQ 1   � ��l
�l 
ascrM R�kR L   � �SS o   � ��j�j 0 	querytext 	queryText�k  � R      �iTU
�i .ascrerr ****      � ****T o      �h�h 0 etext eTextU �gVW
�g 
errnV o      �f�f 0 enumber eNumberW �eXY
�e 
erobX o      �d�d 0 efrom eFromY �cZ�b
�c 
errtZ o      �a�a 
0 eto eTo�b  � k   � �[[ \]\ r   � �^_^ o   � ��`�` 0 oldtids oldTIDs_ n     `a` 1   � ��_
�_ 
txdla 1   � ��^
�^ 
ascr] b�]b I   � ��\c�[�\ 
0 _error  c ded m   � �ff �gg * j o i n   U R L   q u e r y   s t r i n ge hih o   � ��Z�Z 0 etext eTexti jkj o   � ��Y�Y 0 enumber eNumberk lml o   � ��X�X 0 efrom eFromm n�Wn o   � ��V�V 
0 eto eTo�W  �[  �]  ��  � opo l     �U�T�S�U  �T  �S  p qrq l     �R�Q�P�R  �Q  �P  r sts l     �Ouv�O  u J D--------------------------------------------------------------------   v �ww � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -t xyx l     �Nz{�N  z , & encode/decode AS objects as JSON data   { �|| L   e n c o d e / d e c o d e   A S   o b j e c t s   a s   J S O N   d a t ay }~} l     �M�L�K�M  �L  �K  ~ � i  x {��� I     �J��
�J .Web:FJSNnull���     ****� o      �I�I 0 
jsonobject 
jsonObject� �H��G
�H 
EWSp� |�F�E��D��F  �E  � o      �C�C "0 isprettyprinted isPrettyPrinted�D  � l     ��B�A� m      �@
�@ boovfals�B  �A  �G  � Q     ����� k    ��� ��� Z    ���?�� n   ��� I    �>��=�> (0 asbooleanparameter asBooleanParameter� ��� o    	�<�< "0 isprettyprinted isPrettyPrinted� ��;� m   	 
�� ��� " e x t r a   w h i t e   s p a c e�;  �=  � o    �:�: 0 _support  � r    ��� n   ��� o    �9�9 80 nsjsonwritingprettyprinted NSJSONWritingPrettyPrinted� m    �8
�8 misccura� o      �7�7 0 writeoptions writeOptions�?  � r    ��� m    �6�6  � o      �5�5 0 writeoptions writeOptions� ��� Z    5���4�3� H    &�� l   %��2�1� n   %��� I     %�0��/�0 (0 isvalidjsonobject_ isValidJSONObject_� ��.� o     !�-�- 0 
jsonobject 
jsonObject�.  �/  � n    ��� o     �,�, *0 nsjsonserialization NSJSONSerialization� m    �+
�+ misccura�2  �1  � R   ) 1�*��
�* .ascrerr ****      � ****� m   / 0�� ��� z C a n  t   c o n v e r t   o b j e c t   t o   J S O N   ( f o u n d   u n s u p p o r t e d   o b j e c t   t y p e ) .� �)��
�) 
errn� m   + ,�(�(�Y� �'��&
�' 
erob� o   - .�%�% 0 
jsonobject 
jsonObject�&  �4  �3  � ��� r   6 O��� n  6 @��� I   9 @�$��#�$ F0 !datawithjsonobject_options_error_ !dataWithJSONObject_options_error_� ��� o   9 :�"�" 0 
jsonobject 
jsonObject� ��� o   : ;�!�! 0 writeoptions writeOptions� �� � l  ; <���� m   ; <�
� 
obj �  �  �   �#  � n  6 9��� o   7 9�� *0 nsjsonserialization NSJSONSerialization� m   6 7�
� misccura� J      �� ��� o      �� 0 thedata theData� ��� o      �� 0 theerror theError�  � ��� Z  P l����� =  P S��� o   P Q�� 0 thedata theData� m   Q R�
� 
msng� R   V h���
� .ascrerr ****      � ****� b   \ g��� b   \ c��� m   \ ]�� ��� : C a n  t   c o n v e r t   o b j e c t   t o   J S O N (� n  ] b��� I   ^ b���� ,0 localizeddescription localizedDescription�  �  � o   ] ^�� 0 theerror theError� m   c f�� ���  ) .� ���
� 
errn� m   X Y���Y� ���
� 
erob� o   Z [�
�
 0 
jsonobject 
jsonObject�  �  �  � ��	� L   m ��� c   m ���� l  m ����� n  m ���� I   v ����� 00 initwithdata_encoding_ initWithData_encoding_� ��� o   v w�� 0 thedata theData� ��� l  w |���� n  w |��� o   x |� �  ,0 nsutf8stringencoding NSUTF8StringEncoding� m   w x��
�� misccura�  �  �  �  � n  m v��� I   r v�������� 	0 alloc  ��  ��  � n  m r��� o   n r���� 0 nsstring NSString� m   m n��
�� misccura�  �  � m   � ���
�� 
ctxt�	  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I   � �������� 
0 _error  � ��� m   � ��� ���  f o r m a t   J S O N� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  �    l     ��������  ��  ��    l     ��������  ��  ��    i  |  I     ��	
�� .Web:PJSNnull���     ctxt o      ���� 0 jsontext jsonText	 ��
��
�� 
Frag
 |��������  ��   o      ���� *0 arefragmentsallowed areFragmentsAllowed��   l     ���� m      ��
�� boovfals��  ��  ��   Q     � k    �  r     n    I    ������ "0 astextparameter asTextParameter  o    	���� 0 jsontext jsonText �� m   	 
 �  ��  ��   o    ���� 0 _support   o      ���� 0 jsontext jsonText  Z    * !��"  n   #$# I    ��%���� (0 asbooleanparameter asBooleanParameter% &'& o    ���� *0 arefragmentsallowed areFragmentsAllowed' (��( m    )) �** $ a l l o w i n g   f r a g m e n t s��  ��  $ o    ���� 0 _support  ! r    $+,+ n   "-.- o     "���� :0 nsjsonreadingallowfragments NSJSONReadingAllowFragments. m     ��
�� misccura, o      ���� 0 readoptions readOptions��  " r   ' */0/ m   ' (����  0 o      ���� 0 readoptions readOptions 121 r   + >343 n  + <565 I   5 <��7���� (0 datausingencoding_ dataUsingEncoding_7 8��8 l  5 89����9 n  5 8:;: o   6 8���� ,0 nsutf8stringencoding NSUTF8StringEncoding; m   5 6��
�� misccura��  ��  ��  ��  6 n  + 5<=< I   0 5��>���� 0 
asnsstring 
asNSString> ?��? o   0 1���� 0 jsontext jsonText��  ��  = o   + 0���� 0 _support  4 o      ���� 0 thedata theData2 @A@ r   ? XBCB n  ? IDED I   B I��F���� F0 !jsonobjectwithdata_options_error_ !JSONObjectWithData_options_error_F GHG o   B C���� 0 thedata theDataH IJI o   C D���� 0 readoptions readOptionsJ K��K l  D EL����L m   D E��
�� 
obj ��  ��  ��  ��  E n  ? BMNM o   @ B���� *0 nsjsonserialization NSJSONSerializationN m   ? @��
�� misccuraC J      OO PQP o      ���� 0 
jsonobject 
jsonObjectQ R��R o      ���� 0 theerror theError��  A STS Z  Y {UV����U =  Y \WXW o   Y Z���� 0 
jsonobject 
jsonObjectX m   Z [��
�� 
msngV R   _ w��YZ
�� .ascrerr ****      � ****Y b   i v[\[ b   i r]^] m   i l__ �``   N o t   v a l i d   J S O N   (^ n  l qaba I   m q�������� ,0 localizeddescription localizedDescription��  ��  b o   l m���� 0 theerror theError\ m   r ucc �dd  ) .Z ��ef
�� 
errne m   a b�����Yf ��g��
�� 
erobg o   e f���� 0 jsontext jsonText��  ��  ��  T h��h L   | �ii c   | �jkj o   | }���� 0 
jsonobject 
jsonObjectk m   } ���
�� 
****��   R      ��lm
�� .ascrerr ****      � ****l o      ���� 0 etext eTextm ��no
�� 
errnn o      ���� 0 enumber eNumbero ��pq
�� 
erobp o      ���� 0 efrom eFromq ��r��
�� 
errtr o      ���� 
0 eto eTo��   I   � ���s���� 
0 _error  s tut m   � �vv �ww  p a r s e   J S O Nu xyx o   � ����� 0 etext eTexty z{z o   � ����� 0 enumber eNumber{ |}| o   � ����� 0 efrom eFrom} ~��~ o   � ����� 
0 eto eTo��  ��   � l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   HTTP dispatch   � ���    H T T P   d i s p a t c h� ��� l     ��������  ��  ��  � ��� l     ���� j   � ������ "0 _excludeheaders _excludeHeaders� J   � ��� ��� m   � ��� ���  A u t h o r i z a t i o n� ��� m   � ��� ���  C o n n e c t i o n� ��� m   � ��� ���  H o s t� ��� m   � ��� ��� $ P r o x y - A u t h e n t i c a t e� ��� m   � ��� ��� & P r o x y - A u t h o r i z a t i o n� ��� m   � ��� ���   W W W - A u t h e n t i c a t e� ��� m   � ��� ���  C o n t e n t - L e n g t h�  � � � note: unlike authorization headers, "Content-Length" isn't reserved by NSSession but is already set automatically so no point allowing users to override with potentially wrong value   � ���l   n o t e :   u n l i k e   a u t h o r i z a t i o n   h e a d e r s ,   " C o n t e n t - L e n g t h "   i s n ' t   r e s e r v e d   b y   N S S e s s i o n   b u t   i s   a l r e a d y   s e t   a u t o m a t i c a l l y   s o   n o   p o i n t   a l l o w i n g   u s e r s   t o   o v e r r i d e   w i t h   p o t e n t i a l l y   w r o n g   v a l u e� ��� l     �~�}�|�~  �}  �|  � ��� l     �{�z�y�{  �z  �y  � ��� h   � ��x��x (0 _nsstringencodings _NSStringEncodings� k      �� ��� l     �w�v�u�w  �v  �u  � ��� l     �t���t  � $  NS...StringEncoding constants   � ��� <   N S . . . S t r i n g E n c o d i n g   c o n s t a n t s� ��� j     ��s��s 
0 _list_  � J     ��� ��� l 	   ��r�q� J     �� ��� J     �� ��� m     �� ��� 
 u t f - 8� ��p� m    �� ���  u t f 8�p  � ��o� m    �n�n �o  �r  �q  � ��� l 	  ��m�l� J    �� ��� J    �� ��� m    �� ���  u t f - 1 6� ��k� m    	�� ��� 
 u t f 1 6�k  � ��j� m    �i�i 
�j  �m  �l  � ��� l 	  ��h�g� J    �� ��� J    �� ��� m    �� ���  u t f - 1 6 b e� ��f� m    �� ���  u t f 1 6 b e�f  � ��e� m    �� A�      �e  �h  �g  � ��� l 	  ��d�c� J    �� ��� J    �� ��� m    �� ���  u t f - 1 6 l e� ��b� m    �� �    u t f 1 6 l e�b  � �a m     A�     �a  �d  �c  �  l 	  #�`�_ J    #  J     		 

 m     �  u t f - 3 2 �^ m     � 
 u t f 3 2�^   �] m     ! A�     �]  �`  �_    l 	 # .�\�[ J   # .  J   # )  m   # $ �  u t f - 3 2 b e �Z m   $ ' �    u t f 3 2 b e�Z   !�Y! m   ) ,"" A�      �Y  �\  �[   #$# l 	 . ;%�X�W% J   . ;&& '(' J   . 6)) *+* m   . 1,, �--  u t f - 3 2 l e+ .�V. m   1 4// �00  u t f 3 2 l e�V  ( 1�U1 m   6 922 A�     �U  �X  �W  $ 343 l 	 ; C5�T�S5 J   ; C66 787 J   ; @99 :�R: m   ; >;; �<< 
 a s c i i�R  8 =�Q= m   @ A�P�P �Q  �T  �S  4 >?> l 	 C S@�O�N@ J   C SAA BCB J   C NDD EFE m   C FGG �HH  i s o - 2 0 2 2 - j pF IJI m   F IKK �LL  i s o 2 0 2 2 j pJ M�MM m   I LNN �OO  c s i s o 2 0 2 2 j p�M  C P�LP m   N Q�K�K �L  �O  �N  ? QRQ l 	 S cS�J�IS J   S cTT UVU J   S ^WW XYX m   S VZZ �[[  i s o - 8 8 5 9 - 1Y \]\ m   V Y^^ �__  l a t i n 1] `�H` m   Y \aa �bb  i s o 8 8 5 9 - 1�H  V c�Gc m   ^ a�F�F �G  �J  �I  R ded l 	 c sf�E�Df J   c sgg hih J   c njj klk m   c fmm �nn  i s o - 8 8 5 9 - 2l opo m   f iqq �rr  l a t i n 2p s�Cs m   i ltt �uu  i s o 8 8 5 9 - 2�C  i v�Bv m   n q�A�A 	�B  �E  �D  e wxw l 	 s �y�@�?y J   s �zz {|{ J   s �}} ~~ m   s v�� ���  e u c - j p ��� m   v y�� ��� 
 u - j i s� ��� m   y |�� ��� 
 e u c j p� ��>� m   | �� ���  u j i s�>  | ��=� m   � ��<�< �=  �@  �?  x ��� l 	 � ���;�:� J   � ��� ��� J   � ��� ��9� m   � ��� ���  m a c r o m a n�9  � ��8� m   � ��7�7 �8  �;  �:  � ��� l 	 � ���6�5� J   � ��� ��� J   � ��� ��� m   � ��� ���  s h i f t - j i s� ��� m   � ��� ��� 
 s - j i s� ��4� m   � ��� ���  s j i s�4  � ��3� m   � ��2�2 �3  �6  �5  � ��� l 	 � ���1�0� J   � ��� ��� J   � ��� ��� m   � ��� ���  w i n d o w s - 1 2 5 0� ��� m   � ��� ���  w i n d o w s 1 2 5 0� ��/� m   � ��� ���  c p 1 2 5 0�/  � ��.� m   � ��-�- �.  �1  �0  � ��� l 	 � ���,�+� J   � ��� ��� J   � ��� ��� m   � ��� ���  w i n d o w s - 1 2 5 1� ��� m   � ��� ���  w i n d o w s 1 2 5 1� ��*� m   � ��� ���  c p 1 2 5 1�*  � ��)� m   � ��(�( �)  �,  �+  � ��� l 	 � ���'�&� J   � ��� ��� J   � ��� ��� m   � ��� ���  w i n d o w s - 1 2 5 2� ��� m   � ��� ���  w i n d o w s 1 2 5 2� ��%� m   � ��� ���  c p 1 2 5 2�%  � ��$� m   � ��#�# �$  �'  �&  � ��� l 	 � ���"�!� J   � ��� ��� J   � ��� ��� m   � ��� ���  w i n d o w s - 1 2 5 3� ��� m   � ��� ���  w i n d o w s 1 2 5 3� �� � m   � ��� ���  c p 1 2 5 3�   � ��� m   � ��� �  �"  �!  � ��� l 	 � ����� J   � ��� ��� J   � ��� ��� m   � �	 	  �		  w i n d o w s - 1 2 5 4� 			 m   � �		 �		  w i n d o w s 1 2 5 4	 	�	 m   � �		 �		  c p 1 2 5 4�  � 		�		 m   � ��� �  �  �  �  � 	
		
 l     ����  �  �  	 	�	 i  � �			 I      �	�� 0 getencoding getEncoding	 	�	 o      �� 0 textencoding textEncoding�  �  	 Q     A		�	 P    8				 k    7		 			 X    4	�		 Z   /		��	 E   "			 n   		 	 4    �	!
� 
cobj	! m    �
�
 	  o    �	�	 0 aref aRef	 J    !	"	" 	#�	# o    �� 0 textencoding textEncoding�  	 L   % +	$	$ n  % *	%	&	% 4   & )�	'
� 
cobj	' m   ' (�� 	& o   % &�� 0 aref aRef�  �  � 0 aref aRef	 n   	(	)	( o    �� 
0 _list_  	)  f    	 	*�	* L   5 7	+	+ m   5 6�
� 
msng�  	 � 	,
�  consdiac	, ��	-
�� conshyph	- ��	.
�� conspunc	. ����
�� conswhit��  	 ��	/
�� conscase	/ ����
�� consnume��  	 R      ������
�� .ascrerr ****      � ****��  ��  �  �  � 	0	1	0 l     ��������  ��  ��  	1 	2	3	2 l     ��������  ��  ��  	3 	4	5	4 i  � �	6	7	6 I      ��	8���� 0 _parsecharset _parseCharset	8 	9��	9 o      ���� "0 asoccontenttype asocContentType��  ��  	7 k     :	:	: 	;	<	; l    	=	>	?	= r     	@	A	@ n    
	B	C	B I    
��	D���� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_	D 	E	F	E m    	G	G �	H	H N ; \ s * c h a r s e t \ s * = \ s * ( " ? ) ( . + ? ) \ 1 \ s * ( ? : ; | $ )	F 	I	J	I m    ����  	J 	K��	K l   	L����	L m    ��
�� 
msng��  ��  ��  ��  	C n    	M	N	M o    ���� *0 nsregularexpression NSRegularExpression	N m     ��
�� misccura	A o      ���� 0 asocpattern asocPattern	> � � sloppy non-RFC1341 pattern not appropriate for general parameter matching, but adequate here as the value will be rejected anyway unless it matches one of the encoding names defined above   	? �	O	Ox   s l o p p y   n o n - R F C 1 3 4 1   p a t t e r n   n o t   a p p r o p r i a t e   f o r   g e n e r a l   p a r a m e t e r   m a t c h i n g ,   b u t   a d e q u a t e   h e r e   a s   t h e   v a l u e   w i l l   b e   r e j e c t e d   a n y w a y   u n l e s s   i t   m a t c h e s   o n e   o f   t h e   e n c o d i n g   n a m e s   d e f i n e d   a b o v e	< 	P	Q	P r    	R	S	R n   	T	U	T I    ��	V���� F0 !firstmatchinstring_options_range_ !firstMatchInString_options_range_	V 	W	X	W o    ���� "0 asoccontenttype asocContentType	X 	Y	Z	Y m    ����  	Z 	[��	[ J    	\	\ 	]	^	] m    ����  	^ 	_��	_ n   	`	a	` I    �������� 
0 length  ��  ��  	a o    ���� "0 asoccontenttype asocContentType��  ��  ��  	U o    ���� 0 asocpattern asocPattern	S o      ���� 0 	asocmatch 	asocMatch	Q 	b	c	b Z   +	d	e����	d =   "	f	g	f o     ���� 0 	asocmatch 	asocMatch	g m     !��
�� 
msng	e L   % '	h	h m   % &��
�� 
msng��  ��  	c 	i��	i L   , :	j	j c   , 9	k	l	k l  , 7	m����	m n  , 7	n	o	n I   - 7��	p���� *0 substringwithrange_ substringWithRange_	p 	q��	q l  - 3	r����	r n  - 3	s	t	s I   . 3��	u���� 0 rangeatindex_ rangeAtIndex_	u 	v��	v m   . /���� ��  ��  	t o   - .���� 0 	asocmatch 	asocMatch��  ��  ��  ��  	o o   , -���� "0 asoccontenttype asocContentType��  ��  	l m   7 8��
�� 
ctxt��  	5 	w	x	w l     ��������  ��  ��  	x 	y	z	y l     ��������  ��  ��  	z 	{	|	{ i  � �	}	~	} I      ��	���� $0 _makehttprequest _makeHTTPRequest	 	�	�	� o      ���� 0 theurl theURL	� 	�	�	� o      ���� 0 
httpmethod 
httpMethod	� 	�	�	� o      ����  0 requestheaders requestHeaders	� 	�	�	� o      ���� 0 requestbody requestBody	� 	���	� o      ���� $0 timeoutinseconds timeoutInSeconds��  ��  	~ P    -	�	�	�	� k   ,	�	� 	�	�	� l   ��	�	���  	�   build HTTP request   	� �	�	� &   b u i l d   H T T P   r e q u e s t	� 	�	�	� r    	�	�	� n   	�	�	� I    ��	����� "0 requestwithurl_ requestWithURL_	� 	���	� l   	�����	� n   	�	�	� I    ��	����� $0 asnsurlparameter asNSURLParameter	� 	�	�	� o    ���� 0 theurl theURL	� 	���	� m    	�	� �	�	�  t o��  ��  	� o    ���� 0 _support  ��  ��  ��  ��  	� n   	�	�	� o    ���� *0 nsmutableurlrequest NSMutableURLRequest	� m    ��
�� misccura	� o      ���� 0 httprequest httpRequest	� 	�	�	� l   '	�	�	�	� r    '	�	�	� n   %	�	�	� I    %��	����� "0 astextparameter asTextParameter	� 	�	�	� o     ���� 0 
httpmethod 
httpMethod	� 	���	� m     !	�	� �	�	�  m e t h o d��  ��  	� o    ���� 0 _support  	� o      ���� 0 
httpmethod 
httpMethod	� O I TO DO: what if any checks are needed here (e.g. non-empty/invalid chars)   	� �	�	� �   T O   D O :   w h a t   i f   a n y   c h e c k s   a r e   n e e d e d   h e r e   ( e . g .   n o n - e m p t y / i n v a l i d   c h a r s )	� 	�	�	� n  ( .	�	�	� I   ) .��	�����  0 sethttpmethod_ setHTTPMethod_	� 	���	� o   ) *���� 0 
httpmethod 
httpMethod��  ��  	� o   ( )���� 0 httprequest httpRequest	� 	�	�	� l  / ?	�	�	�	� Z  / ?	�	�����	� >  / 2	�	�	� o   / 0���� $0 timeoutinseconds timeoutInSeconds	� m   0 1��
�� 
msng	� n  5 ;	�	�	� I   6 ;��	����� *0 settimeoutinterval_ setTimeoutInterval_	� 	���	� o   6 7���� $0 timeoutinseconds timeoutInSeconds��  ��  	� o   5 6���� 0 httprequest httpRequest��  ��  	� � � If during a connection attempt the request remains idle for longer than the timeout interval, the request is considered to have timed out.   	� �	�	�   I f   d u r i n g   a   c o n n e c t i o n   a t t e m p t   t h e   r e q u e s t   r e m a i n s   i d l e   f o r   l o n g e r   t h a n   t h e   t i m e o u t   i n t e r v a l ,   t h e   r e q u e s t   i s   c o n s i d e r e d   t o   h a v e   t i m e d   o u t .	� 	�	�	� l  @ @��	�	���  	� $  add request headers, if given   	� �	�	� <   a d d   r e q u e s t   h e a d e r s ,   i f   g i v e n	� 	�	�	� Z   @#	�	�����	� >  @ C	�	�	� o   @ A����  0 requestheaders requestHeaders	� m   A B��
�� 
msng	� X   F	���	�	� k   `	�	� 	�	�	� Q   ` �	�	�	�	� k   c �	�	� 	�	�	� r   c n	�	�	� c   c l	�	�	� n  c h	�	�	� 1   d h��
�� 
pcnt	� o   c d���� 0 aref aRef	� m   h k��
�� 
reco	� o      ���� 0 headerrecord headerRecord	� 	�	�	� l  o �	�	�	�	� Z  o �	�	�����	� >   o z	�	�	� l  o x	�����	� I  o x��	�	�
�� .corecnte****       ****	� o   o p���� 0 headerrecord headerRecord	� ��	��
�� 
kocl	� m   q t�~
�~ 
ctxt�  ��  ��  	� m   x y�}�} 	� R   } ��|�{	�
�| .ascrerr ****      � ****�{  	� �z	��y
�z 
errn	� m   � ��x�x�Y�y  ��  ��  	� note: requiring text values here avoids any risk of numbers being accidentally coerced to inappropriate localized representations (e.g. "1,0" instead of "1.0"); user should use Number library's `format number` command to convert numbers to non-localized format first   	� �	�	�   n o t e :   r e q u i r i n g   t e x t   v a l u e s   h e r e   a v o i d s   a n y   r i s k   o f   n u m b e r s   b e i n g   a c c i d e n t a l l y   c o e r c e d   t o   i n a p p r o p r i a t e   l o c a l i z e d   r e p r e s e n t a t i o n s   ( e . g .   " 1 , 0 "   i n s t e a d   o f   " 1 . 0 " ) ;   u s e r   s h o u l d   u s e   N u m b e r   l i b r a r y ' s   ` f o r m a t   n u m b e r `   c o m m a n d   t o   c o n v e r t   n u m b e r s   t o   n o n - l o c a l i z e d   f o r m a t   f i r s t	� 	��w	� r   � �	�	�	� J   � �	�	� 	�	�	� n  � �	�	�	� o   � ��v�v 0 
headername 
headerName	� o   � ��u�u 0 headerrecord headerRecord	� 	��t	� n  � �	�	�	� o   � ��s�s 0 headervalue headerValue	� o   � ��r�r 0 headerrecord headerRecord�t  	� J      
 
  


 o      �q�q 0 
headername 
headerName
 
�p
 o      �o�o 0 headervalue headerValue�p  �w  	� R      �n


�n .ascrerr ****      � ****
 o      �m�m 0 etext eText
 �l


�l 
errn
 o      �k�k 0 enum eNum
 �j

	
�j 
erob
 o      �i�i 0 efrom eFrom
	 �h

�g
�h 
errt

 o      �f�f 
0 eto eTo�g  	� k   � �

 


 Z  � �

�e�d
 H   � �

 E  � �


 J   � �

 


 m   � ��c�c�\
 


 m   � ��b�b�Y
 
�a
 m   � ��`�`�@�a  
 J   � �

 
�_
 o   � ��^�^ 0 enum eNum�_  
 R   � ��]


�] .ascrerr ****      � ****
 o   � ��\�\ 0 etext eText
 �[


�[ 
errn
 o   � ��Z�Z 0 enum eNum
 �Y

 
�Y 
erob
 o   � ��X�X 0 efrom eFrom
  �W
!�V
�W 
errt
! o   � ��U�U 
0 eto eTo�V  �e  �d  
 
"�T
" n  � �
#
$
# I   � ��S
%�R�S .0 throwinvalidparameter throwInvalidParameter
% 
&
'
& o   � ��Q�Q 0 aref aRef
' 
(
)
( m   � �
*
* �
+
+  h e a d e r s
) 
,
-
, m   � ��P
�P 
list
- 
.�O
. m   � �
/
/ �
0
0 F N o t   a   l i s t   o f   v a l i d   h e a d e r   r e c o r d s .�O  �R  
$ o   � ��N�N 0 _support  �T  	� 
1
2
1 Z   �
3
4�M�L
3 E  � �
5
6
5 o   � ��K�K "0 _excludeheaders _excludeHeaders
6 o   � ��J�J 0 
headername 
headerName
4 n  �
7
8
7 I   ��I
9�H�I .0 throwinvalidparameter throwInvalidParameter
9 
:
;
: o   � ��G�G 0 aref aRef
; 
<
=
< m   �
>
> �
?
?  h e a d e r s
= 
@
A
@ m  �F
�F 
list
A 
B�E
B m  
C
C �
D
D T H e a d e r   f i e l d   i s   a l r e a d y   s e t   a u t o m a t i c a l l y .�E  �H  
8 o   � ��D�D 0 _support  �M  �L  
2 
E�C
E l 
F
G
H
F l 
I�B�A
I n 
J
K
J I  �@
L�?�@ <0 setvalue_forhttpheaderfield_ setValue_forHTTPHeaderField_
L 
M
N
M o  �>�> 0 headervalue headerValue
N 
O�=
O o  �<�< 0 
headername 
headerName�=  �?  
K o  �;�; 0 httprequest httpRequest�B  �A  
G ` Z TO DO: does NSHTTPRequest sanitize these inputs; if not, how should they be treated here?   
H �
P
P �   T O   D O :   d o e s   N S H T T P R e q u e s t   s a n i t i z e   t h e s e   i n p u t s ;   i f   n o t ,   h o w   s h o u l d   t h e y   b e   t r e a t e d   h e r e ?�C  �� 0 aref aRef	� n  I T
Q
R
Q I   N T�:
S�9�: "0 aslistparameter asListParameter
S 
T
U
T o   N O�8�8  0 requestheaders requestHeaders
U 
V�7
V m   O P
W
W �
X
X  h e a d e r s�7  �9  
R o   I N�6�6 0 _support  ��  ��  	� 
Y
Z
Y l $$�5
[
\�5  
[   add request body   
\ �
]
] "   a d d   r e q u e s t   b o d y
Z 
^
_
^ Z  $)
`
a�4�3
` > $'
b
c
b o  $%�2�2 0 requestbody requestBody
c m  %&�1
�1 
msng
a l *%
d
e
f
d Z  *%
g
h
i
j
g =  *7
k
l
k l *5
m�0�/
m I *5�.
n
o
�. .corecnte****       ****
n J  *-
p
p 
q�-
q o  *+�,�, 0 requestbody requestBody�-  
o �+
r�*
�+ 
kocl
r m  .1�)
�) 
ctxt�*  �0  �/  
l m  56�(�( 
h k  :�
s
s 
t
u
t l ::�'
v
w�'  
v x r if user supplies "Content-Type" header, parse its `charset` param if it has one to determine text encoding to use   
w �
x
x �   i f   u s e r   s u p p l i e s   " C o n t e n t - T y p e "   h e a d e r ,   p a r s e   i t s   ` c h a r s e t `   p a r a m   i f   i t   h a s   o n e   t o   d e t e r m i n e   t e x t   e n c o d i n g   t o   u s e
u 
y
z
y r  :D
{
|
{ n :B
}
~
} I  ;B�&
�%�& 40 valueforhttpheaderfield_ valueForHTTPHeaderField_
 
��$
� m  ;>
�
� �
�
�  C o n t e n t - T y p e�$  �%  
~ o  :;�#�# 0 httprequest httpRequest
| o      �"�" 0 contenttype contentType
z 
�
�
� Z  E�
�
��!
�
� = EH
�
�
� o  EF� �  0 contenttype contentType
� m  FG�
� 
msng
� l K\
�
�
�
� k  K\
�
� 
�
�
� n KV
�
�
� I  LV�
��� <0 setvalue_forhttpheaderfield_ setValue_forHTTPHeaderField_
� 
�
�
� m  LO
�
� �
�
� 0 t e x t / p l a i n ; c h a r s e t = u t f - 8
� 
��
� m  OR
�
� �
�
�  C o n t e n t - T y p e�  �  
� o  KL�� 0 httprequest httpRequest
� 
��
� r  W\
�
�
� o  WX�� ,0 nsutf8stringencoding NSUTF8StringEncoding
� o      �� *0 requestbodyencoding requestBodyEncoding�  
� 0 * encode text-based body as UTF8 by default   
� �
�
� T   e n c o d e   t e x t - b a s e d   b o d y   a s   U T F 8   b y   d e f a u l t�!  
� l _�
�
�
�
� k  _�
�
� 
�
�
� r  _r
�
�
� I  _n�
��� 0 _parsecharset _parseCharset
� 
��
� n `j
�
�
� I  ej�
��� 0 
asnsstring 
asNSString
� 
��
� o  ef�� 0 contenttype contentType�  �  
� o  `e�� 0 _support  �  �  
� o      �� 0 charsetname charsetName
� 
��
� Z  s�
�
��
�
� = sx
�
�
� o  sv�� 0 charsetname charsetName
� m  vw�
� 
msng
� l {�
�
�
�
� k  {�
�
� 
�
�
� n {�
�
�
� I  |��

��	�
 <0 setvalue_forhttpheaderfield_ setValue_forHTTPHeaderField_
� 
�
�
� l |�
���
� b  |�
�
�
� o  |}�� 0 contenttype contentType
� m  }�
�
� �
�
�  ; c h a r s e t = u t f - 8�  �  
� 
��
� m  ��
�
� �
�
�  C o n t e n t - T y p e�  �	  
� o  {|�� 0 httprequest httpRequest
� 
��
� r  ��
�
�
� o  ���� ,0 nsutf8stringencoding NSUTF8StringEncoding
� o      �� *0 requestbodyencoding requestBodyEncoding�  
� Q K if Content-Type doesn't include charset parameter then use UTF8 by default   
� �
�
� �   i f   C o n t e n t - T y p e   d o e s n ' t   i n c l u d e   c h a r s e t   p a r a m e t e r   t h e n   u s e   U T F 8   b y   d e f a u l t�  
� l ��
�
�
�
� k  ��
�
� 
�
�
� r  ��
�
�
� n ��
�
�
� I  ��� 
����  0 getencoding getEncoding
� 
���
� o  ������ 0 charsetname charsetName��  ��  
� o  ������ (0 _nsstringencodings _NSStringEncodings
� o      ���� *0 requestbodyencoding requestBodyEncoding
� 
���
� Z  ��
�
�����
� = ��
�
�
� o  ������ *0 requestbodyencoding requestBodyEncoding
� m  ����
�� 
msng
� n ��
�
�
� I  ����
����� .0 throwinvalidparameter throwInvalidParameter
� 
�
�
� o  ������  0 requestheaders requestHeaders
� 
�
�
� m  ��
�
� �
�
�  h e a d e r s
� 
�
�
� m  ����
�� 
list
� 
���
� m  ��
�
� �
�
� � C o n t e n t - T y p e   s p e c i f i e s   a   c h a r s e t   t h a t   c a n n o t   b e   a u t o m a t i c a l l y   e n c o d e d   b y   t h i s   h a n d l e r .��  ��  
� o  ������ 0 _support  ��  ��  ��  
� � � automatically encode the body text using the specified charset (assuming it's one directly recognized by NSString's dataWithEncoding: method)   
� �
�
�   a u t o m a t i c a l l y   e n c o d e   t h e   b o d y   t e x t   u s i n g   t h e   s p e c i f i e d   c h a r s e t   ( a s s u m i n g   i t ' s   o n e   d i r e c t l y   r e c o g n i z e d   b y   N S S t r i n g ' s   d a t a W i t h E n c o d i n g :   m e t h o d )�  
� V P user has specified Content-Type for body (e.g. "application/json;charset=utf8")   
� �
�
� �   u s e r   h a s   s p e c i f i e d   C o n t e n t - T y p e   f o r   b o d y   ( e . g .   " a p p l i c a t i o n / j s o n ; c h a r s e t = u t f 8 " )
� 
���
� n ��
�
�
� I  ����
����� 0 sethttpbody_ setHTTPBody_
� 
���
� l ��
�����
� n ��
�
�
� I  ����
����� &0 datawithencoding_ dataWithEncoding_
� 
���
� o  ������ *0 requestbodyencoding requestBodyEncoding��  ��  
� n ��
�
�
� I  ����
����� 0 
asnsstring 
asNSString
� 
���
� o  ������ 0 requestbody requestBody��  ��  
� o  ������ 0 _support  ��  ��  ��  ��  
� o  ������ 0 httprequest httpRequest��  
i 
�
�
� F  ��
�
�
� n ��
�
�
� I  ����
����� &0 checktypeforvalue checkTypeForValue
� 
� 
� o  ������ 0 requestbody requestBody  �� m  ����
�� 
ocid��  ��  
� o  ������ 0 _support  
� l ������ n �� I  �������� &0 isinstanceoftype_ isInstanceOfType_ �� l ������ n ��	 I  ���������� 	0 class  ��  ��  	 n ��

 o  ������ 0 nsdata NSData m  ����
�� misccura��  ��  ��  ��   o  ������ 0 requestbody requestBody��  ��  
� �� l  n  I  ������ 0 sethttpbody_ setHTTPBody_ �� o  ���� 0 requestbody requestBody��  ��   o  ���� 0 httprequest httpRequest � � also accept NSData, allowing users to do their own encoding/decoding; users should supply appropriate Content-Type header themselves    �
   a l s o   a c c e p t   N S D a t a ,   a l l o w i n g   u s e r s   t o   d o   t h e i r   o w n   e n c o d i n g / d e c o d i n g ;   u s e r s   s h o u l d   s u p p l y   a p p r o p r i a t e   C o n t e n t - T y p e   h e a d e r   t h e m s e l v e s��  
j n % I  %������ .0 throwinvalidparameter throwInvalidParameter  o  ���� 0 requestbody requestBody  m   �  b o d y  J     !"! m  ��
�� 
ctxt" #��# m  ��
�� 
ocid��   $��$ m  %% �&& 8 N o t   a   t e x t   o r   N S D a t a   o b j e c t .��  ��   o  ���� 0 _support  
e V P requestBody may be supplied as text or NSData -- TO DO: what about file object?   
f �'' �   r e q u e s t B o d y   m a y   b e   s u p p l i e d   a s   t e x t   o r   N S D a t a   - -   T O   D O :   w h a t   a b o u t   f i l e   o b j e c t ?�4  �3  
_ (��( L  *,)) o  *+���� 0 httprequest httpRequest��  	� ��*
�� consdiac* ��+
�� conshyph+ ��,
�� conspunc, ����
�� conswhit��  	� ��-
�� conscase- ����
�� consnume��  	| ./. l     ��������  ��  ��  / 010 l     ��������  ��  ��  1 232 l     ��������  ��  ��  3 454 l     ��67��  6 R L TO DO: how to support authentication? (might be best to leave that for now)   7 �88 �   T O   D O :   h o w   t o   s u p p o r t   a u t h e n t i c a t i o n ?   ( m i g h t   b e   b e s t   t o   l e a v e   t h a t   f o r   n o w )5 9:9 l     ��������  ��  ��  : ;<; l     ��=>��  =;5 TO DO: requestBodyData/responseBodyType could also be file object/`file`, in which case upload/download tasks could be used (Q. will NSSession supply Content-Length automatically when a file is given? also, will it supply Content-Type automatically, or is there a way to get file's MIME type via Cocoa APIs?)   > �??j   T O   D O :   r e q u e s t B o d y D a t a / r e s p o n s e B o d y T y p e   c o u l d   a l s o   b e   f i l e   o b j e c t / ` f i l e ` ,   i n   w h i c h   c a s e   u p l o a d / d o w n l o a d   t a s k s   c o u l d   b e   u s e d   ( Q .   w i l l   N S S e s s i o n   s u p p l y   C o n t e n t - L e n g t h   a u t o m a t i c a l l y   w h e n   a   f i l e   i s   g i v e n ?   a l s o ,   w i l l   i t   s u p p l y   C o n t e n t - T y p e   a u t o m a t i c a l l y ,   o r   i s   t h e r e   a   w a y   t o   g e t   f i l e ' s   M I M E   t y p e   v i a   C o c o a   A P I s ? )< @A@ l     ��������  ��  ��  A BCB l     ��DE��  DKE TO DO: if responseBodyType is `text` and requestHeaders doesn't include "Accept*" headers, add appropriate content negotiation header (Accept: text/*) automatically? (what about common application/� headers, e.g. application/json, application/xml? TBH, it'd be a shot in the dark; probably best to leave it entirely to user)   E �FF�   T O   D O :   i f   r e s p o n s e B o d y T y p e   i s   ` t e x t `   a n d   r e q u e s t H e a d e r s   d o e s n ' t   i n c l u d e   " A c c e p t * "   h e a d e r s ,   a d d   a p p r o p r i a t e   c o n t e n t   n e g o t i a t i o n   h e a d e r   ( A c c e p t :   t e x t / * )   a u t o m a t i c a l l y ?   ( w h a t   a b o u t   c o m m o n   a p p l i c a t i o n / &   h e a d e r s ,   e . g .   a p p l i c a t i o n / j s o n ,   a p p l i c a t i o n / x m l ?   T B H ,   i t ' d   b e   a   s h o t   i n   t h e   d a r k ;   p r o b a b l y   b e s t   t o   l e a v e   i t   e n t i r e l y   t o   u s e r )C GHG l     ��������  ��  ��  H IJI l     ��������  ��  ��  J KLK i  � �MNM I     ����O
�� .Web:ReqHnull��� ��� null��  O ��PQ
�� 
DestP o      ���� 0 theurl theURLQ ��RS
�� 
MethR |����T��U��  ��  T o      ���� 0 
httpmethod 
httpMethod��  U l     V����V m      WW �XX  G E T��  ��  S ��YZ
�� 
HeadY |����[��\��  ��  [ o      ����  0 requestheaders requestHeaders��  \ J      ����  Z ��]^
�� 
Body] |����_��`��  ��  _ o      ���� 0 requestbody requestBody��  ` l     a����a m      ��
�� 
msng��  ��  ^ ��bc
�� 
TimOb |����d��e��  ��  d o      �� $0 timeoutinseconds timeoutInSeconds��  e l     f�~�}f m      �|
�| 
msng�~  �}  c �{g�z
�{ 
Typeg |�y�xh�wi�y  �x  h o      �v�v $0 responsebodytype responseBodyType�w  i l     j�u�tj m      �s
�s 
ctxt�u  �t  �z  N Q    Aklmk k   %nn opo Z    qr�r�qq >   sts o    �p�p $0 timeoutinseconds timeoutInSecondst m    �o
�o 
msngr r   	 uvu n  	 wxw I    �ny�m�n (0 asintegerparameter asIntegerParametery z{z o    �l�l $0 timeoutinseconds timeoutInSeconds{ |�k| m    }} �~~  t i m e o u t�k  �m  x o   	 �j�j 0 _support  v o      �i�i $0 timeoutinseconds timeoutInSeconds�r  �q  p � r    '��� I    %�h��g�h $0 _makehttprequest _makeHTTPRequest� ��� o    �f�f 0 theurl theURL� ��� o    �e�e 0 
httpmethod 
httpMethod� ��� o    �d�d  0 requestheaders requestHeaders� ��� o     �c�c 0 requestbody requestBody� ��b� o     !�a�a $0 timeoutinseconds timeoutInSeconds�b  �g  � o      �`�` 0 httprequest httpRequest� ��� r   ( 1��� n  ( /��� I   + /�_�^�]�_ >0 ephemeralsessionconfiguration ephemeralSessionConfiguration�^  �]  � n  ( +��� o   ) +�\�\ 60 nsurlsessionconfiguration NSURLSessionConfiguration� m   ( )�[
�[ misccura� o      �Z�Z 0 sessionconfig sessionConfig� ��� l  2 B���� Z  2 B���Y�X� >  2 5��� o   2 3�W�W $0 timeoutinseconds timeoutInSeconds� m   3 4�V
�V 
msng� n  8 >��� I   9 >�U��T�U >0 settimeoutintervalforrequest_ setTimeoutIntervalForRequest_� ��S� o   9 :�R�R $0 timeoutinseconds timeoutInSeconds�S  �T  � o   8 9�Q�Q 0 sessionconfig sessionConfig�Y  �X  � g a controls how long (in seconds) a task should wait for additional data to arrive before giving up   � ��� �   c o n t r o l s   h o w   l o n g   ( i n   s e c o n d s )   a   t a s k   s h o u l d   w a i t   f o r   a d d i t i o n a l   d a t a   t o   a r r i v e   b e f o r e   g i v i n g   u p� ��� Z   C t���P�� =  C F��� o   C D�O�O $0 responsebodytype responseBodyType� m   D E�N
�N 
msng� r   I S��� n  I Q��� I   L Q�M��L�M 60 sessionwithconfiguration_ sessionWithConfiguration_� ��K� o   L M�J�J 0 sessionconfig sessionConfig�K  �L  � n  I L��� o   J L�I�I 0 nsurlsession NSURLSession� m   I J�H
�H misccura� o      �G�G 0 asocsession asocSession�P  � k   V t�� ��� r   V _��� n  V ]��� I   Y ]�F�E�D�F 0 data  �E  �D  � n  V Y��� o   W Y�C�C 0 nsmutabledata NSMutableData� m   V W�B
�B misccura� o      �A�A $0 responsebodydata responseBodyData� ��� h   ` g�@��@ *0 sessiontaskdelegate sessionTaskDelegate� k      �� ��� x     �?��>�?  � 4    �=�
�= 
frmk� m    �� ���  F o u n d a t i o n�>  � ��<� i    ��� I      �;��:�; J0 #urlsession_datatask_didreceivedata_ #URLSession_dataTask_didReceiveData_� ��� o      �9�9 0 asocsession asocSession� ��� o      �8�8 0 asoctask asocTask� ��7� o      �6�6 0 asocdata asocData�7  �:  � n    
��� I    
�5��4�5 0 appenddata_ appendData_� ��3� o    �2�2 0 asocdata asocData�3  �4  � o     �1�1 $0 responsebodydata responseBodyData�<  � ��0� r   h t��� n  h r��� I   k r�/��.�/ d0 0sessionwithconfiguration_delegate_delegatequeue_ 0sessionWithConfiguration_delegate_delegateQueue_� ��� o   k l�-�- 0 sessionconfig sessionConfig� ��� o   l m�,�, *0 sessiontaskdelegate sessionTaskDelegate� ��+� l  m n��*�)� m   m n�(
�( 
msng�*  �)  �+  �.  � n  h k��� o   i k�'�' 0 nsurlsession NSURLSession� m   h i�&
�& misccura� o      �%�% 0 asocsession asocSession�0  � ��� r   u }��� n  u {��� I   v {�$��#�$ ,0 datataskwithrequest_ dataTaskWithRequest_� ��"� o   v w�!�! 0 httprequest httpRequest�"  �#  � o   u v� �  0 asocsession asocSession� o      �� 0 asoctask asocTask� ��� n  ~ ���� I    ����� 
0 resume  �  �  � o   ~ �� 0 asoctask asocTask� ��� l  � �����  � � � block until completed/failed; TO DO: can user cancel during this loop? (if so, does anything need to be done with error -128? e.g. catch, call cancel, then rethrow)   � ���J   b l o c k   u n t i l   c o m p l e t e d / f a i l e d ;   T O   D O :   c a n   u s e r   c a n c e l   d u r i n g   t h i s   l o o p ?   ( i f   s o ,   d o e s   a n y t h i n g   n e e d   t o   b e   d o n e   w i t h   e r r o r   - 1 2 8 ?   e . g .   c a t c h ,   c a l l   c a n c e l ,   t h e n   r e t h r o w )� ��� V   � ���� l  � ����� n  � ���� I   � ����� .0 sleepfortimeinterval_ sleepForTimeInterval_� ��� m   � ��� ?��������  �  � n  � ���� o   � ��� 0 nsthread NSThread� m   � ��
� misccura�   sleep for 0.1sec   � ��� "   s l e e p   f o r   0 . 1 s e c� =  � �   n  � � I   � ����� 	0 state  �  �   o   � ��� 0 asoctask asocTask n  � � o   � ��� <0 nsurlsessiontaskstaterunning NSURLSessionTaskStateRunning m   � ��
� misccura�  Z   � �	�� =  � �

 n  � � I   � ����
� 	0 state  �  �
   o   � ��	�	 0 asoctask asocTask n  � � o   � ��� @0 nsurlsessiontaskstatesuspended NSURLSessionTaskStateSuspended m   � ��
� misccura	 l  � � n  � � I   � ����� 
0 cancel  �  �   o   � ��� 0 asoctask asocTask D > sanity check (shouldn't be possible for task to be suspended)    � |   s a n i t y   c h e c k   ( s h o u l d n ' t   b e   p o s s i b l e   f o r   t a s k   t o   b e   s u s p e n d e d )�  �    Z   � ��� =  � � n  � � I   � �� �����  	0 state  ��  ��   o   � ����� 0 asoctask asocTask n  � � o   � ����� @0 nsurlsessiontaskstatecanceling NSURLSessionTaskStateCanceling m   � ���
�� misccura l  � � !"  R   � �����#
�� .ascrerr ****      � ****��  # ��$��
�� 
errn$ m   � ���������  ! * $ TO DO: does Cmd-period cancel task?   " �%% H   T O   D O :   d o e s   C m d - p e r i o d   c a n c e l   t a s k ?�  �   &'& r   � �()( n  � �*+* I   � ��������� 	0 error  ��  ��  + o   � ����� 0 asoctask asocTask) o      ���� 0 	taskerror 	taskError' ,-, Z   �./����. >  � �010 o   � ����� 0 	taskerror 	taskError1 m   � ���
�� 
msng/ R   ���23
�� .ascrerr ****      � ****2 l  �4����4 c   �565 n  � �787 I   � ��������� ,0 localizeddescription localizedDescription��  ��  8 o   � ����� 0 	taskerror 	taskError6 m   ���
�� 
ctxt��  ��  3 ��9:
�� 
errn9 n  � �;<; I   � ��������� 0 code  ��  ��  < o   � ����� 0 	taskerror 	taskError: ��=��
�� 
erob= o   � ����� 0 theurl theURL��  ��  ��  - >?> l ��@A��  @   unpack HTTP response   A �BB *   u n p a c k   H T T P   r e s p o n s e? CDC r  EFE n GHG I  	�������� 0 response  ��  ��  H o  	���� 0 asoctask asocTaskF o      ���� 0 httpresponse httpResponseD IJI r  KLK J  ����  L o      ���� 0 headerfields headerFieldsJ MNM r  OPO n QRQ I  �������� "0 allheaderfields allHeaderFields��  ��  R o  ���� 0 httpresponse httpResponseP o      ���� $0 asocheaderfields asocHeaderFieldsN STS r  &UVU n "WXW I  "�������� 0 allkeys allKeys��  ��  X o  ���� $0 asocheaderfields asocHeaderFieldsV o      ���� 0 
headerkeys 
headerKeysT YZY Y  'k[��\]��[ k  7f^^ _`_ r  7Eaba l 7Ac����c n 7Aded I  :A��f����  0 objectatindex_ objectAtIndex_f g��g o  :=���� 0 i  ��  ��  e o  7:���� 0 
headerkeys 
headerKeys��  ��  b o      ���� 0 asockey asocKey` h��h r  Ffiji K  Fckk ��lm�� 0 
headername 
headerNamel c  IPnon o  IL���� 0 asockey asocKeyo m  LO��
�� 
ctxtm ��p���� 0 headervalue headerValuep c  S_qrq l S[s����s n S[tut I  T[��v���� 0 objectforkey_ objectForKey_v w��w o  TW���� 0 asockey asocKey��  ��  u o  ST���� $0 asocheaderfields asocHeaderFields��  ��  r m  [^��
�� 
****��  j n      xyx  ;  dey o  cd���� 0 headerfields headerFields��  �� 0 i  \ m  *+����  ] \  +2z{z l +0|����| n +0}~} I  ,0�������� 	0 count  ��  ��  ~ o  +,���� $0 asocheaderfields asocHeaderFields��  ��  { m  01���� ��  Z � Z  l����� = lq��� o  lm���� $0 responsebodytype responseBodyType� m  mp��
�� 
ctxt� k  t��� ��� r  ty��� m  tu��
�� 
msng� o      ���� ,0 responsebodyencoding responseBodyEncoding� ��� r  z���� n z���� I  {�������� 0 objectforkey_ objectForKey_� ���� m  {~�� ���  C o n t e n t - T y p e��  ��  � o  z{���� $0 asocheaderfields asocHeaderFields� o      ���� "0 asoccontenttype asocContentType� ��� Z ��������� > ����� o  ������ "0 asoccontenttype asocContentType� m  ����
�� 
msng� r  ����� n ����� I  ��������� 0 getencoding getEncoding� ���� I  ��������� 0 _parsecharset _parseCharset� ���� o  ������ "0 asoccontenttype asocContentType��  ��  ��  ��  � o  ������ (0 _nsstringencodings _NSStringEncodings� o      ���� ,0 responsebodyencoding responseBodyEncoding��  ��  � ��� Z  ��������� = ����� o  ������ ,0 responsebodyencoding responseBodyEncoding� m  ����
�� 
msng� R  ������
�� .ascrerr ****      � ****� m  ���� ��� � C a n ' t   a u t o m a t i c a l l y   d e c o d e   H T T P   r e s p o n s e   a s   t e x t   a s   i t   d i d n ' t   s p e c i f y   a   C o n t e n t - T y p e   w i t h   a   s u p p o r t e d   c h a r s e t .� �����
�� 
errn� m  �������\��  ��  ��  � ���� r  ����� c  ����� l �������� n ����� I  ��������� 00 initwithdata_encoding_ initWithData_encoding_� ��� o  ������ $0 responsebodydata responseBodyData� ���� o  ������ ,0 responsebodyencoding responseBodyEncoding��  ��  � n ����� I  ���������� 	0 alloc  ��  ��  � n ����� o  ������ 0 nsstring NSString� m  ���
� misccura��  ��  � m  ���~
�~ 
ctxt� o      �}�} 0 responsebody responseBody��  � ��� = ����� o  ���|�| $0 responsebodytype responseBodyType� m  ���{
�{ 
rdat� ��� l ������ r  ����� n ����� I  ���z�y�x�z 0 copy  �y  �x  � o  ���w�w $0 responsebodydata responseBodyData� o      �v�v 0 responsebody responseBody�   return NSData   � ���    r e t u r n   N S D a t a� ��� = ����� o  ���u�u $0 responsebodytype responseBodyType� m  ���t
�t 
msng� ��s� r  ����� m  ���r
�r 
msng� o      �q�q 0 responsebody responseBody�s  � n  ��� I  �p��o�p >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o  �n�n $0 responsebodytype responseBodyType� ��m� m  	�� ���  r e t u r n i n g�m  �o  � o   �l�l 0 _support  � ��k� L  %�� K  $�� �j���j 0 
statuscode 
statusCode� n ��� I  �i�h�g�i 0 
statuscode 
statusCode�h  �g  � o  �f�f 0 httpresponse httpResponse� �e���e "0 responseheaders responseHeaders� o  �d�d 0 headerfields headerFields� �c��b�c 0 responsebody responseBody� o   �a�a 0 responsebody responseBody�b  �k  l R      �`��
�` .ascrerr ****      � ****� o      �_�_ 0 etext eText� �^��
�^ 
errn� o      �]�] 0 enumber eNumber� �\��
�\ 
erob� o      �[�[ 0 efrom eFrom� �Z��Y
�Z 
errt� o      �X�X 
0 eto eTo�Y  m I  -A�W��V�W 
0 _error  � ��� m  .1�� ��� " s e n d   H T T P   r e q u e s t� ��� o  14�U�U 0 etext eText� ��� o  47�T�T 0 enumber eNumber� ��� o  7:�S�S 0 efrom eFrom� ��R� o  :=�Q�Q 
0 eto eTo�R  �V  L ��� l     �P�O�N�P  �O  �N  � ��� l     �M�L�K�M  �L  �K  � ��� l     �J�I�H�J  �I  �H  � � � l     �G�F�E�G  �F  �E     l     �D�C�B�D  �C  �B    i  � � I     �A�@
�A .Web:DStCnull���     long o      �?�? 0 
statuscode 
statusCode�@   Q     *	
 L     c     l   �>�= n    I    �<�;�< >0 localizedstringforstatuscode_ localizedStringForStatusCode_ �: l   �9�8 n    I    �7�6�7 (0 asintegerparameter asIntegerParameter  o    �5�5 0 
statuscode 
statusCode �4 m     �  �4  �6   o    �3�3 0 _support  �9  �8  �:  �;   n    o    �2�2 &0 nshttpurlresponse NSHTTPURLResponse m    �1
�1 misccura�>  �=   m    �0
�0 
ctxt	 R      �/
�/ .ascrerr ****      � **** o      �.�. 0 etext eText �- !
�- 
errn  o      �,�, 0 enumber eNumber! �+"#
�+ 
erob" o      �*�* 0 efrom eFrom# �)$�(
�) 
errt$ o      �'�' 
0 eto eTo�(  
 I     *�&%�%�& 
0 _error  % &'& m   ! "(( �)) 2 d e s c r i b e   H T T P   s t a t u s   c o d e' *+* o   " #�$�$ 0 etext eText+ ,-, o   # $�#�# 0 enumber eNumber- ./. o   $ %�"�" 0 efrom eFrom/ 0�!0 o   % &� �  
0 eto eTo�!  �%   121 l     ����  �  �  2 3�3 l     ����  �  �  �       �456789:;<'=>?@ABCDEFGHI�  4 ��������������
�	�������
� 
pimr� 0 _support  � 
0 _error  � 0 _usesnetloc _usesNetLoc� 0 _ascomponent _asComponent� ,0 _joinnetworklocation _joinNetworkLocation
� .Web:SplUnull���     ctxt
� .Web:JoiUnull���     WebC� "0 _safecharacters _safeCharacters� 0 _replacetext _replaceText
� .Web:EscUnull���     ctxt
� .Web:UneUnull���     ctxt
� .Web:SplQnull���     ctxt
�
 .Web:JoiQnull���     ****
�	 .Web:FJSNnull���     ****
� .Web:PJSNnull���     ctxt� "0 _excludeheaders _excludeHeaders� (0 _nsstringencodings _NSStringEncodings� 0 _parsecharset _parseCharset� $0 _makehttprequest _makeHTTPRequest
� .Web:ReqHnull��� ��� null
� .Web:DStCnull���     long5 �J� J  KK � L��
�  
cobjL MM   �� 
�� 
frmk��  6 NN   �� *
�� 
scpt7 �� 4����OP���� 
0 _error  �� ��Q�� Q  ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo��  O ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToP  D������ �� &0 throwcommanderror throwCommandError�� b  ࠡ����+ 8 ��R�� R   j n r v z ~ � � � � � � � � � � � � � � � � �9 �� �����ST���� 0 _ascomponent _asComponent�� ��U�� U  ���� 0 
asocstring 
asocString��  S ���� 0 
asocstring 
asocStringT �� ���
�� 
msng
�� 
ctxt�� ��  �Y hO��&: �� �����VW���� ,0 _joinnetworklocation _joinNetworkLocation�� ��X�� X  ���� .0 networklocationrecord networkLocationRecord��  V 	�������������������� .0 networklocationrecord networkLocationRecord�� $0 fullnetlocrecord fullNetLocRecord�� 0 urlcomponents urlComponents�� 0 aref aRef�� 0 	urlrecord 	urlRecord�� 0 username userName�� 0 userpassword userPassword�� 0 hostname hostName�� 0 
portnumber 
portNumberW (�� ��� ��� ��� �������������������Y������*9=AD��Fbjrx���������� 0 username userName�� 0 userpassword userPassword�� 0 hostname hostName�� 0 
portnumber 
portNumber�� �� 60 asoptionalrecordparameter asOptionalRecordParameter�� 
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
ctxt��  Y ������
�� 
errn���\��  
�� 
errn���Y
�� 
erob
�� 
leng
�� 
bool��%b  �����������m+ 
E�O�[�,\[�,\[�,\[�,\Z�vE�O V�[��l kh  ��,a &��,FW 3X  )a a a ��a a a a a �v��a ,k/%a %[OY��O�E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO�a  �a %�%E�Y hO�a  �a  %E�Y hO�a ! 	 �a " 	 �a # a $&a $& )a a a ��a %Y hO��%E�O�a & �a '%�%E�Y hO�; �������Z[��
�� .Web:SplUnull���     ctxt�� 0 urltext urlText�� ��\��
�� 
NeLo\ {�������� ,0 splitnetworklocation splitNetworkLocation��  
�� boovfals��  Z ������������������ 0 urltext urlText�� ,0 splitnetworklocation splitNetworkLocation�� 0 asocurl asocURL�� "0 networklocation networkLocation�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo[ ����������������������� ����������������������������]2������ $0 asnsurlparameter asNSURLParameter�� 0 username userName�� 0 user  �� 0 _ascomponent _asComponent�� 0 userpassword userPassword�� 0 password  �� 0 hostname hostName�� 0 host  �� 0 
portnumber 
portNumber�� 0 port  �� �� (0 asbooleanparameter asBooleanParameter�� ,0 _joinnetworklocation _joinNetworkLocation�� 0 	urlscheme 	urlScheme�� 
0 scheme  �� "0 networklocation networkLocation�� 0 resourcepath resourcePath�� 0 path  �� "0 parameterstring parameterString�� 0 querystring queryString�� 	0 query  �� (0 fragmentidentifier fragmentIdentifier�� 0 fragment  �� �� 0 etext eText] ����^
�� 
errn�� 0 enumber eNumber^ ����_
�� 
erob�� 0 efrom eFrom_ ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � �b  ��l+ E�O�*�j+ k+ �*�j+ k+ �*�j+ k+ �*�j+ 
k+ �E�Ob  ��l+  *�k+ E�Y hO�*�j+ k+ a �a *�j+ k+ a *�j+ k+ a *�j+ k+ a *�j+ k+ a W X  *a ����a + < ��D����`a��
�� .Web:JoiUnull���     WebC�� 0 	urlrecord 	urlRecord�� ��b��
�� 
Baseb {����K�� 0 baseurl baseURL��  ��  ` ��������~�}�|�{�z�y�x�w�v�u�t�s�r�� 0 	urlrecord 	urlRecord�� 0 baseurl baseURL�� 0 fullurlrecord fullURLRecord� 0 urlcomponents urlComponents�~ 0 aref aRef�} 0 	urlscheme 	urlScheme�| 0 resourcepath resourcePath�{ "0 parameterstring parameterString�z 0 querystring queryString�y (0 fragmentidentifier fragmentIdentifier�x "0 networklocation networkLocation�w 0 urltext urlText�v 0 asocurl asocURL�u 0 etext eText�t 0 enumber eNumber�s 0 efrom eFrom�r 
0 eto eToa LTU�q�p�o�nx�m|�l��k��j��i��h��g�f�e�d�c�bc��������a��`�_�^�]+�\7@�[GUZ`it|��������Z���Y�X�W�V�U�T�S�R��Qd��P
�q 
kocl
�p 
reco
�o .corecnte****       ****�n 0 	urlscheme 	urlScheme�m "0 networklocation networkLocation�l 0 resourcepath resourcePath�k "0 parameterstring parameterString�j 0 querystring queryString�i (0 fragmentidentifier fragmentIdentifier�h �g 60 asoptionalrecordparameter asOptionalRecordParameter�f 
�e 
cobj
�d 
pcnt
�c 
ctxt�b  c �O�N�M
�O 
errn�N�\�M  
�a 
leng�` �_ .0 throwinvalidparameter throwInvalidParameter�^ ,0 _joinnetworklocation _joinNetworkLocation
�] 
Safe
�\ .Web:EscUnull���     ctxt
�[ 
bool�Z "0 astextparameter asTextParameter�Y $0 asnsurlparameter asNSURLParameter
�X misccura�W 0 nsurl NSURL�V <0 urlwithstring_relativetourl_ URLWithString_relativeToURL_
�U 
msng
�T 
errn�S�Y
�R 
erob�Q 0 etext eTextd �L�Ke
�L 
errn�K 0 enumber eNumbere �J�If
�J 
erob�I 0 efrom eFromf �H�G�F
�H 
errt�G 
0 eto eTo�F  �P 
0 _error  ��}f��^�kv��l j�b  ������������a a a m+ E�O�[�,\[�,\[�,\[�,\[�,\Za vE�O f�[�a l kh  �a ,a &�a ,FW =X  b  �a �a a a a a a  a va �a !,k/%a "%a #+ $[OY��O�E[a k/E�Z[a l/E�Z[a m/E�Z[a a #/E�Z[a a /E�ZO��,kv��l j *��,k+ %E�Y ) ��,a &E�W X  b  �a &�a 'a #+ $O�a (a )l *E�O�a +
 &�a ,	 b  �a -&	 �a .a -&a -& /�a /	 �a 0a -& a 1�%E�Y hOa 2�%�%E�Y �E�O�a 3 �a 4%�%E�Y hO�a 5 �a 6%�%E�Y hO�a 7 �a 8%�%E�Y hO�a 9 �a :%�%E�Y hY b  �a ;l+ <E�O�a = Kb  �a >l+ ?E�Oa @a A,��l+ BE�O�a C  )a Da Ea F�a #a GY hO�a &E�Y hO�VW X H I*a J���] a + K= �E0�D�Cgh�B�E 0 _replacetext _replaceText�D �Ai�A i  �@�?�>�@ 0 thetext theText�? 0 fromtext fromText�> 0 totext toText�C  g �=�<�;�:�= 0 thetext theText�< 0 fromtext fromText�; 0 totext toText�: 0 thelist theListh <�9�8�7�6�5
�9 
ascr
�8 
txdl
�7 
citm
�6 
spac
�5 
ctxt�B ���,FO��-E�O���,FO��&> �4^�3�2jk�1
�4 .Web:EscUnull���     ctxt�3 0 thetext theText�2 �0l�/
�0 
Safel {�.�-e�. &0 allowedcharacters allowedCharacters�-  �/  j �,�+�*�)�(�'�&�%�, 0 thetext theText�+ &0 allowedcharacters allowedCharacters�* $0 asocallowedchars asocAllowedChars�) 0 
asocresult 
asocResult�( 0 etext eText�' 0 enumber eNumber�& 0 efrom eFrom�% 
0 eto eTok u�$��#�"�!� ���������m����$ "0 astextparameter asTextParameter
�# misccura�"  0 nscharacterset NSCharacterSet�! J0 #charactersetwithcharactersinstring_ #characterSetWithCharactersInString_�  0 
asnsstring 
asNSString� j0 3stringbyaddingpercentencodingwithallowedcharacters_ 3stringByAddingPercentEncodingWithAllowedCharacters_
� 
msng
� 
errn��Y
� 
erob� 
� 
ctxt� 0 etext eTextm ��n
� 
errn� 0 enumber eNumbern ��o
� 
erob� 0 efrom eFromo ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �1 p [b  ��l+ E�Ob  b  ��l+ %E�O��,�k+ E�Ob  �k+ �k+ E�O��  )�����Y hO��&W X  *a ����a + ? ����pq�
� .Web:UneUnull���     ctxt� 0 thetext theText�  p �
�	�����
 0 thetext theText�	 0 
asocresult 
asocResult� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToq ������ �����������r	����� "0 astextparameter asTextParameter� 0 
asnsstring 
asNSString� B0 stringbyremovingpercentencoding stringByRemovingPercentEncoding
� 
msng
�  
errn���Y
�� 
erob�� 
�� 
ctxt�� 0 etext eTextr ����s
�� 
errn�� 0 enumber eNumbers ����t
�� 
erob�� 0 efrom eFromt ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � L ;b  ��l+ E�Ob  �k+ j+ E�O��  )�����Y hO��&W X  *������+ @ ��%����uv��
�� .Web:SplQnull���     ctxt�� 0 	querytext 	queryText��  u 	�������������������� 0 	querytext 	queryText�� 0 oldtids oldTIDs�� 0 	querylist 	queryList�� 0 aref aRef�� 0 
queryparts 
queryParts�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTov ()����C��G����N��\������������������|����w�����
�� 
ascr
�� 
txdl�� "0 astextparameter asTextParameter
�� 
spac�� 0 _replacetext _replaceText
�� 
citm
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
leng
�� 
errn���Y
�� 
erob�� 
�� .Web:UneUnull���     ctxt�� 0 etext eTextw ����x
�� 
errn�� 0 enumber eNumberx ����y
�� 
erob�� 0 efrom eFromy ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� ��� ���,E�O �*b  ��l+ ��m+ E�O���,FO��-E�O���,FO T�[��l kh ��,E�-E�O�a ,l )a a a �a a Y hO��k/j ��l/j lv��,F[OY��O���,FO�W X  ���,FO*a ����a + VA �������z{��
�� .Web:JoiQnull���     ****�� 0 	querylist 	queryList��  z 	�������������������� 0 	querylist 	queryList�� 0 oldtids oldTIDs�� 0 aref aRef�� 0 kvpair kvPair�� 0 	querytext 	queryText�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo{ �������������������������������������-:��B��|f����
�� 
ascr
�� 
txdl�� 0 aslist asList
�� 
cobj
�� 
kocl
�� .corecnte****       ****
�� 
pcnt
�� 
list
�� 
leng
�� 
bool
�� 
errn���Y
�� 
erob�� 
�� 
ctxt
�� 
Safe
�� 
spac
�� .Web:EscUnull���     ctxt�� 0 _replacetext _replaceText�� 0 etext eText| ����}
�� 
errn�� 0 enumber eNumber} ����~
�� 
erob�� 0 efrom eFrom~ ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� ���,E�O �b  ��l+ �-E�O ��[��l kh ��,E�O�kv��l k 	 	��,l �& )������Y hO��a l l  )�����a Y hO*��k/a _ l a %��l/a _ l %_ a m+ ��,F[OY��Oa ��,FO�a &E�O���,FO�W X  ���,FO*a ����a + B ����������
�� .Web:FJSNnull���     ****�� 0 
jsonobject 
jsonObject�� �����
�� 
EWSp� {�������� "0 isprettyprinted isPrettyPrinted��  
�� boovfals��   	�������������������� 0 
jsonobject 
jsonObject�� "0 isprettyprinted isPrettyPrinted�� 0 writeoptions writeOptions�� 0 thedata theData�� 0 theerror theError�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ������������������������������������~�}�|�{���z�y�� (0 asbooleanparameter asBooleanParameter
�� misccura�� 80 nsjsonwritingprettyprinted NSJSONWritingPrettyPrinted�� *0 nsjsonserialization NSJSONSerialization�� (0 isvalidjsonobject_ isValidJSONObject_
�� 
errn���Y
�� 
erob�� 
�� 
obj �� F0 !datawithjsonobject_options_error_ !dataWithJSONObject_options_error_
�� 
cobj
�� 
msng�� ,0 localizeddescription localizedDescription�� 0 nsstring NSString� 	0 alloc  �~ ,0 nsutf8stringencoding NSUTF8StringEncoding�} 00 initwithdata_encoding_ initWithData_encoding_
�| 
ctxt�{ 0 etext eText� �x�w�
�x 
errn�w 0 enumber eNumber� �v�u�
�v 
erob�u 0 efrom eFrom� �t�s�r
�t 
errt�s 
0 eto eTo�r  �z �y 
0 _error  �� � �b  ��l+  
��,E�Y jE�O��,�k+  )�����Y hO��,���m+ E[�k/E�Z[�l/E�ZO��  )�����j+ %a %Y hO�a ,j+ ��a ,l+ a &W X  *a ����a + C �q�p�o���n
�q .Web:PJSNnull���     ctxt�p 0 jsontext jsonText�o �m��l
�m 
Frag� {�k�j�i�k *0 arefragmentsallowed areFragmentsAllowed�j  
�i boovfals�l  � 
�h�g�f�e�d�c�b�a�`�_�h 0 jsontext jsonText�g *0 arefragmentsallowed areFragmentsAllowed�f 0 readoptions readOptions�e 0 thedata theData�d 0 
jsonobject 
jsonObject�c 0 theerror theError�b 0 etext eText�a 0 enumber eNumber�` 0 efrom eFrom�_ 
0 eto eTo� �^)�]�\�[�Z�Y�X�W�V�U�T�S�R�Q�P�O_�Nc�M�L�v�K�J�^ "0 astextparameter asTextParameter�] (0 asbooleanparameter asBooleanParameter
�\ misccura�[ :0 nsjsonreadingallowfragments NSJSONReadingAllowFragments�Z 0 
asnsstring 
asNSString�Y ,0 nsutf8stringencoding NSUTF8StringEncoding�X (0 datausingencoding_ dataUsingEncoding_�W *0 nsjsonserialization NSJSONSerialization
�V 
obj �U F0 !jsonobjectwithdata_options_error_ !JSONObjectWithData_options_error_
�T 
cobj
�S 
msng
�R 
errn�Q�Y
�P 
erob�O �N ,0 localizeddescription localizedDescription
�M 
****�L 0 etext eText� �I�H�
�I 
errn�H 0 enumber eNumber� �G�F�
�G 
erob�F 0 efrom eFrom� �E�D�C
�E 
errt�D 
0 eto eTo�C  �K �J 
0 _error  �n � �b  ��l+ E�Ob  ��l+  
��,E�Y jE�Ob  �k+ ��,k+ E�O��,���m+ E[�k/E�Z[�l/E�ZO��  )��a �a a �j+ %a %Y hO�a &W X  *a ����a + D �B��B �  �������E �A�  ��A (0 _nsstringencodings _NSStringEncodings�  ���� �@�?�@ 
0 _list_  �? 0 getencoding getEncoding� �>��> �  �������������������� �=��= �  ��<� �;��; �  ���< � �:��: �  ��9� �8��8 �  ���9 
� �7��7 �  ��� �6��6 �  ��� �5��5 �  �� �4��4 �  ��� �3��3 �  �� �2��2 �  � �1��1 �  �"� �0��0 �  � �/��/ �  �2� �.��. �  ,/� �-��- �  ��,� �+��+ �  ;�, � �*��* �  ��)� �(��( �  GKN�) � �'��' �  ��&� �%��% �  Z^a�& � �$��$ �  ��#� �"��" �  mqt�# 	� �!��! �  �� � ��� �  �����  � ��� �  ��� ��� �  �� � ��� �  ��� ��� �  ���� � ��� �  ��� ��� �  ���� � ��� �  ��� ��� �  ���� � ��� �  ��� ��� �  ���� � ��� �  ��� ��� �  ���� � ��� �  ��� �
��
 �  	 		� � �		������	 0 getencoding getEncoding� ��� �  �� 0 textencoding textEncoding�  � ��� 0 textencoding textEncoding� 0 aref aRef� 			�� ����������� 
0 _list_  
�  
kocl
�� 
cobj
�� .corecnte****       ****
�� 
msng��  ��  � B :�� 2 +)�,[��l kh ��k/�kv ��l/EY h[OY��O�VW X  hF ��	7���������� 0 _parsecharset _parseCharset�� ����� �  ���� "0 asoccontenttype asocContentType��  � �������� "0 asoccontenttype asocContentType�� 0 asocpattern asocPattern�� 0 	asocmatch 	asocMatch� 
����	G��������������
�� misccura�� *0 nsregularexpression NSRegularExpression
�� 
msng�� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_�� 
0 length  �� F0 !firstmatchinstring_options_range_ !firstMatchInString_options_range_�� 0 rangeatindex_ rangeAtIndex_�� *0 substringwithrange_ substringWithRange_
�� 
ctxt�� ;��,�j�m+ E�O��jj�j+ lvm+ E�O��  �Y hO��lk+ k+ �&G ��	~���������� $0 _makehttprequest _makeHTTPRequest�� ����� �  ������������ 0 theurl theURL�� 0 
httpmethod 
httpMethod��  0 requestheaders requestHeaders�� 0 requestbody requestBody�� $0 timeoutinseconds timeoutInSeconds��  � �������������������������������������� 0 theurl theURL�� 0 
httpmethod 
httpMethod��  0 requestheaders requestHeaders�� 0 requestbody requestBody�� $0 timeoutinseconds timeoutInSeconds�� 0 httprequest httpRequest�� 0 aref aRef�� 0 headerrecord headerRecord�� 0 
headername 
headerName�� 0 headervalue headerValue�� 0 etext eText�� 0 enum eNum�� 0 efrom eFrom�� 
0 eto eTo�� 0 contenttype contentType�� ,0 nsutf8stringencoding NSUTF8StringEncoding�� *0 requestbodyencoding requestBodyEncoding�� 0 charsetname charsetName� <	�	�����	�����	���������
W�����������������������������������
*��
/����
>
C��
���
�
�����
�
���
�
�����������������%
�� misccura�� *0 nsmutableurlrequest NSMutableURLRequest�� $0 asnsurlparameter asNSURLParameter�� "0 requestwithurl_ requestWithURL_�� "0 astextparameter asTextParameter��  0 sethttpmethod_ setHTTPMethod_
�� 
msng�� *0 settimeoutinterval_ setTimeoutInterval_�� "0 aslistparameter asListParameter
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
reco
�� 
ctxt
�� 
errn���Y�� 0 
headername 
headerName�� 0 headervalue headerValue�� 0 etext eText� �����
�� 
errn�� 0 enum eNum� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  ���\���@
�� 
erob
�� 
errt�� 
�� 
list�� �� .0 throwinvalidparameter throwInvalidParameter�� <0 setvalue_forhttpheaderfield_ setValue_forHTTPHeaderField_�� 40 valueforhttpheaderfield_ valueForHTTPHeaderField_�� 0 
asnsstring 
asNSString�� 0 _parsecharset _parseCharset�� 0 getencoding getEncoding�� &0 datawithencoding_ dataWithEncoding_�� 0 sethttpbody_ setHTTPBody_
�� 
ocid�� &0 checktypeforvalue checkTypeForValue�� 0 nsdata NSData�� 	0 class  �� &0 isinstanceoftype_ isInstanceOfType_
�� 
bool��.��*��,b  ��l+ k+ E�Ob  ��l+ E�O��k+ 	O�� ��k+ Y hO�� � �b  ��l+ [��l kh  I�a ,a &E�O��a l l )a a lhY hO�a ,�a ,lvE[�k/E�Z[�l/E�ZW FX  a a a mv�kv )a �a �a �a �Y hOb  �a a  a !a "+ #Ob  � b  �a $a  a %a "+ #Y hO���l+ &[OY�@Y hO�� �kv�a l k  ��a 'k+ (E�O��  �a )a *l+ &O�E^ Y f*b  �k+ +k+ ,E^ O] �  ��a -%a .l+ &O�E^ Y 4b  ] k+ /E^ O] �  b  �a 0a  a 1a "+ #Y hO�b  �k+ +] k+ 2k+ 3Y Jb  �a 4l+ 5	 ��a 6,j+ 7k+ 8a 9& ��k+ 3Y b  �a :a a 4lva ;a "+ #Y hO�VH ��N��������
�� .Web:ReqHnull��� ��� null��  �� �����
�� 
Dest�� 0 theurl theURL� ����
�� 
Meth� {����W�� 0 
httpmethod 
httpMethod��  � ����
�� 
Head� {��������  0 requestheaders requestHeaders��  ��  � ����
�� 
Body� {�������� 0 requestbody requestBody��  
�� 
msng� ����
�� 
TimO� {�������� $0 timeoutinseconds timeoutInSeconds��  
�� 
msng� �����
�� 
Type� {�������� $0 responsebodytype responseBodyType��  
�� 
ctxt��  � ��������~�}�|�{�z�y�x�w�v�u�t�s�r�q�p�o�n�m�l�k�j�i�� 0 theurl theURL�� 0 
httpmethod 
httpMethod��  0 requestheaders requestHeaders� 0 requestbody requestBody�~ $0 timeoutinseconds timeoutInSeconds�} $0 responsebodytype responseBodyType�| 0 httprequest httpRequest�{ 0 sessionconfig sessionConfig�z 0 asocsession asocSession�y $0 responsebodydata responseBodyData�x *0 sessiontaskdelegate sessionTaskDelegate�w 0 asoctask asocTask�v 0 	taskerror 	taskError�u 0 httpresponse httpResponse�t 0 headerfields headerFields�s $0 asocheaderfields asocHeaderFields�r 0 
headerkeys 
headerKeys�q 0 i  �p 0 asockey asocKey�o ,0 responsebodyencoding responseBodyEncoding�n "0 asoccontenttype asocContentType�m 0 responsebody responseBody�l 0 etext eText�k 0 enumber eNumber�j 0 efrom eFrom�i 
0 eto eTo� @�h}�g�f�e�d�c�b�a�`�_�^�]�\���[�Z�Y�X�W�V��U�T�S�R�Q�P�O�N�M�L�K�J�I�H�G�F�E�D�C�B�A��@�?�>��=�<�;�:�9��8�7�6�5�4�3���2
�h 
msng�g (0 asintegerparameter asIntegerParameter�f �e $0 _makehttprequest _makeHTTPRequest
�d misccura�c 60 nsurlsessionconfiguration NSURLSessionConfiguration�b >0 ephemeralsessionconfiguration ephemeralSessionConfiguration�a >0 settimeoutintervalforrequest_ setTimeoutIntervalForRequest_�` 0 nsurlsession NSURLSession�_ 60 sessionwithconfiguration_ sessionWithConfiguration_�^ 0 nsmutabledata NSMutableData�] 0 data  �\ *0 sessiontaskdelegate sessionTaskDelegate� �1��0�/���.
�1 .ascrinit****      � ****� k     �� ��� ��-�-  �0  �/  � �,�+
�, 
pimr�+ J0 #urlsession_datatask_didreceivedata_ #URLSession_dataTask_didReceiveData_� �*�)��
�* 
cobj
�) 
frmk� �(��'�&���%�( J0 #urlsession_datatask_didreceivedata_ #URLSession_dataTask_didReceiveData_�' �$��$ �  �#�"�!�# 0 asocsession asocSession�" 0 asoctask asocTask�! 0 asocdata asocData�&  � � ���  0 asocsession asocSession� 0 asoctask asocTask� 0 asocdata asocData� �� 0 appenddata_ appendData_�% b  	�k+  �. �*��/lkv�L �[ d0 0sessionwithconfiguration_delegate_delegatequeue_ 0sessionWithConfiguration_delegate_delegateQueue_�Z ,0 datataskwithrequest_ dataTaskWithRequest_�Y 
0 resume  �X 	0 state  �W <0 nsurlsessiontaskstaterunning NSURLSessionTaskStateRunning�V 0 nsthread NSThread�U .0 sleepfortimeinterval_ sleepForTimeInterval_�T @0 nsurlsessiontaskstatesuspended NSURLSessionTaskStateSuspended�S 
0 cancel  �R @0 nsurlsessiontaskstatecanceling NSURLSessionTaskStateCanceling
�Q 
errn�P���O 	0 error  �N 0 code  
�M 
erob�L �K ,0 localizeddescription localizedDescription
�J 
ctxt�I 0 response  �H "0 allheaderfields allHeaderFields�G 0 allkeys allKeys�F 	0 count  �E  0 objectatindex_ objectAtIndex_�D 0 
headername 
headerName�C 0 headervalue headerValue�B 0 objectforkey_ objectForKey_
�A 
****�@ 0 _parsecharset _parseCharset�? 0 getencoding getEncoding�>�\�= 0 nsstring NSString�< 	0 alloc  �; 00 initwithdata_encoding_ initWithData_encoding_
�: 
rdat�9 0 copy  �8 >0 throwinvalidconstantparameter throwInvalidConstantParameter�7 0 
statuscode 
statusCode�6 "0 responseheaders responseHeaders�5 0 responsebody responseBody�4 �3 0 etext eText� �� 
� 
errn� 0 enumber eNumber  ��
� 
erob� 0 efrom eFrom ���
� 
errt� 
0 eto eTo�  �2 
0 _error  ��B'�� b  ��l+ E�Y hO*������+ E�O��,j+ E�O�� ��k+ Y hO��  ��,�k+ 
E�Y  ��,j+ E�O��K S�O��,���m+ E�O��k+ E�O�j+ O  h�j+ �a , �a ,a k+ [OY��O�j+ �a ,  
�j+ Y hO�j+ �a ,  )a a lhY hO�j+ E�O�� )a �j+ a �a  �j+ !a "&Y hO�j+ #E�OjvE�O�j+ $E�O�j+ %E^ O Cj�j+ &kkh ] ] k+ 'E^ Oa (] a "&a )�] k+ *a +&a  �6F[OY��O�a "  l�E^ O�a ,k+ *E^ O] � b  *] k+ -k+ .E^ Y hO] �  )a a /la 0Y hO�a 1,j+ 2�] l+ 3a "&E^ Y 1�a 4  �j+ 5E^ Y ��  
�E^ Y b  �a 6l+ 7Oa 8�j+ 8a 9�a :] a ;W X < =*a >] ] ] ] �+ ?I ����
� .Web:DStCnull���     long� 0 
statuscode 
statusCode�   ������ 0 
statuscode 
statusCode� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo ���
�	��(��
� misccura� &0 nshttpurlresponse NSHTTPURLResponse�
 (0 asintegerparameter asIntegerParameter�	 >0 localizedstringforstatuscode_ localizedStringForStatusCode_
� 
ctxt� 0 etext eText ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom � ����
�  
errt�� 
0 eto eTo��  � � 
0 _error  � + ��,b  ��l+ k+ �&W X  *衢���+ 
ascr  ��ޭ