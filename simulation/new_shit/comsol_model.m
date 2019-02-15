clear all
import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 3);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').create('blk1', 'Block');
model.component('comp1').geom('geom1').feature('blk1').set('size', [0.03 1 0.15]);
model.component('comp1').geom('geom1').create('ext1', 'Extrude');
model.component('comp1').geom('geom1').feature('ext1').setIndex('distance', '20', 0);
model.component('comp1').geom('geom1').feature('ext1').setIndex('twist', '90', 0);
model.component('comp1').geom('geom1').feature('ext1').selection('inputface').set('blk1(1)', 3);
model.component('comp1').geom('geom1').create('del1', 'Delete');
model.component('comp1').geom('geom1').feature('del1').selection('input').set('ext1(1)', 5);
model.component('comp1').geom('geom1').create('del2', 'Delete');
model.component('comp1').geom('geom1').feature('del2').selection('input').set('del1(1)', 10);
model.component('comp1').geom('geom1').create('del3', 'Delete');
model.component('comp1').geom('geom1').feature('del3').selection('input').set('del2(1)', 7);
model.component('comp1').geom('geom1').create('del4', 'Delete');
model.component('comp1').geom('geom1').feature('del4').selection('input').set('del3(1)', 8);
model.component('comp1').geom('geom1').create('del5', 'Delete');
model.component('comp1').geom('geom1').feature('del5').selection('input').set('del4(1)', 6);
model.component('comp1').geom('geom1').create('del6', 'Delete');
model.component('comp1').geom('geom1').feature('del6').selection('input').set('del5(1)', 2);
model.component('comp1').geom('geom1').create('del7', 'Delete');
model.component('comp1').geom('geom1').feature('del7').selection('input').set('del6(1)', 4);
model.component('comp1').geom('geom1').run;
model.component('comp1').mesh('mesh1').autoMeshSize(1);
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').export.set('filename', 'D:\JOB\github\ja111.stl');
model.component('comp1').mesh('mesh1').export('D:\JOB\github\ja111.stl');
% Finished running method twist
out = model;


