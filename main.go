package main

import (
	_ "github.com/GoAdminGroup/go-admin/adapter/gin"
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/engine"
	"github.com/GoAdminGroup/go-admin/examples/datamodel"
	"github.com/GoAdminGroup/go-admin/modules/config"
	_ "github.com/GoAdminGroup/go-admin/modules/db/drivers/mysql"
	"github.com/GoAdminGroup/go-admin/plugins/admin"
	"github.com/GoAdminGroup/go-admin/template/types"
	_ "github.com/GoAdminGroup/themes/adminlte"
	"github.com/gin-gonic/gin"
	"go-admin-demo/module"
	"os"
)

func main() {
	r := gin.Default()
	eng := engine.Default()
	cfg := config.ReadFromJson("./config.json")
	fillEnv(&cfg)

	adminPlugin := admin.NewAdmin(module.Generators)
	adminPlugin.AddGenerator("user", datamodel.GetUserTable)

	_ = eng.AddConfig(cfg).AddPlugins(adminPlugin).Use(r)
	eng.HTML("GET", cfg.PrefixFixSlash(), homePage )
	_ = r.Run(":9033")
}

/**
fill env to database config
 */
func fillEnv(cfg *config.Config){
	dateConfig := cfg.Databases.GetDefault()
	envDefault := func(key string, val *string) {
		port, find :=os.LookupEnv(key)
		if find{
			*val = port
		}
	}
	envDefault("DB_PORT", &dateConfig.Port)
	envDefault("DB_HOST", &dateConfig.Host)
	envDefault("DB_NAME", &dateConfig.Name)
	envDefault("DB_PASS", &dateConfig.Pwd)
	cfg.Databases.Add("default", dateConfig )
}

func homePage(ctx *context.Context) (panel types.Panel, err error) {
	return types.Panel{
		Content:   "",
		Title:       "首页",
		Description: "",
	}, nil
}