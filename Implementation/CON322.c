#include "MAX.h" //this header is for assigning MAX values and NUM_LOOP globally
#define N MAX1
#define M N
#define	P 3
#define Q P
#define	Cdiv  P*P //div for filter 
#define Coffset 2
//offset
__m256i Cdiv_v; // vector that contain Cdiv
__m256i Coffset_v; // vector that contain Coffset

short int kernel[P][Q] __attribute__(( aligned(32)));
// input and out put matrix MAX1 and MAX2 should be equla to xsize and ysize
unsigned short int input[N][M] __attribute__(( aligned(32)));
unsigned short int output[N][M] __attribute__((aligned(32)));
inline void kernelBuilder( short int kernel[P][Q])
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
int main()
{
	singleCore
	assignMatrixui16(input);
	kernelBuilder(kernel);
	Coffset_v = _mm256_set1_epi16(Coffset);
	Cdiv_v = _mm256_set1_epi16(32768 / Cdiv);
		programName="CON32";

		
		//function to be executed here :
		begin_rdtsc

			int i,j;
				//Broadcasting coefficients
				__m256i c00 = _mm256_set1_epi16(kernel[0][0]);// printf("      c00 : "); printVeci16(c00);
				__m256i c01 = _mm256_set1_epi16(kernel[0][1]);// printf("      c01 : "); printVeci16(c01);
				__m256i c02 = _mm256_set1_epi16(kernel[0][2]);// printf("      c02 : "); printVeci16(c02);
				__m256i c10 = _mm256_set1_epi16(kernel[1][0]);// printf("      c10 : "); printVeci16(c10);
				__m256i c11 = _mm256_set1_epi16(kernel[1][1]);// printf("      c11 : "); printVeci16(c11);
				__m256i c12 = _mm256_set1_epi16(kernel[1][2]);// printf("      c12 : "); printVeci16(c12);
				__m256i c20 = _mm256_set1_epi16(kernel[2][0]);// printf("      c20 : "); printVeci16(c20);
				__m256i c21 = _mm256_set1_epi16(kernel[2][1]);// printf("      c21 : "); printVeci16(c21);
				__m256i c22 = _mm256_set1_epi16(kernel[2][2]);// printf("      c22 : "); printVeci16(c22);
				
				for(i=P/2; i<N-(P/2); i++){
					for(j=Q/2; j<M-(Q/2); j+=16){
						
						//loading inputs
						__m256i input00 = _mm256_loadu_si256((__m256i *) &input[i-(P/2)+0][j-(Q/2)+0]);
						__m256i input01 = _mm256_loadu_si256((__m256i *) &input[i-(P/2)+0][j-(Q/2)+1]);
						__m256i input02 = _mm256_loadu_si256((__m256i *) &input[i-(P/2)+0][j-(Q/2)+2]);
						
						__m256i input10 =_mm256_concat_epi16(input00,input01,1);// _mm256_loadu_si256((__m256i *) &input[i-(P/2)+1][j-(Q/2)+0]);
						__m256i input11 = _mm256_concat_epi16(input02,input01,1);//_mm256_loadu_si256((__m256i *) &input[i-(P/2)+1][j-(Q/2)+1]);
						__m256i input12 = _mm256_concat_epi16(input00,input02,1);//_mm256_loadu_si256((__m256i *) &input[i-(P/2)+1][j-(Q/2)+2]);
						
						__m256i input20 = _mm256_loadu_si256((__m256i *) &input[i-(P/2)+2][j-(Q/2)+0]);
						__m256i input21 = _mm256_concat_epi16(input02,input01,1);//_mm256_loadu_si256((__m256i *) &input[i-(P/2)+2][j-(Q/2)+1]);
						__m256i input22 = _mm256_loadu_si256((__m256i *) &input[i-(P/2)+2][j-(Q/2)+2]);
						
						//multiplications
						input00 = _mm256_mullo_epi16(input00, c00);// printf("  input00 : "); printVeci16(input00);
						input01 = _mm256_mullo_epi16(input01, c01);// printf("  input01 : "); printVeci16(input01);
						input02 = _mm256_mullo_epi16(input02, c02);// printf("  input02 : "); printVeci16(input02);
						input10 = _mm256_mullo_epi16(input10, c10);// printf("  input10 : "); printVeci16(input10);
						input11 = _mm256_mullo_epi16(input11, c11);// printf("  input11 : "); printVeci16(input11);
						input12 = _mm256_mullo_epi16(input12, c12);// printf("  input12 : "); printVeci16(input12);
						input20 = _mm256_mullo_epi16(input20, c20);// printf("  input20 : "); printVeci16(input20);
						input21 = _mm256_mullo_epi16(input21, c21);// printf("  input21 : "); printVeci16(input21);
						input22 = _mm256_mullo_epi16(input22, c22);// printf("  input22 : "); printVeci16(input22);
						
						//additions
						__m256i vec1 = _mm256_add_epi16(input00, input01);// printf("  vec1 : "); printVeci16(vec1);
						__m256i vec2 = _mm256_add_epi16(input10, input11);// printf("  vec2 : "); printVeci16(vec2);
						__m256i vec3 = _mm256_add_epi16(input20, input21);// printf("  vec3 : "); printVeci16(vec3);
						
						vec1 = _mm256_add_epi16(input02, vec1);// printf("  vec1 : "); printVeci16(vec1);
						vec2 = _mm256_add_epi16(input12, vec2);// printf("  vec2 : "); printVeci16(vec2);
						vec3 = _mm256_add_epi16(input22, vec3);// printf("  vec3 : "); printVeci16(vec3);
						
						__m256i result = _mm256_add_epi16(vec1, vec2);// printf("  result : "); printVeci16(result);
						result = _mm256_add_epi16(result, vec3);// printf("  result : "); printVeci16(result);
						
						//pripheral computations
						result = _mm256_mulhrs_epi16(result, Cdiv_v);
						result = _mm256_add_epi16( result, Coffset_v);
						//store results
						_mm256_storeu_si256( (__m256i *) &output[i][j], result);
					}
				}		
			end_rdtsc
		
	printf("\nThe  %d X matrix \n", output[N/2][ M/2]);

	return 0;
}
