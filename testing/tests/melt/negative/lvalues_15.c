
int m = 5;

int * j() {
    return &m;
}

int main() 
{
    int n = 0;
    j() = &n; // Function results are rvalues.
    return 0;
}
