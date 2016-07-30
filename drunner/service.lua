-- drunner service configuration for helloworld

function drunner_setup()
-- addconfig(NAME, DESCRIPTION, DEFAULT VALUE, TYPE, REQUIRED)
   addconfig("SECRETWORD","The secret word to use","squirrel","string",true)

-- addvolume(NAME, [BACKUP], [EXTERNAL])

-- addcontainer(NAME)
   addcontainer("drunner/helloworld")  -- First one must always be this container.
end


-- everything past here are functions that can be run from the commandline,
-- e.g. helloworld run

function run()
  result=drun("docker","run","--rm", "-e", "SECRETWORD=${SECRETWORD}", "drunner/helloworld", "helloworld", "${SERVICENAME}" "${IMAGENAME}")
  if result~=0 then
     print("Failed to run helloworld.")
   end
end

function stop()
  print("What?")
end

function help()
   return [[
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
   ]]
end
