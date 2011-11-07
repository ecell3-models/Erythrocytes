#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( TotalSumFluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( TotalSumFluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );
    }

 
  
  virtual void fire()
  {

    Real velocity = 0;
    Real k=0;
    for( VariableReferenceVector::const_iterator
	   i ( theZeroVariableReferenceIterator );
	 i != theVariableReferenceVector.end(); ++i )
      {

	k= k+((*i).getVariable()->getValue());
	velocity = k;
	/*	velocity = velocity * getSuperSystem()->getSize() * N_A; */
      }
    setFlux( velocity );
    
  }


 protected:

};

LIBECS_DM_INIT( TotalSumFluxProcess, Process );
