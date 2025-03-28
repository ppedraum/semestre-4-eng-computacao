PGDMP  .    
                }            LIVRARIA    17.4    17.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    16394    LIVRARIA    DATABASE     m   CREATE DATABASE "LIVRARIA" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en';
    DROP DATABASE "LIVRARIA";
                     postgres    false                       0    0    DATABASE "LIVRARIA"    COMMENT     �  COMMENT ON DATABASE "LIVRARIA" IS '1. A livraria deseja manter um cadastro de clientes e sobre cada cliente, é importante manter seu endereço, telefone, CPF e lista dos livros que este cliente já comprou. Para cada compra é importante guardar a data em que esta foi realizada.

2. Um cliente pode comprar muitos livros. Um livro pode ser vendido para mais de um cliente pois geralmente há vários livros em estoque.

3. Um cliente pode ser pessoa física ou jurídica. Se for pessoa jurídica, o seu identificador deve ser o CNPJ.

3. A livraria compra livros de editoras e sobre as editoras, a livraria precisa de seu código, endereço, telefone de contato, e o nome de seu gerente.

4. Cada cliente tem um código único.

5. Deve-se manter um cadastro sobre cada livro na livraria. Para cada livro, é importante armazenar o nome do autor, assunto, editora, ISBN e a quantidade dos livros em estoque.

6. Editoras diferentes não fornecem o mesmo tipo de livro. ';
                        postgres    false    4889            �            1259    16400    cliente    TABLE       CREATE TABLE public.cliente (
    cpf_cnpj character varying(14) NOT NULL,
    nome character varying(100) NOT NULL,
    endereco character varying(200) NOT NULL,
    telefone character varying(13) NOT NULL,
    cnpj_livraria character varying(14) NOT NULL
);
    DROP TABLE public.cliente;
       public         heap r       postgres    false            �            1259    16418    compra    TABLE     �   CREATE TABLE public.compra (
    id_compra integer NOT NULL,
    data date DEFAULT CURRENT_DATE NOT NULL,
    id_livro integer NOT NULL,
    cpf_cnpj_cliente character varying(14) NOT NULL
);
    DROP TABLE public.compra;
       public         heap r       postgres    false            �            1259    16405    editora    TABLE     �   CREATE TABLE public.editora (
    cnpj character varying(14) NOT NULL,
    endereco character varying(200) NOT NULL,
    telefone character varying(13) NOT NULL,
    nome_gerente character varying(100) NOT NULL
);
    DROP TABLE public.editora;
       public         heap r       postgres    false            �            1259    16395    livraria    TABLE     �   CREATE TABLE public.livraria (
    cnpj character varying(14) NOT NULL,
    nome character varying(100) NOT NULL,
    endereco character varying(200) NOT NULL,
    telefone character varying(13) NOT NULL
);
    DROP TABLE public.livraria;
       public         heap r       postgres    false            �            1259    16410    livro    TABLE     M  CREATE TABLE public.livro (
    id_livro integer NOT NULL,
    autor character varying(100) NOT NULL,
    assunto character varying(200) NOT NULL,
    isbn character varying(13) NOT NULL,
    qtd_estoque integer DEFAULT 0 NOT NULL,
    cnpj_editora character varying(14) NOT NULL,
    cnpj_livraria character varying(14) NOT NULL
);
    DROP TABLE public.livro;
       public         heap r       postgres    false                      0    16400    cliente 
   TABLE DATA           T   COPY public.cliente (cpf_cnpj, nome, endereco, telefone, cnpj_livraria) FROM stdin;
    public               postgres    false    218   @+                 0    16418    compra 
   TABLE DATA           M   COPY public.compra (id_compra, data, id_livro, cpf_cnpj_cliente) FROM stdin;
    public               postgres    false    221   �+                 0    16405    editora 
   TABLE DATA           I   COPY public.editora (cnpj, endereco, telefone, nome_gerente) FROM stdin;
    public               postgres    false    219   �+                 0    16395    livraria 
   TABLE DATA           B   COPY public.livraria (cnpj, nome, endereco, telefone) FROM stdin;
    public               postgres    false    217   R,                 0    16410    livro 
   TABLE DATA           i   COPY public.livro (id_livro, autor, assunto, isbn, qtd_estoque, cnpj_editora, cnpj_livraria) FROM stdin;
    public               postgres    false    220   �,       k           2606    16404    cliente cliente_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cpf_cnpj);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public                 postgres    false    218            s           2606    16423    compra compra_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id_compra);
 <   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_pkey;
       public                 postgres    false    221            m           2606    16409    editora editora_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.editora
    ADD CONSTRAINT editora_pkey PRIMARY KEY (cnpj);
 >   ALTER TABLE ONLY public.editora DROP CONSTRAINT editora_pkey;
       public                 postgres    false    219            i           2606    16399    livraria livraria_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.livraria
    ADD CONSTRAINT livraria_pkey PRIMARY KEY (cnpj);
 @   ALTER TABLE ONLY public.livraria DROP CONSTRAINT livraria_pkey;
       public                 postgres    false    217            o           2606    16417    livro livro_assunto_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_assunto_key UNIQUE (assunto);
 A   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_assunto_key;
       public                 postgres    false    220            q           2606    16415    livro livro_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_pkey PRIMARY KEY (id_livro);
 :   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_pkey;
       public                 postgres    false    220            t           2606    16424 "   cliente cliente_cnpj_livraria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cnpj_livraria_fkey FOREIGN KEY (cnpj_livraria) REFERENCES public.livraria(cnpj) NOT VALID;
 L   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_cnpj_livraria_fkey;
       public               postgres    false    4713    217    218            u           2606    16449 #   cliente cliente_cnpj_livraria_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cnpj_livraria_fkey1 FOREIGN KEY (cnpj_livraria) REFERENCES public.livraria(cnpj) NOT VALID;
 M   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_cnpj_livraria_fkey1;
       public               postgres    false    217    218    4713            z           2606    16444 #   compra compra_cpf_cnpj_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_cpf_cnpj_cliente_fkey FOREIGN KEY (cpf_cnpj_cliente) REFERENCES public.cliente(cpf_cnpj) NOT VALID;
 M   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_cpf_cnpj_cliente_fkey;
       public               postgres    false    218    221    4715            {           2606    16469 $   compra compra_cpf_cnpj_cliente_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_cpf_cnpj_cliente_fkey1 FOREIGN KEY (cpf_cnpj_cliente) REFERENCES public.cliente(cpf_cnpj) NOT VALID;
 N   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_cpf_cnpj_cliente_fkey1;
       public               postgres    false    218    221    4715            |           2606    16439    compra compra_id_livro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_id_livro_fkey FOREIGN KEY (id_livro) REFERENCES public.livro(id_livro) NOT VALID;
 E   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_id_livro_fkey;
       public               postgres    false    221    4721    220            }           2606    16464    compra compra_id_livro_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_id_livro_fkey1 FOREIGN KEY (id_livro) REFERENCES public.livro(id_livro) NOT VALID;
 F   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_id_livro_fkey1;
       public               postgres    false    221    220    4721            v           2606    16429    livro livro_cnpj_editora_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_cnpj_editora_fkey FOREIGN KEY (cnpj_editora) REFERENCES public.editora(cnpj) NOT VALID;
 G   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_cnpj_editora_fkey;
       public               postgres    false    220    219    4717            w           2606    16454    livro livro_cnpj_editora_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_cnpj_editora_fkey1 FOREIGN KEY (cnpj_editora) REFERENCES public.editora(cnpj) NOT VALID;
 H   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_cnpj_editora_fkey1;
       public               postgres    false    219    4717    220            x           2606    16434    livro livro_cnpj_livraria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_cnpj_livraria_fkey FOREIGN KEY (cnpj_livraria) REFERENCES public.livraria(cnpj) NOT VALID;
 H   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_cnpj_livraria_fkey;
       public               postgres    false    4713    217    220            y           2606    16459    livro livro_cnpj_livraria_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_cnpj_livraria_fkey1 FOREIGN KEY (cnpj_livraria) REFERENCES public.livraria(cnpj) NOT VALID;
 I   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_cnpj_livraria_fkey1;
       public               postgres    false    4713    217    220               a   x�34�΀Ԕ�|Π�D����Tc##]���Ԣ����2�u��2��]��@�`g�����NSSKKCS3N��@�+F��� d$�            x�3�4202�50�54�B������ Y 2         c   x�34� CCΠ�D����Tc#c]���Ԣ����2�u��2��]��@�`g�����NSSK#(�tN,��/VpM)M,J������ �c�         c   x�34�  ��YV�X������ux%gPi�BHjqI���������s~njQr��E��:
�E�@���D�L����SQbqf�����%�`C�=... l�\         K   x�3���V�/���K��H,*�T�/)I-RHUHTHM)JTp���/�OK��4D��p�����*�А+F��� Y�)     