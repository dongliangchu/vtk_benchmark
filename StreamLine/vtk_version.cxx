
#include <vtkSmartPointer.h>
#include <vtkWriter.h>
#include <vtkDataSetReader.h>
#include <vtkDataSetWriter.h>
#include <string>
#include <stdlib.h>
#include <vtkRectilinearGrid.h>
#include <vtkMarchingCubes.h>
#include <vtkPlaneSource.h>
#include <vtkStreamTracer.h>
#include <vtkPolyData.h>
#include <vtkPoints.h>
#include <vtkPointSet.h>
#include <vtkMath.h>
#include <vtkPointData.h>
#include <iostream>
static void
usage(const char *pgm)
{
  std::cerr<<"Usage:"<<std::endl;
  std::cerr<<"  "<<pgm;
  std::cerr<<"      -i : iso surface"<<std::endl;
  std::cerr<<"  <option> filename isovalue"<<std::endl;
  std::cerr<<"  "<<pgm;
  std::cerr<<"      -s : streamline"<<std::endl;
  std::cerr<<" <option> NumSeeds  NumSteps  StpSize"<<std::endl;
}

void streamline(const char *fname,double NumSed,double NumStp,double StepSize);

void isoSurface(const char *fname,double isovalue);


int main ( int argc, char *argv[] )
{
  if (!(argc == 4 || argc==6))
  {
      std::cerr<<" Error."<<std::endl;
      usage(argv[0]);
      return -1;
  }
  std::string opt(argv[1]);
  const char *fname=argv[2];
  
  double isovalue;
  
  //std::string InputFilename = argv[1];
  double NumSed;
  double NumStp;
  double StpSize;

  if (opt == "-h")
      usage(argv[0]);
  else if (opt == "-i")
      { 
	isovalue=atof(argv[3]);
	isoSurface(fname, isovalue);
      } 
  else if (opt == "-s")
      {
	NumSed = atof(argv[3]);
	NumStp = atof(argv[4]);
	StpSize = atof(argv[5]);
	streamline(fname, NumSed, NumStp, StpSize);     
      } 
  else
  {
    std::cerr<<"Unrecongized option: "<<opt<<std::endl;
    usage(argv[0]);
  }

  return 0;
  
 } 
  // Ensure a filename was specified

  // Get the filename from the command line

void isoSurface(const char *fname, double isovalue)
{ 
  
  vtkIndent vtkdent;
  vtkSmartPointer<vtkDataSetReader> reader = vtkSmartPointer<vtkDataSetReader>::New();
  vtkSmartPointer<vtkDataSetWriter> Writer =vtkSmartPointer<vtkDataSetWriter>::New();

  reader->SetFileName(fname);
  reader->Update();
 
  vtkSmartPointer<vtkMarchingCubes> surface = vtkSmartPointer<vtkMarchingCubes>::New();
  surface->SetInputData(reader->GetOutput());
  surface->SetValue(0, isovalue);
  surface->Update();
  
  std::string OutputFilename = (std::string)"isoOutput.vtk";
  Writer->SetFileName(OutputFilename.c_str());
  Writer->SetInputData(surface->GetOutput());
  Writer->Write(); 
}


 
 void streamline(const char *fname,double NumSed,double NumStp,double StepSize)
{ 
   std::string OutputFilename = "StreamLine.vtk";

  vtkSmartPointer<vtkDataSetReader> reader = vtkSmartPointer<vtkDataSetReader>::New();
  vtkSmartPointer<vtkDataSetWriter> Writer =vtkSmartPointer<vtkDataSetWriter>::New();
  vtkSmartPointer<vtkPolyData> Stream_Output =vtkSmartPointer<vtkPolyData>::New();
  vtkSmartPointer<vtkPoints> Origi_Points =vtkSmartPointer<vtkPoints>::New();
  vtkSmartPointer<vtkRectilinearGrid> Origi_Rectilinear =vtkSmartPointer<vtkRectilinearGrid>::New(); 

 
  reader->SetFileName(fname);
  reader->Update();
  
  vtkSmartPointer<vtkStreamTracer> streamLine = vtkSmartPointer<vtkStreamTracer>::New();

  vtkSmartPointer<vtkPoints> Seeds_Coordi =vtkSmartPointer<vtkPoints>::New();
  vtkSmartPointer<vtkPolyData> Seeds_Set =vtkSmartPointer<vtkPolyData>::New();
  

  Origi_Rectilinear=reader->GetRectilinearGridOutput();
  Origi_Rectilinear->GetPoints((vtkPoints*) Origi_Points);
  double bound[6];
  Origi_Points->GetBounds(bound);

  vtkMath::RandomSeed(time(NULL));
  for(unsigned int i = 0; i < NumSed; i++)
    {
    double a = vtkMath::Random(0.0,1.0);
    Seeds_Coordi->InsertNextPoint(bound[0]+a*(bound[1]-bound[0]),bound[2]+a*(bound[3]-bound[2]),bound[4]+a*(bound[5]-bound[4]));
    }
  

  Seeds_Set->SetPoints(Seeds_Coordi);
 
  streamLine->SetInputData((vtkDataObject *)reader->GetOutput());
  streamLine->SetSourceData((vtkDataSet*) Seeds_Set);
  vtkIndent vtkdent;
  
  streamLine->SetMaximumNumberOfSteps(NumStp);
  streamLine->SetInitialIntegrationStep(StepSize);
  streamLine->SetIntegratorTypeToRungeKutta4();
  streamLine->SetIntegrationDirectionToForward();
  streamLine->SetComputeVorticity(0);
  streamLine->Update();

  streamLine->PrintSelf(std::cout,vtkdent);
  Writer->SetFileName(OutputFilename.c_str());
  int inputport=0;
  Writer->SetInputData(streamLine->GetOutput());
  
 //ostream*  VtkPointer=Writer->OpenVTKFile();
   //Writer->WriteDataSetData(VtkPointer, surface->GetOutput());
   Writer->Write(); 
  
}
