PGDMP  7    :                }            hospital    17.2    17.2 Q               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16495    hospital    DATABASE        CREATE DATABASE hospital WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE hospital;
                     postgres    false            �            1259    16543    alas    TABLE     �   CREATE TABLE public.alas (
    idala integer NOT NULL,
    nome character varying(100) NOT NULL,
    idhospital integer NOT NULL
);
    DROP TABLE public.alas;
       public         heap r       postgres    false            �           0    0 
   TABLE alas    ACL     T   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.alas TO chefes WITH GRANT OPTION;
          public               postgres    false    227            �            1259    16542    alas_idala_seq    SEQUENCE     �   CREATE SEQUENCE public.alas_idala_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.alas_idala_seq;
       public               postgres    false    227            �           0    0    alas_idala_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.alas_idala_seq OWNED BY public.alas.idala;
          public               postgres    false    226            �            1259    16577    atendimentos    TABLE     5  CREATE TABLE public.atendimentos (
    idatendimento integer NOT NULL,
    data date NOT NULL,
    hora time without time zone NOT NULL,
    idplano integer NOT NULL,
    status character varying(8) NOT NULL,
    idmedico integer NOT NULL,
    idpaciente integer NOT NULL,
    valor numeric(10,2) NOT NULL
);
     DROP TABLE public.atendimentos;
       public         heap r       postgres    false            �           0    0    TABLE atendimentos    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.atendimentos TO chefes WITH GRANT OPTION;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.atendimentos TO atendentes WITH GRANT OPTION;
          public               postgres    false    232            �            1259    16576    atendimentos_idatendimento_seq    SEQUENCE     �   CREATE SEQUENCE public.atendimentos_idatendimento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.atendimentos_idatendimento_seq;
       public               postgres    false    232            �           0    0    atendimentos_idatendimento_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.atendimentos_idatendimento_seq OWNED BY public.atendimentos.idatendimento;
          public               postgres    false    231            �            1259    16559    enfermeiros    TABLE     k  CREATE TABLE public.enfermeiros (
    idenfermeiro integer NOT NULL,
    idala integer NOT NULL,
    nome character varying(100) NOT NULL,
    chefe character varying(3) NOT NULL,
    cre character varying(15) NOT NULL,
    CONSTRAINT enfermeiros_chefe_check CHECK (((chefe)::text = ANY ((ARRAY['Sim'::character varying, 'Não'::character varying])::text[])))
);
    DROP TABLE public.enfermeiros;
       public         heap r       postgres    false            �           0    0    TABLE enfermeiros    ACL     [   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.enfermeiros TO chefes WITH GRANT OPTION;
          public               postgres    false    228            �            1259    16520    especialidades    TABLE     w   CREATE TABLE public.especialidades (
    idespecialidade integer NOT NULL,
    nome character varying(100) NOT NULL
);
 "   DROP TABLE public.especialidades;
       public         heap r       postgres    false            �           0    0    TABLE especialidades    ACL     b   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.especialidades TO atendentes WITH GRANT OPTION;
          public               postgres    false    222            �            1259    16519 "   especialidades_idespecialidade_seq    SEQUENCE     �   CREATE SEQUENCE public.especialidades_idespecialidade_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.especialidades_idespecialidade_seq;
       public               postgres    false    222            �           0    0 "   especialidades_idespecialidade_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.especialidades_idespecialidade_seq OWNED BY public.especialidades.idespecialidade;
          public               postgres    false    221            �            1259    16497 	   hospitais    TABLE     �   CREATE TABLE public.hospitais (
    idhospital integer NOT NULL,
    nome character varying(100) NOT NULL,
    cnpj character varying(14) NOT NULL
);
    DROP TABLE public.hospitais;
       public         heap r       postgres    false            �            1259    16496    hospital_idhospital_seq    SEQUENCE     �   CREATE SEQUENCE public.hospital_idhospital_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.hospital_idhospital_seq;
       public               postgres    false    218            �           0    0    hospital_idhospital_seq    SEQUENCE OWNED BY     T   ALTER SEQUENCE public.hospital_idhospital_seq OWNED BY public.hospitais.idhospital;
          public               postgres    false    217            �            1259    16529    medicos    TABLE     �   CREATE TABLE public.medicos (
    idmedico integer NOT NULL,
    nome character varying(100) NOT NULL,
    crm character varying(15) NOT NULL,
    idespecialidade integer
);
    DROP TABLE public.medicos;
       public         heap r       postgres    false            �           0    0    TABLE medicos    ACL     [   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.medicos TO atendentes WITH GRANT OPTION;
          public               postgres    false    224            �            1259    16528    medicos_idmedico_seq    SEQUENCE     �   CREATE SEQUENCE public.medicos_idmedico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.medicos_idmedico_seq;
       public               postgres    false    224            �           0    0    medicos_idmedico_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.medicos_idmedico_seq OWNED BY public.medicos.idmedico;
          public               postgres    false    223            �            1259    16570 	   pacientes    TABLE     �   CREATE TABLE public.pacientes (
    idpaciente integer NOT NULL,
    nome character varying(100) NOT NULL,
    datanascimento date NOT NULL,
    telefone character varying(13) NOT NULL
);
    DROP TABLE public.pacientes;
       public         heap r       postgres    false            �           0    0    TABLE pacientes    ACL     ]   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.pacientes TO atendentes WITH GRANT OPTION;
          public               postgres    false    230            �            1259    16569    pacientes_idpaciente_seq    SEQUENCE     �   CREATE SEQUENCE public.pacientes_idpaciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.pacientes_idpaciente_seq;
       public               postgres    false    230            �           0    0    pacientes_idpaciente_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.pacientes_idpaciente_seq OWNED BY public.pacientes.idpaciente;
          public               postgres    false    229            �            1259    16506 
   planosaude    TABLE     �   CREATE TABLE public.planosaude (
    idplano integer NOT NULL,
    nome character varying(100) NOT NULL,
    telefone character varying(13) NOT NULL,
    idhospital integer NOT NULL
);
    DROP TABLE public.planosaude;
       public         heap r       postgres    false            �            1259    16505    planosaude_idplano_seq    SEQUENCE     �   CREATE SEQUENCE public.planosaude_idplano_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.planosaude_idplano_seq;
       public               postgres    false    220            �           0    0    planosaude_idplano_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.planosaude_idplano_seq OWNED BY public.planosaude.idplano;
          public               postgres    false    219            �            1259    16537    planosmedicos    TABLE     c   CREATE TABLE public.planosmedicos (
    idplano integer NOT NULL,
    idmedico integer NOT NULL
);
 !   DROP TABLE public.planosmedicos;
       public         heap r       postgres    false            �           2604    16546 
   alas idala    DEFAULT     h   ALTER TABLE ONLY public.alas ALTER COLUMN idala SET DEFAULT nextval('public.alas_idala_seq'::regclass);
 9   ALTER TABLE public.alas ALTER COLUMN idala DROP DEFAULT;
       public               postgres    false    226    227    227            �           2604    16580    atendimentos idatendimento    DEFAULT     �   ALTER TABLE ONLY public.atendimentos ALTER COLUMN idatendimento SET DEFAULT nextval('public.atendimentos_idatendimento_seq'::regclass);
 I   ALTER TABLE public.atendimentos ALTER COLUMN idatendimento DROP DEFAULT;
       public               postgres    false    231    232    232            �           2604    16523    especialidades idespecialidade    DEFAULT     �   ALTER TABLE ONLY public.especialidades ALTER COLUMN idespecialidade SET DEFAULT nextval('public.especialidades_idespecialidade_seq'::regclass);
 M   ALTER TABLE public.especialidades ALTER COLUMN idespecialidade DROP DEFAULT;
       public               postgres    false    222    221    222            �           2604    16500    hospitais idhospital    DEFAULT     {   ALTER TABLE ONLY public.hospitais ALTER COLUMN idhospital SET DEFAULT nextval('public.hospital_idhospital_seq'::regclass);
 C   ALTER TABLE public.hospitais ALTER COLUMN idhospital DROP DEFAULT;
       public               postgres    false    218    217    218            �           2604    16532    medicos idmedico    DEFAULT     t   ALTER TABLE ONLY public.medicos ALTER COLUMN idmedico SET DEFAULT nextval('public.medicos_idmedico_seq'::regclass);
 ?   ALTER TABLE public.medicos ALTER COLUMN idmedico DROP DEFAULT;
       public               postgres    false    223    224    224            �           2604    16573    pacientes idpaciente    DEFAULT     |   ALTER TABLE ONLY public.pacientes ALTER COLUMN idpaciente SET DEFAULT nextval('public.pacientes_idpaciente_seq'::regclass);
 C   ALTER TABLE public.pacientes ALTER COLUMN idpaciente DROP DEFAULT;
       public               postgres    false    230    229    230            �           2604    16509    planosaude idplano    DEFAULT     x   ALTER TABLE ONLY public.planosaude ALTER COLUMN idplano SET DEFAULT nextval('public.planosaude_idplano_seq'::regclass);
 A   ALTER TABLE public.planosaude ALTER COLUMN idplano DROP DEFAULT;
       public               postgres    false    219    220    220            w          0    16543    alas 
   TABLE DATA           7   COPY public.alas (idala, nome, idhospital) FROM stdin;
    public               postgres    false    227   _       |          0    16577    atendimentos 
   TABLE DATA           o   COPY public.atendimentos (idatendimento, data, hora, idplano, status, idmedico, idpaciente, valor) FROM stdin;
    public               postgres    false    232   q_       x          0    16559    enfermeiros 
   TABLE DATA           L   COPY public.enfermeiros (idenfermeiro, idala, nome, chefe, cre) FROM stdin;
    public               postgres    false    228   7`       r          0    16520    especialidades 
   TABLE DATA           ?   COPY public.especialidades (idespecialidade, nome) FROM stdin;
    public               postgres    false    222   Fa       n          0    16497 	   hospitais 
   TABLE DATA           ;   COPY public.hospitais (idhospital, nome, cnpj) FROM stdin;
    public               postgres    false    218   �a       t          0    16529    medicos 
   TABLE DATA           G   COPY public.medicos (idmedico, nome, crm, idespecialidade) FROM stdin;
    public               postgres    false    224   5b       z          0    16570 	   pacientes 
   TABLE DATA           O   COPY public.pacientes (idpaciente, nome, datanascimento, telefone) FROM stdin;
    public               postgres    false    230   )c       p          0    16506 
   planosaude 
   TABLE DATA           I   COPY public.planosaude (idplano, nome, telefone, idhospital) FROM stdin;
    public               postgres    false    220   :d       u          0    16537    planosmedicos 
   TABLE DATA           :   COPY public.planosmedicos (idplano, idmedico) FROM stdin;
    public               postgres    false    225    e       �           0    0    alas_idala_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.alas_idala_seq', 1, false);
          public               postgres    false    226            �           0    0    atendimentos_idatendimento_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.atendimentos_idatendimento_seq', 1, false);
          public               postgres    false    231            �           0    0 "   especialidades_idespecialidade_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.especialidades_idespecialidade_seq', 1, false);
          public               postgres    false    221            �           0    0    hospital_idhospital_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.hospital_idhospital_seq', 1, true);
          public               postgres    false    217            �           0    0    medicos_idmedico_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.medicos_idmedico_seq', 1, true);
          public               postgres    false    223            �           0    0    pacientes_idpaciente_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.pacientes_idpaciente_seq', 1, false);
          public               postgres    false    229            �           0    0    planosaude_idplano_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.planosaude_idplano_seq', 3, true);
          public               postgres    false    219            �           2606    16550    alas alas_nome_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.alas
    ADD CONSTRAINT alas_nome_key UNIQUE (nome);
 <   ALTER TABLE ONLY public.alas DROP CONSTRAINT alas_nome_key;
       public                 postgres    false    227            �           2606    16568    alas alas_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.alas
    ADD CONSTRAINT alas_pkey PRIMARY KEY (idala);
 8   ALTER TABLE ONLY public.alas DROP CONSTRAINT alas_pkey;
       public                 postgres    false    227            �           2606    16583    atendimentos atendimentos_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.atendimentos
    ADD CONSTRAINT atendimentos_pkey PRIMARY KEY (idatendimento);
 H   ALTER TABLE ONLY public.atendimentos DROP CONSTRAINT atendimentos_pkey;
       public                 postgres    false    232            �           2606    16616 &   atendimentos atendimentos_status_check    CHECK CONSTRAINT     �   ALTER TABLE public.atendimentos
    ADD CONSTRAINT atendimentos_status_check CHECK (((status)::text = ANY ((ARRAY['Aberto'::character varying, 'Atendido'::character varying])::text[]))) NOT VALID;
 K   ALTER TABLE public.atendimentos DROP CONSTRAINT atendimentos_status_check;
       public               postgres    false    232    232            �           2606    16566    enfermeiros enfermeiros_cre_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.enfermeiros
    ADD CONSTRAINT enfermeiros_cre_key UNIQUE (cre);
 I   ALTER TABLE ONLY public.enfermeiros DROP CONSTRAINT enfermeiros_cre_key;
       public                 postgres    false    228            �           2606    16564    enfermeiros enfermeiros_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.enfermeiros
    ADD CONSTRAINT enfermeiros_pkey PRIMARY KEY (idenfermeiro, idala);
 F   ALTER TABLE ONLY public.enfermeiros DROP CONSTRAINT enfermeiros_pkey;
       public                 postgres    false    228    228            �           2606    16527 &   especialidades especialidades_nome_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.especialidades
    ADD CONSTRAINT especialidades_nome_key UNIQUE (nome);
 P   ALTER TABLE ONLY public.especialidades DROP CONSTRAINT especialidades_nome_key;
       public                 postgres    false    222            �           2606    16525 "   especialidades especialidades_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.especialidades
    ADD CONSTRAINT especialidades_pkey PRIMARY KEY (idespecialidade);
 L   ALTER TABLE ONLY public.especialidades DROP CONSTRAINT especialidades_pkey;
       public                 postgres    false    222            �           2606    16504    hospitais hospital_cnpj_key 
   CONSTRAINT     V   ALTER TABLE ONLY public.hospitais
    ADD CONSTRAINT hospital_cnpj_key UNIQUE (cnpj);
 E   ALTER TABLE ONLY public.hospitais DROP CONSTRAINT hospital_cnpj_key;
       public                 postgres    false    218            �           2606    16502    hospitais hospital_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.hospitais
    ADD CONSTRAINT hospital_pkey PRIMARY KEY (idhospital);
 A   ALTER TABLE ONLY public.hospitais DROP CONSTRAINT hospital_pkey;
       public                 postgres    false    218            �           2606    16536    medicos medicos_crm_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_crm_key UNIQUE (crm);
 A   ALTER TABLE ONLY public.medicos DROP CONSTRAINT medicos_crm_key;
       public                 postgres    false    224            �           2606    16534    medicos medicos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_pkey PRIMARY KEY (idmedico);
 >   ALTER TABLE ONLY public.medicos DROP CONSTRAINT medicos_pkey;
       public                 postgres    false    224            �           2606    16575    pacientes pacientes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (idpaciente);
 B   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_pkey;
       public                 postgres    false    230            �           2606    16513    planosaude planosaude_nome_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.planosaude
    ADD CONSTRAINT planosaude_nome_key UNIQUE (nome);
 H   ALTER TABLE ONLY public.planosaude DROP CONSTRAINT planosaude_nome_key;
       public                 postgres    false    220            �           2606    16511    planosaude planosaude_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.planosaude
    ADD CONSTRAINT planosaude_pkey PRIMARY KEY (idplano);
 D   ALTER TABLE ONLY public.planosaude DROP CONSTRAINT planosaude_pkey;
       public                 postgres    false    220            �           2606    16541     planosmedicos planosmedicos_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.planosmedicos
    ADD CONSTRAINT planosmedicos_pkey PRIMARY KEY (idplano, idmedico);
 J   ALTER TABLE ONLY public.planosmedicos DROP CONSTRAINT planosmedicos_pkey;
       public                 postgres    false    225    225            �           1259    16611    idx_cre    INDEX     E   CREATE UNIQUE INDEX idx_cre ON public.enfermeiros USING btree (cre);
    DROP INDEX public.idx_cre;
       public                 postgres    false    228            �           1259    16612    idx_crm    INDEX     A   CREATE UNIQUE INDEX idx_crm ON public.medicos USING btree (crm);
    DROP INDEX public.idx_crm;
       public                 postgres    false    224            �           1259    16615    idx_data_hora_atendimento    INDEX     X   CREATE INDEX idx_data_hora_atendimento ON public.atendimentos USING btree (data, hora);
 -   DROP INDEX public.idx_data_hora_atendimento;
       public                 postgres    false    232    232            �           1259    16614    idx_nome_pacientes    INDEX     H   CREATE INDEX idx_nome_pacientes ON public.pacientes USING btree (nome);
 &   DROP INDEX public.idx_nome_pacientes;
       public                 postgres    false    230            �           1259    16613    idx_nome_planosaude    INDEX     Q   CREATE UNIQUE INDEX idx_nome_planosaude ON public.planosaude USING btree (nome);
 '   DROP INDEX public.idx_nome_planosaude;
       public                 postgres    false    220            �           2606    16589 '   atendimentos atendimentos_idmedico_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.atendimentos
    ADD CONSTRAINT atendimentos_idmedico_fkey FOREIGN KEY (idmedico) REFERENCES public.medicos(idmedico);
 Q   ALTER TABLE ONLY public.atendimentos DROP CONSTRAINT atendimentos_idmedico_fkey;
       public               postgres    false    232    4806    224            �           2606    16594 )   atendimentos atendimentos_idpaciente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.atendimentos
    ADD CONSTRAINT atendimentos_idpaciente_fkey FOREIGN KEY (idpaciente) REFERENCES public.pacientes(idpaciente);
 S   ALTER TABLE ONLY public.atendimentos DROP CONSTRAINT atendimentos_idpaciente_fkey;
       public               postgres    false    232    230    4820            �           2606    16584 &   atendimentos atendimentos_idplano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.atendimentos
    ADD CONSTRAINT atendimentos_idplano_fkey FOREIGN KEY (idplano) REFERENCES public.planosaude(idplano);
 P   ALTER TABLE ONLY public.atendimentos DROP CONSTRAINT atendimentos_idplano_fkey;
       public               postgres    false    4797    220    232            �           2606    16514 %   planosaude planosaude_idhospital_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.planosaude
    ADD CONSTRAINT planosaude_idhospital_fkey FOREIGN KEY (idhospital) REFERENCES public.hospitais(idhospital);
 O   ALTER TABLE ONLY public.planosaude DROP CONSTRAINT planosaude_idhospital_fkey;
       public               postgres    false    4792    220    218            w   L   x�3�t�ITHIUpN,J����O�L�4�2�	�������a� ��"��	L�=3/5n�)L�/��.���� �!�      |   �   x�m��
�0�s�/��nco���
=J�����f��A�cT���@2 �oDz����|�����F��N�InR�V)G	�`29)�LT����:��g����,�ɩ��;''��I�Y5,&�N��5��A��R�_�����˝��v�4��� Gz�TjK!9z�*�ߚ;z�Ui[=���{�      x   �   x�e�MN�0F�3��	P&���,�寭P�e3Q���ؕ���:�8G/�$j���}�l�����;CkGhN۲$�܆Y�ގ�ˇ�A*A�����>�
k����5���&^gk�B��qE�n�135.��Lp�z.����������bE�/q%��Ȳ��o��µ���]2�ӟ�5R	���rz�?g�T"��g}��ɚ��*��9��a4��S����]>����B����Q�΄)�I'����l��z��_k���      r   r   x�5�K�@Cמ� ʟ5����M�	(R;�4��V��lW��e�A�Bi��\?�W�G�S��PK�>ZG��F���-����4��t�|縹���M�8�����7)�<7)�)�2�      n   ]   x�3���/.�,I�QN�+IT�)��L�4426153��4 ����T^����_|x%������������e�P������_�ȉ0������ �? �      t   �   x�=�MN�0����)|�(��4U��*�Xu3�aɱ�]w��8#�+/��dK8�L��r��0�y.Ab�院q���;kOI(�\�21��dI.�v-��*鉽%�H\���\A��6}��:�`�j�jlR;Т���;6�`���1�U��b�ʧh4�g��]�[�������������ӝz�y��t�?��qq�+��&s�2�	+��ǒK���5C�_�[^�      z     x�E�Aj�0������I��e�"�4$�n�c�@��lg���(�X�I����3���ss����k�,��g���4��C��}�es��z�'ʶ��>����4�?�;dFC�D�����Bs��D�JFvBt�jṬ���D�Ϡn	���4^Knv�6ƫ�o�҃	r^�p\�jZ}c�Ӽ�j$�l
���ʵ��%o���+5�D+�5I�1���C��İVL�2��96�<|��j�?n��I)��^`      p   �   x�5�=�0Fg�0�I�8[1� BB0�DM�H�A�p'���pZu����}��ۘ� �sB*Ԇ@T�!�Z2��ه��e�YKd��o��7�ίIBH�;�)��"j�l8��'�uZ)Us��4��C\L]�%����8��%a+�����6M�-N�*�5�b��ND��]UU�L;�      u   *   x�3�4�2�4bc 6bS 6bs � bK 64������ ���     