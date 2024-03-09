function model=createmodel()

I=20; %müşteri sayısı
J=5; %dağıtımcı sayısı
K=2; %fabrika sayısı

R=[16	45	25	21	37	46	10	28	17	21	24	41	29	28	20	16	42	42	19	27]; % Müşteri talep
D=[148   139   115   148   126]; %dağıtımcının kapasitesi
P=[350 380]; %fabrika kapasitesi

a=[15	13	30	37	12	32	40	31	17	22	36	34	12	25	14	32	36	25	37	11;
27	39	27	33	17	20	12	34	24	10	31	27	39	34	38	40	39	10	14	14;
29	12	22	28	29	18	24	32	12	37	38	33	28	14	14	10	27	24	36	17;
23	15	12	17	18	10	11	30	38	19	37	38	17	26	22	38	14	26	16	35;
33	22	32	29	39	34	25	40	40	36	36	22	20	21	14	20	27	25	20	24]; % Dağıtımcıların her müşteriye verdiği fiyat

b=[15	11	15	11	19;17	15	20	15	17]; %fabrikanın her dağıtımcıya verdiği fiyat

model.I=I;
model.J=J;
model.K=K;
model.R=R;
model.D=D;
model.P=P;
model.a=a;
model.b=b;


end