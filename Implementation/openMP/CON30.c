#include "MAX.h" //this header is for assigning MAX values and NUM_LOOP globally
#define N MAX1
#define M N
#define	P 3
#define Q P
#define	Cdiv  P*P //div for filter 
#define Coffset 2
///void kernelBuilder( short int);
short int kernel[P][Q] __attribute__(( aligned(32)));
// input and out put matrix MAX1 and MAX2 should be equla to xsize and ysize
unsigned short int input[N][M] __attribute__(( aligned(32)));
unsigned short int output[N][M] __attribute__((aligned(32)));
void kernelBuilder( short int kernel[P][Q])
{ 
	int i, j, k=1;
	for(i=0;i<P;i++){
		for(j=0;j<Q;j++)
		{
			kernel[i][j]=1;//k;
			k++;
		}
	}
}	
//gcc -fopenmp, icc -openmp, clang -fopenmp should be added to comand line
int main()
{
	//singleCore
	assignMatrixui16(input);
	kernelBuilder(kernel);
	int i, j,k,l=0,temp;
	programName="CON31";
		
		//function to be executed here :
		begin_rdtsc
				#pragma omp parallel for
				for (i=P/2; i< N-P/2; i++){
				//#pragma omp parallel for
				for(j=Q/2; j< M-Q/2; j++){
					temp=0;
					//#pragma omp parallel for
					for(k = 0; k <  P; k++){ 
						//#pragma omp parallel for
						//#pragma unroll
						for(l = 0; l <  Q; l++){
							temp += (kernel[k][l])   * (input[i - (P/2)+k][j - (Q/2)+l]);

						}
					}
					output[i][j]=((temp/(Cdiv))+Coffset);
				}
			}
		end_rdtsc
		
	printf("\nThe  %d X matrix \n", output[N/2][ M/2]);

	return 0;
}
