FasdUAS 1.101.10   ��   ��    k             x     �� ����    4   % )�� 
�� 
scpt  m   ' ( 	 	 � 
 
  T e s t T o o l s��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l          x    $�� ����    4   . 2�� 
�� 
scpt  m   0 1   �    T e x t��      the script being tested     �   0   t h e   s c r i p t   b e i n g   t e s t e d      l     ��������  ��  ��        l     ��������  ��  ��        h   $ +��  �� $0 suite_modifytext suite_ModifyText   k       ! !  " # " l      �� $ %��   $2,	to configure_skipTests()		return "checking suite skipping works" -- skip all tests in this suite		return {test_uppercase:"checking per-test skipping works", test_lowercase:missing value} -- skip 'test_uppercase only'		return missing value -- do all tests in this suite	end configure_skipTests	    % � & &X  	 t o   c o n f i g u r e _ s k i p T e s t s ( )  	 	 r e t u r n   " c h e c k i n g   s u i t e   s k i p p i n g   w o r k s "   - -   s k i p   a l l   t e s t s   i n   t h i s   s u i t e  	 	 r e t u r n   { t e s t _ u p p e r c a s e : " c h e c k i n g   p e r - t e s t   s k i p p i n g   w o r k s " ,   t e s t _ l o w e r c a s e : m i s s i n g   v a l u e }   - -   s k i p   ' t e s t _ u p p e r c a s e   o n l y '  	 	 r e t u r n   m i s s i n g   v a l u e   - -   d o   a l l   t e s t s   i n   t h i s   s u i t e  	 e n d   c o n f i g u r e _ s k i p T e s t s  	 #  ' ( ' i     ) * ) I      �������� 0 test_uppercase  ��  ��   * k     � + +  , - , I    ! .�� / . z�� 
�� .���:AsRenull��� ��� null��   / �� 0 1
�� 
Valu 0 l  	  2���� 2 I  	  3 4�� 3 z�� 
�� .Txt:UppTnull���     ctxt 4 b     5 6 5 m     7 7 � 8 8  f o �   b � r 6 1    ��
�� 
lnfd��  ��  ��   1 �� 9��
�� 
Equa 9 b     : ; : m     < < � = =  F O �   B � R ; 1    ��
�� 
lnfd��   -  > ? > I  " A @�� A @ z�� 
�� .���:AsRenull��� ��� null��   A �� B C
�� 
Valu B l  + 8 D���� D I  + 8 E F�� E z�� 
�� .Txt:UppTnull���     ctxt F m   2 3 G G @      ��  ��  ��   C �� H��
�� 
Equa H l  9 < I���� I c   9 < J K J m   9 : L L @       K m   : ;��
�� 
ctxt��  ��  ��   ?  M�� M X   B � N�� O N I  b � P�� Q P z�� 
�� .���:AsErnull��� ��� null��   Q �� R S
�� 
Args R n  o t T U T 1   p t��
�� 
pcnt U o   o p���� 0 aref aRef S �� V��
�� 
Equa V K   u } W W �� X���� 0 errornumber errorNumber X m   x {�����Y��  ��  �� 0 aref aRef O J   E R Y Y  Z [ Z K   E K \ \ �� ]���� 0 a   ] m   F I ^ ^ � _ _  f o o��   [  `�� ` J   K P a a  b�� b 1   K N��
�� 
ascr��  ��  ��   (  c d c l     ��������  ��  ��   d  e f e i    g h g I      �������� 0 test_lowercase  ��  ��   h k     [ i i  j k j I     l�� m l z�� 
�� .���:AsRenull��� ��� null��   m �� n o
�� 
Valu n l  	  p���� p I  	  q r�� q z�� 
�� .Txt:LowTnull���     ctxt r m     s s � t t  F O � B � R��  ��  ��   o �� u��
�� 
Equa u m     v v � w w  f o � b � r��   k  x�� x X    [ y�� z y I  6 V {�� | { z�� 
�� .���:AsErnull��� ��� null��   | �� } ~
�� 
Args } n  C H  �  1   D H��
�� 
pcnt � o   C D���� 0 aref aRef ~ �� ���
�� 
Equa � K   I Q � � �� ����� 0 errornumber errorNumber � m   L O�����Y��  ��  �� 0 aref aRef z J   ! * � �  � � � K   ! % � � �� ����� 0 a   � m   " # � � � � �  f o o��   �  ��� � J   % ( � �  ��� � 1   % &��
�� 
ascr��  ��  ��   f  � � � l     ��������  ��  ��   �  � � � i    � � � I      �������� 0 test_capitalize  ��  ��   � k     [ � �  � � � I     ��� � � z�� 
�� .���:AsRenull��� ��� null��   � �� � �
�� 
Valu � l  	  ����� � I  	  � ��� � z�� 
�� .Txt:CapTnull���     ctxt � m     � � � � �  F O � B � R��  ��  ��   � �� ���
�� 
Equa � m     � � � � �  F o � b � r��   �  ��� � X    [ ��� � � I  6 V ��� � � z�� 
�� .���:AsErnull��� ��� null��   � �� � �
�� 
Args � n  C H � � � 1   D H��
�� 
pcnt � o   C D���� 0 aref aRef � �� ���
�� 
Equa � K   I Q � � �� ����� 0 errornumber errorNumber � m   L O�����Y��  ��  �� 0 aref aRef � J   ! * � �  � � � K   ! % � � �� ����� 0 a   � m   " # � � � � �  f o o��   �  ��� � J   % ( � �  ��� � 1   % &��
�� 
ascr��  ��  ��   �  � � � l     ��~�}�  �~  �}   �  � � � i    � � � I      �| ��{�| 0 call_uppercase   �  ��z � o      �y�y 	0 param  �z  �{   � I     � ��x � z�w 
�w .Txt:UppTnull���     ctxt � o    �v�v 	0 param  �x   �  � � � l     �u�t�s�u  �t  �s   �  � � � i    � � � I      �r ��q�r 0 call_lowercase   �  ��p � o      �o�o 	0 param  �p  �q   � I     � ��n � z�m 
�m .Txt:LowTnull���     ctxt � o    �l�l 	0 param  �n   �  � � � l     �k�j�i�k  �j  �i   �  � � � i    � � � I      �h ��g�h 0 call_capitalize   �  ��f � o      �e�e 	0 param  �f  �g   � I     � ��d � z�c 
�c .Txt:CapTnull���     ctxt � o    �b�b 	0 param  �d   �  ��a � l     �`�_�^�`  �_  �^  �a     � � � l     �]�\�[�]  �\  �[   �  � � � l     �Z�Y�X�Z  �Y  �X   �  � � � h   , 3�W ��W $0 suite_formattext suite_FormatText � k       � �  � � � l     �V�U�T�V  �U  �T   �  � � � j     �S ��S 	0 _date   � m     �R
�R 
msng �  � � � j    �Q ��Q 0 	_testdata 	_testData � m    �P
�P 
msng �  � � � l     �O�N�M�O  �N  �M   �  � � � i   	 � � � I      �L�K�J�L "0 configure_setup configure_setUp�K  �J   � k     @ � �  � � � r      � � � I    �I�H�G
�I .misccurdldt    ��� null�H  �G   � o      �F�F 	0 _date   �  ��E � r    @ � � � J    : � �  � � � l 	   ��D�C � J     � �  � � � l    ��B�A � m     � � @�������B  �A   �  ��@ � l    �?�>  c     m     @������ m    �=
�= 
ctxt�?  �>  �@  �D  �C   �  l 	  �<�; J     	 l   
�:�9
 m     �  �:  �9  	 �8 l   �7�6 m     �  " "�7  �6  �8  �<  �;    l 	  +�5�4 J    +  l    �3�2 J       m     �  f o o  m    �1�1    m    �0
�0 boovtrue  !�/! o    �.�. 	0 _date  �/  �3  �2   "�-" l    )#�,�+# b     )$%$ b     '&'& m     !(( �)) . { " f o o " ,   1 ,   t r u e ,   d a t e   "' o   ! &�*�* 	0 _date  % m   ' (** �++  " }�,  �+  �-  �5  �4   ,�), l 	 + 8-�(�'- l 
 + 8.�&�%. J   + 8// 010 l  + 32�$�#2 K   + 333 �"45�" 0 a  4 m   , -�!
�! 
msng5 � 67
�  
pnam6 m   . /�
� 
alis7 �8�
� 
pcls8 m   0 1�
� 
docu�  �$  �#  1 9�9 l  3 6:��: m   3 6;; �<< Z { a : m i s s i n g   v a l u e ,   n a m e : a l i a s ,   c l a s s : d o c u m e n t }�  �  �  �&  �%  �(  �'  �)   � o      �� 0 	_testdata 	_testData�E   � =>= l     ����  �  �  > ?@? i  
 ABA I      ���� 80 test_literalrepresentation test_literalRepresentation�  �  B X     IC�DC k    DEE FGF r    $HIH o    �� 0 aref aRefI J      JJ KLK o      �� 0 avalue aValueL M�M o      ��  0 expectedresult expectedResult�  G N�N I  % DO�PO z�
 
�
 .���:AsRenull��� ��� null�  P �	QR
�	 
ValuQ l  . =S��S I  . =T�UT z� 
� .Txt:FLitnull��� ��� null�  U �V�
� 
For_V o   7 8�� 0 avalue aValue�  �  �  R �W� 
� 
EquaW o   > ?����  0 expectedresult expectedResult�   �  � 0 aref aRefD o    ���� 0 	_testdata 	_testData@ X��X l     ��������  ��  ��  ��   � YZY l     ��������  ��  ��  Z [\[ l     ��������  ��  ��  \ ]^] i   4 7_`_ I     ������
�� .aevtoappnull  �   � ****��  ��  ` l    abca I    ��d��
�� .sysoexecTEXT���     TEXTd b     efe m     gg �hh  ~ / b i n / o s a t e s t  f n    
iji 1    
��
�� 
strqj n    klk 1    ��
�� 
psxpl l   m����m I   ��n��
�� .earsffdralis        afdrn  f    ��  ��  ��  ��  b [ U handy for running tests in Script Editor (assumes `osatest` is installed in `~/bin`)   c �oo �   h a n d y   f o r   r u n n i n g   t e s t s   i n   S c r i p t   E d i t o r   ( a s s u m e s   ` o s a t e s t `   i s   i n s t a l l e d   i n   ` ~ / b i n ` )^ pqp l     ��������  ��  ��  q r��r l     ��������  ��  ��  ��       ��stuvw��  s ��������
�� 
pimr�� $0 suite_modifytext suite_ModifyText�� $0 suite_formattext suite_FormatText
�� .aevtoappnull  �   � ****t ��x�� x  yz{y ��|��
�� 
cobj| }}   �� 	
�� 
scpt��  z ��~��
�� 
cobj~    ��
�� 
osax��  { �����
�� 
cobj� ��   �� 
�� 
scpt��  u ��    ��� $0 suite_modifytext suite_ModifyText� �����������  � �������������� 0 test_uppercase  �� 0 test_lowercase  �� 0 test_capitalize  �� 0 call_uppercase  �� 0 call_lowercase  �� 0 call_capitalize  � �� *���������� 0 test_uppercase  ��  ��  � ���� 0 aref aRef� �� 	��  7������ <���� 	  G���� ^�������� 	����������
�� 
scpt
�� 
Valu
�� 
lnfd
�� .Txt:UppTnull���     ctxt
�� 
Equa�� 
�� .���:AsRenull��� ��� null
�� 
ctxt�� 0 a  
�� 
ascr
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
Args
�� 
pcnt�� 0 errornumber errorNumber���Y
�� .���:AsErnull��� ��� null�� �)��/ *�)��/ 	��%j U���%� 
UO)��/ *�)��/ �j U���&� 
UO D�a l_ kvlv[a a l kh  )�a / *a �a ,�a a l� U[OY��� �� h���������� 0 test_lowercase  ��  ��  � ���� 0 aref aRef� �� 	��  s���� v������ ��������� 	����������
�� 
scpt
�� 
Valu
�� .Txt:LowTnull���     ctxt
�� 
Equa�� 
�� .���:AsRenull��� ��� null�� 0 a  
�� 
ascr
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
Args
�� 
pcnt�� 0 errornumber errorNumber���Y
�� .���:AsErnull��� ��� null�� \)��/ *�)��/ �j U��� 	UO <��l�kvlv[��l kh  )�a / *a �a ,�a a l� U[OY��� �� ����������� 0 test_capitalize  ��  ��  � ���� 0 aref aRef� �� 	��  ����� ������� ��������� 	����������
�� 
scpt
�� 
Valu
�� .Txt:CapTnull���     ctxt
�� 
Equa�� 
�� .���:AsRenull��� ��� null�� 0 a  
�� 
ascr
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
Args
�� 
pcnt�� 0 errornumber errorNumber���Y
�� .���:AsErnull��� ��� null�� \)��/ *�)��/ �j U��� 	UO <��l�kvlv[��l kh  )�a / *a �a ,�a a l� U[OY��� �� ����������� 0 call_uppercase  �� ����� �  ���� 	0 param  ��  � ���� 	0 param  � �� ��
�� 
scpt
�� .Txt:UppTnull���     ctxt�� )��/ �j U� �� ���~���}�� 0 call_lowercase  � �|��| �  �{�{ 	0 param  �~  � �z�z 	0 param  � �y �x
�y 
scpt
�x .Txt:LowTnull���     ctxt�} )��/ �j U� �w ��v�u���t�w 0 call_capitalize  �v �s��s �  �r�r 	0 param  �u  � �q�q 	0 param  � �p �o
�p 
scpt
�o .Txt:CapTnull���     ctxt�t )��/ �j Uv �n �  ��n $0 suite_formattext suite_FormatText� �m��l�k���m  � �j�i�h�g�j 	0 _date  �i 0 	_testdata 	_testData�h "0 configure_setup configure_setUp�g 80 test_literalrepresentation test_literalRepresentation
�l 
msng
�k 
msng� �f ��e�d���c�f "0 configure_setup configure_setUp�e  �d  �  � �b ��a�`(*�_�^�]�\�[�Z�Y;
�b .misccurdldt    ��� null
�a 
ctxt�` �_ 0 a  
�^ 
msng
�] 
pnam
�\ 
alis
�[ 
pcls
�Z 
docu�Y �c A*j  Ec   O���&lv��lv�keb   �v�b   %�%lv�������a lv�vEc  � �XB�W�V���U�X 80 test_literalrepresentation test_literalRepresentation�W  �V  � �T�S�R�T 0 aref aRef�S 0 avalue aValue�R  0 expectedresult expectedResult� �Q�P�O�N 	�M �L�K�J�I�H
�Q 
kocl
�P 
cobj
�O .corecnte****       ****
�N 
scpt
�M 
Valu
�L 
For_
�K .Txt:FLitnull��� ��� null
�J 
Equa�I 
�H .���:AsRenull��� ��� null�U J Hb  [��l kh  �E[�k/E�Z[�l/E�ZO)��/ *�)��/ 	*�l U�� U[OY��w �G`�F�E���D
�G .aevtoappnull  �   � ****�F  �E  �  � g�C�B�A�@
�C .earsffdralis        afdr
�B 
psxp
�A 
strq
�@ .sysoexecTEXT���     TEXT�D �)j �,�,%j ascr  ��ޭ