<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ProspectPreference */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="prospect-preference-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'prospect_id')->textInput() ?>

    <?= $form->field($model, 'preference_id')->textInput() ?>
    

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
