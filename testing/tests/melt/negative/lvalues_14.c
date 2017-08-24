
int main() 
{
    int n = 0;
    (n > 0 ? n : n) = 5; // Ternary expressions are not lvalues
    return 0;
}
