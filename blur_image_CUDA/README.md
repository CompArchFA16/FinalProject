# Image Blurring in CUDA
This folder contains all the CUDA code for blurring an image. A sample image is included in this folder as cinque_terre_small.jpg.
## Main Components
-   student_func.cu: Includes all the kernels needed for blurring image. It separates the image into 3 images with one color channel in each, blur all 3 images, and recombine them back.
-   compare.cpp: Compares the generated picture to the expected blurred picture. (Require OpenCV)

## Running the program
*   Makefile contains instructions about running this program on Linux/Mac.
*   We currently do not support running the program on Windowsn because we are having issues with CUDA toolkits and Microsoft Visual Studio. But there is a way to do a test run on Udacity platform:
    * Copy the code in student_func.cu and go to the Quiz at the end of Lesson 2 here: https://classroom.udacity.com/courses/cs344/lessons/77202674/concepts/801512920923#
    * Overwrite student_func.cu on the webpage and hit "Test Run".
