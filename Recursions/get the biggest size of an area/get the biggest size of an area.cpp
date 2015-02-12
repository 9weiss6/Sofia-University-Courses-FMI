#include <iostream>

using namespace std;

void getSizeArea(int **area, int n, int &length, int i, int j);

int main() {

	int n = 0;
	cout << "Enter n: ";
	cin >> n;

	int **area = new int*[n];

	for (size_t i = 0; i < n; i++) {
		area[i] = new int[n];
	}

	cout << "Enter only 0 or 1!" << endl;
	for (size_t i = 0; i < n; i++) {
		for (size_t j = 0; j < n; j++) {
			cin >> area[i][j];
		}
	}

	cout << endl;

	for (size_t i = 0; i < n; i++) {
		for (size_t j = 0; j < n; j++) {
			cout << area[i][j] << ' ';
		}
		cout << endl;
	}

	int x = 0;
	cout << "Enter x: ";
	cin >> x;

	int y = 0;
	cout << "Enter y: ";
	cin >> y;

	int length = 1;
	int i = x;
	int j = y;

	getSizeArea(area, n, length, i, j);

	cout << "Size of area: " << length << endl;

	for (size_t i = 0; i < n; i++) {
		for (size_t j = 0; j < n; j++) {
			cout << area[i][j] << ' ';
		}
		cout << endl;
	}


	for (size_t i = 0; i < n; i++) {
		delete[] area[i];
	}
	delete[] area;

	return 0;
}

void getSizeArea(int **area, int n, int &length, int i, int j) {

	area[i][j] = 9;

	//�������
	if (i < n && i >= 0 && j < n && j >= 0 && j + 1 < n && j - 1 >= 0 && area[i][j + 1] == 1) {
		length++;
		getSizeArea(area, n, length, i, j + 1);
	}
	//������
	if (i < n && i >= 0 && j < n && j >= 0 && j - 1 < n && j - 1 >= 0 && area[i][j - 1] == 1) {
		length++;
		getSizeArea(area, n, length, i, j - 1);
	}
	//������
	if (i < n && i >= 0 && j < n && j >= 0 && i + 1 < n && i + 1 >= 0 && area[i + 1][j] == 1) {
		length++;
		getSizeArea(area, n, length, i + 1, j);
	}
	//������
	if (i < n && i >= 0 && j < n && j >= 0 && i - 1 < n && i - 1 >= 0 && area[i - 1][j] == 1) {
		length++;
		getSizeArea(area, n, length, i - 1, j);
	}
	//������-����� �� ���������
	if (i < n && i >= 0 && j < n && j >= 0 && i + 1 < n && i + 1 >= 0 && j + 1 < n && j + 1 >= 0 && area[i + 1][j + 1] == 1) {
		length++;
		getSizeArea(area, n, length, i + 1, j + 1);
	}
	//������-���� �� ���������
	if (i < n && i >= 0 && j < n && j >= 0 && i - 1 < n && i - 1 >= 0 && j - 1 < n && j - 1 >= 0 && area[i - 1][j - 1] == 1) {
		length++;
		getSizeArea(area, n, length, i - 1, j - 1);
	}
	//������-���� �� ���������
	if (i < n && i >= 0 && j < n && j >= 0 && i + 1 < n && i + 1 >= 0 && j - 1 < n && j - 1 >= 0 && area[i + 1][j - 1] == 1) {
		length++;
		getSizeArea(area, n, length, i + 1, j - 1);
	}
	//������-����� �� ���������
	if (i < n && i >= 0 && j < n && j >= 0 && i - 1 < n && i - 1 >= 0 && j + 1 < n && j + 1 >= 0 && area[i - 1][j + 1] == 1) {
		length++;
		getSizeArea(area, n, length, i - 1, j + 1);
	}
}
