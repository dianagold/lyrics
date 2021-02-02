*==============================================================================*
*! GitHub Session - Onboarding
*! EduAnalytics, World Bank Group [eduanalytics@worldbank.org]

* This do-file calculates population-weighted OoS rates for Primary
*==============================================================================*

* Get data using WBG API
wbopendata, indicator(SP.POP.0509.FE; SP.POP.0509.MA; UIS.ROFST.1) ///
            year(2000) long nometadata clear
* SP.POP.0509.FE = Female population between the ages 5 to 9.
* SP.POP.0509.MA = Male population between the ages 5 to 9.
* UIS.ROFST.1 = Rate of out-of-school children of primary school age, both sexes (%)

* Sum genders
gen population_0509 = sp_pop_0509_fe + sp_pop_0509_ma

* More intuitive variable name
rename uis_rofst_1 oos_prim

* Keep only the relevant variables
keep country* region* year population* oos*

* Drop aggregates
drop if region == "NA" | missing(region)

* Calculate population-weighted OoS
tabstat oos_prim [aw = population_0509], by(regionname)


/*-----------------------------------------------------------------------------*
Questions for discussion:
1. Is this code well-documented?
2. Is this code easily replicable?
3. What else is recommended to build on this in a project?
4. How good of a global estimate do we have?
*-----------------------------------------------------------------------------*/