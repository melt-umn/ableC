
template<a>
void test1() {
  
}

template<a>
void test2() {
  {test1<a>();}
  {test1<a>();}
}

template<a>
void test3() {
  {test2<a>();}
  {test2<a>();}
}

template<a>
void test4() {
  {test3<a>();}
  {test3<a>();}
}

template<a>
void test5() {
  {test4<a>();}
  {test4<a>();}
}

template<a>
void test6() {
  {test5<a>();}
  {test5<a>();}
}

template<a>
void test7() {
  {test6<a>();}
  {test6<a>();}
}

int main() {
  test6<int>();
}
