# Homework 1

Напишете програма която при получен "компресиран" низ на стандартният вход, извежда на стандартният изход, декомпресираната му версия. В програмата НЯМАТЕ право да използвате рекурсия.

Компресираният низ съдържа 2 вида конструкции:

Букви които са символ от 'A' до 'Z' и се декомпресират до същата буква
Групи които започват с число и след това в скобите имат компресиран низ. Декомпресират се като се декомпресира низа в скобите и се повтори толкова пъти колкото е числото.

## Пример:
```
A -> A
AB -> AB
3(A) -> AAA
3(AB2(B)) -> ABBBABBBABBB
12(ZQ) -> ZQZQZQZQZQZQZQZQZQZQZQZQ
2(2(A)3(B)) -> AABBBAABBB
```
