#include "opencvUtils.h"

#define Pxsize MAX1
#define Pysize Pxsize

//Kernel size
#define Kxsize 7
#define Kysize Kxsize
using namespace std;
using namespace cv;

unsigned short int A[Pxsize][Pysize];
unsigned short int B[Pxsize][Pysize];
unsigned short int K[Kxsize][Kysize];


int main(){
	SINGLECORE	
	programName = "opencv7";
	//filter arguments
	Point anchor;
	double delta;
	int ddepth;
	
	//assign data between 0 and 255 to the input matrix
	int i,j;
	for (i=0; i<Pxsize; i++)
		for (j=0; j<Pysize; j++)
			A[i][j] = (i+j)%255;
			
	//assign data to the kernel
	//assign data between 0 and 255 to the input matrix
	for (i=0; i<Kxsize; i++)
		for (j=0; j<Kysize; j++)
			K[i][j]=1;
			
	cv::Mat input = cv::Mat(Pxsize, Pysize, CV_8UC1, A);
	cv::Mat output = cv::Mat(Pxsize, Pysize, CV_8UC1, B);
	cv::Mat kernel = cv::Mat::ones(Kxsize, Kysize, CV_8UC1);

	//name for out put
	//char window_name[32] = "filter2D Demo";

	// Initialize arguments for the filter
	anchor = Point( -1, -1 );
	delta = 0;
	ddepth = -1;
	
	
	
		begin_rdtsc
		//the problem is here:
		filter2D( input,   output, ddepth ,  kernel, anchor, delta, 1 );
		end_rdtsc
	
	
	//namedWindow( window_name, 128*128 );
	//imshow( window_name, output );
	//imwrite(
	//cout<<" "<< input<<endl;
	//cout<<" "<< output<<endl;
	printf("\n for %dX%d matrix for %d, %d kernel \n",Pxsize, Pysize, Kxsize, Kysize);
	//printf("%ld", sizeof(Mat) * 32768);
	
	 
	return 0;
}
