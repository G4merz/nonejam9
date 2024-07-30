//Isso representa se eu estou sendo carregado ou não
picked = false

//Essa ENUM serve para acessar as sprites dos itens de forma fácil
enum itens{
	ovo,
	carne_crua,
	carne_assada,
	leite,
	queijo,
	manteiga,
	tomate,
	molho_tomate,
	cacau,
	chocolate,
	nescau,
	trigo,
	massa,
	bolo,
	bolo_chocolate,
	pizza
}

//Esse array guarda os nomes dos ingredientes
nomes =		[
			"Ovo",
			"Carne Crua",
			"Carne Assada",
			"Leite",
			"Queijo",
			"Manteiga",
			"Tomate",
			"Molho de Tomate",
			"Cacau",
			"Chocolate",
			"Nescau",
			"Trigo",
			"Massa",
			"Bolo",
			"Bolo de Chocolate",
			"Pizza",
			]

//Randomizando a sprite (temporário, apenas para testes)
index = irandom_range(0, itens.pizza)
nome = ""

//Variáveis de posição manuais para um movimento suave
xx = x
yy = y
img_angle = 0

//Instanciando o chefinho pra facilitar o código
chef = obj_chefinho