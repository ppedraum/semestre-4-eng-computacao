PGDMP                      }            loja    17.2    17.2 .    X           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            Y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            Z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            [           1262    16617    loja    DATABASE     {   CREATE DATABASE loja WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE loja;
                     postgres    false            �            1259    16618 
   categorias    TABLE     r   CREATE TABLE public.categorias (
    cat_codigo integer NOT NULL,
    cat_nome character varying(100) NOT NULL
);
    DROP TABLE public.categorias;
       public         heap r       postgres    false            \           0    0    TABLE categorias    ACL     _   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.categorias TO suprimentos WITH GRANT OPTION;
          public               postgres    false    217            �            1259    16623    cidades    TABLE     �   CREATE TABLE public.cidades (
    cid_cep character varying(8) NOT NULL,
    cid_nome character varying(100) NOT NULL,
    cid_estado character(2) NOT NULL
);
    DROP TABLE public.cidades;
       public         heap r       postgres    false            ]           0    0    TABLE cidades    ACL     \   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.cidades TO suprimentos WITH GRANT OPTION;
          public               postgres    false    218            �            1259    16675    entradas    TABLE     �   CREATE TABLE public.entradas (
    ent_codigo integer NOT NULL,
    ent_data date NOT NULL,
    ent_hora time without time zone NOT NULL
);
    DROP TABLE public.entradas;
       public         heap r       postgres    false            ^           0    0    TABLE entradas    ACL     ]   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.entradas TO suprimentos WITH GRANT OPTION;
          public               postgres    false    223            �            1259    16628    fornecedores    TABLE     �  CREATE TABLE public.fornecedores (
    for_codigo integer NOT NULL,
    cid_cep character varying(8) NOT NULL,
    for_nome character varying(100) NOT NULL,
    for_telefone character varying(13),
    for_celular character varying(13),
    for_email character varying(100),
    for_cnpj character varying(14),
    for_sexo character varying(4),
    for_rua character varying(100),
    for_numero character varying(10),
    for_bairro character varying(100)
);
     DROP TABLE public.fornecedores;
       public         heap r       postgres    false            _           0    0    TABLE fornecedores    ACL     a   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.fornecedores TO suprimentos WITH GRANT OPTION;
          public               postgres    false    219            �            1259    16680    itens_entrada    TABLE     f  CREATE TABLE public.itens_entrada (
    pro_codigo integer NOT NULL,
    ent_codigo integer NOT NULL,
    for_codigo integer NOT NULL,
    ien_preco_venda numeric(15,2) NOT NULL,
    ien_preco_compra numeric(15,2),
    ien_icms numeric(5,2),
    ien_preco_ent_c_icms numeric(15,2),
    ien_qnt integer NOT NULL,
    ien_preco_total numeric(15,2) NOT NULL
);
 !   DROP TABLE public.itens_entrada;
       public         heap r       postgres    false            `           0    0    TABLE itens_entrada    ACL     b   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.itens_entrada TO suprimentos WITH GRANT OPTION;
          public               postgres    false    224            �            1259    16660    itens_venda    TABLE     �   CREATE TABLE public.itens_venda (
    pro_codigo integer NOT NULL,
    ven_codigo integer NOT NULL,
    ivn_qnt integer NOT NULL,
    ivn_preco_unitario numeric(15,2) NOT NULL,
    ivn_preco_total numeric(15,2) NOT NULL
);
    DROP TABLE public.itens_venda;
       public         heap r       postgres    false            a           0    0    TABLE itens_venda    ACL     ^   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.itens_venda TO comercial WITH GRANT OPTION;
          public               postgres    false    222            �            1259    16638    produtos    TABLE     �  CREATE TABLE public.produtos (
    pro_codigo integer NOT NULL,
    for_codigo integer NOT NULL,
    cat_codigo integer NOT NULL,
    pro_nome character varying(100) NOT NULL,
    pro_preco numeric(15,2) NOT NULL,
    pro_foto character varying(200),
    pro_qnt integer DEFAULT 0 NOT NULL,
    pro_cod_barra character varying(20),
    pro_qnt_min_estoque integer DEFAULT 0 NOT NULL,
    codigo_pro character varying(14)
);
    DROP TABLE public.produtos;
       public         heap r       postgres    false            b           0    0    TABLE produtos    ACL     ]   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.produtos TO suprimentos WITH GRANT OPTION;
          public               postgres    false    220            �            1259    16655    vendas    TABLE     x   CREATE TABLE public.vendas (
    ven_codigo integer NOT NULL,
    ven_data date,
    ven_hora time without time zone
);
    DROP TABLE public.vendas;
       public         heap r       postgres    false            c           0    0    TABLE vendas    ACL     Y   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.vendas TO comercial WITH GRANT OPTION;
          public               postgres    false    221            N          0    16618 
   categorias 
   TABLE DATA           :   COPY public.categorias (cat_codigo, cat_nome) FROM stdin;
    public               postgres    false    217   67       O          0    16623    cidades 
   TABLE DATA           @   COPY public.cidades (cid_cep, cid_nome, cid_estado) FROM stdin;
    public               postgres    false    218   �7       T          0    16675    entradas 
   TABLE DATA           B   COPY public.entradas (ent_codigo, ent_data, ent_hora) FROM stdin;
    public               postgres    false    223   �7       P          0    16628    fornecedores 
   TABLE DATA           �   COPY public.fornecedores (for_codigo, cid_cep, for_nome, for_telefone, for_celular, for_email, for_cnpj, for_sexo, for_rua, for_numero, for_bairro) FROM stdin;
    public               postgres    false    219   8       U          0    16680    itens_entrada 
   TABLE DATA           �   COPY public.itens_entrada (pro_codigo, ent_codigo, for_codigo, ien_preco_venda, ien_preco_compra, ien_icms, ien_preco_ent_c_icms, ien_qnt, ien_preco_total) FROM stdin;
    public               postgres    false    224   {8       S          0    16660    itens_venda 
   TABLE DATA           k   COPY public.itens_venda (pro_codigo, ven_codigo, ivn_qnt, ivn_preco_unitario, ivn_preco_total) FROM stdin;
    public               postgres    false    222   �8       Q          0    16638    produtos 
   TABLE DATA           �   COPY public.produtos (pro_codigo, for_codigo, cat_codigo, pro_nome, pro_preco, pro_foto, pro_qnt, pro_cod_barra, pro_qnt_min_estoque, codigo_pro) FROM stdin;
    public               postgres    false    220   9       R          0    16655    vendas 
   TABLE DATA           @   COPY public.vendas (ven_codigo, ven_data, ven_hora) FROM stdin;
    public               postgres    false    221   �9       �           2606    16622    categorias categorias_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (cat_codigo);
 D   ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_pkey;
       public                 postgres    false    217            �           2606    16627    cidades cidades_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.cidades
    ADD CONSTRAINT cidades_pkey PRIMARY KEY (cid_cep);
 >   ALTER TABLE ONLY public.cidades DROP CONSTRAINT cidades_pkey;
       public                 postgres    false    218            �           2606    16679    entradas entradas_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.entradas
    ADD CONSTRAINT entradas_pkey PRIMARY KEY (ent_codigo);
 @   ALTER TABLE ONLY public.entradas DROP CONSTRAINT entradas_pkey;
       public                 postgres    false    223            �           2606    16632    fornecedores fornecedor_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (for_codigo);
 F   ALTER TABLE ONLY public.fornecedores DROP CONSTRAINT fornecedor_pkey;
       public                 postgres    false    219            �           2606    16684     itens_entrada itens_entrada_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.itens_entrada
    ADD CONSTRAINT itens_entrada_pkey PRIMARY KEY (pro_codigo, ent_codigo);
 J   ALTER TABLE ONLY public.itens_entrada DROP CONSTRAINT itens_entrada_pkey;
       public                 postgres    false    224    224            �           2606    16664    itens_venda itens_venda_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.itens_venda
    ADD CONSTRAINT itens_venda_pkey PRIMARY KEY (pro_codigo, ven_codigo);
 F   ALTER TABLE ONLY public.itens_venda DROP CONSTRAINT itens_venda_pkey;
       public                 postgres    false    222    222            �           2606    16644    produtos produtos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (pro_codigo);
 @   ALTER TABLE ONLY public.produtos DROP CONSTRAINT produtos_pkey;
       public                 postgres    false    220            �           2606    16659    vendas vendas_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (ven_codigo);
 <   ALTER TABLE ONLY public.vendas DROP CONSTRAINT vendas_pkey;
       public                 postgres    false    221            �           1259    16704    idx_cat_nome    INDEX     N   CREATE UNIQUE INDEX idx_cat_nome ON public.categorias USING btree (cat_nome);
     DROP INDEX public.idx_cat_nome;
       public                 postgres    false    217            �           1259    16702    idx_ent_data    INDEX     E   CREATE INDEX idx_ent_data ON public.entradas USING btree (ent_data);
     DROP INDEX public.idx_ent_data;
       public                 postgres    false    223            �           1259    16701    idx_ien_for_codigo    INDEX     R   CREATE INDEX idx_ien_for_codigo ON public.itens_entrada USING btree (for_codigo);
 &   DROP INDEX public.idx_ien_for_codigo;
       public                 postgres    false    224            �           1259    16705    idx_pro_nome    INDEX     L   CREATE UNIQUE INDEX idx_pro_nome ON public.produtos USING btree (pro_nome);
     DROP INDEX public.idx_pro_nome;
       public                 postgres    false    220            �           1259    16703    idx_ven_data_hora    INDEX     R   CREATE INDEX idx_ven_data_hora ON public.vendas USING btree (ven_data, ven_hora);
 %   DROP INDEX public.idx_ven_data_hora;
       public                 postgres    false    221    221            �           2606    16633 $   fornecedores fornecedor_cid_cep_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT fornecedor_cid_cep_fkey FOREIGN KEY (cid_cep) REFERENCES public.cidades(cid_cep);
 N   ALTER TABLE ONLY public.fornecedores DROP CONSTRAINT fornecedor_cid_cep_fkey;
       public               postgres    false    218    4775    219            �           2606    16665 '   itens_venda itens_venda_pro_codigo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_venda
    ADD CONSTRAINT itens_venda_pro_codigo_fkey FOREIGN KEY (pro_codigo) REFERENCES public.produtos(pro_codigo);
 Q   ALTER TABLE ONLY public.itens_venda DROP CONSTRAINT itens_venda_pro_codigo_fkey;
       public               postgres    false    220    222    4780            �           2606    16670 '   itens_venda itens_venda_ven_codigo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_venda
    ADD CONSTRAINT itens_venda_ven_codigo_fkey FOREIGN KEY (ven_codigo) REFERENCES public.vendas(ven_codigo);
 Q   ALTER TABLE ONLY public.itens_venda DROP CONSTRAINT itens_venda_ven_codigo_fkey;
       public               postgres    false    221    4783    222            �           2606    16650 !   produtos produtos_cat_codigo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_cat_codigo_fkey FOREIGN KEY (cat_codigo) REFERENCES public.categorias(cat_codigo);
 K   ALTER TABLE ONLY public.produtos DROP CONSTRAINT produtos_cat_codigo_fkey;
       public               postgres    false    217    4772    220            �           2606    16645 !   produtos produtos_for_codigo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_for_codigo_fkey FOREIGN KEY (for_codigo) REFERENCES public.fornecedores(for_codigo);
 K   ALTER TABLE ONLY public.produtos DROP CONSTRAINT produtos_for_codigo_fkey;
       public               postgres    false    4777    219    220            N   A   x�3�t���M�+�/�2�tJ�I�J�2�t�I-):�%/3(n��XrxeQf�B@Qfn"W� ?�0      O   G   x�34N����ûr9���� �3 ��$_�1'5�(�3(��8�Rs�<�2���JR9}ݹb���� 8�      T   0   x�3�4202�50�50�44�25�20�2B5
�D�QD-��1z\\\ �#$      P   M   x�3�4� ΀Ԕ�|��̢����|�?��ˈ�8���TH,���ژ�8��J�|�J2�q������ @�%�      U   :   x�3�4AS=�?(2�4	pq�����	��H�˘�P�aB\1z\\\ 0��      S   @   x�-��� Cѳ=r)���Q\�'+�10�$ĳÎ���
o�R�fiV�S������H��X      Q   j   x�3�4�����ҼtG#���|�М��D��
�����"Ns=�?N8�e�	��EE�U���PiK��':%���*����d�s���1������� P �      R   9   x�3�4202�50�50�44�20 ".CQc+SS����9T�1��%T���1z\\\ ��     