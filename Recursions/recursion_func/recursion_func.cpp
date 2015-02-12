// �������� ��������, ����� ������� �������� ��� � ������� �� ������ �� 100 �������, �������� �� ��������� 0, 1 � *, �������� 01*0*.
//������ ������ � �� ��������� �� ���� ����� �� �������� ������, �������� �� �������, ���� ����� ������� �� * � �������� �� ������ �������� ������ � 0 ��� 1.
#include <iostream>

int readN();

void getTheUpFigure(int n, int i, int j);
void getTheDownFigure(int n, int i, int j);

int main() {

	int n = 0;
	n = readN();

	int i = 1;
	int j = 2;

	getTheUpFigure(n, i, j);
	j = n;
	getTheDownFigure(n, i, j);

	return 0;
}

int readN() {
	int n = 0;
	do {
		std::cin.clear();
		std::cin.sync();
		std::cout << "Enter n: ";
		std::cin >> n;
	} while (!std::cin.good() || n < 0 || n > 21) ;

	return n;
}

void getTheUpFigure(int n, int i, int j) {
	if (j == n + 2) {
		return;
	}
	else {
		if (i == j) {
			std::cout << '\n';
			i = 1;
			getTheUpFigure(n, i, j + 1);
		}
		else {
			std::cout << i << "  ";
			getTheUpFigure(n, i + 1, j);
		}
	}
}

void getTheDownFigure(int n, int i, int j) {
	if (j == 1) {
		return;
	}
	else {
		if (i == j) {
			i = 1;
			std::cout << '\n';
			getTheDownFigure(n, i, j - 1);
		}
		else {
			std::cout << i << "  ";
			getTheDownFigure(n, i + 1, j);
		}
	}
}
