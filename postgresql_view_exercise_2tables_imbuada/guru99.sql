PGDMP     5                
    w            guru99    12.0    12.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16416    guru99    DATABASE     �   CREATE DATABASE guru99 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_Philippines.1252' LC_CTYPE = 'English_Philippines.1252';
    DROP DATABASE guru99;
                postgres    false            �            1259    16441 	   buildings    TABLE     �   CREATE TABLE public.buildings (
    id integer NOT NULL,
    bldg_name text,
    bldg_add text,
    blg_zip text,
    cust_fname text,
    cust_lname text
);
    DROP TABLE public.buildings;
       public         heap    postgres    false            �            1259    16439    buildings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.buildings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.buildings_id_seq;
       public          postgres    false    205                       0    0    buildings_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.buildings_id_seq OWNED BY public.buildings.id;
          public          postgres    false    204            �            1259    16432 	   customers    TABLE     �   CREATE TABLE public.customers (
    id integer NOT NULL,
    cust_fname text,
    cust_mi text,
    cust_lname text,
    cust_cont text,
    cust_add text,
    cust_eadd text,
    cust_job text
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    16448 	   cust_bldg    VIEW     �   CREATE VIEW public.cust_bldg AS
 SELECT customers.id,
    customers.cust_fname,
    customers.cust_lname,
    buildings.bldg_name,
    buildings.blg_zip
   FROM (public.customers
     JOIN public.buildings USING (cust_lname));
    DROP VIEW public.cust_bldg;
       public          postgres    false    203    205    205    205    203    203            �            1259    16430    customers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          postgres    false    203                       0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
          public          postgres    false    202            �
           2604    16444    buildings id    DEFAULT     l   ALTER TABLE ONLY public.buildings ALTER COLUMN id SET DEFAULT nextval('public.buildings_id_seq'::regclass);
 ;   ALTER TABLE public.buildings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            �
           2604    16435    customers id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203           