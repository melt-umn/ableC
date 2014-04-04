// A simple program
int main() {

    asm("x") ;

    asm("x" :) ; 

    asm("x" : :) ; 

    asm("x" : "f" ( x + 1 ), [x] "f" (3) ) ;

    asm("x" : "f" ( x + 1 ) : [x] "f" (3) ) ;

    asm("x" : "f" ( x + 1 ) : [x] "f" (3) : "clobber", "clobber2" ) ;
}
