FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� FileLib -- common file system and path string operations


- read/write commands need to support text encodings as well as AS types

- POSIX path manipulation commands (split, join, normalize, expand, etc; see Python's os.path module for ideas)

- `convert text to file`, `convert file to text`; these should convert between POSIX path and �class furl�/alias/�class bmrk�/file, and hopefully bring some sanity to that incoherent, inconsistent mess (note: if keeping `datetime DATA` shortcut in DateLib, consider adding `filepath DATA` shortcut here too)

- `convert path PATH from FORMAT to FORMAT` (note: HFS conversions will need to be done using vanilla AS as the relevant Cocoa APIs support POSIX and Windows paths only)

- TO DO: are there any common use cases where non-atomic file read/write operations are performed? (caution: modern multi-byte text encodings aren't amenable to incremental reads using StandardAdditions' read/write commands) if not, implement atomic read/write handlers only (users can always use StandardAdditions' read/write commands or Cocoa APIs if they need to perform more complex operations)

- what about including FileManager commands? (this would overlap existing functionality in System Events, but TBH System Events' File Suite is glitchy and crap, and itself just duplicates functionality that is (or should be) already in Finder, so there's a good argument for deprecating System Events' File Suite in favor of library-based alternative)

     � 	 	�   F i l e L i b   - -   c o m m o n   f i l e   s y s t e m   a n d   p a t h   s t r i n g   o p e r a t i o n s 
 
 
 -   r e a d / w r i t e   c o m m a n d s   n e e d   t o   s u p p o r t   t e x t   e n c o d i n g s   a s   w e l l   a s   A S   t y p e s 
 
 -   P O S I X   p a t h   m a n i p u l a t i o n   c o m m a n d s   ( s p l i t ,   j o i n ,   n o r m a l i z e ,   e x p a n d ,   e t c ;   s e e   P y t h o n ' s   o s . p a t h   m o d u l e   f o r   i d e a s ) 
 
 -   ` c o n v e r t   t e x t   t o   f i l e ` ,   ` c o n v e r t   f i l e   t o   t e x t ` ;   t h e s e   s h o u l d   c o n v e r t   b e t w e e n   P O S I X   p a t h   a n d   � c l a s s   f u r l � / a l i a s / � c l a s s   b m r k � / f i l e ,   a n d   h o p e f u l l y   b r i n g   s o m e   s a n i t y   t o   t h a t   i n c o h e r e n t ,   i n c o n s i s t e n t   m e s s   ( n o t e :   i f   k e e p i n g   ` d a t e t i m e   D A T A `   s h o r t c u t   i n   D a t e L i b ,   c o n s i d e r   a d d i n g   ` f i l e p a t h   D A T A `   s h o r t c u t   h e r e   t o o ) 
 
 -   ` c o n v e r t   p a t h   P A T H   f r o m   F O R M A T   t o   F O R M A T `   ( n o t e :   H F S   c o n v e r s i o n s   w i l l   n e e d   t o   b e   d o n e   u s i n g   v a n i l l a   A S   a s   t h e   r e l e v a n t   C o c o a   A P I s   s u p p o r t   P O S I X   a n d   W i n d o w s   p a t h s   o n l y ) 
 
 -   T O   D O :   a r e   t h e r e   a n y   c o m m o n   u s e   c a s e s   w h e r e   n o n - a t o m i c   f i l e   r e a d / w r i t e   o p e r a t i o n s   a r e   p e r f o r m e d ?   ( c a u t i o n :   m o d e r n   m u l t i - b y t e   t e x t   e n c o d i n g s   a r e n ' t   a m e n a b l e   t o   i n c r e m e n t a l   r e a d s   u s i n g   S t a n d a r d A d d i t i o n s '   r e a d / w r i t e   c o m m a n d s )   i f   n o t ,   i m p l e m e n t   a t o m i c   r e a d / w r i t e   h a n d l e r s   o n l y   ( u s e r s   c a n   a l w a y s   u s e   S t a n d a r d A d d i t i o n s '   r e a d / w r i t e   c o m m a n d s   o r   C o c o a   A P I s   i f   t h e y   n e e d   t o   p e r f o r m   m o r e   c o m p l e x   o p e r a t i o n s ) 
 
 -   w h a t   a b o u t   i n c l u d i n g   F i l e M a n a g e r   c o m m a n d s ?   ( t h i s   w o u l d   o v e r l a p   e x i s t i n g   f u n c t i o n a l i t y   i n   S y s t e m   E v e n t s ,   b u t   T B H   S y s t e m   E v e n t s '   F i l e   S u i t e   i s   g l i t c h y   a n d   c r a p ,   a n d   i t s e l f   j u s t   d u p l i c a t e s   f u n c t i o n a l i t y   t h a t   i s   ( o r   s h o u l d   b e )   a l r e a d y   i n   F i n d e r ,   s o   t h e r e ' s   a   g o o d   a r g u m e n t   f o r   d e p r e c a t i n g   S y s t e m   E v e n t s '   F i l e   S u i t e   i n   f a v o r   o f   l i b r a r y - b a s e d   a l t e r n a t i v e ) 
 
   
�� 
 l     ��������  ��  ��  ��       �� ��      ascr  ��ޭ