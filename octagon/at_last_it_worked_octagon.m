import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

% Started to run method gg

model.modelPath('D:\JOB\github\Octagon-guide\octagon\try');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 3);

model.component('comp1').mesh.create('mesh1');

model.param.set('a', '0.05');
model.param.set('b', 'a/sqrt(2)');
model.param.set('w', '0.03');
model.param.set('h', '0.15');
model.param.rename('h', 'height');
model.param.rename('w', 'width');
model.param.set('L0', '15');
model.param.set('L1', '10');
model.param.set('L2', '15');

model.component('comp1').geom('geom1').create('blk1', 'Block');
model.component('comp1').geom('geom1').feature('blk1').set('size', {'width' '1' 'height'});
model.component('comp1').geom('geom1').run('blk1');
model.component('comp1').geom('geom1').run('blk1');
model.component('comp1').geom('geom1').feature.create('ext1', 'Extrude');
model.component('comp1').geom('geom1').feature.remove('ext1');
model.component('comp1').geom('geom1').run('blk1');
model.component('comp1').geom('geom1').feature.create('del1', 'Delete');
model.component('comp1').geom('geom1').feature('del1').selection('input').set('blk1', 2);
model.component('comp1').geom('geom1').run('del1');
model.component('comp1').geom('geom1').run('del1');
model.component('comp1').geom('geom1').feature.create('del2', 'Delete');
model.component('comp1').geom('geom1').feature('del2').selection('input').set('del1', 3);
model.component('comp1').geom('geom1').run('del2');
model.component('comp1').geom('geom1').run('del2');
model.component('comp1').geom('geom1').feature.create('del3', 'Delete');
model.component('comp1').geom('geom1').feature('del3').selection('input').set('del2', 3);
model.component('comp1').geom('geom1').run('del3');
model.component('comp1').geom('geom1').run('del3');
model.component('comp1').geom('geom1').feature.create('del4', 'Delete');
model.component('comp1').geom('geom1').feature('del4').selection('input').set('del3', 3);
model.component('comp1').geom('geom1').run('del4');
model.component('comp1').geom('geom1').run('del4');
model.component('comp1').geom('geom1').feature.create('del5', 'Delete');
model.component('comp1').geom('geom1').feature('del5').selection('input').set('del4', 1);
model.component('comp1').geom('geom1').run('del5');
model.component('comp1').geom('geom1').run('del5');
model.component('comp1').geom('geom1').feature.create('wp1', 'WorkPlane');
model.component('comp1').geom('geom1').feature('wp1').set('unite', true);
model.component('comp1').geom('geom1').feature('wp1').set('planetype', 'faceparallel');
model.component('comp1').geom('geom1').feature('wp1').selection('face').set('del5', 1);
model.component('comp1').geom('geom1').feature('wp1').set('offset', 'L0');
model.component('comp1').geom('geom1').run('wp1');
model.component('comp1').geom('geom1').feature('wp1').geom.create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('pol1').set('table', {'-a/2' '-a/2-b';  ...
'-a/2-b' '-a/2';  ...
'-a/2-b' 'a/2';  ...
'-a/2' 'a/2+b';  ...
'a/2' 'a/2+b';  ...
'a/2+b' 'a/2';  ...
'a/2+b' '-a/2';  ...
'a/2' '-a/2-b'});
model.component('comp1').geom('geom1').feature('wp1').geom.run('pol1');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('wp1');
model.component('comp1').geom('geom1').feature.create('wp2', 'WorkPlane');
model.component('comp1').geom('geom1').feature('wp2').set('unite', true);
model.component('comp1').geom('geom1').feature('wp2').set('quickoffsettype', 'vertex');
model.component('comp1').geom('geom1').feature('wp2').selection('offsetvertex').set('del5', [4]);
model.component('comp1').geom('geom1').feature('wp2').selection('offsetvertex').clear('del5(1)');
model.component('comp1').geom('geom1').feature('wp2').selection('offsetvertex').set('wp1', [7]);
model.component('comp1').geom('geom1').run('wp2');
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').feature('wp2').geom.create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('wp2').geom.feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('wp2').geom.feature('pol1').setIndex('table', 0, 0, 0);
model.component('comp1').geom('geom1').feature('wp2').geom.feature('pol1').setIndex('table', 0, 0, 1);
model.component('comp1').geom('geom1').feature('wp2').geom.feature('pol1').setIndex('table', 0, 1, 0);
model.component('comp1').geom('geom1').feature('wp2').geom.feature('pol1').setIndex('table', 'w', 1, 0);
model.component('comp1').geom('geom1').feature('wp2').geom.feature('pol1').setIndex('table', 0, 1, 1);
model.component('comp1').geom('geom1').feature('wp2').geom.feature('pol1').setIndex('table', 'width', 1, 0);
model.component('comp1').geom('geom1').feature('wp2').geom.feature('pol1').setIndex('table', '-a/2', 2, 0);
model.component('comp1').geom('geom1').feature('wp2').geom.feature('pol1').setIndex('table', 'L0', 2, 1);
model.component('comp1').geom('geom1').feature('wp2').geom.feature('pol1').setIndex('table', 'a/2', 2, 0);
model.component('comp1').geom('geom1').feature('wp2').geom.feature('pol1').setIndex('table', 'a/2+width/2', 2, 0);
model.component('comp1').geom('geom1').feature('wp2').geom.feature('pol1').setIndex('table', '-a/2+width/2', 3, 0);
model.component('comp1').geom('geom1').feature('wp2').geom.feature('pol1').setIndex('table', 'L0', 3, 1);
model.component('comp1').geom('geom1').feature('wp2').geom.run('pol1');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').feature('wp2').geom.feature('pol1').setIndex('table', '-L0', 2, 1);
model.component('comp1').geom('geom1').feature('wp2').geom.feature('pol1').setIndex('table', '-L0', 3, 1);
model.component('comp1').geom('geom1').feature('wp2').geom.run('pol1');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').runPre('wp2');
model.component('comp1').geom('geom1').feature('wp2').selection('offsetvertex').clear('wp1');
model.component('comp1').geom('geom1').feature('wp2').selection('offsetvertex').set('del5', [4]);
model.component('comp1').geom('geom1').feature('wp2').set('planetype', 'vertices');
model.component('comp1').geom('geom1').feature('wp2').selection('vertex1').set('del5', 4);
model.component('comp1').geom('geom1').feature('wp2').selection('vertex2').set('del5', 3);
model.component('comp1').geom('geom1').feature('wp2').selection('vertex3').set('wp1', 7);
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').feature('wp2').geom.feature('pol1').setIndex('table', 'L0', 2, 1);
model.component('comp1').geom('geom1').feature('wp2').geom.feature('pol1').setIndex('table', 'L0', 3, 1);
model.component('comp1').geom('geom1').feature('wp2').geom.run('pol1');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('wp2');
model.component('comp1').geom('geom1').feature.create('wp3', 'WorkPlane');
model.component('comp1').geom('geom1').feature('wp3').set('unite', true);
model.component('comp1').geom('geom1').feature('wp3').set('planetype', 'vertices');
model.component('comp1').geom('geom1').feature('wp3').selection('vertex1').set('wp2', 2);
model.component('comp1').geom('geom1').feature('wp3').selection('vertex1').clear('wp2.pol1');
model.component('comp1').geom('geom1').feature('wp3').selection('vertex1').set('wp1', [5]);
model.component('comp1').geom('geom1').feature('wp3').selection('vertex1').clear('wp1.pol1');
model.component('comp1').geom('geom1').feature('wp3').selection('vertex1').set('wp2', [2]);
model.component('comp1').geom('geom1').feature('wp3').selection('vertex2').set('wp1', 7);
model.component('comp1').geom('geom1').feature('wp3').selection('vertex3').set('wp1', 5);
model.component('comp1').geom('geom1').run('wp3');
model.component('comp1').geom('geom1').feature('wp3').geom.create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('pol1').setIndex('table', 0, 0, 0);
model.component('comp1').geom('geom1').feature('wp3').geom.feature('pol1').setIndex('table', 0, 0, 1);
model.component('comp1').geom('geom1').feature('wp3').geom.feature('pol1').setIndex('table', '-b/sqrt(2)', 1, 0);
model.component('comp1').geom('geom1').feature('wp3').geom.feature('pol1').setIndex('table', 'L0', 1, 1);
model.component('comp1').geom('geom1').feature('wp3').geom.feature('pol1').setIndex('table', 'b/sqrt(2)', 2, 0);
model.component('comp1').geom('geom1').feature('wp3').geom.feature('pol1').setIndex('table', 'L0', 2, 1);
model.component('comp1').geom('geom1').feature('wp3').geom.run('pol1');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('pol1').setIndex('table', '', 1, 0);
model.component('comp1').geom('geom1').feature('wp3').geom.feature('pol1').setIndex('table', '-b/sqrt(2)', 1, 1);
model.component('comp1').geom('geom1').feature('wp3').geom.feature('pol1').setIndex('table', '', 2, 0);
model.component('comp1').geom('geom1').feature('wp3').geom.feature('pol1').setIndex('table', 'b/sqrt(2)', 2, 1);
model.component('comp1').geom('geom1').feature('wp3').geom.feature('pol1').setIndex('table', 'L0', 1, 0);
model.component('comp1').geom('geom1').feature('wp3').geom.feature('pol1').setIndex('table', 'L0', 2, 0);
model.component('comp1').geom('geom1').feature('wp3').geom.run('pol1');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('pol1').setIndex('table', 0, 1, 1);
model.component('comp1').geom('geom1').feature('wp3').geom.feature('pol1').setIndex('table', '2*b/sqrt(2)', 2, 1);
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('wp3');
model.component('comp1').geom('geom1').feature.create('wp4', 'WorkPlane');
model.component('comp1').geom('geom1').feature('wp4').set('unite', true);
model.component('comp1').geom('geom1').feature('wp4').set('planetype', 'vertices');
model.component('comp1').geom('geom1').feature('wp4').selection('vertex1').set('wp3', 1);
model.component('comp1').geom('geom1').feature('wp4').selection('vertex2').set('del5', 2);
model.component('comp1').geom('geom1').feature('wp4').selection('vertex3').set('wp1', 3);
model.component('comp1').geom('geom1').feature('wp4').geom.create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('wp4').geom.feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('wp4').geom.feature('pol1').setIndex('table', 0, 0, 0);
model.component('comp1').geom('geom1').feature('wp4').geom.feature('pol1').setIndex('table', 0, 0, 1);
model.component('comp1').geom('geom1').feature('wp4').geom.feature('pol1').setIndex('table', 'h', 1, 0);
model.component('comp1').geom('geom1').feature('wp4').geom.feature('pol1').setIndex('table', 0, 1, 1);
model.component('comp1').geom('geom1').feature('wp4').geom.feature('pol1').setIndex('table', 'height', 1, 0);
model.component('comp1').geom('geom1').feature('wp4').geom.feature('pol1').setIndex('table', 'height/2+a/2', 2, 0);
model.component('comp1').geom('geom1').feature('wp4').geom.feature('pol1').setIndex('table', 'L0', 2, 1);
model.component('comp1').geom('geom1').feature('wp4').geom.feature('pol1').setIndex('table', 'height/2-a/2', 3, 0);
model.component('comp1').geom('geom1').feature('wp4').geom.feature('pol1').setIndex('table', 'L0', 3, 1);
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('wp4');
model.component('comp1').geom('geom1').feature.create('wp5', 'WorkPlane');
model.component('comp1').geom('geom1').feature('wp5').set('unite', true);
model.component('comp1').geom('geom1').feature('wp5').set('planetype', 'vertices');
model.component('comp1').geom('geom1').feature('wp5').selection('vertex1').set('wp4', 4);
model.component('comp1').geom('geom1').feature('wp5').selection('vertex2').set('wp1', 3);
model.component('comp1').geom('geom1').feature('wp5').selection('vertex3').set('wp1', 1);
model.component('comp1').geom('geom1').feature('wp5').geom.create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('wp5').geom.feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('wp5').geom.feature('pol1').setIndex('table', 0, 0, 0);
model.component('comp1').geom('geom1').feature('wp5').geom.feature('pol1').setIndex('table', 0, 0, 1);
model.component('comp1').geom('geom1').feature('wp5').geom.feature('pol1').setIndex('table', 'L', 1, 0);
model.component('comp1').geom('geom1').feature('wp5').geom.feature('pol1').setIndex('table', 0, 1, 1);
model.component('comp1').geom('geom1').feature('wp5').geom.feature('pol1').setIndex('table', 'L0', 1, 0);
model.component('comp1').geom('geom1').feature('wp5').geom.feature('pol1').setIndex('table', 'L0', 2, 0);
model.component('comp1').geom('geom1').feature('wp5').geom.feature('pol1').setIndex('table', '2*b/sqrt(2)', 2, 1);
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('wp5');
model.component('comp1').geom('geom1').feature.create('del6', 'Delete');
model.component('comp1').geom('geom1').feature('del6').selection('input').init(0);
model.component('comp1').geom('geom1').run('wp5');
model.component('comp1').geom('geom1').run('wp5');
model.component('comp1').geom('geom1').feature.create('wp6', 'WorkPlane');
model.component('comp1').geom('geom1').feature('wp6').set('unite', true);
model.component('comp1').geom('geom1').feature('wp6').set('planetype', 'vertices');
model.component('comp1').geom('geom1').feature('wp6').selection('vertex1').set('del5', 1);
model.component('comp1').geom('geom1').feature('wp6').selection('vertex2').set('wp5', 1);
model.component('comp1').geom('geom1').feature('wp6').selection('vertex3').set('wp1', 1);
model.component('comp1').geom('geom1').feature('wp6').geom.create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('wp6').geom.feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('wp6').geom.feature('pol1').setIndex('table', 0, 0, 0);
model.component('comp1').geom('geom1').feature('wp6').geom.feature('pol1').setIndex('table', 0, 0, 1);
model.component('comp1').geom('geom1').feature('wp6').geom.feature('pol1').setIndex('table', 0, 1, 0);
model.component('comp1').geom('geom1').feature('wp6').geom.feature('pol1').setIndex('table', 'L0', 1, 1);
model.component('comp1').geom('geom1').feature('wp6').geom.feature('pol1').setIndex('table', 0, 2, 0);
model.component('comp1').geom('geom1').feature('wp6').geom.feature('pol1').setIndex('table', 'height', 1, 0);
model.component('comp1').geom('geom1').feature('wp6').geom.feature('pol1').setIndex('table', 0, 1, 1);
model.component('comp1').geom('geom1').feature('wp6').geom.feature('pol1').setIndex('table', 'height/2+a/2', 2, 0);
model.component('comp1').geom('geom1').feature('wp6').geom.feature('pol1').setIndex('table', 'L0', 2, 1);
model.component('comp1').geom('geom1').feature('wp6').geom.feature('pol1').setIndex('table', 'height/2-a/2', 3, 0);
model.component('comp1').geom('geom1').feature('wp6').geom.feature('pol1').setIndex('table', 'L0', 3, 1);
model.component('comp1').geom('geom1').feature.remove('del6');
model.component('comp1').geom('geom1').feature('wp6').geom.feature('pol1').setIndex('table', 'width', 1, 0);
model.component('comp1').geom('geom1').feature('wp6').geom.feature('pol1').setIndex('table', 'width/2+a/2', 2, 0);
model.component('comp1').geom('geom1').feature('wp6').geom.feature('pol1').setIndex('table', 'width/2-a/2', 3, 0);
model.component('comp1').geom('geom1').feature('wp6').geom.run('pol1');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('wp6');
model.component('comp1').geom('geom1').feature.create('wp7', 'WorkPlane');
model.component('comp1').geom('geom1').feature('wp7').set('unite', true);
model.component('comp1').geom('geom1').feature('wp7').set('planetype', 'vertices');
model.component('comp1').geom('geom1').feature('wp7').selection('vertex1').set('wp6', 2);
model.component('comp1').geom('geom1').feature('wp7').selection('vertex2').set('wp6', 1);
model.component('comp1').geom('geom1').feature('wp7').selection('vertex3').set('wp1', 4);
model.component('comp1').geom('geom1').feature('wp7').geom.create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('wp7').geom.feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('wp7').geom.feature('pol1').setIndex('table', 0, 0, 0);
model.component('comp1').geom('geom1').feature('wp7').geom.feature('pol1').setIndex('table', 0, 0, 1);
model.component('comp1').geom('geom1').feature('wp7').geom.feature('pol1').setIndex('table', 'L0', 1, 0);
model.component('comp1').geom('geom1').feature('wp7').geom.feature('pol1').setIndex('table', 0, 1, 1);
model.component('comp1').geom('geom1').feature('wp7').geom.feature('pol1').setIndex('table', 'L0', 2, 0);
model.component('comp1').geom('geom1').feature('wp7').geom.feature('pol1').setIndex('table', 'a', 2, 1);
model.component('comp1').geom('geom1').feature('wp7').geom.run('pol1');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('wp7');
model.component('comp1').geom('geom1').feature.create('wp8', 'WorkPlane');
model.component('comp1').geom('geom1').feature('wp8').set('unite', true);
model.component('comp1').geom('geom1').feature('wp8').set('planetype', 'vertices');
model.component('comp1').geom('geom1').feature('wp8').selection('vertex1').set('wp2', 3);
model.component('comp1').geom('geom1').feature('wp8').selection('vertex2').set('wp7', 1);
model.component('comp1').geom('geom1').feature('wp8').selection('vertex3').set('wp7', 3);
model.component('comp1').geom('geom1').feature('wp8').geom.create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('wp8').geom.feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('wp8').geom.feature('pol1').setIndex('table', 0, 0, 0);
model.component('comp1').geom('geom1').feature('wp8').geom.feature('pol1').setIndex('table', 0, 0, 1);
model.component('comp1').geom('geom1').feature('wp8').geom.feature('pol1').setIndex('table', 'height', 1, 0);
model.component('comp1').geom('geom1').feature('wp8').geom.feature('pol1').setIndex('table', 0, 1, 1);
model.component('comp1').geom('geom1').feature('wp8').geom.feature('pol1').setIndex('table', 'height/2+a/2', 2, 0);
model.component('comp1').geom('geom1').feature('wp8').geom.feature('pol1').setIndex('table', 'L0', 2, 1);
model.component('comp1').geom('geom1').feature('wp8').geom.feature('pol1').setIndex('table', 'height/2-a/2', 3, 0);
model.component('comp1').geom('geom1').feature('wp8').geom.feature('pol1').setIndex('table', 'L0', 3, 1);
model.component('comp1').geom('geom1').feature('wp8').geom.run('pol1');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('wp8');
model.component('comp1').geom('geom1').feature.create('wp9', 'WorkPlane');
model.component('comp1').geom('geom1').feature('wp9').set('unite', true);
model.component('comp1').geom('geom1').feature('wp9').set('planetype', 'vertices');
model.component('comp1').geom('geom1').feature('wp9').selection('vertex1').set('wp8', 1);
model.component('comp1').geom('geom1').feature('wp9').selection('vertex2').set('wp2', 4);
model.component('comp1').geom('geom1').feature('wp9').selection('vertex3').set('wp8', 2);
model.component('comp1').geom('geom1').feature('wp9').geom.create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('wp9').geom.feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('wp9').geom.feature('pol1').setIndex('table', 0, 0, 0);
model.component('comp1').geom('geom1').feature('wp9').geom.feature('pol1').setIndex('table', 0, 0, 1);
model.component('comp1').geom('geom1').feature('wp9').geom.feature('pol1').setIndex('table', 'L0', 1, 0);
model.component('comp1').geom('geom1').feature('wp9').geom.feature('pol1').setIndex('table', 0, 1, 1);
model.component('comp1').geom('geom1').feature('wp9').geom.feature('pol1').setIndex('table', 'L0', 2, 0);
model.component('comp1').geom('geom1').feature('wp9').geom.feature('pol1').setIndex('table', 'b/sqrt(2)', 2, 1);
model.component('comp1').geom('geom1').feature('wp9').geom.run('pol1');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').feature('wp9').geom.feature('pol1').setIndex('table', 'b*sqrt(2)', 2, 1);
model.component('comp1').geom('geom1').feature('wp9').geom.run('pol1');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('wp9');
model.component('comp1').geom('geom1').feature.create('ext1', 'Extrude');
model.component('comp1').geom('geom1').feature('ext1').set('extrudefrom', 'faces');
model.component('comp1').geom('geom1').feature('ext1').selection('inputface').set('wp1', 1);
model.component('comp1').geom('geom1').feature('ext1').setIndex('distance', 'L1', 0);
model.component('comp1').geom('geom1').run('ext1');
model.component('comp1').geom('geom1').run;
model.component('comp1').geom('geom1').run('ext1');
model.component('comp1').geom('geom1').feature.create('del6', 'Delete');
model.component('comp1').geom('geom1').feature('del6').selection('input').init;
model.component('comp1').geom('geom1').feature('del6').selection('input').init(1);
model.component('comp1').geom('geom1').feature('del6').selection('input').init(2);
model.component('comp1').geom('geom1').feature('del6').selection('input').set('ext1', 2);
model.component('comp1').geom('geom1').run('del6');
model.component('comp1').geom('geom1').run('del6');
model.component('comp1').geom('geom1').feature.create('del7', 'Delete');
model.component('comp1').geom('geom1').feature('del7').selection('input').set('del6', 4);
model.component('comp1').geom('geom1').run('del7');
model.component('comp1').geom('geom1').run('del7');
model.component('comp1').geom('geom1').run('del7');
model.component('comp1').geom('geom1').run('del7');
model.component('comp1').geom('geom1').run('del7');
model.component('comp1').geom('geom1').feature.create('del8', 'Delete');
model.component('comp1').geom('geom1').feature('del8').selection('input').set('del5', 1);
model.component('comp1').geom('geom1').run('del8');
model.component('comp1').geom('geom1').run('del8');
model.component('comp1').geom('geom1').feature.create('wp10', 'WorkPlane');
model.component('comp1').geom('geom1').feature('wp10').set('unite', true);
model.component('comp1').geom('geom1').feature('wp10').label('rot_pl');
model.component('comp1').geom('geom1').feature('wp10').set('planetype', 'vertices');
model.component('comp1').geom('geom1').feature('wp10').selection('vertex1').set('del7', 6);
model.component('comp1').geom('geom1').feature('wp10').selection('vertex2').set('del7', 14);
model.component('comp1').geom('geom1').feature('wp10').selection('vertex3').set('del7', 5);
model.component('comp1').geom('geom1').feature('wp10').selection('vertex2').set('del7', [10]);
model.component('comp1').geom('geom1').feature('wp10').set('displ', {'a/2' 'a/2+b'});
model.component('comp1').geom('geom1').run('wp10');
model.component('comp1').geom('geom1').run('wp10');
model.component('comp1').geom('geom1').create('copy1', 'Copy');
model.component('comp1').geom('geom1').feature('copy1').selection('input').set({'wp2' 'wp3' 'wp4' 'wp5' 'wp6' 'wp7' 'wp8' 'wp9'});
model.component('comp1').geom('geom1').feature('copy1').set('workplane', 'wp1');
model.component('comp1').geom('geom1').feature('copy1').set('displz', 'L1+L0');
model.component('comp1').geom('geom1').run('copy1');
model.component('comp1').geom('geom1').run('copy1');
model.component('comp1').geom('geom1').create('mir1', 'Mirror');
model.component('comp1').geom('geom1').feature('mir1').selection('input').set({'copy1(2)' 'copy1(3)' 'copy1(4)'});
model.component('comp1').geom('geom1').feature.remove('mir1');
model.component('comp1').geom('geom1').run('copy1');
model.component('comp1').geom('geom1').feature.create('wp11', 'WorkPlane');
model.component('comp1').geom('geom1').feature('wp11').set('unite', true);
model.component('comp1').geom('geom1').feature('wp11').label('mirr');
model.component('comp1').geom('geom1').feature('wp11').set('planetype', 'vertices');
model.component('comp1').geom('geom1').feature('wp11').selection('vertex1').set('copy1(1)', 4);
model.component('comp1').geom('geom1').feature('wp11').selection('vertex2').set('copy1(1)', 1);
model.component('comp1').geom('geom1').feature('wp11').selection('vertex3').set('copy1(5)', 1);
model.component('comp1').geom('geom1').feature('wp11').set('displ', {'a/2' 'a/2+b'});
model.component('comp1').geom('geom1').run('wp11');
model.component('comp1').geom('geom1').run('wp11');
model.component('comp1').geom('geom1').create('mir1', 'Mirror');
model.component('comp1').geom('geom1').feature('mir1').selection('input').set({'copy1'});
model.component('comp1').geom('geom1').feature('mir1').set('workplane', 'wp11');
model.component('comp1').geom('geom1').run('mir1');
model.component('comp1').geom('geom1').run('mir1');
model.component('comp1').geom('geom1').create('mov1', 'Move');
model.component('comp1').geom('geom1').feature('mov1').selection('input').set({'mir1(2)' 'mir1(3)' 'mir1(4)' 'mir1(5)' 'mir1(6)' 'mir1(7)' 'mir1(8)'});
model.component('comp1').geom('geom1').feature('mov1').set('workplane', 'wp11');
model.component('comp1').geom('geom1').feature('mov1').set('displz', 'L0');
model.component('comp1').geom('geom1').feature('mov1').selection('input').set({'mir1'});
model.component('comp1').geom('geom1').run('mov1');
model.component('comp1').geom('geom1').run('mov1');
model.component('comp1').geom('geom1').create('rot1', 'Rotate');
model.component('comp1').geom('geom1').feature('rot1').selection('input').set({'mov1'});
model.component('comp1').geom('geom1').feature('rot1').set('workplane', 'wp10');
model.component('comp1').geom('geom1').feature('rot1').set('rot', 90);
model.component('comp1').geom('geom1').run('rot1');
model.component('comp1').geom('geom1').feature('fin').set('action', 'assembly');
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').mesh('mesh1').autoMeshSize(8);
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').export.set('type', 'stlascii');
model.component('comp1').mesh('mesh1').export.set('filename', 'D:\JOB\comsol\oct\end.stl');
model.component('comp1').mesh('mesh1').export('D:\JOB\comsol\oct\end.stl');
out = model;
