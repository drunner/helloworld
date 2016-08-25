-- drunner service configuration for helloworld

function drunner_setup()
-- addconfig(NAME, DESCRIPTION, DEFAULT VALUE, TYPE, REQUIRED)
-- addvolume(NAME, [BACKUP], [EXTERNAL])
-- addcontainer(NAME)
   addconfig("SECRETWORD","The secret word to use","squirrel","string",true)
end

-- functions that can be run from the commandline, e.g. helloworld run
function run(...)
   local args = table.pack(...)
   if (args.n>0) then
      print("You gave me some arguments! They are:")
      for i,v in ipairs(args) do
         print(i, v)
      end
   else
      result=drun("docker","run","--rm", "-e", "SECRETWORD=${SECRETWORD}", "${IMAGENAME}",
                  "helloworld", "${SERVICENAME}", "${IMAGENAME}")
      if result~=0 then
        print("Failed to run helloworld.")
      end
   end

   return 0
end

function stop(...)
  print("There's nothing to stop!")
  return 1
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
