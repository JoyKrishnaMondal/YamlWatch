yamljs = require "yamljs"

delimit = require "path" |> (.sep)

cli = require "cli-color"

Red = cli.redBright

Yellow = cli.yellowBright

fs = require "fs" |> require "GetRidOfError"

{SetConfig,PrintSucess,PrintFailure} = require "GeneralDev"


Config =
	InitialExt:"yaml"
	FinalExtention:"json"
	Compile:(FileName) ->

		ReadFilePath = Config.DirToLook + delimit + FileName + "." + Config.InitialExt
		
		data <-! fs.readFile ReadFilePath,'utf8'

		try

			ParsedYaml = yamljs.parse data

		catch Problem

			console.error Red "Yaml Error:" + Yellow ReadFilePath
			console.error  Red "Line:" + Yellow Problem.parsedLine
			console.error Red "Snippet:" + Yellow Problem.snippet

			return 


		Json = JSON.stringify ParsedYaml, null,1 

		WriteFilePath = Config.DirToSave + delimit + FileName + "." + Config.FinalExtention


		<-! fs.writeFile WriteFilePath,Json

		PrintSucess FileName



WithDir = (Init = true,watch = true,clean = false,DirToSave = process.cwd!,DirToLook = process.cwd!) ->

	Config.DirToSave = DirToSave

	Config.DirToLook = DirToLook

	AutoBuild = SetConfig Config

	AutoBuild Init,watch,clean

	return


module.exports = WithDir
