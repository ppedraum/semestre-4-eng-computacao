PGDMP      "        
        }            agenda    17.2    17.2     #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            &           1262    16387    agenda    DATABASE     }   CREATE DATABASE agenda WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE agenda;
                     postgres    false            �            1259    16388    cidades    TABLE     �   CREATE TABLE public.cidades (
    idcidade integer NOT NULL,
    nome character varying(70) NOT NULL,
    uf character varying(2) NOT NULL
);
    DROP TABLE public.cidades;
       public         heap r       postgres    false            �            1259    16393    clientes    TABLE     �   CREATE TABLE public.clientes (
    idcliente integer NOT NULL,
    nome character varying(70) NOT NULL,
    limitecredito numeric(15,3) NOT NULL,
    idcidade integer NOT NULL
);
    DROP TABLE public.clientes;
       public         heap r       postgres    false                      0    16388    cidades 
   TABLE DATA           5   COPY public.cidades (idcidade, nome, uf) FROM stdin;
    public               postgres    false    217   o                  0    16393    clientes 
   TABLE DATA           L   COPY public.clientes (idcliente, nome, limitecredito, idcidade) FROM stdin;
    public               postgres    false    218   �       �           2606    16392    cidades CIDADES_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cidades
    ADD CONSTRAINT "CIDADES_pkey" PRIMARY KEY (idcidade);
 @   ALTER TABLE ONLY public.cidades DROP CONSTRAINT "CIDADES_pkey";
       public                 postgres    false    217            �           2606    16397    clientes clientes_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (idcliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public                 postgres    false    218            �           2606    16398    clientes fk_cliente_cidade    FK CONSTRAINT     �   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT fk_cliente_cidade FOREIGN KEY (idcidade) REFERENCES public.cidades(idcidade);
 D   ALTER TABLE ONLY public.clientes DROP CONSTRAINT fk_cliente_cidade;
       public               postgres    false    217    4746    218            '           0    0 (   CONSTRAINT fk_cliente_cidade ON clientes    COMMENT     S   COMMENT ON CONSTRAINT fk_cliente_cidade ON public.clientes IS 'Cidade do Cliente';
          public               postgres    false    4749               S   x�3�t.�L�<�+7�3ؙˈ�����"0ۘ3 ��$_�1'5�(�3(�˄ӹ�(�$3)�3 �˔3"��4ULr:9r��qqq "B5          C   x�3���/JO�44 = �4�2�HM)��4�	qs:'��s�Č�L8�9��M�b���� ��     