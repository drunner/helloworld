-- drunner service configuration for helloworld

addconfig("SECRETWORD","squirrel","The secret word to use")

imagename="j842/helloworld"

-- functions that can be run from the commandline, e.g. helloworld run
function run(...)
   local args = table.pack(...)
   if (args.n>0) then
      print("You gave me some arguments! They are:")
      for i,v in ipairs(args) do
         print(i, v)
      end
   else
      result, output = docker("run","--rm", "-e", "SECRETWORD=${SECRETWORD}", imagename,
                              "helloworld", "${SERVICENAME}", imagename)
      dieunless( result, "Failed to run helloworld: "..output )
   end
end


function selftest()
   run()
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



function uninstall()
-- stop services, e.g. with dockerstop
end

function obliterate()
-- e.g. call dockerdeletevolume(volumename)
end

function install()
-- e.g. pull relevant containers with dockerpull, create volumes with dockercreatevolume
end

function backup()
-- pause containers with docker("pause",containername), backup volumes with dockerbackup(volumename), then unpause
end

function restore()
-- restore volumes with dockerrestore(volumename)
end

