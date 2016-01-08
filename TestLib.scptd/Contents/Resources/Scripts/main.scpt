FasdUAS 1.101.10   ��   ��    k             l      ��  ��    � � TestLib -- currently a mish-mash of minor tools; eventually should include full-blown unit testing framework (once a sane and stable architecture for writing, loading, and executing test code is devised)

      � 	 	�   T e s t L i b   - -   c u r r e n t l y   a   m i s h - m a s h   o f   m i n o r   t o o l s ;   e v e n t u a l l y   s h o u l d   i n c l u d e   f u l l - b l o w n   u n i t   t e s t i n g   f r a m e w o r k   ( o n c e   a   s a n e   a n d   s t a b l e   a r c h i t e c t u r e   f o r   w r i t i n g ,   l o a d i n g ,   a n d   e x e c u t i n g   t e s t   c o d e   i s   d e v i s e d ) 
 
     
  
 l     ��������  ��  ��        x     
�� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��������  ��  ��        i  
     I      �� ���� 0 
randomword 
randomWord      o      ���� 0 	minlength 	minLength   ��  o      ���� 0 	maxlength 	maxLength��  ��    k     '       r         m          � ! !    o      ���� 0 s     " # " U    $ $ % $ r     & ' & b     ( ) ( o    ���� 0 s   ) n     * + * 3    ��
�� 
cobj + m     , , � - - 4 a b c d e f g h i j k l m n o p q r s t u v w x y z ' o      ���� 0 s   % l    .���� . I    /�� 0 / z����
�� .sysorandnmbr    ��� nmbr
�� misccura��   0 �� 1 2
�� 
from 1 o    ���� 0 	minlength 	minLength 2 �� 3��
�� 
to   3 o    ���� 0 	maxlength 	maxLength��  ��  ��   #  4�� 4 L   % ' 5 5 o   % &���� 0 s  ��     6 7 6 l     ��������  ��  ��   7  8 9 8 l     ��������  ��  ��   9  : ; : i    < = < I      �������� 0 	maketimer 	makeTimer��  ��   = l     > ? @ > h     �� A�� 0 timerobject TimerObject A k       B B  C D C l     �� E F��   E � � note: AS can't serialize ASOC objects when [auto-]saving scripts, so store start and end times as NSTimeInterval (Double/real) to avoid any complaints    F � G G.   n o t e :   A S   c a n ' t   s e r i a l i z e   A S O C   o b j e c t s   w h e n   [ a u t o - ] s a v i n g   s c r i p t s ,   s o   s t o r e   s t a r t   a n d   e n d   t i m e s   a s   N S T i m e I n t e r v a l   ( D o u b l e / r e a l )   t o   a v o i d   a n y   c o m p l a i n t s D  H I H x     �� J����   J 4    �� K
�� 
frmk K m     L L � M M  F o u n d a t i o n��   I  N O N j    �� P�� 0 
_starttime 
_startTime P m    ��
�� 
msng O  Q R Q j    �� S�� 0 _totalseconds _totalSeconds S m     T T          R  U V U j    �� W�� 0 
_isrunning 
_isRunning W m    ��
�� boovfals V  X Y X l     ��������  ��  ��   Y  Z [ Z i    \ ] \ I      �������� 0 
starttimer 
startTimer��  ��   ] l    ' ^ _ ` ^ k     ' a a  b c b Z     d e���� d o     ���� 0 
_isrunning 
_isRunning e L    
����  ��  ��   c  f g f r     h i h m    ��
�� boovtrue i o      ���� 0 
_isrunning 
_isRunning g  j k j r    $ l m l n    n o n I    �������� @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate��  ��   o n    p q p o    ���� 0 nsdate NSDate q m    ��
�� misccura m o      ���� 0 
_starttime 
_startTime k  r�� r L   % ' s s  f   % &��   _ 8 2 start the timer (does nothing if already running)    ` � t t d   s t a r t   t h e   t i m e r   ( d o e s   n o t h i n g   i f   a l r e a d y   r u n n i n g ) [  u v u l     ��������  ��  ��   v  w x w i    y z y I      �������� 0 	stoptimer 	stopTimer��  ��   z l    8 { | } { k     8 ~ ~   �  Z     � ����� � H      � � o     ���� 0 
_isrunning 
_isRunning � L   	  � � m   	 
����  ��  ��   �  � � � r     � � � \     � � � l    ����� � n    � � � I    �������� @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate��  ��   � n    � � � o    ���� 0 nsdate NSDate � m    ��
�� misccura��  ��   � o    ���� 0 
_starttime 
_startTime � o      ���� 0 elapsedtime elapsedTime �  � � � r     - � � � [     ' � � � o     %���� 0 _totalseconds _totalSeconds � o   % &���� 0 elapsedtime elapsedTime � o      ���� 0 _totalseconds _totalSeconds �  � � � r   . 5 � � � m   . /��
�� boovfals � o      ���� 0 
_isrunning 
_isRunning �  ��� � L   6 8 � � o   6 7���� 0 elapsedtime elapsedTime��   | E ? stop the timer, returning time elapsed since timer was started    } � � � ~   s t o p   t h e   t i m e r ,   r e t u r n i n g   t i m e   e l a p s e d   s i n c e   t i m e r   w a s   s t a r t e d x  � � � l     ��������  ��  ��   �  � � � i    � � � I      �������� 0 elapsedtime elapsedTime��  ��   � l     � � � � Z      � ��� � � o     ���� 0 
_isrunning 
_isRunning � L     � � \     � � � l    ����� � n    � � � I   	 �������� @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate��  ��   � o    	���� 0 nsdate NSDate��  ��   � o    ���� 0 
_starttime 
_startTime��   � L     � � m    ����   � 5 / no. of seconds since running timer was started    � � � � ^   n o .   o f   s e c o n d s   s i n c e   r u n n i n g   t i m e r   w a s   s t a r t e d �  � � � l     ��������  ��  ��   �  ��� � i    # � � � I      �������� 0 	totaltime 	totalTime��  ��   � l     � � � � Z      � ��� � � o     ���� 0 
_isrunning 
_isRunning � L     � � [     � � � o    ���� 0 _totalseconds _totalSeconds � I    �������� 0 elapsedtime elapsedTime��  ��  ��   � L     � � o    �� 0 _totalseconds _totalSeconds � - ' total no. of seconds the timer has run    � � � � N   t o t a l   n o .   o f   s e c o n d s   t h e   t i m e r   h a s   r u n��   ? ) # TO DO: optional user-defined label    @ � � � F   T O   D O :   o p t i o n a l   u s e r - d e f i n e d   l a b e l ;  � � � l     �~�}�|�~  �}  �|   �  ��{ � l     �z�y�x�z  �y  �x  �{       �w � � � ��w   � �v�u�t
�v 
pimr�u 0 
randomword 
randomWord�t 0 	maketimer 	makeTimer � �s ��s  �   � � �r ��q
�r 
cobj �  � �   �p
�p 
osax�q   � �o �n�m � ��l�o 0 
randomword 
randomWord�n �k ��k  �  �j�i�j 0 	minlength 	minLength�i 0 	maxlength 	maxLength�m   � �h�g�f�h 0 	minlength 	minLength�g 0 	maxlength 	maxLength�f 0 s   �   �e�d�c�b�a ,�`
�e misccura
�d 
from
�c 
to  �b 
�a .sysorandnmbr    ��� nmbr
�` 
cobj�l (�E�O � *��� Ukh���.%E�[OY��O� � �_ =�^�] � ��\�_ 0 	maketimer 	makeTimer�^  �]   � �[�[ 0 timerobject TimerObject � �Z A ��Z 0 timerobject TimerObject � �Y ��X�W � ��V
�Y .ascrinit****      � **** � k     # � �  H � �  N � �  Q � �  U � �  Z � �  w � �  � � �  ��U�U  �X  �W   � �T�S�R�Q�P�O�N�M
�T 
pimr�S 0 
_starttime 
_startTime�R 0 _totalseconds _totalSeconds�Q 0 
_isrunning 
_isRunning�P 0 
starttimer 
startTimer�O 0 	stoptimer 	stopTimer�N 0 elapsedtime elapsedTime�M 0 	totaltime 	totalTime � �L�K L�J�I T�H�G � � � �
�L 
cobj
�K 
frmk
�J 
msng�I 0 
_starttime 
_startTime�H 0 _totalseconds _totalSeconds�G 0 
_isrunning 
_isRunning � �F ]�E�D � ��C�F 0 
starttimer 
startTimer�E  �D   �   � �B�A�@
�B misccura�A 0 nsdate NSDate�@ @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate�C (b   hY hOeEc  O��,j+ Ec  O) � �? z�>�= � ��<�? 0 	stoptimer 	stopTimer�>  �=   � �;�; 0 elapsedtime elapsedTime � �:�9�8
�: misccura�9 0 nsdate NSDate�8 @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate�< 9b   jY hO��,j+ b  E�Ob  �Ec  OfEc  O� � �7 ��6�5 � ��4�7 0 elapsedtime elapsedTime�6  �5   � �3�3 0 nsdate NSDate � �2�2 @0 timeintervalsincereferencedate timeIntervalSinceReferenceDate�4 b   �j+  b  Y j � �1 ��0�/ � ��.�1 0 	totaltime 	totalTime�0  �/   �   � �-�- 0 elapsedtime elapsedTime�. b   b  *j+  Y b  �V $�*��/lkv��O�Of�OL OL 	OL 
OL �\ ��K S� ascr  ��ޭ