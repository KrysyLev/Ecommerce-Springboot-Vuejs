--
-- PostgreSQL database dump
--

-- Dumped from database version 15.10
-- Dumped by pg_dump version 15.10

-- Started on 2024-12-21 01:53:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 17552)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    created_date timestamp without time zone,
    quantity integer NOT NULL,
    product_id bigint,
    user_id bigint NOT NULL
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17551)
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_id_seq OWNER TO postgres;

--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 214
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- TOC entry 217 (class 1259 OID 17559)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    category_name character varying(255),
    description character varying(255),
    image_url character varying(255)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17558)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 216
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 219 (class 1259 OID 17568)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    created_date timestamp without time zone,
    price double precision,
    quantity integer,
    order_id integer,
    product_id bigint
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17567)
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_id_seq OWNER TO postgres;

--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 218
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- TOC entry 221 (class 1259 OID 17575)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    created_date timestamp without time zone,
    session_id character varying(255),
    total_price double precision,
    user_id bigint
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17574)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 220
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 223 (class 1259 OID 17582)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    description character varying(255),
    imageurl character varying(255),
    name character varying(255),
    price double precision NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17581)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 222
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 225 (class 1259 OID 17591)
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tokens (
    id bigint NOT NULL,
    created_date timestamp without time zone,
    token character varying(255),
    user_id bigint NOT NULL
);


ALTER TABLE public.tokens OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17590)
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 224
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- TOC entry 227 (class 1259 OID 17598)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    password character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17597)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 226
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 229 (class 1259 OID 17607)
-- Name: wishes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wishes (
    id integer NOT NULL,
    created_date timestamp without time zone,
    product_id bigint,
    user_id bigint NOT NULL
);


ALTER TABLE public.wishes OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17606)
-- Name: wishes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wishes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wishes_id_seq OWNER TO postgres;

--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 228
-- Name: wishes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wishes_id_seq OWNED BY public.wishes.id;


--
-- TOC entry 3208 (class 2604 OID 17555)
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- TOC entry 3209 (class 2604 OID 17562)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 17571)
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- TOC entry 3211 (class 2604 OID 17578)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3212 (class 2604 OID 17585)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 17594)
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 17601)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 17610)
-- Name: wishes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishes ALTER COLUMN id SET DEFAULT nextval('public.wishes_id_seq'::regclass);


--
-- TOC entry 3384 (class 0 OID 17552)
-- Dependencies: 215
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, created_date, quantity, product_id, user_id) FROM stdin;
7	2024-12-19 18:17:08.084	1	13	12
9	2024-12-21 12:00:00	2	1	1
10	2024-12-21 12:00:00	1	2	2
11	2024-12-21 12:00:00	3	3	3
12	2024-12-21 12:00:00	2	4	4
13	2024-12-21 12:00:00	1	5	5
14	2024-12-21 12:00:00	4	6	6
15	2024-12-21 12:00:00	2	7	7
16	2024-12-21 12:00:00	1	8	8
17	2024-12-21 12:00:00	3	9	9
18	2024-12-21 12:00:00	1	10	10
19	2024-12-21 12:00:00	2	11	11
20	2024-12-21 12:00:00	1	12	12
21	2024-12-21 12:00:00	2	13	13
22	2024-12-21 12:00:00	3	14	14
23	2024-12-21 12:00:00	1	15	15
24	2024-12-21 12:00:00	4	16	16
25	2024-12-21 12:00:00	1	17	17
26	2024-12-21 12:00:00	2	18	18
27	2024-12-21 12:00:00	1	19	19
29	2024-12-21 01:50:23.506	1	34	13
\.


--
-- TOC entry 3386 (class 0 OID 17559)
-- Dependencies: 217
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, category_name, description, image_url) FROM stdin;
1	Electronics	Devices and gadgets	https://via.placeholder.com/150/0000FF/FFFFFF?text=Electronics
3	Clothing	Apparel and accessories	https://via.placeholder.com/150/0000FF/FFFFFF?text=Clothing
4	Home & Kitchen	Household items and kitchenware	https://via.placeholder.com/150/0000FF/FFFFFF?text=Home+Kitchen
5	Sports & Outdoors	Sporting goods and outdoor equipment	https://via.placeholder.com/150/0000FF/FFFFFF?text=Sports+Outdoors
6	Beauty & Personal Care	Cosmetics and personal care products	https://via.placeholder.com/150/0000FF/FFFFFF?text=Beauty+Care
7	Toys & Games	Children toys and games	https://via.placeholder.com/150/0000FF/FFFFFF?text=Toys+Games
8	Automotive	Vehicle parts and accessories	https://via.placeholder.com/150/0000FF/FFFFFF?text=Automotive
9	Health & Wellness	Health-related products	https://via.placeholder.com/150/0000FF/FFFFFF?text=Health+Wellness
10	Jewelry	Jewelry and accessories	https://via.placeholder.com/150/0000FF/FFFFFF?text=Jewelry
11	Office Supplies	Office and school supplies	https://via.placeholder.com/150/0000FF/FFFFFF?text=Office+Supplies
2	Books	Printed and digital books for teens	https://via.placeholder.com/150/0000FF/FFFFFF?text=Books
12	Electronics	Devices and gadgets for everyday use	https://example.com/images/electronics.jpg
13	Clothing	Fashion and clothing for all seasons	https://example.com/images/clothing.jpg
14	Books	Wide range of books in various genres	https://example.com/images/books.jpg
15	Home Appliances	Appliances for your home and kitchen	https://example.com/images/home_appliances.jpg
16	Toys	Fun and educational toys for kids	https://example.com/images/toys.jpg
17	Sports	Equipment and gear for sports activities	https://example.com/images/sports.jpg
18	Groceries	Daily essentials and food items	https://example.com/images/groceries.jpg
19	Furniture	Home and office furniture	https://example.com/images/furniture.jpg
20	Books & Media	Books, DVDs, and media items	https://example.com/images/books_media.jpg
21	Beauty	Beauty and skincare products	https://example.com/images/beauty.jpg
22	Jewelry	Beautiful jewelry and accessories	https://example.com/images/jewelry.jpg
23	Pet Supplies	Products for your pets	https://example.com/images/pets.jpg
24	Automotive	Car accessories and parts	https://example.com/images/automotive.jpg
25	Office Supplies	Stationery and office equipment	https://example.com/images/office_supplies.jpg
26	Health & Wellness	Products for health and wellness	https://example.com/images/health_wellness.jpg
27	Kitchen	Kitchen tools and utensils	https://example.com/images/kitchen.jpg
28	Gardening	Gardening tools and plants	https://example.com/images/gardening.jpg
29	Technology	Latest tech gadgets	https://example.com/images/technology.jpg
30	Travel	Travel accessories and essentials	https://example.com/images/travel.jpg
\.


--
-- TOC entry 3388 (class 0 OID 17568)
-- Dependencies: 219
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, created_date, price, quantity, order_id, product_id) FROM stdin;
1	2024-12-21 10:00:00	999.99	1	1	1
2	2024-12-21 10:00:00	19.99	1	1	3
3	2024-12-21 11:00:00	1499.99	1	2	2
4	2024-12-21 12:00:00	25.99	1	3	4
5	2024-12-21 13:00:00	500.75	1	4	5
6	2024-12-21 14:00:00	799.99	1	5	6
7	2024-12-21 15:00:00	1200.45	1	6	7
8	2024-12-21 16:00:00	320	1	7	8
9	2024-12-21 17:00:00	150.6	1	8	9
10	2024-12-21 18:00:00	750.99	1	9	10
11	2024-12-21 19:00:00	910	1	10	11
12	2024-12-21 20:00:00	620	1	11	12
13	2024-12-21 21:00:00	1100.3	1	12	13
14	2024-12-21 22:00:00	340.45	1	13	14
15	2024-12-21 23:00:00	550.5	1	14	15
16	2024-12-22 00:00:00	1250	1	15	16
17	2024-12-22 01:00:00	700	1	16	17
18	2024-12-22 02:00:00	150.3	1	17	18
19	2024-12-22 03:00:00	460.5	1	18	19
20	2024-12-22 04:00:00	390	1	19	20
\.


--
-- TOC entry 3390 (class 0 OID 17575)
-- Dependencies: 221
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, created_date, session_id, total_price, user_id) FROM stdin;
1	2024-12-21 10:00:00	session123	1020.98	1
2	2024-12-21 11:00:00	session456	1139.98	2
3	2024-12-21 12:00:00	session789	200.5	3
4	2024-12-21 13:00:00	session101	500.75	4
5	2024-12-21 14:00:00	session102	800.25	5
6	2024-12-21 15:00:00	session103	1200.45	6
7	2024-12-21 16:00:00	session104	420.3	7
8	2024-12-21 17:00:00	session105	320	8
9	2024-12-21 18:00:00	session106	150.6	9
10	2024-12-21 19:00:00	session107	750.99	10
11	2024-12-21 20:00:00	session108	910	11
12	2024-12-21 21:00:00	session109	620	12
13	2024-12-21 22:00:00	session110	1100.3	13
14	2024-12-21 23:00:00	session111	340.45	14
15	2024-12-22 00:00:00	session112	550.5	15
16	2024-12-22 01:00:00	session113	1250	16
17	2024-12-22 02:00:00	session114	700	17
18	2024-12-22 03:00:00	session115	150.3	18
19	2024-12-22 04:00:00	session116	460.5	19
20	2024-12-22 05:00:00	session117	390	20
\.


--
-- TOC entry 3392 (class 0 OID 17582)
-- Dependencies: 223
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, description, imageurl, name, price, category_id) FROM stdin;
11	Silver necklace	https://via.placeholder.com/150/FF5733/FFFFFF?text=Necklace	Necklace	49.99	10
12	Ergonomic office chair	https://via.placeholder.com/150/FF5733/FFFFFF?text=Office+Chair	Office Chair	149.99	11
2	Wireless Noise-Canceling Headphones	https://via.placeholder.com/150/FF5733/FFFFFF?text=Headphones	Headphones for teens	199.99	1
13	Newest Iphone in 2025!	https://minhtuanmobile.com/uploads/products/241207031241-1.webp	Iphone 16	200	1
14	Latest smartphone with high-end features	https://example.com/images/smartphone.jpg	Smartphone	999.99	1
15	Powerful laptop for gaming and work	https://example.com/images/laptop.jpg	Laptop	1499.99	1
16	Compact tablet with amazing display	https://example.com/images/tablet.jpg	Tablet	499.99	1
17	Fitness tracker with smartwatch features	https://example.com/images/smartwatch.jpg	Smartwatch	199.99	1
18	High-quality digital camera for photography	https://example.com/images/camera.jpg	Camera	899.99	1
19	Comfortable cotton T-shirt	https://example.com/images/tshirt.jpg	T-shirt	19.99	2
20	Stylish denim jeans for casual wear	https://example.com/images/jeans.jpg	Jeans	39.99	2
21	Elegant dress for formal occasions	https://example.com/images/dress.jpg	Dress	59.99	2
22	Winter jacket to keep you warm	https://example.com/images/jacket.jpg	Jacket	79.99	2
23	Trendy sneakers for everyday wear	https://example.com/images/shoes.jpg	Shoes	49.99	2
24	A best-selling thriller novel	https://example.com/images/novel.jpg	Novel	15.99	3
25	A great cookbook for home cooks	https://example.com/images/cookbook.jpg	Cookbook	25.99	3
26	A collection of science fiction books	https://example.com/images/sci_fi.jpg	Science Fiction	19.99	3
27	High-performance kitchen blender	https://example.com/images/blender.jpg	Blender	89.99	4
28	Compact microwave for your kitchen	https://example.com/images/microwave.jpg	Microwave	129.99	4
29	Energy-efficient air conditioner	https://example.com/images/air_conditioner.jpg	Air Conditioner	399.99	4
30	Comfortable couch for your living room	https://example.com/images/couch.jpg	Couch	699.99	5
31	Ergonomic desk for work or study	https://example.com/images/desk.jpg	Desk	159.99	5
32	Office chair with lumbar support	https://example.com/images/chair.jpg	Chair	89.99	5
33	Protect your car seats with this cover	https://example.com/images/car_seat_cover.jpg	Car Seat Cover	49.99	6
34	A Nice Tee	https://dytbw3ui6vsu6.cloudfront.net/media/catalog/product/resize/780x780/S/a/Sandro_SHPTS01442-G023_V_1_1_3.webp	Nice T-shirt!	100	3
1	Smartphone with 5G capability	https://minhtuanmobile.com/uploads/products/240910094632-iphone-16-plus-black-pdp-image-position-1a-black-color-vn-vi.jpg	5G Smartphone	699.99	1
3	Best-selling novel	https://sachtrading.com/wp-content/uploads/2022/06/warren-buffet-qua-trinh-hinh-thanh-1.jpg	Novel	14.99	2
4	Casual T-shirt	https://hips.hearstapps.com/hmg-prod/images/mhl-tshirts-bugatchi-293-lead-669e776a9eee7.jpg?crop=0.561xw:0.871xh;0.216xw,0.0498xh&resize=1120:*	T-Shirt	19.99	3
5	Non-stick frying pan	https://euromixx.vn/wp-content/uploads/2024/09/021525296612-2-1-150x150.jpg	Frying Pan	29.99	4
6	Mountain bike	https://www.starbike.com/images/2023/dmr-rhythm-pro-dirt-jump-bike-26-black-1-lowres.jpg	Mountain Bike	499.99	5
7	Organic face moisturizer	https://product.hstatic.net/200000691333/product/creme_merveilleuse_3bad67f51e4f4597ba9c13d4bf12b9dd_master.jpg	Face Moisturizer	24.99	6
8	Educational board game	https://bangtot.vn/wp-content/uploads/2019/01/bang-day-hoc-da-nang-510x510.png	Board Game	34.99	7
9	Car phone holder	https://bachlongstore.vn/vnt_upload/product/07_2023/1.png	Phone Holder	15.99	8
10	Vitamin D supplements	https://thegioivitamin.org/wp-content/uploads/2024/09/Quality-Of-Life-Kinoko-AHCC-750mg-2.png	Vitamin D	12.99	9
\.


--
-- TOC entry 3394 (class 0 OID 17591)
-- Dependencies: 225
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tokens (id, created_date, token, user_id) FROM stdin;
1	2024-12-19 15:53:14.869	55d39491-9e7d-43be-9316-16d4280a3ced	12
3	2024-12-21 10:30:00	token123	1
4	2024-12-21 11:30:00	token456	2
5	2024-12-21 12:30:00	token789	3
6	2024-12-21 13:30:00	token101	4
7	2024-12-21 14:30:00	token102	5
8	2024-12-21 15:30:00	token103	6
9	2024-12-21 16:30:00	token104	7
10	2024-12-21 17:30:00	token105	8
11	2024-12-21 18:30:00	token106	9
12	2024-12-21 19:30:00	token107	10
13	2024-12-21 20:30:00	token108	11
14	2024-12-21 21:30:00	token109	12
15	2024-12-21 22:30:00	token110	13
16	2024-12-21 23:30:00	token111	14
17	2024-12-22 00:30:00	token112	15
18	2024-12-22 01:30:00	token113	16
19	2024-12-22 02:30:00	token114	17
20	2024-12-22 03:30:00	token115	18
21	2024-12-22 04:30:00	token116	19
22	2024-12-22 05:30:00	token117	20
\.


--
-- TOC entry 3396 (class 0 OID 17598)
-- Dependencies: 227
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, first_name, last_name, password) FROM stdin;
1	john.doe@example.com	John	Doe	password123
2	jane.smith@example.com	Jane	Smith	securepass
3	alice.jones@example.com	Alice	Jones	alicepass
4	bob.brown@example.com	Bob	Brown	bobsecure
5	carol.white@example.com	Carol	White	carolpass
6	dave.black@example.com	Dave	Black	dave123
7	eve.green@example.com	Eve	Green	evepass
8	frank.adams@example.com	Frank	Adams	franksecure
9	grace.lee@example.com	Grace	Lee	gracepass
10	henry.clark@example.com	Henry	Clark	henry123
11	irene.wright@example.com	Irene	Wright	irenepass
12	nguyenducdo35@gmail.com	Nguyễn	Độ	3B919CE1FB5A2C07A2B901D069BEB9C9
13	do342643@gmail.com	Celsius	Lev	3B919CE1FB5A2C07A2B901D069BEB9C9
14	john.doe@example.com	John	Doe	password123
15	jane.smith@example.com	Jane	Smith	password456
16	alice.jones@example.com	Alice	Jones	password789
17	bob.brown@example.com	Bob	Brown	password000
18	charlie.white@example.com	Charlie	White	password111
19	diana.green@example.com	Diana	Green	password222
20	eve.black@example.com	Eve	Black	password333
21	frank.miller@example.com	Frank	Miller	password444
22	grace.king@example.com	Grace	King	password555
23	henry.martin@example.com	Henry	Martin	password666
24	isabel.lopez@example.com	Isabel	Lopez	password777
25	jackson.harris@example.com	Jackson	Harris	password888
26	karen.clark@example.com	Karen	Clark	password999
27	leo.lewis@example.com	Leo	Lewis	password010
28	mary.walker@example.com	Mary	Walker	password020
29	nate.hall@example.com	Nate	Hall	password030
30	olivia.young@example.com	Olivia	Young	password040
31	paul.jones@example.com	Paul	Jones	password050
32	quinn.scott@example.com	Quinn	Scott	password060
\.


--
-- TOC entry 3398 (class 0 OID 17607)
-- Dependencies: 229
-- Data for Name: wishes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishes (id, created_date, product_id, user_id) FROM stdin;
1	2024-12-19 15:59:30.725	13	12
2	2024-12-19 15:59:37.938	13	12
3	2024-12-19 15:59:45.935	2	12
4	2024-12-19 15:59:49.235	2	12
5	2024-12-19 15:59:57.783	13	12
6	2024-12-19 16:03:20.571	13	12
7	2024-12-19 16:03:21.398	13	12
9	2024-12-21 12:00:00	4	1
10	2024-12-21 12:00:00	5	2
11	2024-12-21 12:00:00	6	3
12	2024-12-21 12:00:00	7	4
13	2024-12-21 12:00:00	8	5
14	2024-12-21 12:00:00	9	6
15	2024-12-21 12:00:00	10	7
16	2024-12-21 12:00:00	11	8
17	2024-12-21 12:00:00	12	9
18	2024-12-21 12:00:00	13	10
19	2024-12-21 12:00:00	14	11
20	2024-12-21 12:00:00	15	12
21	2024-12-21 12:00:00	16	13
22	2024-12-21 12:00:00	17	14
23	2024-12-21 12:00:00	18	15
24	2024-12-21 12:00:00	19	16
25	2024-12-21 12:00:00	20	17
26	2024-12-21 12:00:00	4	18
27	2024-12-21 12:00:00	5	19
28	2024-12-21 12:00:00	6	20
\.


--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 214
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 29, true);


--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 216
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 30, true);


--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 218
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 20, true);


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 220
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 20, true);


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 222
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 34, true);


--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 224
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tokens_id_seq', 22, true);


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 226
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 32, true);


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 228
-- Name: wishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wishes_id_seq', 28, true);


--
-- TOC entry 3217 (class 2606 OID 17557)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 17566)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3221 (class 2606 OID 17573)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- TOC entry 3223 (class 2606 OID 17580)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 17589)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3227 (class 2606 OID 17596)
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 17605)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 17612)
-- Name: wishes wishes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishes
    ADD CONSTRAINT wishes_pkey PRIMARY KEY (id);


--
-- TOC entry 3238 (class 2606 OID 17643)
-- Name: tokens fk2dylsfo39lgjyqml2tbe0b0ss; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT fk2dylsfo39lgjyqml2tbe0b0ss FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3236 (class 2606 OID 17633)
-- Name: orders fk32ql8ubntj5uh44ph9659tiih; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk32ql8ubntj5uh44ph9659tiih FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3234 (class 2606 OID 17623)
-- Name: order_items fkbioxgbv59vetrxe0ejfubep1w; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fkbioxgbv59vetrxe0ejfubep1w FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 3239 (class 2606 OID 17648)
-- Name: wishes fkef34opvvpteniel93u4hikth3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishes
    ADD CONSTRAINT fkef34opvvpteniel93u4hikth3 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3232 (class 2606 OID 17618)
-- Name: cart fkg5uhi8vpsuy0lgloxk2h4w5o6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fkg5uhi8vpsuy0lgloxk2h4w5o6 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3240 (class 2606 OID 17653)
-- Name: wishes fkh4fwumji30i8f8lt9gnhqxjy7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishes
    ADD CONSTRAINT fkh4fwumji30i8f8lt9gnhqxjy7 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3235 (class 2606 OID 17628)
-- Name: order_items fkocimc7dtr037rh4ls4l95nlfi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fkocimc7dtr037rh4ls4l95nlfi FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3237 (class 2606 OID 17638)
-- Name: products fkog2rp4qthbtt2lfyhfo32lsw9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fkog2rp4qthbtt2lfyhfo32lsw9 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 3233 (class 2606 OID 17613)
-- Name: cart fkpu4bcbluhsxagirmbdn7dilm5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fkpu4bcbluhsxagirmbdn7dilm5 FOREIGN KEY (product_id) REFERENCES public.products(id);


-- Completed on 2024-12-21 01:53:52

--
-- PostgreSQL database dump complete
--

