#include "libecs.hpp"
#include "Process.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( TotalSumProcess, ContinuousProcess )
{
  
 public:
  
  LIBECS_DM_OBJECT( TotalSumProcess, Process ){
    
    INHERIT_PROPERTIES( Process );
    

  }
  
  TotalSumProcess()
    //    :
    {
      ; // do nothing
    }
  
  virtual void initialize(){
    
    Process::initialize();

    P0 = getVariableReference( "P0" );
      
  }

   
  
  virtual void fire(){


    P0.setValue(0);

  for( VariableReferenceVector::const_iterator
	 i ( thePositiveVariableReferenceIterator );
       i != theVariableReferenceVector.end(); ++i )
    {
      P0.addValue ( (*i).getVariable()->getValue() );
     }

  }
    


  
 protected:
  
  VariableReference P0;


};

LIBECS_DM_INIT( TotalSumProcess, Process );





