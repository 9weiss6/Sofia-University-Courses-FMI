#include <iostream>
#include <algorithm>

#include "DynamicArray.h"


DynamicArray::DynamicArray() {

}


DynamicArray::~DynamicArray() {

}

DynamicArray::DynamicArray(DynamicArray const & other) {

}

DynamicArray& DynamicArray::operator=(DynamicArray const & other) {

}

DynamicArray::~DynamicArray() {

}

void DynamicArray::free() {

}

void DynamicArray::reallocate(size_t newSize) {

}

void DynamicArray::add(int element) {

}

size_t DynamicArray::getAllocatedSize() const {

}

size_t DynamicArray::getLength() const {

}

int DynamicArray::getAt(size_t index) const {

}

void DynamicArray::setAt(size_t index, int value) {

}

void DynamicArray::print() const {

}

DynamicArray DynamicArray::operator+(DynamicArray const& rhs) const {

}


///
/// ����� proxy �����, ����� ��������� �������� �� ������ � ������ index.
///
/// ���� ������ �� ��������� �� �������� �� ������������ ������ � �����
/// proxy �����, ����� ���� �� �� �������� �� ������� �� �������� �� ������.
///
/// �����:
/// 1. ���������� �� ����� �������� �� ���� ���� index
/// � ������� ������ � ������. ������ �������� �� �����
/// ����� ���, ������ proxy ������� �� ��������.
/// 2. proxy ������� � ������� � ��������� ������, � �� � ��������� �������
/// �� ������. ���� ��������, �� ���������� �� ���� ����� ������� �� ������
/// � ���������� �����, proxy ������� ������ �� �������� ���� � ��� ������.
///
DynamicArrayElementProxy DynamicArray::operator[](size_t index) {

}


///
/// ����� proxy �����, ����� ��������� �������� �� ������ � ������ index.
///
/// ���� ������ �� ��������� �� �������� �� ���������� ������ � �����
/// ���������� proxy �����, ����� *�� ����* �� �� �������� �� �������
/// �� �������� �� ������.
///
const DynamicArrayElementProxy DynamicArray::operator[](size_t index) const {

}


/// ============================================================================


DynamicArrayElementProxy::DynamicArrayElementProxy(DynamicArray * pDynamicArray, size_t elementIndex) :
pParent(pDynamicArray),
parentElementIndex(elementIndex) {
}

DynamicArrayElementProxy::operator int() const {

}

DynamicArrayElementProxy & DynamicArrayElementProxy::operator=(int value) {

}