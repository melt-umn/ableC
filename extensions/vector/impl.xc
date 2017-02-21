// This file contains the functions that would optimally be templated.  Instead for now, we are just compiling this manually to get the ast

#include <vector.xh>

typedef int ty;

typedef struct __attribute__((refId("edu:umn:cs:melt:exts:ableC:vector:_vector_s"))) _vector_s {
  struct _vector_info _info;
  ty *_contents;
}* _vector;

// Allocate a pointer to a generic vector and clear its fields
static _vector _alloc_vector() {
  _vector result = GC_malloc(sizeof(struct _vector_s));
  return result;
}

// Access the value in a vector at an index
static ty _index_vector(_vector v, size_t i) {
  _check_index_vector(v->_info, v->_contents, i);
  return v->_contents[i];
}

// Update the value in a vector at an index
static ty _update_index_vector(_vector v, int i, ty val) {
  _maybe_grow_vector_by_one(&v->_info, (void**)&v->_contents, i);
  v->_contents[i] = val; // Use overloaded assign operator
  return val;
}

// Copy one vector into another
static _vector _copy_vector(_vector v) {
  _vector result = _alloc_vector();
  _init_vector(&result->_info, (void**)&result->_contents, v->_info.elem_size, v->_info.length);
  for (size_t i = 0; i < v->_info.length; i++) {
    _update_index_vector(v, i, _index_vector(v, i)); // Use vector abstract syntax
  }
  return result;
}

// Append a vector to another, updating the first
static _vector _append_update_vector(_vector v1, _vector v2) {
  _resize_vector(&v1->_info, (void**)&v1->_contents, v1->_info.length + v2->_info.length);
  for (size_t i = 0; i < v2->_info.length; i++) {
    _update_index_vector(v1, v1->_info.length + i, _index_vector(v2, i)); // Use vector abstract syntax
  }
  return v1;
}

// Append two vectors to create a new vector
static _vector _append_vectors(_vector v1, _vector v2) {
  _vector result = _copy_vector(v1);
  return _append_update_vector(result, v2);
}

// Append a single item to a vector
static void _append_item(_vector v, ty elem) {
  _update_index_vector(v, v->_info.length, elem);
}

// Return true if two vectors are equal
static bool _equal_vectors(_vector v1, _vector v2) {
  if (v1->_info.length != v2->_info.length)
    return false;
  for (unsigned i = 0; i < v1->_info.length; i++) {
    if (_index_vector(v1, i) != _index_vector(v2, i))
      return false;
  }
  return true;
}

// Convert a vector to a string
static string _showVector(_vector v) {
  if (v->_info.length == 0)
    return "[]";
  string result = "[" + str(_index_vector(v, 0));
  for (unsigned i = 1; i < v->_info.length; i++) {
    result += ", " + str(_index_vector(v, i));
  }
  result += "]";
  return result;
}
