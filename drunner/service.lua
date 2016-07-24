-- drunner service configuration for helloworld

function setup()
-- d.addconfig(NAME, DESCRIPTION, DEFAULT VALUE, TYPE, REQUIRED)
   d.addconfig("SECRETWORD","The secret word to use","squirrel","string",true)

-- d.addvolume(NAME, BACKUP, EXTERNAL)

-- d.addcontainer(NAME)
   addcontainer("drunner/helloworld")
end

function run()
  result=d.run(d.esub("docker run --rm -e SECRETWORD=${SECRETWORD} drunner/helloworld helloworld ${SERVICENAME} ${IMAGENAME}"))
  if result~=0 then
     print("Failed to run helloworld.")
   end
end

function stop()
  print("What?")
end

function help()
   return d.esub([[
   NAME
      ${SERVICENAME}

   SYNOPSIS
      ${SERVICENAME} help
         This help.

      ${SERVICENAME} run
         Say hello to the world.

      ${SERVICENAME} configure SECRETWORD
         Set the secret word.

   DESCRIPTION
      A simple dRunner example. Built from ${IMAGENAME}.
   ]])
end
