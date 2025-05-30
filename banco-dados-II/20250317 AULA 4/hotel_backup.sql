PGDMP  1    4                }            hotel    17.2    17.2 *    O           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            P           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            Q           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            R           1262    16448    hotel    DATABASE     |   CREATE DATABASE hotel WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE hotel;
                     postgres    false            �            1259    16496    atendimento    TABLE     �   CREATE TABLE public.atendimento (
    id_atendimento integer NOT NULL,
    id_servico integer NOT NULL,
    id_hospedagem integer NOT NULL
);
    DROP TABLE public.atendimento;
       public         heap r       postgres    false            S           0    0    TABLE atendimento    ACL     \   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.atendimento TO gerente WITH GRANT OPTION;
          public               postgres    false    223            �            1259    16449    cliente    TABLE     �   CREATE TABLE public.cliente (
    rg_cliente character varying(15) NOT NULL,
    nome character varying(100) NOT NULL,
    genero character varying(4) NOT NULL,
    telefone character varying(15)
);
    DROP TABLE public.cliente;
       public         heap r       postgres    false            T           0    0    TABLE cliente    ACL     �   GRANT SELECT ON TABLE public.cliente TO estagiario WITH GRANT OPTION;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.cliente TO gerente WITH GRANT OPTION;
          public               postgres    false    217            �            1259    16491 
   hospedagem    TABLE     �   CREATE TABLE public.hospedagem (
    id_hospedagem integer NOT NULL,
    rg_cliente character varying(15) NOT NULL,
    num_quarto integer NOT NULL,
    data_entrada date NOT NULL,
    data_saida date,
    status character varying(9) NOT NULL
);
    DROP TABLE public.hospedagem;
       public         heap r       postgres    false            U           0    0    TABLE hospedagem    ACL     [   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.hospedagem TO gerente WITH GRANT OPTION;
          public               postgres    false    222            �            1259    16466    quarto    TABLE     �   CREATE TABLE public.quarto (
    num_quarto integer NOT NULL,
    andar integer,
    id_tipo_quarto integer NOT NULL,
    status character varying(9) NOT NULL
);
    DROP TABLE public.quarto;
       public         heap r       postgres    false            V           0    0    TABLE quarto    ACL     W   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.quarto TO gerente WITH GRANT OPTION;
          public               postgres    false    220            �            1259    16476    reserva    TABLE       CREATE TABLE public.reserva (
    id_reserva integer NOT NULL,
    rg_cliente character varying(15) NOT NULL,
    num_quarto integer NOT NULL,
    data_reserva date NOT NULL,
    quant_dias integer NOT NULL,
    data_entrada date NOT NULL,
    status character varying(9) NOT NULL
);
    DROP TABLE public.reserva;
       public         heap r       postgres    false            W           0    0    TABLE reserva    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.reserva TO atendente WITH GRANT OPTION;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.reserva TO gerente WITH GRANT OPTION;
          public               postgres    false    221            �            1259    16454    servico    TABLE     �   CREATE TABLE public.servico (
    id_servico integer NOT NULL,
    descricao character varying(200) NOT NULL,
    valor numeric(15,3) NOT NULL
);
    DROP TABLE public.servico;
       public         heap r       postgres    false            X           0    0    TABLE servico    ACL     X   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.servico TO gerente WITH GRANT OPTION;
          public               postgres    false    218            �            1259    16461    tipo_quarto    TABLE     �   CREATE TABLE public.tipo_quarto (
    id_tipo_quarto integer NOT NULL,
    descricao character varying(200) NOT NULL,
    valor numeric(15,2) NOT NULL
);
    DROP TABLE public.tipo_quarto;
       public         heap r       postgres    false            Y           0    0    TABLE tipo_quarto    ACL     \   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tipo_quarto TO gerente WITH GRANT OPTION;
          public               postgres    false    219            L          0    16496    atendimento 
   TABLE DATA           P   COPY public.atendimento (id_atendimento, id_servico, id_hospedagem) FROM stdin;
    public               postgres    false    223   84       F          0    16449    cliente 
   TABLE DATA           E   COPY public.cliente (rg_cliente, nome, genero, telefone) FROM stdin;
    public               postgres    false    217   U4       K          0    16491 
   hospedagem 
   TABLE DATA           m   COPY public.hospedagem (id_hospedagem, rg_cliente, num_quarto, data_entrada, data_saida, status) FROM stdin;
    public               postgres    false    222   r4       I          0    16466    quarto 
   TABLE DATA           K   COPY public.quarto (num_quarto, andar, id_tipo_quarto, status) FROM stdin;
    public               postgres    false    220   �4       J          0    16476    reserva 
   TABLE DATA           u   COPY public.reserva (id_reserva, rg_cliente, num_quarto, data_reserva, quant_dias, data_entrada, status) FROM stdin;
    public               postgres    false    221   �4       G          0    16454    servico 
   TABLE DATA           ?   COPY public.servico (id_servico, descricao, valor) FROM stdin;
    public               postgres    false    218   �4       H          0    16461    tipo_quarto 
   TABLE DATA           G   COPY public.tipo_quarto (id_tipo_quarto, descricao, valor) FROM stdin;
    public               postgres    false    219   �4       �           2606    16500    atendimento atendimento_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT atendimento_pkey PRIMARY KEY (id_atendimento);
 F   ALTER TABLE ONLY public.atendimento DROP CONSTRAINT atendimento_pkey;
       public                 postgres    false    223            �           2606    16521    cliente cliente_genero_check    CHECK CONSTRAINT     �   ALTER TABLE public.cliente
    ADD CONSTRAINT cliente_genero_check CHECK (((genero)::text = ANY ((ARRAY['FEM'::character varying, 'MASC'::character varying, 'NBIN'::character varying])::text[]))) NOT VALID;
 A   ALTER TABLE public.cliente DROP CONSTRAINT cliente_genero_check;
       public               postgres    false    217    217            �           2606    16460    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (rg_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public                 postgres    false    217            �           2606    16495    hospedagem hospedagem_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.hospedagem
    ADD CONSTRAINT hospedagem_pkey PRIMARY KEY (id_hospedagem);
 D   ALTER TABLE ONLY public.hospedagem DROP CONSTRAINT hospedagem_pkey;
       public                 postgres    false    222            �           2606    16523 "   hospedagem hospedagem_status_check    CHECK CONSTRAINT     �   ALTER TABLE public.hospedagem
    ADD CONSTRAINT hospedagem_status_check CHECK (((status)::text = ANY (ARRAY[('ABERTA'::character varying)::text, ('FECHADA'::character varying)::text, ('ENCERRADA'::character varying)::text]))) NOT VALID;
 G   ALTER TABLE public.hospedagem DROP CONSTRAINT hospedagem_status_check;
       public               postgres    false    222    222            �           2606    16470    quarto quarto_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.quarto
    ADD CONSTRAINT quarto_pkey PRIMARY KEY (num_quarto);
 <   ALTER TABLE ONLY public.quarto DROP CONSTRAINT quarto_pkey;
       public                 postgres    false    220            �           2606    16480    reserva reserva_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (id_reserva);
 >   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_pkey;
       public                 postgres    false    221            �           2606    16522    reserva reserva_status_check    CHECK CONSTRAINT     �   ALTER TABLE public.reserva
    ADD CONSTRAINT reserva_status_check CHECK (((status)::text = ANY ((ARRAY['ABERTA'::character varying, 'FECHADA'::character varying, 'ENCERRADA'::character varying])::text[]))) NOT VALID;
 A   ALTER TABLE public.reserva DROP CONSTRAINT reserva_status_check;
       public               postgres    false    221    221            �           2606    16458    servico servico_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.servico
    ADD CONSTRAINT servico_pkey PRIMARY KEY (id_servico);
 >   ALTER TABLE ONLY public.servico DROP CONSTRAINT servico_pkey;
       public                 postgres    false    218            �           2606    16465    tipo_quarto tipo_quarto_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tipo_quarto
    ADD CONSTRAINT tipo_quarto_pkey PRIMARY KEY (id_tipo_quarto);
 F   ALTER TABLE ONLY public.tipo_quarto DROP CONSTRAINT tipo_quarto_pkey;
       public                 postgres    false    219            �           2606    16506 *   atendimento atendimento_id_hospedagem_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT atendimento_id_hospedagem_fkey FOREIGN KEY (id_hospedagem) REFERENCES public.hospedagem(id_hospedagem);
 T   ALTER TABLE ONLY public.atendimento DROP CONSTRAINT atendimento_id_hospedagem_fkey;
       public               postgres    false    4779    223    222            �           2606    16501 '   atendimento atendimento_id_servico_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT atendimento_id_servico_fkey FOREIGN KEY (id_servico) REFERENCES public.servico(id_servico);
 Q   ALTER TABLE ONLY public.atendimento DROP CONSTRAINT atendimento_id_servico_fkey;
       public               postgres    false    223    4771    218            �           2606    16516 %   hospedagem hospedagem_num_quarto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hospedagem
    ADD CONSTRAINT hospedagem_num_quarto_fkey FOREIGN KEY (num_quarto) REFERENCES public.quarto(num_quarto) NOT VALID;
 O   ALTER TABLE ONLY public.hospedagem DROP CONSTRAINT hospedagem_num_quarto_fkey;
       public               postgres    false    222    220    4775            �           2606    16511 %   hospedagem hospedagem_rg_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hospedagem
    ADD CONSTRAINT hospedagem_rg_cliente_fkey FOREIGN KEY (rg_cliente) REFERENCES public.cliente(rg_cliente) NOT VALID;
 O   ALTER TABLE ONLY public.hospedagem DROP CONSTRAINT hospedagem_rg_cliente_fkey;
       public               postgres    false    217    222    4769            �           2606    16471 !   quarto quarto_id_tipo_quarto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.quarto
    ADD CONSTRAINT quarto_id_tipo_quarto_fkey FOREIGN KEY (id_tipo_quarto) REFERENCES public.tipo_quarto(id_tipo_quarto);
 K   ALTER TABLE ONLY public.quarto DROP CONSTRAINT quarto_id_tipo_quarto_fkey;
       public               postgres    false    4773    219    220            �           2606    16486    reserva reserva_num_quarto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_num_quarto_fkey FOREIGN KEY (num_quarto) REFERENCES public.quarto(num_quarto) NOT VALID;
 I   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_num_quarto_fkey;
       public               postgres    false    221    220    4775            �           2606    16481    reserva reserva_rg_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_rg_cliente_fkey FOREIGN KEY (rg_cliente) REFERENCES public.cliente(rg_cliente) NOT VALID;
 I   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_rg_cliente_fkey;
       public               postgres    false    4769    221    217            L      x������ � �      F      x������ � �      K      x������ � �      I      x������ � �      J      x������ � �      G      x������ � �      H      x������ � �     