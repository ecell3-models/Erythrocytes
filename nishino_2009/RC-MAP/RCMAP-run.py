
### ess file for ecell-3.2.2
### last update: 2011/11/07
### author: Taiko Nishino <taiko@sfc.keio.ac.jp>

import ecell, ecell.emc, ecell.Session, ecell.ecs
import os, sys

anEMLFileName = './RBC-steadystate.eml'
Directory = 'Data'

## make a session ## 
aSimulator = ecell.emc.Simulator()
aSession = ecell.Session.Session( aSimulator )

## set DM path ##
DMdir = aSession.theSimulator.getDMSearchPath()
aSession.theSimulator.setDMSearchPath('%s%s.' % (DMdir, aSession.theSimulator.DM_SEARCH_PATH_SEPARATOR))

## load model ##
aSession.loadModel(anEMLFileName)
aSession.step(2) 

## make logger stubs ##
aLoggerList = [
    'Process:/CELL/CYTOPLASM:tATP:MolarActivity',
    'Process:/CELL/CYTOPLASM:t23DPG:MolarActivity',
    'Variable:/CELL/CYTOPLASM:G6P:MolarConc',
    'Variable:/CELL/CYTOPLASM:F6P:MolarConc',
    'Variable:/CELL/CYTOPLASM:FDP:MolarConc',
    'Variable:/CELL/CYTOPLASM:DHAP:MolarConc',
    'Variable:/CELL/CYTOPLASM:GA3P:MolarConc',
    'Variable:/CELL/CYTOPLASM:_13DPG:MolarConc',
    'Variable:/CELL/CYTOPLASM:_3PG:MolarConc',
    'Variable:/CELL/CYTOPLASM:_2PG:MolarConc',
    'Variable:/CELL/CYTOPLASM:PEP:MolarConc',
    'Variable:/CELL/CYTOPLASM:PYRi:MolarConc',
    'Variable:/CELL/CYTOPLASM:LACi:MolarConc',
    'Variable:/CELL/CYTOPLASM:ADE:MolarConc',
    'Variable:/CELL/CYTOPLASM:HXi:MolarConc',
    'Variable:/CELL/CYTOPLASM:S7P:MolarConc',
    'Variable:/CELL/CYTOPLASM:f23DPG:MolarConc',
    'Variable:/CELL/CYTOPLASM:fATP:MolarConc',
    'Variable:/ENVIRONMENT:ADEe:MolarConc'
    ]
aLoggerStubList = []
for i in aLoggerList:
    aLoggerStubList.append(aSession.createLoggerStub(i))
for i in aLoggerStubList:
    i.create()
    i.setLoggerPolicy((0, 10000, 0, 0))

###                ### 
### set parameters ###
###                ### 

# Parameter settings for cold-stored RC-MAP. 
# When you comment out this section (from here to 'End of set parameters'),  
# you can get steady-state data of normal RBC metabolism.

# Hemoglobin #
aSession.theSimulator.setEntityProperty('Process:/CELL/CYTOPLASM:distributionHb:flag', 0.0)
aSession.theSimulator.setEntityProperty('Process:/CELL/CYTOPLASM:deoxyTOoxy:k', 0.001)

# pH #
aSession.theSimulator.setEntityProperty('Process:/CELL/CYTOPLASM:pHcontrol:k', 8.66e-8)
aSession.theSimulator.setEntityProperty('Variable:/CELL/CYTOPLASM:pHi:Value', 6.95)

# Process activities #
EnzymeActivity = 34.8348449414
PurineActivity = 240.602540629
NaKActivity = 6.2803881725
aSession.theSimulator.setEntityProperty('Variable:/CELL/CYTOPLASM:AC_Enzyme:Value', EnzymeActivity)
aSession.theSimulator.setEntityProperty('Variable:/CELL/CYTOPLASM:AC_Purine:Value', PurineActivity)
aSession.theSimulator.setEntityProperty('Variable:/CELL/MEMBRANE:AC_NaK_Pump:Value', NaKActivity)

# Extracellular metabolites value #
aSession.theSimulator.setEntityProperty('Variable:/ENVIRONMENT:ADEe:Value', 60221367.0) # 1.0mM
aSession.theSimulator.setEntityProperty('Variable:/ENVIRONMENT:ADOe:Value', 0.0)
aSession.theSimulator.setEntityProperty('Variable:/ENVIRONMENT:HXe:Value', 0.0)
aSession.theSimulator.setEntityProperty('Variable:/ENVIRONMENT:INOe:Value', 0.0)
aSession.theSimulator.setEntityProperty('Variable:/ENVIRONMENT:Ke:Value', 0.0)
aSession.theSimulator.setEntityProperty('Variable:/ENVIRONMENT:LACe:Value', 0.0)
aSession.theSimulator.setEntityProperty('Variable:/ENVIRONMENT:Nae:Value', 6383464902.0) # 106mM
aSession.theSimulator.setEntityProperty('Variable:/ENVIRONMENT:PYRe:Value', 0.0)
aSession.theSimulator.setEntityProperty('Variable:/ENVIRONMENT:Pie:Value', 361328202.0) # 6.0mM
aSession.theSimulator.setEntityProperty('Variable:/CELL/CYTOPLASM:GLC:Value', 2408854680.0) # 40.0mM

# Transporters #
aSession.theSimulator.setEntityProperty('Process:/CELL/CYTOPLASM:E_GLC:SW', 0.0)
aSession.theSimulator.setEntityProperty('Process:/CELL/MEMBRANE:E_ADEtrSUB:SW', 0.0)
aSession.theSimulator.setEntityProperty('Process:/CELL/MEMBRANE:E_ADOtrSUB:SW', 0.0)
aSession.theSimulator.setEntityProperty('Process:/CELL/MEMBRANE:E_HXtrSUB:SW', 0.0)
aSession.theSimulator.setEntityProperty('Process:/CELL/MEMBRANE:E_INOtrSUB:SW', 0.0)
aSession.theSimulator.setEntityProperty('Process:/CELL/MEMBRANE:E_K_LeakSUB:SW', 0.0)
aSession.theSimulator.setEntityProperty('Process:/CELL/MEMBRANE:E_LACtrSUB:SW', 0.0)
aSession.theSimulator.setEntityProperty('Process:/CELL/MEMBRANE:E_NaK_PumpSUB:SW', 0.0)
aSession.theSimulator.setEntityProperty('Process:/CELL/MEMBRANE:E_Na_LeakSUB:SW', 0.0)
aSession.theSimulator.setEntityProperty('Process:/CELL/MEMBRANE:E_PYRtrSUB:SW', 0.0)
aSession.theSimulator.setEntityProperty('Process:/CELL/MEMBRANE:E_PitrSUB:SW', 0.0)

aSession.theSimulator.initialize()

###                       ### 
### End of set parameters ###
###                       ### 

## run ##
print 'Running.....'
aSession.run(4233600)  ## 49 days

## save data ##
if (not(os.path.isdir('%s/%s' % (os.path.dirname(anEMLFileName), Directory)))):
    os.mkdir('%s/%s' % (os.path.dirname(anEMLFileName), Directory))

aSession.saveLoggerData(aSaveDirectory = '%s/%s' % (os.path.dirname(anEMLFileName), Directory))

print 'Finished!'

