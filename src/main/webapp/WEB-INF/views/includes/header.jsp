<div id="" class="container" style="margin:0px;background-color: #0099cc;">

    <!-- local-search -->
    <div id="ddi-local-masthead" class="row">
        <!-- local-title -->
        <!-- NB: for additional title style patterns, see http://frontier.ebi.ac.uk/web/style/patterns -->
        <div class="grid_12 alpha logo-title col-md-6 col-sm-12 col-xs-12" id="local-title">
            <a href="/" title="OmicsDI Homepage"><img src="static/images/logo/OmicsDI-icon-3.png" alt="logo" width="64"
                                                      height="64"></a>
            <span><h1><a href="/" title="OmicsDI Homepage" alt="OmicsDI Homepage">Omics Discovery Index</a></h1></span>
        </div>
        <!-- /local-title -->

        <!-- NB: if you do not have a local-search, delete the following div, and drop the class="grid_12 alpha" class from local-title above -->
        <!-- /local-search -->
        <div class="col-md-4 col-sm-10 col-xs-12" ng-hide="show_top_search">
             style="height:105px; float:right; margin-top:0px; z-index:1; width:45%">
        </div>

        <div ng-controller="QueryCtrl" id="queryCtrl" class="col-md-6 col-sm-12 col-xs-12" ng-show="show_top_search"
             style="height:105px; float:right; margin-top:0px; z-index:1; ">
            <form novalidate name="queryForm" class="local-search" ng-submit="submit_query()">
                <fieldset>
                    <div class="form-group " ng-class="(query.submitted && queryForm.$invalid) ? 'has-error' : ''">
                        <div class="input-group ">
                            <autocomplete ng-model="query.text"
                                          attr-placeholder="organism, repository, gene, tissue, accession"
                                          click-activation="false" data="words" on-type="get_suggestions"
                                          on-select="do_query"></autocomplete>
                            <div class="input-group-btn">
                                <button type="submit" class="btn btn-primary ddi-btn">
                                    <i class="fa fa-search"></i> Search
                                </button>
                            </div>
                            <!-- /input-group-btn -->
                        </div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           </span>
                    </div>
                    <!-- /form-group -->
                </fieldset>
            </form>
           <div class="container" ng-controller="QueryBuilderCtrl">
    <!--        <h1>Angular.js Query Builder</h1>  -->

            <div class="alert alert-info">
                <strong>Query preview</strong><br>
                <span ng-bind-html="query_output"></span>
            </div>

            <query-builder group="filter.group"></query-builder>
            </div>

        </div>
    </div>

    <div id="local-masthead" class="masthead row" style="margin-left:-15px;margin-right:-15px">
        <!-- local-nav -->
        <nav style="float:bottom" class="col-md-12 col-sm-12 col-xs-12">
            <ul class="" id="local-nav">
                <li class=" first" id="home-menu"><a title="Home" href="/" alt="Home">Home</a></li>
                <li class="" id="browse-menu"><a title="Browse" href="/search?q=*:*" alt="Browse">Browse</a></li>
                <li class="" id="api-menu">
                    <a title="OmicsDI API" href="/api" alt="API">API</a>
                </li>
                <li class=" last" id="about-prider-menu">
                    <a title="Databases" href="/databases" alt="Databases">Databases</a>
                </li>
                <li class="functional last">
                    <a data-icon="\" class="icon icon-static"
                       href="http://www.ebi.ac.uk/support/index.php?query=omicsdi" alt="Feedback">Feedback</a>
                </li>
                <li class="functional"><a class="" href="/about" alt="About">About</a></li>
                <li class="functional"><a class="" href="/help" alt="Help">Help</a></li>
            </ul>
        </nav>
    </div>
    <!-- /local-nav -->


    <script type="text/ng-template" id="/queryBuilderDirective.html">
        <div class="alert alert-warning alert-group">
            <div class="form-inline" style="margin-left: -15px">
                <select ng-options="o.name as o.name for o in operators" ng-model="group.operator" class="form-control input-sm"></select>
                <button style="margin-left: 5px" ng-click="addCondition()" class="btn btn-sm btn-success"><i class="fa fa-plus" aria-hidden="true"></i> Add Condition</button>
                <button style="margin-left: 5px" ng-click="addGroup()" class="btn btn-sm btn-success"><i class="fa fa-plus" aria-hidden="true"></i> Add Group</button>
                <button style="margin-left: 5px" ng-click="removeGroup()" class="btn btn-sm btn-danger"><i class="fa fa-minus" aria-hidden="true"></i> Remove Group</button>
            </div>
            <div class="group-conditions">
                <div ng-repeat="rule in group.rules | orderBy:'index'" class="condition">
                    <div ng-switch="rule.hasOwnProperty('group')">
                        <div ng-switch-when="true">
                            <query-builder group="rule.group"></query-builder>
                        </div>
                        <div ng-switch-default="ng-switch-default">
                            <div class="form-inline" style="margin:3px">
                                <select ng-options="t.name as t.name for t in fields" ng-model="rule.field" class="form-control input-sm"></select>
                                <select style="margin-left: 5px" ng-options="c.name as c.name for c in conditions" ng-model="rule.condition" class="form-control input-sm"></select>
                                <%--<input style="margin-left: 5px" type="text" ng-model="rule.data" class="form-control input-sm"/>--%>
                                <select ng-options="facet.value as facet.label for facet in fields_data[rule.field]" style="margin-left: 5px" type="text" ng-model="rule.data" class="form-control input-sm"></select>
                                <select ng-options="facet.value as facet.label for facet in fields_data[rule.field]" style="margin-left: 5px" type="text" ng-model="rule.data2" class="form-control input-sm" ng-show="rule.condition=='range'"></select>
                                <button style="margin-left: 5px" ng-click="removeCondition($index)" class="btn btn-sm btn-danger"><i class="fa fa-minus" aria-hidden="true"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </script>




</div>
