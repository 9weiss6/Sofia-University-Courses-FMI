Да се реализира полиморфична йерархия от класове представляващи двуизмерни фигури и да се реализира следната функционалност:

По подадена точка да се извеждат фигурите които съдържат дадената точка
По индекс на фигура [0, броя - 1] да се изведат нейните абсолютни координати (ако е в група се прилага транслацията)
Фигурите които ще трябва да имплементирате са

Окръжност - зададена по координати център и дължина на радиуса, пример:circle 3.0 7.5 3.15
Триъгълник - зададен по координати на 3-те върха, пример: triangle 1.0 1.0 2.0 1.0 1.0 2.0
Правоъгълник - зададен по 2 срещуположни върха, като неговите страни са успоредни на координатните оси, пример: rect -1.0 -1.0 2.0 2.0
Група - това представлява последователност от фигури (окръжност, триъгълник, правоъгълник) които са транслирани с вектор, пример с транслационен вектор (5.0, -7.3): group in 5.0 -7.3 .... group out
Входа на програмата ще се чете от текстов файл, като всяка фигура ще бъде на отделен ред. Изключение прави групата, като тя ще се дефинира като започва от group in и завършва на group out, и всички редове между тези двата са фигури принадлежащи в тази група. Файлът винаги ще е правилен и не се налага да проверявате за коректност, няма да има случай на група която се съдържа в друга група.

Примерен файл:

circle 3.0 7.5 3.15
triangle 1.0 1.0 2.0 1.0 1.0 2.0
group in 2.0 -1.0
rect -1.0 -1.0 2.0 2.0
group out
За заявка на фигура на индекс 3 се извежда следното rect 1.0 -2.0 4.0 1.0 като координатите са получени при сбора на координатите на правоъгълника и транслиращият вектор от групата.