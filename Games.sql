PGDMP     :    .                {            Games    15.2    15.1 #    +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            .           1262    41678    Games    DATABASE     {   CREATE DATABASE "Games" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Games";
                postgres    false            �            1259    41679    awards    TABLE     �   CREATE TABLE public.awards (
    id bigint NOT NULL,
    game text,
    award text,
    category text,
    person text,
    win_lose boolean,
    studio text,
    year integer
);
    DROP TABLE public.awards;
       public         heap    postgres    false            �            1259    41684    games    TABLE     �  CREATE TABLE public.games (
    name text NOT NULL,
    ru_name text,
    year integer,
    platform text,
    genre text,
    country text,
    developer text,
    publisher text,
    director text,
    designer text,
    writer text,
    composer text,
    budget text,
    sells text,
    user_score real,
    metacritic_score real,
    cover text,
    description text,
    game_link text
);
    DROP TABLE public.games;
       public         heap    postgres    false            �            1259    41689    person    TABLE     �   CREATE TABLE public.person (
    name text NOT NULL,
    birth text,
    career text,
    studios text,
    games_n integer,
    photo text
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    41694    reviews    TABLE     n   CREATE TABLE public.reviews (
    game text NOT NULL,
    username text NOT NULL,
    review text NOT NULL
);
    DROP TABLE public.reviews;
       public         heap    postgres    false            �            1259    41699    score    TABLE     x   CREATE TABLE public.score (
    game text NOT NULL,
    username text NOT NULL,
    score integer,
    platform text
);
    DROP TABLE public.score;
       public         heap    postgres    false            �            1259    41704    studio    TABLE     �   CREATE TABLE public.studio (
    name text NOT NULL,
    st_pu text,
    country text,
    founders text,
    famous text,
    link text,
    logo text
);
    DROP TABLE public.studio;
       public         heap    postgres    false            �            1259    41709    users    TABLE     �   CREATE TABLE public.users (
    username text NOT NULL,
    password text NOT NULL,
    mail text,
    status text,
    favgame_1 text,
    favgame_2 text,
    favgame_3 text,
    favgame_4 text,
    favgame_5 text,
    avatar text
);
    DROP TABLE public.users;
       public         heap    postgres    false            "          0    41679    awards 
   TABLE DATA           [   COPY public.awards (id, game, award, category, person, win_lose, studio, year) FROM stdin;
    public          postgres    false    214   a*       #          0    41684    games 
   TABLE DATA           �   COPY public.games (name, ru_name, year, platform, genre, country, developer, publisher, director, designer, writer, composer, budget, sells, user_score, metacritic_score, cover, description, game_link) FROM stdin;
    public          postgres    false    215   �+       $          0    41689    person 
   TABLE DATA           N   COPY public.person (name, birth, career, studios, games_n, photo) FROM stdin;
    public          postgres    false    216   2\       %          0    41694    reviews 
   TABLE DATA           9   COPY public.reviews (game, username, review) FROM stdin;
    public          postgres    false    217   O\       &          0    41699    score 
   TABLE DATA           @   COPY public.score (game, username, score, platform) FROM stdin;
    public          postgres    false    218   l\       '          0    41704    studio 
   TABLE DATA           T   COPY public.studio (name, st_pu, country, founders, famous, link, logo) FROM stdin;
    public          postgres    false    219   �\       (          0    41709    users 
   TABLE DATA           �   COPY public.users (username, password, mail, status, favgame_1, favgame_2, favgame_3, favgame_4, favgame_5, avatar) FROM stdin;
    public          postgres    false    220   e       �           2606    41715    person Person_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.person
    ADD CONSTRAINT "Person_pkey" PRIMARY KEY (name);
 >   ALTER TABLE ONLY public.person DROP CONSTRAINT "Person_pkey";
       public            postgres    false    216            }           2606    41717    awards awards_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.awards DROP CONSTRAINT awards_pkey;
       public            postgres    false    214                       2606    41719    games games_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (name);
 :   ALTER TABLE ONLY public.games DROP CONSTRAINT games_pkey;
       public            postgres    false    215            �           2606    41721    reviews reviews_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (game, username);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    217    217            �           2606    41723    score score_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.score
    ADD CONSTRAINT score_pkey PRIMARY KEY (game, username);
 :   ALTER TABLE ONLY public.score DROP CONSTRAINT score_pkey;
       public            postgres    false    218    218            �           2606    41725    studio studio_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.studio
    ADD CONSTRAINT studio_pkey PRIMARY KEY (name);
 <   ALTER TABLE ONLY public.studio DROP CONSTRAINT studio_pkey;
       public            postgres    false    219            �           2606    41727    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    220            �           2606    41728    awards awards_game_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_game_fkey FOREIGN KEY (game) REFERENCES public.games(name) NOT VALID;
 A   ALTER TABLE ONLY public.awards DROP CONSTRAINT awards_game_fkey;
       public          postgres    false    214    215    3199            �           2606    41733    reviews reviews_game_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_game_fkey FOREIGN KEY (game) REFERENCES public.games(name) NOT VALID;
 C   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_game_fkey;
       public          postgres    false    217    3199    215            �           2606    41738    reviews reviews_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_username_fkey FOREIGN KEY (username) REFERENCES public.users(username) NOT VALID;
 G   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_username_fkey;
       public          postgres    false    220    217    3209            �           2606    41743    score score_game_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.score
    ADD CONSTRAINT score_game_fkey FOREIGN KEY (game) REFERENCES public.games(name) NOT VALID;
 ?   ALTER TABLE ONLY public.score DROP CONSTRAINT score_game_fkey;
       public          postgres    false    218    215    3199            �           2606    41748    score score_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.score
    ADD CONSTRAINT score_username_fkey FOREIGN KEY (username) REFERENCES public.users(username) NOT VALID;
 C   ALTER TABLE ONLY public.score DROP CONSTRAINT score_username_fkey;
       public          postgres    false    220    3209    218            �           2606    41753    users users_favgame_1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_favgame_1_fkey FOREIGN KEY (favgame_1) REFERENCES public.games(name) NOT VALID;
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_favgame_1_fkey;
       public          postgres    false    3199    215    220            �           2606    41758    users users_favgame_2_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_favgame_2_fkey FOREIGN KEY (favgame_2) REFERENCES public.games(name) NOT VALID;
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_favgame_2_fkey;
       public          postgres    false    220    3199    215            �           2606    41763    users users_favgame_3_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_favgame_3_fkey FOREIGN KEY (favgame_3) REFERENCES public.games(name) NOT VALID;
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_favgame_3_fkey;
       public          postgres    false    220    215    3199            �           2606    41768    users users_favgame_4_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_favgame_4_fkey FOREIGN KEY (favgame_4) REFERENCES public.games(name) NOT VALID;
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_favgame_4_fkey;
       public          postgres    false    3199    220    215            �           2606    41773    users users_favgame_5_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_favgame_5_fkey FOREIGN KEY (favgame_5) REFERENCES public.games(name) NOT VALID;
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_favgame_5_fkey;
       public          postgres    false    220    215    3199            "   E  x����N1��ݧ� &����9�k����v�m'i����|_��H@�[g2�f����P�����Zd��j	�-�܉ݛW�C~.ъ�Dx�hY���F�Lr��/��'d����O�K�%����%�vĳ�l=*�uC�JVXë�4o�J����V�"�J�8�F3��0ŵA��Y6�0���lh���*'�����=m�sh�=oz@8кo���\�Ca�J:�4�
FZ���ۆk:~���%�H)B�N���?M~��S�v��)z���ڈ�U%�@@�\� -�~��[�!Aƚ�.��Z�G]��+H�����tq�$�7��      #      x��}[s�����W��$v�EPԅo���KJ�\_�ThbFL�s	>I��xk�ز]�%�$��Ԗْ��T}�������=���1� ���ME�Lw�`���s?��غ�]O8?u��~G4Lϔ�6��\9_9�m-�Y��7��\�+l�wD�m��]�ϭ2�z�D�Wf�v�����-Z�'l�1��p�,h
�4�߿m��R�^{�l�pϙ�F�\]�_����߱$o���u��^3���eE�ι;�&����]D ��lx�b�t]�nβ��V�c�hmx/��a�|�d�=ӫZ�l�'�D}�E���X�����������5��y�A�i������7��������M=������0�A����?Ǧ�������߽�!t|�?쿀�~�6���g����GX���?���_�m���Ϗ���=ˍN���!�t[��F��Ҽ���p��e���eZP[�U=B#��њ)���B�J�#����:[�M[x��.3z�U������D�3@� 8`�������(>����E���s������o4�����Boc������b�r��1Y��]DPiޔUC�[��vM��6�H�&$�^��l�t�Yf͖�u�����/�O?0��H�9�̹����a�2���9߅n�ݪ��c�m���.�i|J[6�.��-����)������Ѽ��Ɉp��#��	��h��{a��S���t��`�4oI٨I>1q	x���S�̶��jZU�=�@��`Kx�q�nY,��������������}ܡ��qG�&}������\�=~v�!.1=@��0F�I8y�H����/��Ƨ�g�����<'Z���n����v>�EK�:�����0рQoQ�w�?�����DY�Pv�=�������d�{ʩ�h��i(-�Q�`KuC����M�P��!{�:���˪����9��{$$E4���������ڢ��`���8{��?�������u��f�[��tv}��pKh����A�ZfDjcVN�.���̮:�ɮ��eWKݤ��|e�/�wc�4:�!
�hJ���p������j9M�\���s���XF�AdI0�-��<�(��d��#�Ll}mE؎�b�?~c8\�.nw l�7�����<�}s���p��[�j|�aZfZ��>����!v�i3�l�-����M�,-�C��,�1@\Ӕ>,j�z��|ǅ�5zH��N�u��z��i��.����vp��i
zkl��7#L0�!�F�nL��TZ�N�U�o���w�.������������*ۘ[_�L��� 3f�g�<Zc�ޮ�,����{@�<B~���� �>0_�(�h�F"%I����
�pOs�o�7�\�9ʴ4�X�3�����/��L�ą���6`�t�	�wz3�H�xq�,��L�(a��k�وL�qjZ�D�1;��	��X[u�[�͝���s<P)�z�]���z���?�\�h���l�X8���Mu��A�?���]�{�QZ�`���I��mN�LN���#W��a��I��/L%��r7@�D��D�k�u��CM.�Pf7�Voo����W�+����y�ɝ����ϵ̞d[~�2�|�͌7=��ۻ��;0H��^'D�᧤-�������f����N�0����9C�m�1����BY�۞�MYf+����M�@��(�]���<�q�����;������_"9"���AG�����yNt�#|1���Ą���?h��,��i� �J�ms qG8�����D��a��Ǩ�|����[��T��E���@/�%7��� ^�m�Tٺ�%���p��,dn��)��Ҳ���k�h��=�(6.��VZ[��^��^M�o�,�I�m��`$2\Mn��x�r/��]�B]��<��4��e@��Q�VB��^"Lg���� ƝVt����}iJ��!�
���� tW-�i פ0aC�۲̆K[�o�lt��i�������lI�k���Sh�q�*L�w�'���������6[�-=	$�ߡ��hq8���ٗ������BMiY:<����G&Ř�f�@�vuX~���Ƶzlݷ<�� u$MG�v#�h��h�b�%z%�FTu�[�-Ë`u�I�Eh�}||�UP���lbcAEԧ",!졍U���͌���l��!�!(��Z2\w�㹃��o�A�����u�.jX+�n� t~8y�#�Ӥ3���ț)-;�aVѢXJ�]Ce�A7H�$s��5x��EW�,��-��h4 ��(�O�����L���U�@��w�K�a^֒-����O�X�D�*H�'mЏ�a�,,����F��On-���Hن�\�h�Cp���%e��{���u�
G ��D���������%����:�����ح9Oɸz7e��\4e%o�u��恝�͝����[��%m���V�caV[h��=�T�爵O� ���wD� }Dt���?���I{B�a�qg��Z�Q�8Di�:Z���������r�"���F���i*��n����W�'s���<*�����+�s�µr��%��1�D�P�������5�8y%��Q^�����{�#���p�	x��d�2���Ǯ�s�b��qΪ�m���7@ä^`�ֈVN.j����ar�ni�7�eH�j8�{0Jŭ��4Mت�|4���q�!R��~1-}:%*����$�Ƽ 6r�c���Y��H(QT�����q�^��C,�L@����usW���5�1�p)��YC�V����/�Gd�z��/��9ڽt5п�o�ϳ���Q�T�^"bTtM���p3����d�)<�!�R����v�.�L��%��6򌔕5�ĴYh"ǒ{��[�l]8m�F�����	�D�����be��!z��<�Q.=�0���Bz�T ����O���f�rq�%�~��3Ɓ�5YRv��*�G5�I��F[1Ah倷���S��O5�z��ٺ�T~(�a
H,���Ҷ����[l͑����p8[������Ǒ$�.�q�Wp;g�}5rKx-�u[�����K��M�:4��f�f�yiE��>�%)���H��eۺ��#�-���;�3P���Ė� 2Oz�� xc�fA%h� ���|��W�"h�uObt҂�i�q��.Y�`S��ndl� EYIi�̖̆tQ��YZ�M��Jo��g`S�x�Z�%ØfuAD�B ���ވ@��WZ4�k�.-enɲP��8H�^p�����r�7�	 ��.k5S7�΁�ʀy�!Y�>���`V1�#�S���h~E��sM����"��qA�o����n�k��(S}J�����wL�t�u >�ugR���{'F`E
+i�Ͳe#|h�u����1^�Z'7�t�T.
f�]�-�T]���M�j"}Y�n�1%��<�H_4��_�r�; 2F�pYց�ȶH��̰4��
��^�1�@u ��&�# ��1�+��f��@��:r��IC�j�8R���du،��$��5!~B��#��}��{�X�Ch'�Q�_(s�~��_�����s/��ɷ�p�M�F�3b��`�$y-灡�:���L1[%��|�]�k��U�čvM�Z�9Rt~r�-r`�ڂ�.��
��I�ic��mo'�w�;Q�. #I ���U�������9s"�K�UNV8p3�ixڒl�A�
��AS�����w��{g�W�\���@�� ߖ�I߱EO�F�������2o�V��z��ۜm��O���^� ��6�y�1��2��媷.@�Ϝ�g���D!w�J�o�-k�Qvo�� �Y�m�z��NR[SV�xCE�S��'qyd��N��<�e4^�M��߱Lt@Nh�u�_A��xY4�@�; M�:�?��7��.l��/mU�M��/k�=j}���=���_�`�X�`5p    �E5+��,�npǖ|GvN�=K���F�Jh���KW�"�%thI��]�@7_h�6�Ȓ�ɍ�G�
�?=~�����2dC@����:��R(�a���wi4H��?��/��G�ǋc��&�43�Fd�i#�z��/c|���
�h �;\l���@�X�J-�L���%��J�q�区&vw�\�[\� ��V8.�Rq�EnX��n� ��4��]��8��m�bR9���v�l��66����F�����q�.'�4J�)1j�̂�.�#8�է��t����Ĥm9ev�{tK�o)*�5MIG =���1<���G�����g�����'�/IM���b<�Q��gd{~A�z� "=�]}s���_ѻ��i�=ep:$�#��0�ń�ǌ���S�zMS�O��,O��M�Il����I6��C�"�i�1��Vm���¿�H����R�_���{^�ߚ�y�F;��!�u�Z�s;4�˳l�tTnD^[d[��UbX�Zv�����;�8�`������Շ�gu|( �����nd�u�u)���C������RTuu	hM'��ʩ�S��1C��� �5�����������s����W�ȋ|�!�^vd�m�0��7A(lg��3���KW��ްЭS)�s�
�|��f����M���U�q�r����V�\l��O�F/V�G�"6E�o熈�c1��'�(�P��E�ң����(R��y�B��nפ�I�Ea#�q��`��2�w���JS�������^�pA��|�,g�dǻ*��;Q�4�Un�{�7���Q����>%�x�fM���ÀG�\o��^��v�m�i���ىq W�����sۋl{i���@��HQaGd�ڮ)��w���G]�Lip�� ����zW�Ji��5Kb,�,�ay ��kZ	بg�JQd�\w�6�Nl�Bp0}V�pt�D{`��Ů"�J�l���3�e`(m�mQ@�I���8csMڠ��E�i��1�:A�2���x[�(?��<�����p�+Tl>W)�n�}��_+l���-j>*����?��������Er'���y��|h�C���t�p�\�p�I���3����7�B�8�zW��:j�� �k4�dX
c����0�?
Z(�pL�͹�&#�#~y*z�D!�g �4ތ�f��O���`�a)�@�V|\��t��,[�%m��Is�?3N�!�r<�M����	t��_ߣ�����3��*���֜�דE�)��j�e7�U�ͅ�T��}e�P;�� 0C#�VE�+�#������m�)َl�=+�efK���N�6pl���I1�^>FgJ�>����%zZ�>�	�+9�.���$k�̒�>�����0��z�>���
��m����T�Z�l�?!�)\4˸O���/�m��vD
%TjEb�6� �%GͷD�)XP�bz�!Q��ơ��_P@�Q��Rx)��D����K�y
�}��h1Y'�-B�>5	0-@�\���:���uY3-2�>2+�V\��v�dx�z�����.<����}�e�{�vϫ���Ğ
a��
�M0�����+쥍��7���e-{?Z�)�&�xd��"�΀3�LG�m����ݱ|��\ژ�c�5�����̡za�TY+��&R� ���x�2p������(��K���?k�$.�*+���,����Ѕ���5=��),�9:�v��x��k� ���0�6�v����ζ�iwzZ�0`F���*���3HP�����z�~�(�Ra��W8qJ~&�(/04|`f��W�tG�T
��`.A[�F6<ܢ`�(IixJ��� �y��ToF���E�G:�$�L�'���C%�(]�)���#�'XP�ӕ-�� <��U�q�7���(	�Q��qB�w��UI֕%�4hE��夵d�L?]�v[�~K����Q��$=ɧ뫬�Q/(+�W���ĥs�͓Ҝ���@Te�����T�YPe�0T0��н��wH!n�±�˅;vT�D��F�.]�\��?��SRW(b�Њa�۾U��xO�Y�?K��)F�:�;�n�'i �J� ��Q�5"/
��;�I��T]:�Q)�;�I=�ӗ"��@*�A;	��2Қk��7g�B�_�幩ϭ��hvV� �%��	^�V��y���3�#x{v,5�hN�U�l �v@3�0w=���hE�J�M/���9� Q!����L +�M���tVg"��Q`����]�h݊?���6���V����r�	�4Ì�cyX+n�#[�m�F�"��3�<aLP腺e�W�;�
x�P�u)��Yr� =�3�L���&�Щ@�o���a 	P�	1Jl"-_��kb�ߞ��I�1��(|�7A��,�݊2܎�%�D��?���;,��������%��&u���(�6=�N�X-+t�����6}/��-���箨qX�և�E���P��<��k��g(���;'���A�r*w*�W��˧�t�.}/�L#kj�:�Mx�ǥ_��dMd�t��p^VL��OƔ+�X��J�J.:tO�K�1Ҋ,]ʥA*�C>��s/��U�V9���~�.��ޝ<�©Gy)2D{i��8���J������Ģ��a�eѠ�V��0ț�-��X�
LJ1&J�|W	��O+f́��&?��W�|��5��$��Ҿ���|���zۧJ�%�DU<�:��L�*(�!���1����D���$LG���⫑���)�P��������.{v�hpZ
wLv���r�L�X�v �-�a�Pq8[�:#��űrV+��,gb��m�d+��3��g�XO�V��+!D�� Fu�X�r{u|�e��Sw9�HF�2��FH2A@�2�o9��S;�yܩ9B�2LNQ���5e�@%mبU�gP]$���b�uЮ,���{f0]�D��(��u�T�	��)WFY�x.�Ji�c� ���"Z��k�{O�R���V��Ș��������V�����_��+h:�h����CX���a��,���+�ۍU( �8l��Q�Dx5~�����5ӥʯ�E�C6���-4��[�Z�p�al����<��?ikX`�]�A�m�ycۦ`k#�U�YX��i�	�D]��(9��\��(��k�|�}�[��N#F��ם�>]Z^zC�E�,��T��K�BaQ�h�&k�nm^��������8�Ӑ��'��Aai�0Ժ]M�W�#��U��ʥ���"쉃�����u�<��3W��n��������%�����}u{nqI;ɘ�|���>���l��R�2�$*�rڸ=�k��#ڼ%t\N���A��7g1�`�[-�á�E)d'�99�s=o��X�7����(�K ��";M�E{)7��%�$@��2E���9��̯�b��� [ܷ�
0�7}���kҰ�m��=���l������O��쫔��{�h=����5�(^�W��UVz�������E-F#�`:���,�VG�wgO�o����3�~Ѕ$�Q5���U����Y�y��A�q�8���3!�3=�����1ӕ�)?�A@~�0���Iy�g��BT꜊����'u�@p=�����
���4��
K��^!����>p�6R�͵�`f�Y��Z/�>�
�ҢhK��nP��%�^�r*��d҃,_�?9*�;~�A%�h���3��(-n�]��`?��T�z˪���/��@���k�?�/�7Z��Q���+qmk�7�����LQ�a٫�p�s[
P^V��Mc�OY�9�=U{5�?��iK��;��=:�,Ffiy{��*�k*��d�红���!Z�>�2k�6��, ^Z�6��Q� Nz0�\��҃�*m�b{kϵ���������������h��h��pӤ �nQ<%�г�Y��^�lo���7%��p5��*�J#�Wx�����O�x
��rN�H����h��	(��n�R�8��p�ӆ�)�s�����]ٶM^�{D��m��:.��2������ ���?��    kq��D"�:�[�@f���.Z����Dc�[�P���a�G*��d��ꈌ�Pn��Z׋4G�Y��^'4S����0==,d�k��1N�%/��MI%2W��`�f������!,A�(��=�VU�MKg�2�&QUN���C�H�sLf|�n��1��a��Ҷh 3���!�T���Ӈ�k�ꗙ[���%�>����8��>R��2K�X��*�/?��+�-�0zyh�ˡ�2��G�r��<Ұcrtq���T$a8�r�ԭ���l�l�F�X8G��d�ߩ+WT��ӕ�.�v���i��B��긑��j��h��V�|����!���p~� w�!Y��%C^��Q�^����Ľ�M�oL/��8�	
�K���d�t�(T�
u���;/�n�4�S�M���}2h�����%*T�dO$��I���d+~3�e��v&5�*Q�>9�|�.�ύ8wU�LGβ��r�e�� �ݬ���y�yQ���R'�j5�T��a$e������|���8<��{�����dO�#&��3�����txe:D����
q:�v��qq=XV�e7:LV�k�Bz1i���Ǌ�Ef��x�^��}��T���/4������'HMMGn�d՗�t9� .�L`x���v��u�16k@P1:��<L/�O}�J��>Z\���r�|����V��B�c�ٲ��04;��p����)��J�>	�{RH�o㥩5���P$T"@h	�	M�7Bn*P5��*��$&M����F�.D��(���n�4�m�v!�h��G�0��N��e7\��T`�hh�=�w�� 7��4�[��a��� ;a�E���G'�,�.��W���W<{�u}���(��VH$a�]����Ng�eE�C��|�M ���h��,�Y�w"h�;�k�{G��,LZ����B+W������_�4�p�TӍ"q\�R8ѽ 'p��*�{���i�E��s�C&�j�gbI�3�ܔq�����n�X����[�,�k@'<�21��ac�%W}�i�	E����Ahn w�	P;���5C����-ӻ�9K�#�Ru�չ �%0q��Vv/^����c0�V�5�ք���I?�y��?Gt��(�..=8��]#�����w�L�U��I}��R��|��{a�t��L�|\�4�QPz�c��\��޲�.H�Z�̒ô߿�W�7N����N�װ�+Ng���{�e��b�*����UOtA���>�--K+h����i��A��JB�ޟE�'�����B��U�3,�������d|+(���!���UT���|@z<��eF���S����.y�vEs�r�=z��-e�Ƃ���zH���_�x��� Q��*#��� [���CS��T��dh(��P'�a{�����+�n����f)k�r"5��@EP�EMP�L������B+x�9�G.N��t��FPi!o��+T>!)Z���2��E�?[��^|ye؊�_�k����ѩ5�8���rˮ��CP?0g=|E���#���O�[�=<�U�AA�h{���VZ�ˋ��&�� �>O���r�ߑ7�i�_)��j9�'�������*�\'�u�N#o2B��r�#(�U�E�Jve@�X�C\����	�U����3���
���̒�I�Xef&�'�kx\�c�7:�B�F�@�����䐑�̛�2%m�W��+TA�F<vr>�3�tOA��
@R��U�h��]���	"c���-5g��<bT˚�?W�sRy�G�z��A��4(�(�p�&���Q�'p6g��!n�����f�������,��
P2�`�;��:�l.����z�����EF�ӍN;T�W�LQ�J%�9�i�	Ӎz;i���p��
*,��T�;��<i�UlŒt�`>Uv��-Y�_�� +N�[��V��v�X4�[�\A�;��h���vDLC��T,_HrI*
N즳'���{���R}~�U-�5�
�`�I��fq�/N���>���^3�L]���^�R���˳A�X���}�_`��P���ljWs���}��v �C�R�F�ut:<�A����t��Q#H@�1�Ri����?��[�㪜��ü����A��
���N���>�S�q���Le0�ʜ��+��� \���=b�K=:�д΍�z���9�s(?��R-t<��;&�������=�'�<8 ���������ք&����;)T"���� B�)D(e��G/���qj����mθ<%�q\�?��omU�Ӕ��}��5=��� ��k���y��C�/i��*�$���'�`���^�w@ v��-X���E>��5��*k�wjCm�n4�|0wh�@�-t<b��S;5�~��e"T5?�0$���`1��T�8YYiO�:�h'P�ңFɥ�����$���&�}���ޑo�P�>��?t��b��=D0��@�oK��;Bh��|��B��˦#:��jާ�bf���đgȷ����,�����!��A��I5��q>�%��6`�M`cOj�������3�1`����S?�ܝ/UŰWð�D��:��ń�U��<D͞$ĀPd�&�P5s<V�4zĤ��N�~;x�ׂ�!L���$�|g�ߡ ���`�b��_e6����U��=Q�{Ae�?Sv3����F�I�����:�/]�e,7e��Tr�]5�(��L�!���1HD�����R\�,���gMiC��z{O�6����V<�ղ0�*؈����MugZI��)P�)hՄ}J!A&8=;p҆6�?7��41�Y���"��޼���ö���Y���qg���^�w�c��Q �ӳ'idQDG�ayo�R�B���S��@z�J�oѼL"yĳ�E*��"OquUV)��G7=U	�ǿдd���Q0��_����P��0�gJ`������@N>�T$:~���#��=�Xp�h��ҒO&\����+%&�N���3�����lޒ�A�@ '�lx�EXL aꇠ<�(O�vFs���n���[8/'�x�>�������л1��)GM�3��pF� H�b���)�Y��lO7}��ih���L�e���M���g���ι���>������f�ե Ku�.M'y��0I�3�m���i,��}�$c�����:u}��$���2z(+&� ����HV4�`��z�"�T��.:�
;"y%}b۠x9O�mY"u�p� �Ԃ�srRA]4�N�)���p��¿��>����봥İH�:{:���N˔�H	nJ���.j<���F׊��.��iu��~�b-��8Z���+����'ԫ"7{\"�YG���b�z���S�,�����S�{�A �]�.��O��Ҏ��BD����ƥ�9t�5c
�iD@~�s�&mFg	v��k�M���i�`�Y$��c}?FI�]7�(��@U+S�RXP;mh�@1����.L�;�%�"� �<ڤ��.�f��9p5Iʓy�}y�c��#%P��IE��ߣ�]x�&V}LL5��Rb'�L9��
�p2�T#�$�0�Ğ%��*WH����-�bj��W/`��0���SE_�G���B�eB�y9���Cd�n�v��[���ٕ���D����[o�Z~
_�������O�3U/�a�XU�sK4�:p�<A�2�e� ^6-�ӑ��*��ã��"�h@�.��H`�ґ���(T��P��!JJ�/l�cV�-�D��t�����ry�
-Y���rr���~��`z�w�t�b��A�v�ݰ[��S�e�"a�4&�$���ױdRnh�Դkt.0�rm��պ�<�D�����3{��"&�$Ld!����0��YIbkO~t_����e�� �2�Մ���f�n���>Z���P�ư�������ɣ�����[���!S�/[�A�/|C���ķ)�e}`��$H�f������s���l)�!��q��/��>&{�d!RX��]�K��g".^�#	q?�.����t�\ ]   ��������ܹ9�t飼ȟ�Y� ����4����lG���T\	yO�R��^���#�'}`�QQML�+�n�K-o؜������s�R������      $      x������ � �      %      x������ � �      &      x������ � �      '   ~  x����n����S�7k'�:�Y������q`�`ws���&�${��q� �\��� �������g�m~�&�Ū_Q3�֒��w�D.���矞~�������ˢ��x�~GW5�e�v��s�����T���0��ے�H�"&�,��
S̲�E��ǜY�<�� �: ��)��\�D� ϐ��#���9�T�j�-ޯ)k09ӚY�$�&Z�[�R�-9i[��d��LȂK�Ȁ��;F0�V�R��=�<0�
� `rɬ�3�B�$��h� ���_E�n����BEL�M�M�y���5�,Qd�7<W%ǝ����B�-�	Mz&��&�k�Wr9;�	9��H2]�B}��x�7��>������>�m'vCm�u��.�RI�c��#;�-��Ǎ����#�@7T���p�����W�����lyz�����b�hYE�0����$e:�2E�8zM��ssP�	��f�$��0WzN��q�x�ɥ�Vy芸�@�-�E�qk,/���#��IL�<^��A�x�wz�a��	�^Zp��l�jU�d0X��&�l�-/�Rp�|��짤%�=.E����B$��H�G�&���o�$�py}"��2MJ�l�. D���fc�Ιun�����2hhZ�3�c9T��<�A��3����\�\��X�Y���&�P-*�G��U2�E~kDb����	�^F�\$��Q[�Y���	{�>q��d�6L�4t�!7�KY�Nf*����34qř(yhm�(�z�j!��?p��
�:���2�?��+��.���ɠ���4 ����WD�X=e�W�f�ڒ��x��)^ ts���F9�PMIC�g0�6���XO������W�D���FmH���<�� �p?M�c8D"��ШA2O0�U�/����ě V����9#*�h�x�9䠐�k����lrF����������Z �����MХa���f�[��`�.QT��qp���w2a+dU��`uߛ�2V��(��p�Q��D*,�ۃBϙ�ě��ĨH�W�H��^�X+ܴ��ȭ+�m�����W$�#:'-P����Ř�v$։��ETH��"?*��}����υ�v��y����;a*8ɩ�1/mhIGѸ��(�d�4�-�����)ϡ�Z<��h��]�ʃ��Gwb�=���B�/�ZÖn@}�C�vf�$�n�� �^NU��]C��ʧ*��ߪPd=]n�ʐۣ��$�q$hud�\�}Ǥ�s6P6�h{y���@H�W�%jE��h<�Mߍ!4��,U+
&��u�w{�%j�M����5&o,^II�!w��<���^��5ŉ���Z��r�+�@���
hZ�h�&1i�ǒ�i�����Q��N����	۪��1][��뫋ϟn�!_�|k���o�S"2��#�T}bp��@���M�(�i��`v�g)HP��
�
*s��,�?�nA�l����������/�i좆�?���������u�}�0t�8��L'C/M-M��v�FR�x����zG܀b:�֛a�z$z8����~�1�]Þ�L��"%�U:l��f ufW�	vI��#U��Y��b��7�3�*��q��DVA߳��2�'��t�g�Y�Y2ͫhp�[�hXO�(c
H̡ηh�] ��8���s�S.�&z�u��N�hɓI����^k�U1�Q+aB��{k^b���-��z�ӝ��D�!Q�[�2m�G��*�
�|�c��ǵ�+QJVVZ�Yÿ|h9�����e�+?�v=@�/�/%�R���ɡ��D��#W���QT�e�8@�@�]�UC�z.���������7��)ϡ��M��zߜ�뛫���O�f>}0A��-�ܥ����wy���/�F�"�gK�7��U7��D�ȝ�󂇊C�nj�u71�$1�s%*��������+&-t���̶F��XP�&e�߼e�v4uv#����������צz����p���-9Q!	ea����O%���o-�A؃�~7ꋶʅ͜Wn��F[B;"���G3G�{gB#4y���zhzl4�^b��w?����.��-�fԪ���t]I	·�� q m��oH�oh�Lm���ZH�� ���۷o�{`S�      (   ,   x�+,O5�LI,N1��Ê�
�S��J��)1+1Ʃ$F��� G �     