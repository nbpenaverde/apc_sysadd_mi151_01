<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\ProspectPreference */

$this->title = 'Update Prospect Preference: ' . $model->prospect_id;
$this->params['breadcrumbs'][] = ['label' => 'Prospect Preferences', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->prospect_id, 'url' => ['view', 'prospect_id' => $model->prospect_id, 'preference_id' => $model->preference_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="prospect-preference-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
