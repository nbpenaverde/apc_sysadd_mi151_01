<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ProspectPreferenceSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Prospect Preferences';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="prospect-preference-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Prospect Preference', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'prospect_id',
            'preference_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>